    -- version snagging on / bouncing off them (that was the "autofarm gets stuck on some geometry" bug:
    -- the old code set both a CFrame AND a velocity, and on certain parts the physics fought the CFrame).
    -- Anchored + direct CFrame can't be fought. We ALWAYS unanchor on every exit path so a stopped
    -- autofarm never leaves the character frozen mid-air (the levitation bug).
    local function moveTo(targetCF, speed, checkFn)
        local spd = math.max(speed or S.FastAutofarmSpeed or 20, 1)
        local deadline = tick() + 12
        local arrived = false
        while tick() < deadline do
            if not S.FastAutofarm then break end
            if checkFn and not checkFn() then break end
            local c = LP.Character
            local hrp = c and c:FindFirstChild("HumanoidRootPart")
            local hum = c and c:FindFirstChildOfClass("Humanoid")
            if not hrp or not hum or hum.Health <= 0 then break end
            for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
                pcall(function() track:Stop() end)
            end
            hrp.Anchored = true
            hrp.AssemblyLinearVelocity = Vector3.zero
            hrp.AssemblyAngularVelocity = Vector3.zero
            local dt = task.wait()
            c = LP.Character
            hrp = c and c:FindFirstChild("HumanoidRootPart")
            if not hrp then break end
            local delta = targetCF.Position - hrp.Position
            local dist = delta.Magnitude
            -- Cap the PER-STEP distance (not dt) so a lag spike can't teleport clean through the
            -- target in one jump, while a slow frame still covers the real-time-correct distance.
            -- The old version clamped dt itself to 1/30, which silently HALVED autofarm speed any
            -- time the game ran below 30 FPS, no matter what the speed slider said.
            -- Safe Mode tightens that cap hard: what trips MM2's "invalid position" is the size of
            -- a SINGLE step, so a 40-stud jump on one long frame is exactly the thing to avoid.
            -- Small steps at the same studs/s look like ordinary fast movement.
            local step = math.min(spd * dt, S.AutofarmSafe and 10 or 40)
            if dist <= math.max(4.0, step) then
                hrp.CFrame = CFrame.new(targetCF.Position)
                arrived = true
                break
            end
            local dir = delta / dist
            local newPos = hrp.Position + dir * step
            local flat = Vector3.new(dir.X, 0, dir.Z)
            hrp.CFrame = (flat.Magnitude > 0.05) and CFrame.new(newPos, newPos + flat) or CFrame.new(newPos)
        end
        -- Unanchor on exit unless Autofarm is active
        local c = LP.Character
        local hrp = c and c:FindFirstChild("HumanoidRootPart")
        if hrp then
            if not S.FastAutofarm then
                hrp.Anchored = false
            end
            hrp.AssemblyLinearVelocity = Vector3.zero
        end
        return arrived
    end
