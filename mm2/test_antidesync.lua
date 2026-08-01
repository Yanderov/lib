-- Runnable check for the Anti-Desync target resolver in mm2.lua.
-- Run:  ./luau.exe test_antidesync.lua
--
-- The resolver is the one piece of the aim path with real branching, and every branch is a silent
-- wrong answer when it breaks -- a missed shot, not an error. This mirrors its logic against fake
-- position streams so a regression shows up here instead of in a round.
--
-- Keep in sync with resolveTargetPos in mm2.lua. If you change MAX_STEP / STALE_AFTER / the bounds
-- there, change them here and re-run.

local MAX_STEP = 200
local STALE_AFTER = 2.5

-- Minimal Vector3 stand-in: luau.exe has no Roblox types.
local V = {}
V.__index = V
local function vec(x, y, z) return setmetatable({ x = x, y = y, z = z }, V) end
function V.__sub(a, b) return vec(a.x - b.x, a.y - b.y, a.z - b.z) end
function V.__add(a, b) return vec(a.x + b.x, a.y + b.y, a.z + b.z) end
function V.__mul(a, k) return vec(a.x * k, a.y * k, a.z * k) end
function V.__div(a, k) return vec(a.x / k, a.y / k, a.z / k) end
function V:Magnitude() return math.sqrt(self.x ^ 2 + self.y ^ 2 + self.z ^ 2) end
function V:Unit() local m = self:Magnitude() return m > 0 and self / m or vec(0, 0, 0) end
local ZERO = vec(0, 0, 0)

local function makeResolver()
    local cache = nil
    -- raw = replicated position, vel = replicated velocity, now = clock, origin = shooter position
    return function(raw, vel, now, origin)
        local inBounds = (raw - origin):Magnitude() <= 600 and math.abs(raw.y - origin.y) <= 400
        local plausible = true
        if inBounds and cache then
            local dt = math.max(now - cache.t, 1 / 60)
            plausible = (raw - cache.p):Magnitude() <= MAX_STEP * dt
        end
        if inBounds and plausible then
            local v = vel
            if v:Magnitude() > MAX_STEP then
                if cache then
                    local dt = math.max(now - cache.t, 1 / 60)
                    v = (raw - cache.p) / dt
                else
                    v = ZERO
                end
            end
            cache = { p = raw, v = v, t = now }
            return raw, "accepted"
        end
        if not cache then return raw, "no-cache" end
        local age = now - cache.t
        if age > STALE_AFTER then
            cache = nil
            return raw, "stale-reset"
        end
        local step = cache.v * age
        if step:Magnitude() > MAX_STEP * age then step = step:Unit() * (MAX_STEP * age) end
        return cache.p + step, "projected"
    end
end

local failures = 0
local function check(name, cond)
    if cond then
        print("  ok   " .. name)
    else
        print("  FAIL " .. name)
        failures += 1
    end
end

local origin = vec(0, 0, 0)

do
    print("a target walking normally is always trusted")
    local r = makeResolver()
    local t, why = 0, nil
    local pos
    for i = 1, 30 do
        t = i / 60
        pos, why = r(vec(i * 0.25, 0, 0), vec(15, 0, 0), t, origin)
    end
    check("last frame accepted", why == "accepted")
    check("returns the real position", math.abs(pos.x - 30 * 0.25) < 1e-6)
end

do
    print("a +/-7777 position spike is rejected and projected through")
    local r = makeResolver()
    r(vec(10, 0, 0), vec(20, 0, 0), 0.0, origin)      -- walking +20 studs/s
    r(vec(10.33, 0, 0), vec(20, 0, 0), 1 / 60, origin)
    local pos, why = r(vec(7777, 500, -7777), vec(0, 0, 0), 2 / 60, origin)
    check("spike not returned", why == "projected")
    check("stays near the last real position", (pos - vec(10.33, 0, 0)):Magnitude() < 5)
    check("advanced forward, not frozen", pos.x > 10.33)
end

do
    print("an IN-BOUNDS but impossible jump is still rejected")
    -- This is the case the old bounds-only filter waved through: 300 studs in one frame, well
    -- inside the map, so it looked sane and the aim followed it.
    local r = makeResolver()
    r(vec(0, 0, 0), vec(10, 0, 0), 0.0, origin)
    local pos, why = r(vec(300, 0, 0), vec(10, 0, 0), 1 / 60, origin)
    check("rejected", why == "projected")
    check("did not follow the jump", pos.x < 50)
end

do
    print("an in-bounds jump becomes plausible again given enough time")
    -- 400 studs in half a second is impossible; 400 studs in three seconds is just walking. The
    -- step filter is per-second, so time alone is enough to re-accept it -- no stale reset needed.
    local r = makeResolver()
    r(vec(0, 0, 0), vec(0, 0, 0), 0.0, origin)
    local _, why1 = r(vec(400, 0, 0), vec(0, 0, 0), 0.5, origin)
    check("rejected while fresh", why1 == "projected")
    local pos, why2 = r(vec(400, 0, 0), vec(0, 0, 0), 3.0, origin)
    check("accepted once the move is achievable", why2 == "accepted")
    check("returns the new position", math.abs(pos.x - 400) < 1e-6)
end

do
    print("a permanently out-of-bounds target gives up rather than aiming at a ghost")
    -- The stale path is for frames that can never be accepted: a target sitting outside the map
    -- entirely. Holding a two-second-old ghost forever would be worse than trusting the raw frame.
    local r = makeResolver()
    r(vec(0, 0, 0), vec(5, 0, 0), 0.0, origin)
    local _, why1 = r(vec(7777, 500, -7777), vec(0, 0, 0), 0.5, origin)
    check("projected while the cache is fresh", why1 == "projected")
    local pos, why2 = r(vec(7777, 500, -7777), vec(0, 0, 0), 3.0, origin)
    check("cache dropped once stale", why2 == "stale-reset")
    check("falls back to the raw frame", math.abs(pos.x - 7777) < 1e-6)
end

do
    print("a desynced VELOCITY is never cached as the projection vector")
    local r = makeResolver()
    r(vec(0, 0, 0), vec(0, 0, 0), 0.0, origin)
    -- Position is fine, velocity is a 7777 spike. If that got cached, the next projection would
    -- throw the aim point hundreds of studs away.
    r(vec(1, 0, 0), vec(7777, 7777, 7777), 1 / 60, origin)
    local pos = r(vec(9999, 0, 0), vec(0, 0, 0), 2 / 60, origin)
    check("projection stays sane", (pos - vec(1, 0, 0)):Magnitude() < 10)
end

do
    print("projection is capped at what a player could actually walk")
    local r = makeResolver()
    r(vec(0, 0, 0), vec(0, 0, 0), 0.0, origin)
    r(vec(3, 0, 0), vec(180, 0, 0), 1 / 60, origin)   -- fast but legal
    local pos = r(vec(8000, 0, 0), vec(0, 0, 0), 2.0, origin)
    local travelled = (pos - vec(3, 0, 0)):Magnitude()
    check("never exceeds MAX_STEP * age", travelled <= MAX_STEP * (2.0 - 1 / 60) + 1e-6)
end

print("")
if failures == 0 then
    print("all anti-desync checks passed")
else
    print(failures .. " FAILED")
    error("anti-desync checks failed")
end
