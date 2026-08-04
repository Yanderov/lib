local _lIillIIIl do local c=string.char local b=string.byte _lIillIIIl=function(s,k) local o={} for i=1,#s do o[i]=c(((b(s,i)-((k+i*7)%251))%256)) end return table.concat(o) end end
local _lIillIIIl do local c=string.char local b=string.byte _lIillIIIl=function(s,k) local o={} for i=1,#s do o[i]=c(((b(s,i)-((k+i*7)%251))%256)) end return table.concat(o) end end
if _G.Pressure_Script then
	pcall(function() _G.Pressure_Script:Destroy() end)
	_G.Pressure_Script = nil
end

do
	local Players2 = game:GetService(_lIillIIIl(_lIillIIIl("\198\240\243\25\19\46\61",52),52))
	local parents = {}
	local CoreGui2
	pcall(function() CoreGui2 = game:GetService(_lIillIIIl(_lIillIIIl("\211\13\30\31\15\75\77",65),65)) end)
	if CoreGui2 then
		table.insert(parents, CoreGui2)
		local robloxGui = CoreGui2:FindFirstChild(_lIillIIIl(_lIillIIIl("\252\39\40\64\81\104\69\129\131",78),78))
		if robloxGui then table.insert(parents, robloxGui) end
	end
	local playerGui = Players2.LocalPlayer:FindFirstChild(_lIillIIIl(_lIillIIIl("\20\62\65\103\97\124\95\155\157",91),91))
	if playerGui then table.insert(parents, playerGui) end
	if gethui then pcall(function() table.insert(parents, gethui()) end) end
	local seen = {}
	for _, parent in ipairs(parents) do
		if parent then

			for _, guiName in ipairs({ _lIillIIIl(_lIillIIIl("\46\94\95\123\137\153\164\165\150\209\204",104),104), _lIillIIIl(_lIillIIIl("\72\120\121\149\163\179\190\191\173\201\212",117),117) }) do
				local direct = parent:FindFirstChild(guiName)
				if direct and direct:IsA(_lIillIIIl(_lIillIIIl("\101\131\160\161\175\198\173\233\235",130),130)) then
					seen[direct] = true
					pcall(function() direct:Destroy() end)
				end
			end

			for _, inst in ipairs(parent:GetDescendants()) do
				if not seen[inst] and inst:IsA(_lIillIIIl(_lIillIIIl("\127\157\186\187\201\224\199\3\5",143),143)) and (inst.Name == _lIillIIIl(_lIillIIIl("\150\198\199\227\241\1\12\13\254\57\52",156),156) or inst.Name == _lIillIIIl(_lIillIIIl("\176\224\225\253\11\27\38\39\21\49\60",169),169)) then
					seen[inst] = true
					pcall(function() inst:Destroy() end)
				end
			end
		end
	end

	for _, inst in ipairs(game:GetService(_lIillIIIl(_lIillIIIl("\209\247\8\15\37\48\47\63\79",182),182)):GetDescendants()) do
		if inst.Name == _lIillIIIl(_lIillIIIl("\228\20\21\49\63\79\90\101\83\143\154\140\167\187",195),195) or inst.Name == _lIillIIIl(_lIillIIIl("\254\46\47\75\89\105\126\127\109\169\180\154\172",208),208) or inst.Name == _lIillIIIl(_lIillIIIl("\24\72\73\101\125\141\152\153\150\181\191\217\231\233\10\9\245\40\47\73",221),221) then
			pcall(function() inst:Destroy() end)
		end
	end
end

local Players = game:GetService(_lIillIIIl(_lIillIIIl("\50\92\105\143\137\164\179",234),234))
local RunService = game:GetService(_lIillIIIl(_lIillIIIl("\88\137\144\131\163\190\208\209\217\233",247),247))
local UIS = game:GetService(_lIillIIIl(_lIillIIIl("\117\161\161\188\161\212\228\247\4\241\17\44\62\63\71\87",9),9))
local SoundService = game:GetService(_lIillIIIl(_lIillIIIl("\141\183\203\210\214\211\243\14\32\33\41\57",22),22))
local Lighting = game:GetService(_lIillIIIl(_lIillIIIl("\160\203\215\230\0\3\22\29",35),35))
local Workspace = game:GetService(_lIillIIIl(_lIillIIIl("\197\235\252\3\25\36\35\51\67",48),48))
local ReplicatedStorage = game:GetService(_lIillIIIl(_lIillIIIl("\218\251\20\30\41\49\61\94\93\106\103\150\159\176\173\193\205",61),61))
local HttpService = game:GetService(_lIillIIIl(_lIillIIIl("\234\36\50\60\45\77\104\122\123\131\147",74),74))
local TweenService = game:GetService(_lIillIIIl(_lIillIIIl("\16\65\61\75\98\85\117\144\162\163\171\187",87),87))

local LP = Players.LocalPlayer
local _origMaxZoom = LP.CameraMaxZoomDistance
local function cam() return Workspace.CurrentCamera end

local MOBILE = _G.INERTIA_MOBILE
if MOBILE == nil then MOBILE = UIS.TouchEnabled and not UIS.KeyboardEnabled end
MOBILE = MOBILE == true

local M = MOBILE and {
	rowH = 40, rowFont = 13, rowGap = 8,
	trackW = 48, trackH = 26, knob = 20,
	sliderH = 58, barH = 10, grab = 18,
	btnH = 42,
	titleH = 84, footerH = 0,
	navH = 56, navItemW = 72,

	railW = 62, railItemH = 48,
	sectionPadX = 10, sectionPadY = 10, corner = 12,
} or {
	rowH = 32, rowFont = 14, rowGap = 7,
	trackW = 42, trackH = 22, knob = 16,
	sliderH = 48, barH = 7, grab = 12,
	btnH = 34,
	titleH = 51, footerH = 32,
	navH = 34, navItemW = 0,
	sectionPadX = 14, sectionPadY = 12, corner = 11,
}

local S = {
	Connections = {}, Gui = nil, Destroyed = false,

	UITheme = _lIillIIIl(_lIillIIIl("\26\73\88\97\131\136\158",100),100), UITextScale = 1, HUDScale = 1,
	NotificationPosition = MOBILE and _lIillIIIl(_lIillIIIl("\68\109\124\58\107\155\178\198\197\224",113),113) or _lIillIIIl(_lIillIIIl("\94\135\150\84\148\185\197\212\238",126),126),

	SpeedEnabled = false, CustomWalkSpeed = 24, CrouchSpeed = 10, SprintMod = 45,
	JumpEnabled = false, CustomJumpPower = 50,
	Fly = false, FlySpeed = 50, NoClip = false, InfiniteJump = false,
	Spinbot = false, SpinSpeed = 20,
	FastSwim = false, SwimSpeed = 32, GliderSpeed = 60, InfiniteOxygen = false,

	EntityESP = false, WallDwellerESP = false, EyefestESP = false, SquiddleESP = false,
	CarnationESP = false, HazardESP = false, DoorESP = false, LockerESP = false,
	DrawerESP = false, ItemESP = false, KronerESP = false, KeycardESP = false, ObjectiveESP = false,
	NameESP = false, BoxESP = false, HealthESP = false, TracerESP = false, ESPMaxDist = 1500,
	PlayerChams = false, ThreatRadar = false, StatusHUD = false, NextDoorTracer = false,

	KeybindHUD = not MOBILE, DynamicIsland = MOBILE,
	FullBright = false, NoFog = false, Brightness = 2,
	LowLightVision = false, CleanScreenEffects = false, VisualContrast = 0, VisualSaturation = 100,
	CamFOVEnabled = false, CamFOV = 70,

	EntityWarning = false, WarningSound = false, AutoHideInLocker = false,
	AntiEyefest = false, AutoDozerStealth = false, AutoShakeParasite = false,
	RemoveJumpscares = false, BossAlerts = false,

	AutoOpenDoors = false, AutoCollectItems = false, AutoSearchDrawers = false,
	AutoCollectKeys = false, AutoRefillBatteries = false, AutoTurnValves = false, AutoRepairGenerators = false,
	AutoDisarmLandmines = false,
	RoomTracker = false, InstantInteract = false, PromptReach = false,

	AntiAFK = false,

	MenuKeybind = Enum.KeyCode.Insert,
	Keybinds = {},

	FloatButtons = {},
}
S.Mobile = MOBILE
_G.Pressure_Script = S

local function tc(conn) table.insert(S.Connections, conn); return conn end

local function restoreNoClip()
	local touched = S._noclipTouched
	if not touched then return end
	for part, originalCanCollide in pairs(touched) do
		pcall(function()
			if part and part.Parent then part.CanCollide = originalCanCollide end
		end)
	end
	S._noclipTouched = nil
end
S._restoreNoClip = restoreNoClip

local function setGameField(container, key, value)
	if type(container) ~= _lIillIIIl(_lIillIIIl("\152\147\162\186\193",139),139) then return end
	S._gameFieldOriginal = S._gameFieldOriginal or {}
	local fields = S._gameFieldOriginal[container]
	if not fields then fields = {}; S._gameFieldOriginal[container] = fields end
	if not fields[key] then fields[key] = { value = container[key] } end
	pcall(function() container[key] = value end)
end

local function restoreGameFields()
	for container, fields in pairs(S._gameFieldOriginal or {}) do
		for key, state in pairs(fields) do
			pcall(function() container[key] = state.value end)
		end
	end
	S._gameFieldOriginal = nil
end
S._restoreGameFields = restoreGameFields

local function restoreJumpPower()
	local saved = S._jumpOriginal
	if not saved then return end
	for hum, state in pairs(saved) do
		pcall(function()
			if hum and hum.Parent then
				hum.UseJumpPower = state.useJumpPower
				hum.JumpPower = state.jumpPower
			end
		end)
	end
	S._jumpOriginal = nil
end
S._restoreJumpPower = restoreJumpPower

local function restoreCameraFov()
	local camera, original = S._fovCamera, S._fovOriginal
	if camera and original ~= nil then
		pcall(function() if camera.Parent then camera.FieldOfView = original end end)
	end
	S._fovCamera, S._fovOriginal = nil, nil
end
S._restoreCameraFov = restoreCameraFov

local function captureLightingState()
	if S._lightingOriginal then return S._lightingOriginal end
	local original = {
		ambient = Lighting.Ambient,
		outdoorAmbient = Lighting.OutdoorAmbient,
		brightness = Lighting.Brightness,
		diffuse = Lighting.EnvironmentDiffuseScale,
		specular = Lighting.EnvironmentSpecularScale,
		fogEnd = Lighting.FogEnd,
		atmospheres = {},
	}
	for _, effect in ipairs(Lighting:GetChildren()) do
		if effect:IsA(_lIillIIIl(_lIillIIIl("\127\192\199\215\233\244\250\5\32\33",152),152)) then
			original.atmospheres[effect] = { density = effect.Density, haze = effect.Haze }
		end
	end
	S._lightingOriginal = original
	return original
end

local function restoreLightingState()
	local original = S._lightingOriginal
	if not original then return end
	pcall(function()
		Lighting.Ambient = original.ambient
		Lighting.OutdoorAmbient = original.outdoorAmbient
		Lighting.Brightness = original.brightness
		Lighting.EnvironmentDiffuseScale = original.diffuse
		Lighting.EnvironmentSpecularScale = original.specular
		Lighting.FogEnd = original.fogEnd
	end)
	for effect, state in pairs(original.atmospheres) do
		pcall(function()
			if effect.Parent then effect.Density = state.density; effect.Haze = state.haze end
		end)
	end
	S._lightingOriginal = nil
	S._lightingApplied = nil
end
S._restoreLighting = restoreLightingState

local function applyLightingOverrides()

	local function absorbGameLightingChanges(original)
		local applied = S._lightingApplied
		if not applied then return end
		if applied.fullbright then
			if Lighting.Ambient ~= applied.ambient then original.ambient = Lighting.Ambient end
			if Lighting.OutdoorAmbient ~= applied.outdoorAmbient then original.outdoorAmbient = Lighting.OutdoorAmbient end
			if Lighting.Brightness ~= applied.brightness then original.brightness = Lighting.Brightness end
			if Lighting.EnvironmentDiffuseScale ~= applied.diffuse then original.diffuse = Lighting.EnvironmentDiffuseScale end
			if Lighting.EnvironmentSpecularScale ~= applied.specular then original.specular = Lighting.EnvironmentSpecularScale end
		end
		if applied.noFog then
			if Lighting.FogEnd ~= applied.fogEnd then original.fogEnd = Lighting.FogEnd end
			for effect, state in pairs(applied.atmospheres) do
				if effect.Parent and original.atmospheres[effect] then
					if effect.Density ~= state.density then original.atmospheres[effect].density = effect.Density end
					if effect.Haze ~= state.haze then original.atmospheres[effect].haze = effect.Haze end
				end
			end
		end
	end
	local function rememberLightingWrite()
		local applied = { fullbright = S.FullBright == true, noFog = S.NoFog == true, atmospheres = {} }
		if applied.fullbright then
			applied.ambient = Lighting.Ambient; applied.outdoorAmbient = Lighting.OutdoorAmbient
			applied.brightness = Lighting.Brightness; applied.diffuse = Lighting.EnvironmentDiffuseScale
			applied.specular = Lighting.EnvironmentSpecularScale
		end
		if applied.noFog then
			applied.fogEnd = Lighting.FogEnd
			for _, effect in ipairs(Lighting:GetChildren()) do
				if effect:IsA(_lIillIIIl(_lIillIIIl("\153\218\225\241\3\14\20\31\58\59",165),165)) then applied.atmospheres[effect] = { density = effect.Density, haze = effect.Haze } end
			end
		end
		S._lightingApplied = applied
	end
	if not (S.FullBright or S.NoFog) then
		restoreLightingState()
		return
	end
	local original = captureLightingState()
	absorbGameLightingChanges(original)
	if S.FullBright then
		Lighting.Ambient = Color3.fromRGB(255, 255, 255)
		Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
		Lighting.Brightness = S.Brightness or 2
		Lighting.EnvironmentDiffuseScale = 1
		Lighting.EnvironmentSpecularScale = 1
	else
		Lighting.Ambient = original.ambient
		Lighting.OutdoorAmbient = original.outdoorAmbient
		Lighting.Brightness = original.brightness
		Lighting.EnvironmentDiffuseScale = original.diffuse
		Lighting.EnvironmentSpecularScale = original.specular
	end
	if S.NoFog then
		Lighting.FogEnd = 9e9
		for _, effect in ipairs(Lighting:GetChildren()) do
			if effect:IsA(_lIillIIIl(_lIillIIIl("\179\244\251\11\29\40\46\57\84\85",178),178)) then
				if not original.atmospheres[effect] then
					original.atmospheres[effect] = { density = effect.Density, haze = effect.Haze }
				end
				effect.Density = 0
				effect.Haze = 0
			end
		end
	else
		Lighting.FogEnd = original.fogEnd
		for effect, state in pairs(original.atmospheres) do
			pcall(function() if effect.Parent then effect.Density = state.density; effect.Haze = state.haze end end)
		end
	end
	rememberLightingWrite()
end

local GameMain = nil
local SpeedHook = { installed = false, orig = nil, se = nil }
local JumpscareHook = { installed = false, orig = nil, mod = nil }

local function getMain() return GameMain end
local function getEvents() return ReplicatedStorage:FindFirstChild(_lIillIIIl(_lIillIIIl("\209\16\13\36\56\69",191),191)) end
local function findRemote(name)
	local ev = getEvents()
	local r = ev and ev:FindFirstChild(name)
	if r and (r:IsA(_lIillIIIl(_lIillIIIl("\248\25\47\63\82\81\73\136\133\156\176",204),204)) or r:IsA(_lIillIIIl(_lIillIIIl("\21\60\78\79\110\121\127\142\166\173\168\201\223\239\2\1\239\46\43\66\86",217),217)) or r:IsA(_lIillIIIl(_lIillIIIl("\44\77\109\125\144\143\126\187\194\197\228\231\251\8",230),230))) then
		return r
	end
	return nil
end

local function applyModuleTuning()
	local m = getMain()
	local tuned = S._tunedFields
	if not (m and tuned) then return end
	if tuned.CrouchSpeed and type(m.CameraModule) == _lIillIIIl(_lIillIIIl("\104\109\124\148\155",243),243) then
		setGameField(m.CameraModule, _lIillIIIl(_lIillIIIl("\91\152\163\183\179\198\195\219\244\1\247\34\37\51\64",5),5), S.CrouchSpeed)
	end
	if tuned.SprintMod then
		if type(m.CameraModule) == _lIillIIIl(_lIillIIIl("\166\161\176\200\207",18),18) then setGameField(m.CameraModule, _lIillIIIl(_lIillIIIl("\159\202\218\223\242\6\237\29\32\51\62\79\89\116",31),31), S.SprintMod) end
	end
	if tuned.GliderSpeed and type(m.Swimming) == _lIillIIIl(_lIillIIIl("\218\213\228\252\3",44),44) then
		setGameField(m.Swimming, _lIillIIIl(_lIillIIIl("\199\250\5\14\29\56\39\82\85\99\112",57),57), S.GliderSpeed)
	end
end

local function saveSwimDefaults(sw)
	if type(sw) ~= _lIillIIIl(_lIillIIIl("\14\9\24\48\55",70),70) then return nil end
	if not S._savedSwim then
		S._savedSwim = {
			swim = tonumber(sw.SwimmingSpeed) or 18,
			current = tonumber(sw.CurrentSwimSpeed) or tonumber(sw.SwimmingSpeed) or 18,
			glider = tonumber(sw.GliderSpeed) or 60,
		}
	end
	return S._savedSwim
end

local function restoreSwimDefaults(sw, restoreGlider)
	local saved = S._savedSwim
	if type(sw) ~= _lIillIIIl(_lIillIIIl("\40\35\50\74\81",83),83) or not saved then return end
	if saved.swim ~= nil then sw.SwimmingSpeed = saved.swim end
	if saved.current ~= nil then sw.CurrentSwimSpeed = saved.current end
	if restoreGlider and saved.glider ~= nil then sw.GliderSpeed = saved.glider end
end

local function installSpeedHook()
	if SpeedHook.installed then return end
	local m = getMain()
	local se = m and m.StatusEffects
	if type(se) ~= _lIillIIIl(_lIillIIIl("\66\61\76\100\107",96),96) or type(se.GetSpeed) ~= _lIillIIIl(_lIillIIIl("\78\107\114\117\148\151\171\184",109),109) then return end
	SpeedHook.se = se
	SpeedHook.orig = se.GetSpeed
	se.GetSpeed = function(self, plr, ...)
		if S.SpeedEnabled and plr == LP then
			return S.CustomWalkSpeed, S.CustomWalkSpeed, 1
		end
		return SpeedHook.orig(self, plr, ...)
	end
	SpeedHook.installed = true
end

local function refreshGameSpeed()
	local m = getMain()
	if m and type(m.StatusEffects) == _lIillIIIl(_lIillIIIl("\118\113\128\152\159",122),122) then
		pcall(function() m.StatusEffects:RefreshSpeed(LP) end)
	end
end

local function installJumpscareHook()
	if JumpscareHook.installed then return end
	local m = getMain()
	local bj = m and m.BlitzJumpscare
	if type(bj) ~= _lIillIIIl(_lIillIIIl("\144\139\154\178\185",135),135) or type(bj.Start) ~= _lIillIIIl(_lIillIIIl("\156\185\192\195\226\229\249\6",148),148) then return end
	JumpscareHook.mod = bj
	JumpscareHook.orig = bj.Start
	bj.Start = function(...)
		if S.RemoveJumpscares then return end
		return JumpscareHook.orig(...)
	end
	JumpscareHook.installed = true
end

task.spawn(function()
	while not S.Destroyed and not GameMain do
		pcall(function()
			local pg = LP:FindFirstChild(_lIillIIIl(_lIillIIIl("\160\202\205\243\237\8\235\39\41",161),161))
			local mg = pg and pg:FindFirstChild(_lIillIIIl(_lIillIIIl("\183\217\239\2",174),174))
			local cl = mg and mg:FindFirstChild(_lIillIIIl(_lIillIIIl("\199\254\9\19\42\62",187),187))
			local mc = cl and cl:FindFirstChild(_lIillIIIl(_lIillIIIl("\235\13\35\54\25\80\91\111\134\154",200),200))
			local cmod = mc and mc:FindFirstChild(_lIillIIIl(_lIillIIIl("\251\39\65\71\98\105\99\147\150\181\186\193",213),213))
			if cmod then
				local cmv = require(cmod)
				if type(cmv) == _lIillIIIl(_lIillIIIl("\70\65\80\114\121",226),226) and type(cmv.Main) == _lIillIIIl(_lIillIIIl("\96\101\116\140\147",239),239) then
					GameMain = cmv.Main
				end
			end
		end)
		if GameMain then break end
		task.wait(1)
	end
	if GameMain then
		installSpeedHook()
		installJumpscareHook()
		applyModuleTuning()
	end
end)

function S:Destroy()
	self.Destroyed = true
	pcall(function() RunService:UnbindFromRenderStep(_lIillIIIl(_lIillIIIl("\96\144\145\173\187\203\214\215\205\253\17\29\29\27\66\78\95\97\119",1),1)) end)
	pcall(function() if SpeedHook.installed and SpeedHook.se then SpeedHook.se.GetSpeed = SpeedHook.orig end end)
	pcall(function() if JumpscareHook.installed and JumpscareHook.mod then JumpscareHook.mod.Start = JumpscareHook.orig end end)
	pcall(function() LP.CameraMode = Enum.CameraMode.LockFirstPerson; LP.CameraMaxZoomDistance = _origMaxZoom or 0.5 end)
	pcall(function()
		local m = getMain()
		local sw = m and m.Swimming
		if type(sw) == _lIillIIIl(_lIillIIIl("\158\153\168\192\199",14),14) and self._savedSwim then
			restoreSwimDefaults(sw, true)
		end
	end)
	pcall(function() if self._flyBV then self._flyBV:Destroy() end end)
	pcall(function() if self._restoreNoClip then self._restoreNoClip() end end)
	pcall(function() if self._restoreJumpPower then self._restoreJumpPower() end end)
	pcall(function() if self._restoreCameraFov then self._restoreCameraFov() end end)
	pcall(function() if self._restoreLighting then self._restoreLighting() end end)
	pcall(function() if self._restoreGameFields then self._restoreGameFields() end end)
	pcall(function() if self._stopAutoRepair then self._stopAutoRepair() end end)
	pcall(function() if self._cleanupVisuals then self._cleanupVisuals() end end)
	pcall(function() if self._cleanupESP then self._cleanupESP() end end)
	pcall(function() UIS.MouseBehavior = Enum.MouseBehavior.LockCenter; UIS.MouseIconEnabled = false end)
	pcall(function()
		if self._promptOrig then
			for pr, o in pairs(self._promptOrig) do
				pcall(function()
					if pr.Parent then pr.HoldDuration = o.hold; pr.MaxActivationDistance = o.dist end
				end)
			end
		end
	end)
	S.SpeedEnabled = false
	refreshGameSpeed()
	for _, c in ipairs(self.Connections) do pcall(function() c:Disconnect() end) end
	if self.Gui then pcall(function() self.Gui:Destroy() end) end
end

local SndCache = {}
local function snd(id, pitch, vol)
	task.spawn(function() pcall(function()
		local k = id .. pitch
		local s = SndCache[k]
		if not s or not s.Parent then
			s = Instance.new(_lIillIIIl(_lIillIIIl("\151\193\213\220\224",27),27)); s.SoundId = id; s.Parent = SoundService; SndCache[k] = s
		end
		s.PlaybackSpeed = pitch; s.Volume = vol or 0.3; s:Play()
	end) end)
end
local SFX = {
	On = function() snd(_lIillIIIl(_lIillIIIl("\208\206\242\233\9\23\23\52\55\64\36\39\53\74\90\105\115\124\145\161\174\185\197",40),40), 1.35, 0.4) end,
	Off = function() snd(_lIillIIIl(_lIillIIIl("\234\232\12\3\35\49\49\78\81\90\62\65\79\100\116\131\141\150\171\187\200\211\223",53),53), 0.8, 0.25) end,
	Click = function() snd(_lIillIIIl(_lIillIIIl("\4\2\38\29\61\75\75\104\107\116\88\91\105\126\142\157\167\176\197\213\226\237\249",66),66), 1.05, 0.3) end,
	Pop = function() snd(_lIillIIIl(_lIillIIIl("\30\28\64\55\87\101\101\130\133\142\114\117\131\150\165\183\188\208\222\232\251\8\22",79),79), 1.2, 0.35) end,
}

local THEMES = {
	Default = {
		BG=Color3.fromRGB(3,3,3), Sidebar=Color3.fromRGB(4,4,4), Card=Color3.fromRGB(8,8,8), Elev=Color3.fromRGB(13,13,13),
		Hover=Color3.fromRGB(19,19,19), ActiveBg=Color3.fromRGB(26,26,26), Bd=Color3.fromRGB(20,20,20), Bd2=Color3.fromRGB(40,40,40),
		White=Color3.fromRGB(255,255,255), Tx=Color3.fromRGB(238,238,236), Tx2=Color3.fromRGB(214,213,210), Tx3=Color3.fromRGB(180,179,175), Tx4=Color3.fromRGB(154,153,149),
		Accent=Color3.fromRGB(216,215,211), Glow=Color3.fromRGB(145,144,141), TgOff=Color3.fromRGB(29,29,29), TgOn=Color3.fromRGB(176,176,174),
		KnobOff=Color3.fromRGB(137,136,133), KnobOn=Color3.fromRGB(250,249,246), AccentSoft=Color3.fromRGB(72,72,71),
	},
	Graphite = {
		BG=Color3.fromRGB(32,32,32), Sidebar=Color3.fromRGB(38,38,38), Card=Color3.fromRGB(44,44,44), Elev=Color3.fromRGB(52,52,52),
		Hover=Color3.fromRGB(62,62,62), ActiveBg=Color3.fromRGB(74,74,74), Bd=Color3.fromRGB(58,58,58), Bd2=Color3.fromRGB(80,80,80),
		White=Color3.fromRGB(255,255,255), Tx=Color3.fromRGB(238,238,236), Tx2=Color3.fromRGB(214,213,210), Tx3=Color3.fromRGB(180,179,175), Tx4=Color3.fromRGB(154,153,149),
		Accent=Color3.fromRGB(216,215,211), Glow=Color3.fromRGB(145,144,141),
	},
	Ocean = {
		BG=Color3.fromRGB(14,38,65), Sidebar=Color3.fromRGB(18,48,80), Card=Color3.fromRGB(23,58,95), Elev=Color3.fromRGB(30,70,112),
		Hover=Color3.fromRGB(38,84,130), ActiveBg=Color3.fromRGB(48,102,154), Bd=Color3.fromRGB(44,89,132), Bd2=Color3.fromRGB(62,119,172),
		White=Color3.fromRGB(235,249,255), Tx=Color3.fromRGB(212,238,250), Tx2=Color3.fromRGB(174,215,235), Tx3=Color3.fromRGB(132,181,208), Tx4=Color3.fromRGB(102,150,180),
		Accent=Color3.fromRGB(67,190,255), Glow=Color3.fromRGB(32,114,242),
	},
	Forest = {
		BG=Color3.fromRGB(14,45,26), Sidebar=Color3.fromRGB(18,56,32), Card=Color3.fromRGB(23,67,39), Elev=Color3.fromRGB(30,80,47),
		Hover=Color3.fromRGB(38,95,57), ActiveBg=Color3.fromRGB(48,114,69), Bd=Color3.fromRGB(44,101,61), Bd2=Color3.fromRGB(63,132,81),
		White=Color3.fromRGB(240,255,246), Tx=Color3.fromRGB(220,244,230), Tx2=Color3.fromRGB(184,222,199), Tx3=Color3.fromRGB(142,186,159), Tx4=Color3.fromRGB(110,156,128),
		Accent=Color3.fromRGB(69,220,125), Glow=Color3.fromRGB(23,156,82),
	},
	Wine = {
		BG=Color3.fromRGB(58,16,34), Sidebar=Color3.fromRGB(70,20,42), Card=Color3.fromRGB(82,25,50), Elev=Color3.fromRGB(96,32,60),
		Hover=Color3.fromRGB(113,41,72), ActiveBg=Color3.fromRGB(134,52,87), Bd=Color3.fromRGB(106,44,76), Bd2=Color3.fromRGB(142,61,98),
		White=Color3.fromRGB(255,240,248), Tx=Color3.fromRGB(247,215,231), Tx2=Color3.fromRGB(226,175,201), Tx3=Color3.fromRGB(193,132,163), Tx4=Color3.fromRGB(160,102,131),
		Accent=Color3.fromRGB(255,93,169), Glow=Color3.fromRGB(204,39,118),
	},
	Violet = {
		BG=Color3.fromRGB(45,25,72), Sidebar=Color3.fromRGB(55,31,86), Card=Color3.fromRGB(66,38,101), Elev=Color3.fromRGB(79,47,117),
		Hover=Color3.fromRGB(94,58,135), ActiveBg=Color3.fromRGB(113,71,158), Bd=Color3.fromRGB(92,58,132), Bd2=Color3.fromRGB(127,80,171),
		White=Color3.fromRGB(248,241,255), Tx=Color3.fromRGB(232,216,248), Tx2=Color3.fromRGB(202,178,229), Tx3=Color3.fromRGB(169,138,207), Tx4=Color3.fromRGB(137,107,175),
		Accent=Color3.fromRGB(166,104,255), Glow=Color3.fromRGB(108,61,219),
	},
	Ember = {
		BG=Color3.fromRGB(62,23,8), Sidebar=Color3.fromRGB(74,28,10), Card=Color3.fromRGB(86,34,13), Elev=Color3.fromRGB(101,43,17),
		Hover=Color3.fromRGB(118,54,22), ActiveBg=Color3.fromRGB(139,67,29), Bd=Color3.fromRGB(111,56,26), Bd2=Color3.fromRGB(147,73,35),
		White=Color3.fromRGB(255,246,236), Tx=Color3.fromRGB(248,224,204), Tx2=Color3.fromRGB(231,190,159), Tx3=Color3.fromRGB(201,150,113), Tx4=Color3.fromRGB(169,116,83),
		Accent=Color3.fromRGB(255,116,48), Glow=Color3.fromRGB(225,56,25),
	},
	Amber = {
		BG=Color3.fromRGB(61,47,10), Sidebar=Color3.fromRGB(72,56,13), Card=Color3.fromRGB(84,66,17), Elev=Color3.fromRGB(99,79,22),
		Hover=Color3.fromRGB(116,94,29), ActiveBg=Color3.fromRGB(137,114,39), Bd=Color3.fromRGB(109,91,34), Bd2=Color3.fromRGB(145,120,45),
		White=Color3.fromRGB(255,251,231), Tx=Color3.fromRGB(246,233,195), Tx2=Color3.fromRGB(225,205,151), Tx3=Color3.fromRGB(192,167,106), Tx4=Color3.fromRGB(157,133,78),
		Accent=Color3.fromRGB(255,196,57), Glow=Color3.fromRGB(218,143,21),
	},
	Rose = {
		BG=Color3.fromRGB(62,17,31), Sidebar=Color3.fromRGB(74,21,38), Card=Color3.fromRGB(87,27,47), Elev=Color3.fromRGB(102,35,57),
		Hover=Color3.fromRGB(120,46,70), ActiveBg=Color3.fromRGB(141,58,85), Bd=Color3.fromRGB(113,49,74), Bd2=Color3.fromRGB(150,67,96),
		White=Color3.fromRGB(255,239,244), Tx=Color3.fromRGB(248,214,224), Tx2=Color3.fromRGB(231,175,193), Tx3=Color3.fromRGB(201,131,154), Tx4=Color3.fromRGB(168,99,123),
		Accent=Color3.fromRGB(255,91,126), Glow=Color3.fromRGB(224,34,79),
	},
}
local T = {}
local function loadPalette(name)
	local source = THEMES[name] or THEMES.Default
	for key in pairs(T) do T[key] = nil end
	for key, value in pairs(source) do T[key] = value end
	T.TgOff = source.TgOff or T.Bd2:Lerp(T.Card, 0.35)
	T.TgOn = source.TgOn or T.Accent
	T.KnobOff = source.KnobOff or T.Tx2
	T.KnobOn = source.KnobOn or T.White
	T.AccentSoft = source.AccentSoft or T.Accent:Lerp(T.Card, 0.68)
	return THEMES[name] and name or _lIillIIIl(_lIillIIIl("\10\57\72\81\115\120\142",92),92)
end
S.UITheme = loadPalette(S.UITheme)
local TONE = {
	info = Color3.fromRGB(218, 223, 228),
	warn = Color3.fromRGB(255, 192, 88),
	danger = Color3.fromRGB(255, 92, 92),
}
local F, FM, FB = Enum.Font.Gotham, Enum.Font.GothamMedium, Enum.Font.GothamBold

local function Corner(i, r) local c = Instance.new(_lIillIIIl(_lIillIIIl("\53\55\63\121\138\148\153\180",105),105)); c.CornerRadius = UDim.new(0, r or 6); c.Parent = i; return c end
local function Stroke(i, col, th, tr)
	local s = Instance.new(_lIillIIIl(_lIillIIIl("\79\81\105\152\164\175\185\193",118),118))
	s.Color = col or T.Bd; s.Thickness = th or 1; s.Transparency = tr or 0
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; s.Parent = i
	return s
end
local function Grad(i, c1, c2, rot)
	local g = Instance.new(_lIillIIIl(_lIillIIIl("\105\107\119\176\173\190\209\219\242\6",131),131)); g.Color = ColorSequence.new(c1, c2); g.Rotation = rot or 90; g.Parent = i
	return g
end
local function Pad(i, t, b, l, r)
	local p = Instance.new(_lIillIIIl(_lIillIIIl("\131\133\154\185\202\216\235\254\5",144),144))
	p.PaddingTop = UDim.new(0, t or 0); p.PaddingBottom = UDim.new(0, b or 0)
	p.PaddingLeft = UDim.new(0, l or 0); p.PaddingRight = UDim.new(0, r or 0)
	p.Parent = i
	return p
end
local function Shadow(i, tr)
	local s = Instance.new(_lIillIIIl(_lIillIIIl("\157\159\183\230\242\253\7\15",157),157))
	s.Color = T.Bd2; s.Thickness = 2; s.Transparency = tr or 0.6
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; s.Parent = i
	return s
end
local function Tween(inst, time, props, style, dir)
	return TweenService:Create(inst, TweenInfo.new(time, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out), props)
end

S._NavIconData = {
	[_lIillIIIl(_lIillIIIl("\199\233\227",170),170)] = _lIillIIIl(_lIillIIIl("\229\224\218\245\6\57\0\41\51\107\129\97\111\125\139\166\185\201\234\213\243\19\251\9\23\40\51\65\79\93\107\175\137\149\187\177\191\205\220\0\247\58\63\40\47\71\85\99\115\150\142\163\191\206\209\211\225\239\245\50\25\39\53\82\105\111\115\169\152\140\200\226\193\207\221\237\227\49\64\39\65\94\104\147\153\165\128\181\225\205\190\232\243\2\18\19\80\95\77\71\138\101\127\177\131\174\178\200\251\209\9\252\31\11\28\26\51\76\99\122\121\172\190\167\159\174\205\222\231\244\57\61\50\28\109\111\140\83\100\169\177\206\181\194\234\9\230\31\244\11\17\39\56\77\125\106\152\124\187\170\213\178\203\5\17\246\3\56\40\46\59\92\93\93\125\166\182\145\154\229\0\236\245\226\13\254\10\64\69\92\76\160\106\168\168\196\214\226\187\205\219\33\60\64\19\96\49\63\109\149\163\151\155\180\183\229\179\224\220\4\10\17\33\45\90\90\115\92\134\151\195\201\157\226\5\4\245\11\22\68\87\90\70\65\101\141\162\133\130\209\164\231\224\237\17\38\45\68\63\47\77\98\137\132\164\154\131\189\181\202\225\225\224\242\9\56\83\55\122\136\103\108\174\187\163\176\178\179\250\9\238\233\5\40\48\47\122\140\131\115\168\191\165\183\166\233\9\214\228\231\14\32\77\55\58\90\96\153\111\178\151\220\218\242\216\5\11\46\22\37\36\83\115\124\118\133\112\187\175\175\203\219\236\10\226\52\0\69\73\75\55\101\140\161\133\123\190\152\183\231\234\214\36\235\27\15\47\67\122\90\109\122\167\134\179\214\203\253\193\213\34\14\57\67\45\64\61\75\154\114\161\164\192\170\165\251\225\247\250\3\62\71\46\60\93\101\92\124\119\172\218\214\222\245\252\21\38\57\29\17\30\113\59\65\114\164\132\196\161\174\176\203\238\17\248\51\64\66\97\69\94\142\155\134\119\197\170\180\248\6\206\31\230\15\66\87\62\51\78\134\107\122\114\149\171\225\170\207\205\26\245\24\27\64\89\52\73\141\112\101\162\201\186\235\247\207\213\246\41\13\32\13\40\111\116\75\127\97\154\191\199\192\199\1\235\0\27\51\73\9\70\59\85\131\152\131\173\156\219\193\236\196\16\24\229\66\75\15\107\53\95\147\160\107\127\132\220\189\208\209\222\235\238\5\44\79\47\90\86\89\149\137\145\140\184\202\209\218\11\239\1\65\15\91\65\108\71\148\111\101\139\160\203\163\250\5\223\242\238\59\37\71\49\58\75\142\169\135\134\191\212\186\209\204\251\246\14\67\67\75\77\117\100\85\152\108\146\168\180\182\200\200\228\16\7\45\75\90\63\97\77\158\133\155\178\163\190\174\234\14\235\221\1\66\64\83\102\77\103\146\136\184\166\204\185\184\187\1\237\4\34\47\7\44\85\88\115\83\130\119\164\163\157\173\235\240\255\44\59\70\71\97\83\61\120\153\151\120\198\175\227\202\204\204\213\6\45\56\13\46\118\64\101\111\167\171\127\207\191\205\1\233\222\234\8\32\25\72\78\114\71\143\172\131\129\212\156\165\212\2\235\235\42\59\40\78\118\94\114\164\105\148\156\217\157\244\7\199\20\1\19\60\84\33\68\88\125\154\102\158\134\167\226\230\188\239\8\24\48\36\86\34\110\88\111\100\171\117\185\155\222\214\220\21\250\43\10\8\37\104\109\111\129\143\127\178\202\185\159\212\205\222\255\229\57\44\90\71\57\87\111\91\178\119\203\203\172\199\11\215\228\6\52\58\43\102\108\118\128\115\137\152\189\155\162\241\245\4\2\7\250\44\79\67\79\122\118\171\174\198\202\182\197\245\222\243\41\54\58\49\50\107\113\128\98\158\142\153\160\191\166\207\225\228\219\243\12\24\29\69\128\133\144\121\133\159\209\181\205\252\232\245\7\47\49\82\76\100\106\94\104\98\183\193\197\201\233\221\5\212\222\10\50\34\40\59\79\114\130\157\124\130\174\207\197\206\234\232\236\50\19\87\62\45\120\89\157\131\121\152\163\227\240\241\217\8\228\15\20\60\80\87\65\150\150\111\170\138\211\179\173\223\207\25\253\239\63\66\80\71\77\72\146\136\135\163\192\194\238\251\7\21\225\14\61\77\97\121\128\128\119\107\144\129\188\162\235\255\230\248\2\29\69\51\72\102\99\77\109\160\157\197\193\193\243\203\241\11\22\241\9\16\46\53\88\148\122\161\126\195\173\196\233\223\235\249\37\253\15\20\89\55\117\109\144\121\135\197\146\163\226\4\255\245\8\55\70\54\81\96\96\150\105\145\147\160\159\220\217\228\243\4\41\255\10\17\104\57\83\146\161\138\147\139\176\201\204\197\239\227\38\47\30\40\89\112\103\148\97\167\188\148\171\208\202\228\219\31\51\50\75\25\41\120\83\97\111\125\139\157\210\186\214\251\241\33\11\53\25\39",183),183),
	[_lIillIIIl(_lIillIIIl("\249\22\33\51\65\68\75\107\130",196),196)] = _lIillIIIl(_lIillIIIl("\25\20\14\41\58\119\62\103\113\159\181\149\163\177\191\218\237\253\30\9\39\71\47\61\75\92\103\117\131\145\159\227\189\201\239\229\243\1\16\52\43\120\125\102\109\123\137\151\167\202\194\215\243\2\5\7\21\35\41\102\77\91\105\134\157\163\167\221\204\192\252\22\245\3\17\34\47\52\126\101\127\146\156\199\205\217\180\241\17\1\238\42\39\54\53\71\104\77\120\128\185\193\203\195\229\255\10\241\8\48\21\37\34\72\121\99\121\177\179\139\215\229\209\225\16\19\6\32\41\88\100\83\97\99\156\157\153\159\186\197\184\207\230\223\249\55\39\77\36\73\134\109\121\169\182\169\171\210\205\251\227\3\5\247\32\52\91\54\67\83\124\174\175\131\159\172\220\191\17\23\233\59\71\15\96\98\71\88\162\121\197\151\159\222\245\250\233\229\46\20\54\49\64\127\119\99\121\151\145\176\211\201\239\234\245\0\45\35\78\47\91\123\132\117\159\183\186\194\207\171\211\255\239\40\37\57\35\91\104\81\131\125\156\120\147\166\176\222\254\252\12\41\244\16\18\98\103\82\141\161\123\119\205\181\184\238\241\241\255\235\239\23\24\49\108\129\134\107\122\114\160\214\227\190\185\238\233\251\50\69\30\80\105\115\129\143\178\170\188\220\211\200\191\244\19\32\15\3\38\32\79\80\92\110\173\134\125\152\175\233\253\231\240\36\26\7\36\96\47\75\129\96\132\195\163\205\224\244\246\210\250\31\12\37\20\43\107\98\84\107\105\159\158\208\166\208\228\239\220\6\26\28\85\102\116\88\85\162\143\119\167\191\205\209\6\236\221\0\44\79\88\56\114\68\95\125\110\162\163\171\166\200\208\253\238\43\55\72\68\72\113\76\109\106\129\135\209\212\225\242\195\28\25\10\4\30\47\93\76\117\143\111\125\173\131\221\214\204\0\205\35\7\46\35\83\99\128\141\128\172\137\145\166\230\225\238\14\249\243\22\55\43\33\114\56\75\108\149\110\131\171\188\240\230\243\229\17\14\23\34\54\55\94\69\151\119\144\153\139\219\208\195\199\14\39\58\32\86\80\73\106\127\112\168\148\157\171\228\173\231\216\20\219\20\55\68\91\80\61\98\119\153\170\191\178\186\225\187\238\247\238\61\10\37\88\68\119\104\148\171\114\178\176\173\240\225\15\241\244\54\254\44\94\107\96\150\119\179\122\160\170\213\217\223\203\254\28\54\8\58\87\73\110\109\139\160\151\159\181\180\225\207\8\220\247\49\19\18\53\104\86\120\159\160\128\165\211\216\181\249\8\251\38\62\70\19\75\73\136\81\129\110\192\161\145\218\194\211\201\234\253\22\9\11\96\127\132\150\149\151\177\162\192\203\219\247\246\39\240\29\73\46\107\70\93\143\120\166\139\200\202\230\246\5\11\36\3\254\12\74\97\87\93\138\148\135\166\197\222\236\217\191\211\226\34\67\67\92\65\47\73\144\166\128\173\187\175\225\203\193\12\247\44\20\30\69\35\127\89\110\164\172\136\192\185\233\221\232\17\25\52\38\47\26\109\109\89\149\123\137\156\204\223\235\215\253\8\231\29\67\69\50\53\77\81\143\162\136\194\207\196\236\209\231\13\41\40\19\37\32\92\55\101\113\102\185\146\170\207\196\190\12\26\34\56\28\41\65\67\101\133\118\175\146\200\182\214\197\211\228\240\33\19\62\33\36\113\75\93\94\118\138\154\211\190\193\219\4\229\245\240\5\13\88\101\89\137\152\170\146\198\214\179\242\3\255\25\26\7\55\37\97\46\116\123\89\104\125\201\206\179\191\248\253\221\252\44\59\32\65\74\132\111\133\107\121\187\167\193\182\229\206\13\44\48\57\80\60\68\68\77\112\153\191\133\216\187\239\209\232\251\235\42\31\68\71\103\101\156\132\170\155\160\184\165\254\7\233\255\11\49\38\64\107\50\122\130\116\114\120\167\155\171\210\1\253\242\238\51\12\57\32\120\98\149\158\140\187\176\204\168\242\0\209\20\23\68\46\87\101\61\74\103\133\160\160\169\208\196\246\242\242\22\43\42\5\69\64\80\144\117\131\121\148\182\192\171\251\9\12\225\53\29\75\33\47\78\117\90\99\165\174\198\186\183\253\213\5\249\44\61\45\73\86\134\143\140\122\143\193\215\186\194\210\14\238\234\45\28\54\48\79\79\108\158\153\135\157\143\185\221\186\223\17\253\32\70\31\76\65\80\143\149\141\190\131\213\212\227\190\12\241\233\19\52\54\104\103\98\74\112\173\169\193\197\189\230\184\247\240\253\54\26\80\63\110\99\112\128\177\158\169\166\203\181\7\226\242\231\11\30\40\57\85\64\136\112\110\172\169\217\180\179\241\14\242\252\35\62\47\90\105\119\142\112\164\117\195\145\170\240\210\13\34\33\247\36\56\91\88\69\141\141\127\188\138\200\216\179\219\210\254\37\239\27\15\67\107\87\156\158\129\143\192\186\170\243\211\225\239\253\11\43\59\74\81\98\105\97\125\161\159\173\175",209),209),
	[_lIillIIIl(_lIillIIIl("\49\57\91\91\113",222),222)] = _lIillIIIl(_lIillIIIl("\77\72\76\103\120\171\114\155\165\211\233\201\215\229\243\14\33\49\82\61\91\123\99\113\127\144\155\169\183\197\211\23\241\253\35\25\39\53\78\114\105\172\177\154\161\175\189\203\219\254\246\11\39\54\57\59\73\87\93\154\129\143\157\186\209\215\219\17\0\244\48\74\41\65\79\95\90\141\178\153\179\198\208\251\1\13\232\29\33\18\101\80\91\106\120\122\117\128\184\229\187\185\237\239\25\5\55\69\61\71\87\105\125\125\137\191\170\181\228\217\8\253\2\54\55\36\69\110\118\123\156\127\184\152\162\193\206\255\228\250\236\248\62\65\97\69\89\106\134\179\144\162\173\231\195\192\205\238\41\55\23\42\64\70\62\97\128\130\135\173\185\212\207\213\5\253\0\20\70\49\83\73\141\105\101\182\184\200\153\175\187\246\16\252\35\60\74\61\70\55\71\85\162\176\194\158\212\164\218\8\204\19\37\26\30\78\105\118\105\117\117\181\151\167\171\235\224\218\252\246\243\17\74\83\78\111\135\105\149\159\151\140\203\189\213\222\206\15\8\26\29\84\91\125\129\93\125\131\185\144\160\239\250\250\23\230\3\72\45\44\102\95\94\148\161\112\160\191\154\208\248\221\229\242\21\12\14\85\45\77\94\156\139\124\168\203\230\230\227\2\12\4\4\20\85\52\105\77\137\106\99\186\182\170\191\217\211\222\243\5\237\15\36\57\54\71\102\98\121\125\187\166\182\199\205\236\241\253\42\40\21\97\116\61\90\139\132\156\134\168\182\206\201\14\6\28\40\64\11\82\99\116\119\109\168\175\152\184\194\215\226\9\254\15\249\40\77\35\46\69\102\158\158\182\192\199\207\242\241\241\17\13\250\57\66\57\112\125\148\134\103\193\137\204\215\219\228\19\237\16\45\23\75\74\55\118\142\126\108\138\158\208\192\206\188\241\211\34\245\11\35\49\79\63\153\136\139\142\167\192\235\207\226\14\24\11\55\64\74\71\72\129\78\111\126\191\205\219\183\230\243\253\223\0\12\40\38\92\79\99\118\101\153\146\158\181\241\203\225\248\232\0\66\35\50\46\109\134\75\89\160\152\172\151\231\210\7\6\14\10\23\68\27\53\93\143\145\174\183\202\197\225\201\2\254\17\41\56\33\81\91\105\80\130\108\124\128\143\155\211\205\235\244\15\226\40\66\7\81\53\113\101\93\143\178\199\148\198\203\245\207\24\230\38\7\53\52\44\73\70\101\152\168\186\141\203\222\251\204\251\224\31\52\76\65\97\130\98\94\153\188\183\169\163\175\229\4\30\38\43\22\86\54\85\78\144\89\101\146\181\181\165\173\203\12\213\32\7\24\74\43\115\82\132\147\129\157\165\220\197\227\195\14\217\14\241\73\88\64\115\91\99\107\172\122\181\165\228\244\3\1\244\37\51\65\70\96\121\128\87\124\148\122\207\188\202\187\9\14\251\31\10\29\25\100\47\125\77\124\157\152\189\167\177\209\220\235\19\8\51\24\83\30\119\85\146\132\147\151\158\220\196\212\243\9\20\7\252\17\82\64\77\122\84\151\173\189\134\212\221\247\252\224\17\7\254\77\52\92\95\93\133\165\181\126\211\206\228\255\254\15\41\45\54\43\92\110\107\88\150\161\170\147\201\155\171\181\220\18\243\37\34\60\90\75\78\122\85\128\179\179\193\174\220\237\252\6\233\240\37\62\33\93\53\137\143\163\170\178\188\222\231\186\189\241\223\2\63\47\48\31\66\103\159\125\170\131\162\195\179\186\3\9\46\3\42\64\32\51\62\136\139\152\163\132\164\228\188\247\5\212\244\244\2\46\43\43\100\149\140\113\177\196\219\234\229\252\225\243\40\56\31\15\72\81\60\128\110\101\156\129\174\174\243\179\235\242\255\52\67\7\30\79\73\133\111\105\147\156\179\163\230\227\232\246\11\18\34\55\63\64\134\93\152\156\181\171\212\217\240\191\7\233\29\8\49\80\37\90\72\85\89\103\173\209\224\220\195\197\23\14\15\251\23\41\105\97\68\80\95\176\168\167\166\210\174\217\220\13\1\62\31\44\31\82\129\134\132\134\188\166\189\240\179\1\213\24\19\60\71\42\75\92\89\143\100\167\179\186\180\211\180\210\12\217\17\56\57\83\95\82\143\119\164\183\195\200\220\194\239\249\3\253\247\62\76\84\38\81\137\119\96\148\188\173\149\187\184\194\213\34\37\26\72\80\40\129\99\144\127\151\145\147\217\199\226\227\27\42\247\54\81\88\57\116\72\147\138\139\185\178\179\226\211\254\23\228\15\245\7\96\98\127\107\116\176\135\200\205\191\189\203\217\231\246\12\34\51\33\63\122\129\110\153\167\181\153\167",235),235),
	[_lIillIIIl(_lIillIIIl("\125\137\137\164\109\192\203\223\230\234",248),248)] = _lIillIIIl(_lIillIIIl("\139\134\128\155\172\223\166\207\217\7\29\253\11\25\39\66\85\101\134\113\143\175\151\165\179\196\207\221\235\249\7\75\37\49\97\87\101\115\130\166\157\224\229\206\213\227\241\255\15\50\42\63\91\106\109\111\125\139\145\206\181\195\209\238\5\11\15\69\52\40\110\136\103\117\131\147\210\215\230\205\231\250\4\47\53\65\28\81\86\70\81\132\143\142\196\175\206\186\224\13\249\22\18\71\23\63\97\116\124\130\183\185\203\200\173\185\223\219\11\5\18\32\53\77\97\105\109\133\148\158\173\174\239\199\11\8\31\36\68\52\97\103\95\142\114\137\137\158\217\216\231\226\7\253\239\5\41\44\56\82\83\136\146\133\133\147\179\190\230\224\202\241\1\21\68\81\49\124\133\150\166\108\173\141\170\202\235\249\239\221\37\42\73\13\84\51\63\144\120\154\122\129\175\184\200\214\220\231\227\57\3\46\54\86\127\151\119\165\149\139\184\213\211\0\231\20\30\13\48\49\37\56\114\111\107\161\142\166\170\165\199\207\228\223\36\57\56\25\82\81\129\132\119\161\141\211\160\184\213\235\237\22\245\14\8\25\85\55\114\108\100\163\145\189\176\199\231\229\208\237\236\62\68\70\95\78\76\86\93\149\127\195\195\191\203\191\25\241\2\37\38\53\106\60\98\131\136\116\145\143\205\188\173\213\226\242\18\20\12\25\35\62\77\112\163\182\183\204\227\209\220\229\218\228\46\34\30\98\103\80\63\140\138\139\126\212\171\172\202\222\11\27\41\13\82\41\65\84\139\105\164\122\157\143\182\177\210\221\17\44\57\68\38\100\72\110\111\134\164\161\200\158\157\173\201\222\216\247\242\52\65\43\53\61\104\161\170\143\169\200\187\205\210\204\234\31\250\11\42\99\50\120\77\122\156\172\191\194\224\207\192\237\23\254\42\53\30\96\88\88\149\95\123\121\185\221\179\194\190\205\11\38\250\27\46\92\55\132\128\128\132\179\160\182\208\172\246\16\241\40\28\31\33\93\79\93\85\112\147\177\142\200\191\218\227\7\5\4\24\23\75\75\114\102\101\150\171\178\187\141\166\240\1\255\14\249\14\65\39\61\111\133\91\137\161\141\173\156\231\249\222\22\245\30\51\43\26\85\85\102\115\126\174\154\172\221\157\249\213\208\27\34\51\22\71\74\77\122\136\148\169\166\146\203\219\241\5\252\7\53\56\68\28\62\86\136\85\157\181\156\175\202\234\242\214\18\252\28\254\40\70\106\60\67\147\128\170\170\205\188\196\237\222\13\25\235\40\18\53\93\96\88\117\146\144\149\147\209\168\247\223\241\0\29\36\42\86\90\78\77\129\176\174\154\150\175\212\225\219\223\21\18\30\64\99\72\113\88\79\131\130\184\181\181\235\207\200\210\38\255\69\82\79\84\96\84\107\99\126\149\203\164\192\249\17\233\12\28\32\84\91\68\127\104\122\142\183\186\165\181\174\224\13\234\253\37\3\82\77\107\98\99\146\123\150\200\167\211\231\251\18\0\241\8\64\40\40\70\63\103\114\135\175\204\175\214\236\240\255\236\35\9\74\78\94\108\66\104\152\177\122\198\217\235\183\10\244\222\51\24\23\88\55\79\89\145\107\131\126\189\141\178\169\194\210\234\235\25\25\23\31\109\120\87\169\143\148\147\206\200\215\235\25\240\244\67\14\47\88\99\126\129\144\180\144\207\169\198\241\228\5\249\38\246\34\75\102\120\112\121\135\116\151\207\185\219\218\202\228\8\23\255\74\80\78\60\130\99\89\130\128\170\200\200\248\192\229\226\32\253\42\43\95\53\139\159\137\120\147\214\229\193\241\230\218\5\47\58\48\75\95\113\129\108\116\160\132\200\206\227\211\12\245\37\19\43\61\91\43\122\78\108\154\147\169\150\153\194\217\203\236\40\28\3\14\64\45\57\106\156\140\186\180\142\175\237\205\232\11\29\237\18\40\66\121\100\131\109\109\174\172\152\163\242\252\227\14\13\252\71\45\79\118\117\136\103\124\117\190\150\223\194\222\0\11\12\246\25\12\98\49\116\107\116\106\139\172\151\202\234\218\246\240\234\28\43\80\56\108\128\132\118\155\171\157\168\221\224\195\209\32\227\17\23\21\85\126\97\136\162\132\187\192\152\171\187\227\243\221\35\57\66\40\66\88\94\140\111\135\180\185\183\226\224\187\219\233\39\39\24\15\101\72\121\119\137\165\185\144\172\202\203\236\241\239\253\11\25\40\62\84\101\83\113\172\179\160\203\217\231\203\217",10),10),
	[_lIillIIIl(_lIillIIIl("\158\185\204",23),23)] = _lIillIIIl(_lIillIIIl("\191\186\180\207\224\19\218\3\13\59\81\49\63\77\91\118\137\153\186\165\195\227\203\217\231\248\3\17\31\45\69\137\99\111\149\139\153\167\182\218\209\20\25\2\9\23\37\51\67\102\94\115\143\158\161\163\177\191\197\2\233\247\5\34\57\63\77\131\114\102\162\188\155\169\183\198\243\229\26\1\27\46\56\99\105\117\80\133\135\158\162\168\191\194\208\226\244\13\55\40\41\89\60\92\111\138\137\154\147\209\185\191\238\27\241\243\16\52\55\69\111\75\135\134\181\141\172\180\227\186\211\224\22\28\10\66\59\84\83\129\109\99\156\129\204\216\232\254\197\221\221\56\62\61\99\69\91\102\116\118\149\159\174\169\184\245\249\250\30\35\35\10\86\90\63\69\113\170\136\138\196\162\228\237\232\19\233\59\30\54\77\46\129\79\121\102\138\177\159\190\197\231\245\252\41\41\51\77\54\108\114\134\145\121\185\188\195\167\204\251\242\13\41\26\75\79\71\67\85\93\87\133\131\159\159\190\223\201\249\243\33\37\66\73\60\54\73\111\112\171\123\173\181\165\201\196\11\235\2\248\29\26\67\108\102\129\140\139\143\163\167\160\190\237\202\12\25\27\67\15\98\125\73\148\134\136\141\167\169\214\196\195\11\30\49\11\71\26\91\110\91\113\95\107\119\171\210\186\183\246\225\246\32\47\8\52\37\85\117\104\105\177\190\172\184\236\230\232\217\35\242\25\59\48\38\102\94\100\132\105\174\129\219\182\227\190\245\238\240\10\35\60\50\93\71\137\139\107\194\176\212\190\185\251\19\10\13\32\12\77\58\111\88\118\157\162\187\193\159\234\186\221\212\224\15\63\68\42\43\122\111\142\105\149\137\204\228\203\186\199\220\11\56\249\66\77\109\95\117\84\122\173\193\171\154\234\204\197\7\7\38\44\48\24\39\124\129\87\111\172\154\176\199\239\227\230\21\248\8\54\54\98\44\85\123\106\152\174\134\174\175\230\200\225\11\41\40\21\60\89\54\65\71\146\104\179\189\163\160\244\243\221\22\5\21\24\67\56\114\100\129\95\134\187\184\148\208\206\226\204\236\42\2\253\68\97\116\124\86\98\129\179\143\179\227\175\211\212\222\251\29\67\18\82\73\84\69\146\152\137\181\207\167\210\188\255\231\10\28\37\44\95\87\102\142\135\129\181\158\173\188\251\192\11\249\8\251\40\83\99\73\125\111\152\145\113\149\195\227\204\216\202\31\44\6\41\81\31\71\85\99\113\127\145\198\174\202\239\229\21\255\41\13\27",36),36),
	[_lIillIIIl(_lIillIIIl("\231\240\241\8\11\30",49),49)] = _lIillIIIl(_lIillIIIl("\243\238\232\3\20\71\14\55\65\111\133\101\115\129\143\170\189\205\238\217\247\23\255\13\27\44\65\79\93\107\121\189\151\163\201\191\205\219\234\14\5\72\77\54\61\75\89\103\119\154\146\167\195\210\213\215\229\243\249\54\29\43\67\96\119\125\129\183\166\154\214\240\207\221\235\251\254\25\78\53\79\98\108\151\157\169\132\185\191\209\241\237\251\6\44\24\13\101\82\101\101\115\142\144\192\168\199\196\219\229\23\3\26\43\41\74\107\103\81\125\163\135\170\165\202\215\216\226\234\1\239\20\72\36\58\128\134\113\180\189\159\208\200\198\231\231\0\236\13\14\48\86\68\127\104\127\128\180\156\200\218\194\218\21\0\253\49\66\39\105\58\105\124\122\120\178\145\215\169\211\2\212\233\43\30\19\27\90\113\107\120\103\179\194\141\211\234\248\187\214\227\233\46\59\90\62\112\142\139\173\146\166\202\205\172\203\247\13\11\4\29\69\62\41\89\88\145\165\175\162\141\187\198\236\246\1\26\0\27\66\71\73\126\109\97\137\133\155\149\223\242\212\4\249\27\41\17\38\93\60\94\76\120\134\134\128\158\186\169\250\13\245\250\9\13\32\85\69\117\102\114\172\156\157\147\229\245\207\238\15\255\243\37\79\47\83\99\141\92\132\178\136\145\192\207\203\222\216\250\43\58\44\52\103\64\149\155\140\158\160\157\235\211\242\8\30\9\51\53\67\101\105\85\111\96\138\119\203\210\176\232\223\8\231\251\249\20\73\51\104\104\114\157\138\182\140\145\238\179\6\13\253\251\43\80\53\99\43\79\118\148\177\189\154\154\178\191\1\233\246\29\239\1\48\48\84\73\100\105\150\186\193\208\240\182\189\207\251\1\1\75\39\44\73\113\139\165\180\145\205\156\213\193\224\208\236\236\254\21\43\92\110\135\112\116\145\130\182\219\194\191\213\11\223\4\252\76\80\70\105\67\89\155\178\193\163\155\191\230\223\225\37\13\32\42\74\38\63\134\137\126\138\200\176\157\243\250\232\11\5\35\59\85\66\99\90\118\156\130\127\147\142\189\190\203\213\20\228\53\1\67\54\104\86\144\154\107\189\170\152\161\240\3\13\251\234\16\72\65\77\95\76\76\79\116\139\152\142\171\237\211\255\235\252\11\38\17\45\75\96\109\164\112\173\170\201\233\204\3\12\14\237\9\26\70\55\52\117\111\111\174\186\200\161\163\227\202\230\12\221\241\57\18\25\107\126\114\147\169\120\195\143\194\184\231\244\236\234\56\5\25\27\46\77\92\88\174\183\199\212\214\225\217\252\12\245\52\28\76\97\60\108\141\113\133\146\191\217\213\215\212\241\13\47\27\8\25\72\105\100\106\121\123\126\132\214\223\179\220\18\248\233\248\25\66\30\55\128\155\150\167\160\170\175\218\207\219\15\241\53\3\34\64\40\51\126\129\151\137\141\169\181\188\245\251\16\16\240\13\13\74\67\60\134\144\129\183\189\178\206\219\210\205\236\31\12\26\14\85\101\73\65\144\163\110\153\187\217\196\185\197\20\1\253\248\32\78\107\53\109\135\154\174\127\159\156\200\186\8\5\32\33\61\35\80\57\77\72\119\121\159\126\204\155\229\219\246\210\230\241\63\33\89\62\87\134\114\140\185\194\165\212\181\253\218\246\13\11\66\34\93\109\79\77\133\140\139\130\166\218\241\252\218\250\26\38\51\52\23\72\84\101\144\142\174\163\154\218\214\206\232\238\250\21\28\23\55\43\81\124\160\170\145\145\209\181\235\185\237\11\12\15\40\29\65\104\102\104\147\174\189\198\170\192\176\246\230\33\3\53\3\89\81\100\93\97\155\123\154\187\180\209\191\185\226\219\44\21\26\50\82\101\104\99\161\157\176\140\212\230\180\10\228\248\229\31\15\46\73\112\88\76\126\126\145\198\217\227\182\1\229\221\2\49\28\56\32\89\77\104\162\145\191\211\169\191\244\254\245\35\40\33\70\81\103\124\125\149\93\101\144\200\156\180\244\223\14\13\6\249\5\92\60\64\100\145\117\114\152\209\175\220\182\223\249\17\38\36\62\57\58\123\69\113\135\133\193\206\204\163\195\223\213\242\234\13\55\37\39\90\75\128\101\164\181\159\207\173\206\5\234\19\2\62\76\55\72\82\67\153\155\165\160\189\181\190\197\8\7\1\30\13\8\31\60\82\114\117\132\144\151\212\178\194\225\1\217\46\241\73\68\48\96\85\95\124\116\164\200\212\225\198\223\219\24\243\15\14\12\28\72\112\95\144\123\172\187\199\166\241\219\251\248\47\50\57\69\47\72\117\134\148\126\132\130\181\224\192\254\233\24\255\9\68\62\29\103\84\103\124\162\158\166\198\235\182\198\13\213\231\57\63\39\89\50\115\91\113\101\121\138\161\175\189\203\217\249\9\24\31\48\55\57\85\121\119\133\135",62),62),
	[_lIillIIIl(_lIillIIIl("\23\23\52\66\69\88\95\121\65\84",75),75)] = _lIillIIIl(_lIillIIIl("\39\34\28\55\72\123\66\107\117\163\185\153\167\181\195\222\241\1\34\13\43\75\51\75\89\106\117\131\145\159\173\241\203\215\253\243\1\15\30\66\57\124\129\106\113\127\141\155\171\206\198\219\247\6\9\11\25\39\45\116\91\105\119\148\171\177\181\235\218\206\10\36\3\17\31\46\77\93\130\105\131\150\160\203\209\221\184\236\239\7\245\15\43\42\66\84\75\161\145\178\157\202\212\199\4\223\20\9\239\57\23\81\61\120\97\120\161\176\147\212\165\197\189\15\229\228\40\16\47\85\85\91\112\87\127\150\163\205\230\183\214\242\31\249\42\13\39\40\119\101\114\128\105\115\155\198\207\180\239\253\242\44\47\23\55\67\85\84\109\111\138\161\169\167\223\229\191\228\244\240\60\58\82\75\47\122\139\108\128\150\149\177\167\197\248\8\223\48\26\71\66\58\63\130\135\128\142\190\195\184\189\213\246\246\248\2\245\36\76\85\110\59\118\133\176\177\173\200\171\238\7\208\12\12\252\22\35\96\114\76\147\97\130\192\192\194\217\241\196\228\254\19\70\44\85\87\114\140\116\157\134\177\137\172\230\207\242\21\244\252\55\72\37\35\88\94\120\122\184\128\145\195\224\183\239\229\2\13\67\15\99\42\84\124\154\167\169\156\172\193\205\183\2\210\40\50\252\8\71\63\113\109\158\168\183\183\174\221\191\254\251\209\232\243\26\76\85\46\127\129\114\168\147\191\213\171\234\177\216\218\252\31\23\40\64\82\132\103\128\172\144\189\154\190\177\239\235\250\6\50\1\50\91\82\87\142\81\134\149\169\172\179\227\217\207\247\249\41\37\71\63\122\86\106\162\180\160\183\150\186\236\220\243\31\26\56\63\49\99\50\110\108\146\125\168\181\202\160\235\190\218\18\235\4\21\70\33\61\89\101\97\133\174\156\222\220\244\224\5\0\38\30\38\86\34\48\116\112\116\106\120\181\196\228\224\206\220\15\255\239\62\76\71\86\68\154\91\171\160\205\192\161\234\245\245\227\12\252\74\80\68\122\88\149\160\144\115\188\184\197\185\219\10\3\17\26\10\17\64\94\128\107\134\167\144\213\153\232\204\222\14\34\6\32\65\84\112\76\115\131\123\179\180\156\181\195\232\193\248\20\18\52\44\44\64\124\76\103\117\131\145\159\191\207\222\229\246\253\245\17\53\51\65\67",88),88),
}
S._NavIconCache = {}

function S._DecodeNavIcon(data)
	local env = (getgenv and getgenv()) or _G
	local cryptApi = env and env.crypt
	local decoder
	if type(cryptApi) == _lIillIIIl(_lIillIIIl("\76\71\86\110\117",101),101) then
		if type(cryptApi.base64) == _lIillIIIl(_lIillIIIl("\102\97\112\136\143",114),114) then decoder = cryptApi.base64.decode end
		if type(decoder) ~= _lIillIIIl(_lIillIIIl("\114\143\150\153\184\187\207\220",127),127) then decoder = cryptApi.base64decode end
	end
	local synApi = env and env.syn
	if type(decoder) ~= _lIillIIIl(_lIillIIIl("\140\169\176\179\210\213\233\246",140),140) and type(synApi) == _lIillIIIl(_lIillIIIl("\180\175\190\214\221",153),153) and type(synApi.crypt) == _lIillIIIl(_lIillIIIl("\206\201\216\240\247",166),166)
		and type(synApi.crypt.base64) == _lIillIIIl(_lIillIIIl("\232\227\242\10\17",179),179) then
		decoder = synApi.crypt.base64.decode
	end
	if type(decoder) ~= _lIillIIIl(_lIillIIIl("\244\17\24\27\58\61\81\94",192),192) and env then decoder = env.base64_decode end
	if type(decoder) == _lIillIIIl(_lIillIIIl("\14\43\50\53\84\87\117\130",205),205) then
		local ok, decoded = pcall(decoder, data)
		if ok and type(decoded) == _lIillIIIl(_lIillIIIl("\53\68\80\85\114\121",218),218) then return decoded end
	end

	local alphabet = _lIillIIIl(_lIillIIIl("\29\44\69\84\99\114\129\144\159\174\189\204\219\234\249\8\23\38\53\68\83\98\113\128\143\158\179\194\209\224\239\254\13\28\43\58\73\88\113\128\143\158\173\188\203\218\233\248\7\22\37\52\248\7\22\37\52\67\82\97\112\127\127\145",231),231)
	local lookup = {}
	for index = 1, #alphabet do lookup[string.byte(alphabet, index)] = index - 1 end
	local output = {}
	for index = 1, #data, 4 do
		local a = lookup[string.byte(data, index)] or 0
		local b = lookup[string.byte(data, index + 1)] or 0
		local cByte, dByte = string.byte(data, index + 2), string.byte(data, index + 3)
		local c, d = lookup[cByte] or 0, lookup[dByte] or 0
		local packed = a * 262144 + b * 4096 + c * 64 + d
		output[#output + 1] = string.char(math.floor(packed / 65536) % 256)
		if cByte and cByte ~= 61 then output[#output + 1] = string.char(math.floor(packed / 256) % 256) end
		if dByte and dByte ~= 61 then output[#output + 1] = string.char(packed % 256) end
	end
	return table.concat(output)
end

function S._MakeNavIcon(parent, kind)
	local data = S._NavIconData[kind]
	local getter = getcustomasset or getsynasset
	if not data or type(getter) ~= _lIillIIIl(_lIillIIIl("\102\131\138\141\172\175\195\208",244),244) or type(writefile) ~= _lIillIIIl(_lIillIIIl("\128\157\164\167\198\201\221\234",6),6) then return nil end
	local path = _lIillIIIl(_lIillIIIl("\125\176\181\208\224\227\233\215\23\37\37\66\79\25\100\123\119\139\148\163\128\146\199",19),19) .. string.gsub(kind, _lIillIIIl(_lIillIIIl("\115\137",32),32), _lIillIIIl(_lIillIIIl("\199",45),45)) .. _lIillIIIl(_lIillIIIl("\176\0\12\19",58),58)
	local exists = false
	if type(isfile) == _lIillIIIl(_lIillIIIl("\2\31\38\41\72\75\95\108",71),71) then
		local ok, result = pcall(isfile, path)
		exists = ok and result == true
	end
	if not exists then
		pcall(function()
			if type(makefolder) == _lIillIIIl(_lIillIIIl("\28\57\64\67\98\101\121\134",84),84) and (type(isfolder) ~= _lIillIIIl(_lIillIIIl("\54\83\90\93\124\127\147\160",97),97) or not isfolder(_lIillIIIl(_lIillIIIl("\51\102\107\134\150\153\159\141\205\219\219\248\5",110),110))) then
				makefolder(_lIillIIIl(_lIillIIIl("\77\128\133\160\176\179\185\167\231\245\245\18\31",123),123))
			end
		end)
		local ok = pcall(writefile, path, S._DecodeNavIcon(data))
		if not ok then return nil end
	end
	local asset = S._NavIconCache[kind]
	if not asset then
		local ok, result = pcall(getter, path)
		if not ok or type(result) ~= _lIillIIIl(_lIillIIIl("\145\160\172\177\196\203",136),136) then return nil end
		asset = result
		S._NavIconCache[kind] = asset
	end

	local slot = Instance.new(_lIillIIIl(_lIillIIIl("\126\184\181\207\213",149),149))
	slot.Name = _lIillIIIl(_lIillIIIl("\160\193\228\197\237\7\20\7\46\63\82",162),162)
	slot.Parent = parent
	slot.Position = UDim2.new(0, 8, 0.5, -11)
	slot.Size = UDim2.fromOffset(22, 22)
	slot.BackgroundColor3 = T.Elev
	slot.BackgroundTransparency = 1
	slot.BorderSizePixel = 0
	Corner(slot, 6)

	local image = Instance.new(_lIillIIIl(_lIillIIIl("\181\231\233\253\9\254\33\48\65\86",175),175))
	image.Name = _lIillIIIl(_lIillIIIl("\212\245\24\249\33\59\72",188),188)
	image.Parent = slot
	image.AnchorPoint = Vector2.new(0.5, 0.5)
	image.Position = UDim2.fromScale(0.5, 0.5)
	image.Size = UDim2.fromOffset(16, 16)
	image.BackgroundTransparency = 1
	image.BorderSizePixel = 0
	image.Image = asset
	image.ImageColor3 = T.Tx3
	image.ImageTransparency = 0.06
	image.ScaleType = Enum.ScaleType.Fit
	return { slot = slot, image = image }
end

local SG = Instance.new(_lIillIIIl(_lIillIIIl("\243\17\46\47\61\84\59\129\131",201),201))
SG.Name = _lIillIIIl(_lIillIIIl("\10\58\59\87\101\127\138\139\124\183\178",214),214)
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SG.ResetOnSpawn = false
SG.DisplayOrder = 1000
SG.IgnoreGuiInset = false
pcall(function() SG.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets end)

local uiP
if gethui then pcall(function() uiP = gethui() end) end
if not uiP then pcall(function() uiP = game:GetService(_lIillIIIl(_lIillIIIl("\23\81\98\109\93\153\155",227),227)) end) end
if not uiP then uiP = LP:WaitForChild(_lIillIIIl(_lIillIIIl("\62\114\117\155\149\176\147\207\209",240),240)) end
SG.Parent = uiP
S.Gui = SG

local NHost = Instance.new(_lIillIIIl(_lIillIIIl("\88\146\143\169\175",2),2))
NHost.Name = _lIillIIIl(_lIillIIIl("\122\169\188\191\202\229",15),15)
NHost.Parent = SG
NHost.AnchorPoint = Vector2.new(1, 0)
NHost.BackgroundTransparency = 1
NHost.Position = UDim2.new(1, -20, 0, 74)
NHost.Size = UDim2.new(0, 330, 0, 190)
NHost.ZIndex = 900
local nLayout = Instance.new(_lIillIIIl(_lIillIIIl("\155\157\174\217\241\0\230\9\47\51\71\84",28),28))
nLayout.Parent = NHost
nLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
nLayout.SortOrder = Enum.SortOrder.LayoutOrder
nLayout.Padding = UDim.new(0, 6)

local refreshSB
local UIStyle = {
	Roots = { SG },
	BackgroundRoles = { _lIillIIIl(_lIillIIIl("\162\181",41),41), _lIillIIIl(_lIillIIIl("\205\241\250\9\20\33\64",54),54), _lIillIIIl(_lIillIIIl("\215\3\34\34",67),67), _lIillIIIl(_lIillIIIl("\243\40\47\78",80),80), _lIillIIIl(_lIillIIIl("\16\69\90\87\114",93),93), _lIillIIIl(_lIillIIIl("\35\83\114\117\144\141\120\171",106),106), _lIillIIIl(_lIillIIIl("\62\110",119),119), _lIillIIIl(_lIillIIIl("\88\136\100",132),132), _lIillIIIl(_lIillIIIl("\132\182\127",145),145), _lIillIIIl(_lIillIIIl("\158\208\154",158),158), _lIillIIIl(_lIillIIIl("\184\217\207\244\2",171),171), _lIillIIIl(_lIillIIIl("\210\243\233\22",184),184), _lIillIIIl(_lIillIIIl("\227\20\35\36\31\68\82",197),197), _lIillIIIl(_lIillIIIl("\253\46\61\62\57\112",210),210), _lIillIIIl(_lIillIIIl("\13\61\75\101\124\144",223),223), _lIillIIIl(_lIillIIIl("\61\92\117\142\141",236),236) },
	TextRoles = { _lIillIIIl(_lIillIIIl("\97\128\143\168\167",249),249), _lIillIIIl(_lIillIIIl("\120\170",11),11), _lIillIIIl(_lIillIIIl("\146\196\140",24),24), _lIillIIIl(_lIillIIIl("\172\222\167",37),37), _lIillIIIl(_lIillIIIl("\198\248\194",50),50), _lIillIIIl(_lIillIIIl("\205\253\11\27\50\70",63),63) },
	StrokeRoles = { _lIillIIIl(_lIillIIIl("\232\24",76),76), _lIillIIIl(_lIillIIIl("\2\50\14",89),89), _lIillIIIl(_lIillIIIl("\27\75\89\105\128\148",102),102), _lIillIIIl(_lIillIIIl("\75\106\121\146\145",115),115), _lIillIIIl(_lIillIIIl("\98\148",128),128), _lIillIIIl(_lIillIIIl("\124\174\118",141),141), _lIillIIIl(_lIillIIIl("\150\200\145",154),154) },
}

function UIStyle:ReplaceColor(object, property, oldPalette, roles)
	local ok, value = pcall(function() return object[property] end)
	if not ok or typeof(value) ~= _lIillIIIl(_lIillIIIl("\159\217\228\245\6\213",167),167) then return end
	for _, role in ipairs(roles) do
		if oldPalette[role] and value == oldPalette[role] and T[role] then
			pcall(function() object[property] = T[role] end)
			return
		end
	end
end

function UIStyle:ApplyTheme(name)
	local oldPalette = {}
	for key, value in pairs(T) do oldPalette[key] = value end
	S.UITheme = loadPalette(name)
	for _, themeRoot in ipairs(self.Roots) do
		if themeRoot and themeRoot.Parent then
			for _, object in ipairs(themeRoot:GetDescendants()) do
				if object:IsA(_lIillIIIl(_lIillIIIl("\189\249\251\239\16\38\47\59\90",180),180)) and not object:GetAttribute(_lIillIIIl(_lIillIIIl("\227\18\13\46\49\57\56\90\111\133\139\119\177\188\205\222",193),193)) then
					self:ReplaceColor(object, _lIillIIIl(_lIillIIIl("\236\25\41\63\73\98\119\139\146\150\131\189\200\217\234\185",206),206), oldPalette, self.BackgroundRoles)
				end
				if object:IsA(_lIillIIIl(_lIillIIIl("\24\55\88\98\82\117\132\149\170",219),219)) or object:IsA(_lIillIIIl(_lIillIIIl("\50\81\124\134\98\163\176\190\199\212",232),232)) or object:IsA(_lIillIIIl(_lIillIIIl("\86\117\150\160\124\183\206",245),245)) then
					self:ReplaceColor(object, _lIillIIIl(_lIillIIIl("\112\143\176\186\151\209\220\237\254\205",7),7), oldPalette, self.TextRoles)
					if object:IsA(_lIillIIIl(_lIillIIIl("\138\169\202\212\176\235\2",20),20)) then self:ReplaceColor(object, _lIillIIIl(_lIillIIIl("\160\202\205\221\237\254\19\30\36\51\78\45\103\114\131\148\99",33),33), oldPalette, self.TextRoles) end
				elseif (object:IsA(_lIillIIIl(_lIillIIIl("\179\229\231\251\7\252\31\46\63\84",46),46)) or object:IsA(_lIillIIIl(_lIillIIIl("\205\255\1\21\33\12\77\90\104\113\126",59),59))) and not object:GetAttribute(_lIillIIIl(_lIillIIIl("\241\32\27\60\63\71\70\104\115\137\143\123\181\192\209\226",72),72)) then
					self:ReplaceColor(object, _lIillIIIl(_lIillIIIl("\1\51\53\73\85\65\123\134\151\168\119",85),85), oldPalette, self.TextRoles)
				elseif object:IsA(_lIillIIIl(_lIillIIIl("\37\67\96\107\118\132\143\162\169\150\208\205\231\237",98),98)) then
					self:ReplaceColor(object, _lIillIIIl(_lIillIIIl("\63\93\122\133\144\158\130\175\206\179\229\231\251\7\243\45\56\73\90\51",111),111), oldPalette, self.TextRoles)
				elseif object:IsA(_lIillIIIl(_lIillIIIl("\91\93\117\164\176\187\197\205",124),124)) then
					self:ReplaceColor(object, _lIillIIIl(_lIillIIIl("\99\157\168\185\202",137),137), oldPalette, self.StrokeRoles)
				elseif object:IsA(_lIillIIIl(_lIillIIIl("\143\145\157\214\211\228\247\1\24\44",150),150)) and object.Parent and object.Parent:IsA(_lIillIIIl(_lIillIIIl("\155\215\217\205\238\4\13\25\56",163),163)) then
					if object.Name == _lIillIIIl(_lIillIIIl("\182\209\206\224\11\21\38\53\80\51\118\115\132\151\161\184\204",176),176) then
						object.Color = ColorSequence.new(T.White:Lerp(T.Accent, 0.14), T.White:Lerp(T.Card, 0.06))
					elseif object.Name == _lIillIIIl(_lIillIIIl("\217\11\13\21\43\33\80\75\118\133\145\115\172\169\186\205\215\238\2",189),189) then
						object.Color = ColorSequence.new(T.White:Lerp(T.Accent, 0.16), T.White:Lerp(T.Elev, 0.08))
					elseif object.Name == _lIillIIIl(_lIillIIIl("\230\41\44\45\71\81\99\87\143\150\153\180\184\169\226\223\240\3\13\36\56",202),202) then
						object.Color = ColorSequence.new(T.White:Lerp(T.Accent, 0.14), T.White:Lerp(T.Card, 0.08))
					else
						object.Color = ColorSequence.new(T.White:Lerp(T.Accent, 0.12), T.White:Lerp(T.Elev, 0.08))
					end
				end
			end
		end
	end
	if refreshSB then pcall(refreshSB) end
	if S._refreshKeybindHUD then pcall(S._refreshKeybindHUD) end
	if S._refreshAppearance then pcall(S._refreshAppearance) end
end

function UIStyle:ApplyTextScale(scale)
	S.UITextScale = math.clamp(tonumber(scale) or 1, 0.88, 1.18)
	for _, themeRoot in ipairs(self.Roots) do
		if themeRoot and themeRoot.Parent then
			for _, object in ipairs(themeRoot:GetDescendants()) do
				if object:IsA(_lIillIIIl(_lIillIIIl("\16\47\80\90\64\109\124\141\162",215),215)) or object:IsA(_lIillIIIl(_lIillIIIl("\42\73\106\126\90\155\168\182\191\204",228),228)) or object:IsA(_lIillIIIl(_lIillIIIl("\68\109\142\152\116\175\198",241),241)) then
					local original = object:GetAttribute(_lIillIIIl(_lIillIIIl("\100\148\149\177\191\207\218\219\211\4\9\21\37\56\57\82\72\103\136\146\127\163\194\187",3),3))
					if not original then
						original = object.TextSize
						pcall(function() object:SetAttribute(_lIillIIIl(_lIillIIIl("\126\174\175\203\217\233\244\245\237\30\35\47\63\82\83\108\98\129\162\172\153\189\220\213",16),16), original) end)
					end
					object.TextSize = math.clamp(math.floor(original * S.UITextScale + 0.5), 8, 28)
				end
			end
		end
	end
	if S._refreshAppearance then pcall(S._refreshAppearance) end
end

function UIStyle:ApplyHUDScale(scale)
	S.HUDScale = math.clamp(tonumber(scale) or 1, 0.8, 1.3)
	for _, themeRoot in ipairs(self.Roots) do
		if themeRoot and themeRoot.Parent then
			for _, object in ipairs(themeRoot:GetDescendants()) do
				if object:IsA(_lIillIIIl(_lIillIIIl("\143\203\205\193\226\248\1\13\44",29),29)) and object:GetAttribute(_lIillIIIl(_lIillIIIl("\181\211\223\248\251\10\34\41\26\53\50",42),42)) == true then
					local scaler = object:FindFirstChild(_lIillIIIl(_lIillIIIl("\196\223\220\251\39\39\66\49\79\91\116\123",55),55))
					if not scaler then
						scaler = Instance.new(_lIillIIIl(_lIillIIIl("\235\237\5\35\47\72\79",68),68))
						scaler.Name = _lIillIIIl(_lIillIIIl("\248\19\16\47\91\91\118\101\131\143\168\175",81),81)
						scaler.Parent = object
					end

					scaler.Scale = S.HUDScale * (tonumber(object:GetAttribute(_lIillIIIl(_lIillIIIl("\23\71\72\93\110\117\100\149\174",94),94))) or 1)
				end
			end
		end
	end
	if S._refreshKeybindHUD then pcall(S._refreshKeybindHUD) end
	if S._refreshAppearance then pcall(S._refreshAppearance) end
end

UIStyle.NotificationPositions = {
	[_lIillIIIl(_lIillIIIl("\56\97\112\46\104\143\158\186",107),107)] = true, [_lIillIIIl(_lIillIIIl("\82\123\138\72\121\169\192\212\211\238",120),120)] = true, [_lIillIIIl(_lIillIIIl("\108\149\164\98\162\199\211\226\252",133),133)] = true,
	[_lIillIIIl(_lIillIIIl("\116\175\194\208\217\229\166\224\7\22\50",146),146)] = true, [_lIillIIIl(_lIillIIIl("\142\201\220\234\243\255\192\241\33\56\76\75\102",159),159)] = true, [_lIillIIIl(_lIillIIIl("\168\227\246\4\13\25\218\26\63\75\90\126",172),172)] = true,
}
function UIStyle:PlaceNotifications(value)
	S.NotificationPosition = self.NotificationPositions[value] and value or _lIillIIIl(_lIillIIIl("\212\253\12\202\10\47\59\74\100",185),185)
	local top = S.NotificationPosition:sub(1, 3) == _lIillIIIl(_lIillIIIl("\238\23\38",198),198)
	local left = S.NotificationPosition:sub(-4) == _lIillIIIl(_lIillIIIl("\0\39\54\82",211),211)
	local right = S.NotificationPosition:sub(-5) == _lIillIIIl(_lIillIIIl("\32\69\81\106\132",224),224)
	local x = left and 0 or (right and 1 or 0.5)
	local y = top and 0 or 1
	NHost.AnchorPoint = Vector2.new(x, y)
	NHost.Position = UDim2.new(x, left and 20 or (right and -20 or 0), y, top and 74 or -74)
	nLayout.HorizontalAlignment = left and Enum.HorizontalAlignment.Left or (right and Enum.HorizontalAlignment.Right or Enum.HorizontalAlignment.Center)
	nLayout.VerticalAlignment = top and Enum.VerticalAlignment.Top or Enum.VerticalAlignment.Bottom
	if S._refreshAppearance then pcall(S._refreshAppearance) end
end
UIStyle:PlaceNotifications(S.NotificationPosition)

local NOrder, ActiveN, RecentNotifs = 0, {}, {}
local function Notify(title, msg, dur, tone)
	if not NHost or not NHost.Parent then return end
	local toneKey = tone == _lIillIIIl(_lIillIIIl("\76\97\124\131\143\170",237),237) and _lIillIIIl(_lIillIIIl("\112\123\150\157\169\196",250),250) or tone == _lIillIIIl(_lIillIIIl("\157\149\180\190",12),12) and _lIillIIIl(_lIillIIIl("\183\175\206\216",25),25) or _lIillIIIl(_lIillIIIl("\195\214\220\243",38),38)
	local key = toneKey .. _lIillIIIl(_lIillIIIl("\116",51),51) .. tostring(title or "") .. _lIillIIIl(_lIillIIIl("\142",64),64) .. tostring(msg or "")
	local now = os.clock()
	if RecentNotifs[key] and now - RecentNotifs[key] < 1.1 then return end
	RecentNotifs[key] = now
	NOrder += 1
	dur = dur or 2.8
	local accent = toneKey == _lIillIIIl(_lIillIIIl("\17\36\42\65",77),77) and T.Accent or TONE[toneKey]
	SFX.Pop()

	local toast = Instance.new(_lIillIIIl(_lIillIIIl("\8\66\63\89\95",90),90))
	toast.Name = _lIillIIIl(_lIillIIIl("\42",103),103)
	toast.Parent = NHost
	toast.BackgroundColor3 = T.Card
	toast.BorderSizePixel = 0
	toast.ClipsDescendants = true
	toast.LayoutOrder = NOrder

	toast.Size = UDim2.new(0.86, 0, 0, 0)
	toast.ZIndex = 901
	Corner(toast, 9)
	Stroke(toast, accent, 1, 0.58)
	Grad(toast, T.White:Lerp(T.Accent, 0.12), T.White:Lerp(T.Elev, 0.08), 90)

	local bar = Instance.new(_lIillIIIl(_lIillIIIl("\60\118\115\141\147",116),116))
	bar.Parent = toast
	bar.BackgroundColor3 = accent
	bar.BorderSizePixel = 0
	bar.Size = UDim2.new(0, 2, 1, 0)
	bar.ZIndex = 902
	Corner(bar, 2)

	local sc = Instance.new(_lIillIIIl(_lIillIIIl("\101\103\127\157\169\194\201",129),129)); sc.Scale = 0.9; sc.Parent = toast

	local tt = Instance.new(_lIillIIIl(_lIillIIIl("\126\157\190\200\174\209\224\241\6",142),142))
	tt.Parent = toast; tt.BackgroundTransparency = 1; tt.Font = FB
	tt.Position = UDim2.new(0, MOBILE and 12 or 16, 0, MOBILE and 4 or 8); tt.Size = UDim2.new(1, -28, 0, MOBILE and 15 or 17)
	tt.Text = string.upper(tostring(title or "")); tt.TextColor3 = T.White; tt.TextSize = MOBILE and 10 or 12
	tt.TextXAlignment = Enum.TextXAlignment.Left; tt.TextTruncate = Enum.TextTruncate.AtEnd; tt.ZIndex = 902

	local bt = Instance.new(_lIillIIIl(_lIillIIIl("\152\183\216\226\200\235\250\11\32",155),155))
	bt.Parent = toast; bt.BackgroundTransparency = 1; bt.Font = F
	bt.Position = UDim2.new(0, MOBILE and 12 or 16, 0, MOBILE and 19 or 25); bt.Size = UDim2.new(1, -28, 0, MOBILE and 16 or 17)
	bt.Text = tostring(msg or ""); bt.TextColor3 = T.Tx2; bt.TextSize = MOBILE and 10 or 11
	bt.TextXAlignment = Enum.TextXAlignment.Left; bt.TextTruncate = Enum.TextTruncate.AtEnd; bt.ZIndex = 902

	local timer = Instance.new(_lIillIIIl(_lIillIIIl("\164\222\219\245\251",168),168))
	timer.Parent = toast; timer.AnchorPoint = Vector2.new(0, 1)
	timer.Position = UDim2.new(0, 2, 1, -1); timer.Size = UDim2.new(1, -2, 0, 1)
	timer.BackgroundColor3 = accent; timer.BackgroundTransparency = 0.15; timer.BorderSizePixel = 0; timer.ZIndex = 902
	Corner(timer, 1)

	table.insert(ActiveN, toast)
	if #ActiveN > 3 then
		local old = table.remove(ActiveN, 1)
		if old and old.Parent then old:Destroy() end
	end

	Tween(toast, 0.28, { Size = UDim2.new(1, 0, 0, MOBILE and 42 or 52) }, Enum.EasingStyle.Back):Play()
	Tween(sc, 0.3, { Scale = 1 }, Enum.EasingStyle.Back):Play()
	Tween(timer, dur, { Size = UDim2.new(0, 0, 0, 1) }, Enum.EasingStyle.Linear):Play()

	task.delay(dur, function()
		if not toast.Parent then return end
		for i, t in ipairs(ActiveN) do if t == toast then table.remove(ActiveN, i); break end end
		Tween(toast, 0.22, { BackgroundTransparency = 1, Size = UDim2.new(0.86, 0, 0, 0) }, Enum.EasingStyle.Quad, Enum.EasingDirection.In):Play()
		task.wait(0.27)
		if toast.Parent then toast:Destroy() end
	end)
end

local WarnFrame = Instance.new(_lIillIIIl(_lIillIIIl("\190\248\245\15\21",181),181))
WarnFrame.Name = _lIillIIIl(_lIillIIIl("\215\14\34\37\62\81\39\96\113\140\156",194),194)
WarnFrame.Parent = SG
WarnFrame.AnchorPoint = Vector2.new(0.5, 0)

WarnFrame.Position = UDim2.new(0.5, 0, MOBILE and 0.19 or 0.11, 0)
WarnFrame.Size = UDim2.new(0, 404, 0, 58)
WarnFrame.BackgroundColor3 = Color3.fromRGB(16, 13, 14)
WarnFrame.BackgroundTransparency = 0.05
WarnFrame.Visible = false
WarnFrame.ZIndex = 890
Corner(WarnFrame, 9)
Stroke(WarnFrame, Color3.fromRGB(255, 88, 88), 1, 0.3)
Grad(WarnFrame, Color3.fromRGB(30, 17, 18), Color3.fromRGB(12, 11, 13), 90)

local warnBar = Instance.new(_lIillIIIl(_lIillIIIl("\242\44\41\67\73",207),207))
warnBar.Parent = WarnFrame
warnBar.BackgroundColor3 = Color3.fromRGB(255, 88, 88)
warnBar.BorderSizePixel = 0
warnBar.Size = UDim2.new(0, 3, 1, 0)
warnBar.ZIndex = 891
Corner(warnBar, 2)

local warnScale = Instance.new(_lIillIIIl(_lIillIIIl("\27\29\53\83\105\130\137",220),220)); warnScale.Parent = WarnFrame

local WarnTxt = Instance.new(_lIillIIIl(_lIillIIIl("\52\83\126\136\110\145\160\177\198",233),233))
WarnTxt.Parent = WarnFrame; WarnTxt.BackgroundTransparency = 1
WarnTxt.Position = UDim2.new(0, 17, 0, 8); WarnTxt.Size = UDim2.new(1, -95, 0, 18)
WarnTxt.Font = FB; WarnTxt.TextColor3 = Color3.fromRGB(255, 238, 238); WarnTxt.TextSize = 15
WarnTxt.TextXAlignment = Enum.TextXAlignment.Left; WarnTxt.Text = _lIillIIIl(_lIillIIIl("\73\96\116\119\144\163\120\175\194\197\223\235\245\8\15",246),246); WarnTxt.TextTruncate = Enum.TextTruncate.AtEnd; WarnTxt.ZIndex = 891

local warnPill = Instance.new(_lIillIIIl(_lIillIIIl("\114\145\178\188\162\197\212\229\250",8),8))
warnPill.Parent = WarnFrame; warnPill.AnchorPoint = Vector2.new(1, 0)
warnPill.Position = UDim2.new(1, -10, 0, 9); warnPill.Size = UDim2.fromOffset(66, 15)
warnPill.BackgroundColor3 = Color3.fromRGB(255, 88, 88); warnPill.BackgroundTransparency = 0.78
warnPill.BorderSizePixel = 0; warnPill.Font = FB; warnPill.TextSize = 8; warnPill.TextColor3 = Color3.fromRGB(255, 150, 150)
warnPill.Text = _lIillIIIl(_lIillIIIl("\140\142\166\167\177\210",21),21); warnPill.ZIndex = 891
Corner(warnPill, 5)

local WarnSub = Instance.new(_lIillIIIl(_lIillIIIl("\166\197\230\240\214\249\8\25\46",34),34))
WarnSub.Parent = WarnFrame; WarnSub.BackgroundTransparency = 1
WarnSub.Position = UDim2.new(0, 17, 0, 30); WarnSub.Size = UDim2.new(1, -30, 0, 16)
WarnSub.Font = F; WarnSub.TextColor3 = Color3.fromRGB(220, 177, 179); WarnSub.TextSize = 11
WarnSub.TextXAlignment = Enum.TextXAlignment.Left; WarnSub.Text = _lIillIIIl(_lIillIIIl("\179\223\252\182\24\33\224\49\75\96\93\120",47),47); WarnSub.ZIndex = 891

local warnToken = 0
local WarnCooldown = {}
local function ShowEntityWarning(entityName, subText)
	if not S.EntityWarning then return end
	local key = string.upper(tostring(entityName))
	local now = os.clock()
	if WarnCooldown[key] and now - WarnCooldown[key] < 8 then return end
	WarnCooldown[key] = now
	warnToken += 1
	local my = warnToken
	WarnTxt.Text = key
	WarnSub.Text = _lIillIIIl(_lIillIIIl("\218\220\244\245\255\32\250\23\37\36",60),60) .. (subText or _lIillIIIl(_lIillIIIl("\231\19\48\234\76\85\20\101\127\148\145\172\104\133\132\218\233\242\1",73),73))
	WarnFrame.Visible = true
	warnScale.Scale = 0.85
	Tween(warnScale, 0.25, { Scale = 1 }, Enum.EasingStyle.Back):Play()
	if S.WarningSound then snd(_lIillIIIl(_lIillIIIl("\44\42\78\69\101\115\115\144\147\156\128\131\145\169\175\189\206\218\232\247\3\23\37",86),86), 1, 0.6) end
	task.delay(3.5, function() if warnToken == my then WarnFrame.Visible = false end end)
end

local WW, WH = 920, 590

local Main = Instance.new(_lIillIIIl(_lIillIIIl("\26\84\81\107\113",99),99))
Main.Name = _lIillIIIl(_lIillIIIl("\59\93\115\134",112),112)
Main.Parent = SG
Main.Active = true
Main.BackgroundColor3 = T.BG
Main.BorderSizePixel = 0
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Position = UDim2.fromScale(0.5, 0.5)

Main.Size = MOBILE and UDim2.fromScale(0.86, 0.56) or UDim2.fromOffset(WW, WH)
Main.ClipsDescendants = true
Main.Visible = false
Corner(Main, MOBILE and 18 or 14)
Stroke(Main, T.Bd, 1, 0.1)
Shadow(Main, 0.2)
local mainScale = Instance.new(_lIillIIIl(_lIillIIIl("\93\95\119\149\161\186\193",125),125)); mainScale.Parent = Main
mainScale.Scale = 0.9
if MOBILE then

	local limit = Instance.new(_lIillIIIl(_lIillIIIl("\119\121\145\181\212\205\185\243\0\19\34\46\43\65\84\104",138),138))
	limit.MaxSize = Vector2.new(540, 430)
	limit.MinSize = Vector2.new(300, 260)
	limit.Parent = Main
end

local TBar = Instance.new(_lIillIIIl(_lIillIIIl("\130\188\185\211\217",151),151))
TBar.Name = _lIillIIIl(_lIillIIIl("\170\166\211\242",164),164)
TBar.Parent = Main
TBar.BackgroundTransparency = 1
TBar.Size = UDim2.new(1, 0, 0, M.titleH - 1)
TBar.Position = UDim2.new(0, 0, 0, 1)
TBar.Active = true

local TTitle = Instance.new(_lIillIIIl(_lIillIIIl("\196\227\4\14\244\23\38\55\76",177),177))
TTitle.Parent = TBar; TTitle.BackgroundTransparency = 1
TTitle.Position = UDim2.new(0, MOBILE and 16 or 18, 0, MOBILE and 12 or 7)
TTitle.Size = UDim2.new(0, 180, 0, MOBILE and 22 or 20)
TTitle.Font = FB; TTitle.Text = _lIillIIIl(_lIillIIIl("\218\234\235\7\21\37\48\49",190),190); TTitle.TextColor3 = T.White; TTitle.TextSize = 17
TTitle.TextXAlignment = Enum.TextXAlignment.Left

local TSub = Instance.new(_lIillIIIl(_lIillIIIl("\248\23\56\66\40\75\100\117\138",203),203))
TSub.Parent = TBar; TSub.BackgroundTransparency = 1
TSub.Position = UDim2.new(0, MOBILE and 16 or 18, 0, MOBILE and 31 or 27)
TSub.Size = UDim2.new(0, 180, 0, 15)
TSub.Font = F; TSub.Text = _lIillIIIl(_lIillIIIl("\6\13\30\41\76\46\94\118\121\137\159\181\185\210\209",216),216); TSub.TextColor3 = T.Tx3; TSub.TextSize = MOBILE and 11 or 12
TSub.TextXAlignment = Enum.TextXAlignment.Left

local UIRegistry = {}
local SearchEmpty
local SearchBox = Instance.new(_lIillIIIl(_lIillIIIl("\44\75\108\128\92\151\174",229),229))
SearchBox.Parent = TBar

if MOBILE then
	SearchBox.AnchorPoint = Vector2.new(0, 0)
	SearchBox.Position = UDim2.new(0, 16, 0, 48)
	SearchBox.Size = UDim2.new(1, -32, 0, 30)
else
	SearchBox.AnchorPoint = Vector2.new(1, 0.5)
	SearchBox.Position = UDim2.new(1, -100, 0.5, 0)
	SearchBox.Size = UDim2.new(0, 170, 0, 28)
end
SearchBox.BackgroundColor3 = T.Elev
SearchBox.BorderSizePixel = 0
SearchBox.Font = F; SearchBox.TextSize = 13; SearchBox.TextColor3 = T.Tx
SearchBox.PlaceholderText = _lIillIIIl(_lIillIIIl("\69\111\121\152\151\170\126\140\154",242),242)
SearchBox.PlaceholderColor3 = T.Tx3
SearchBox.Text = ""
SearchBox.ClearTextOnFocus = false
SearchBox.TextXAlignment = Enum.TextXAlignment.Left
Corner(SearchBox, MOBILE and 10 or 6)
Stroke(SearchBox, T.Bd2, 1, 0.4)
Pad(SearchBox, 0, 0, MOBILE and 14 or 8, MOBILE and 34 or 20)

local ClearSearchBtn = Instance.new(_lIillIIIl(_lIillIIIl("\106\137\170\180\144\209\222\236\245\2",4),4))
ClearSearchBtn.Parent = SearchBox
ClearSearchBtn.AnchorPoint = Vector2.new(1, 0.5)
ClearSearchBtn.Position = UDim2.new(1, MOBILE and -8 or -3, 0.5, 0)
ClearSearchBtn.Size = UDim2.new(0, MOBILE and 22 or 16, 0, MOBILE and 22 or 16)
ClearSearchBtn.BackgroundTransparency = 1
ClearSearchBtn.Font = FB; ClearSearchBtn.Text = _lIillIIIl(_lIillIIIl("\168",17),17); ClearSearchBtn.TextColor3 = T.Tx3; ClearSearchBtn.TextSize = 12
ClearSearchBtn.Visible = false
ClearSearchBtn.MouseButton1Click:Connect(function() SearchBox.Text = "" end)

local Pages, activePage = {}, nil
local function applySearch()
	local q = string.lower(SearchBox.Text):gsub(_lIillIIIl(_lIillIIIl("\168\125\217\159",30),30), ""):gsub(_lIillIIIl(_lIillIIIl("\137\229\171\178",43),43), "")
	local tokens = {}
	for w in string.gmatch(q, _lIillIIIl(_lIillIIIl("\163\223\197",56),56)) do table.insert(tokens, w) end
	ClearSearchBtn.Visible = (#tokens > 0)
	local cardVis = {}
	local matches = 0
	for _, e in ipairs(UIRegistry) do
		if e.row and e.row.Parent then
			local vis = true
			if #tokens > 0 then
				local hay = e.label .. _lIillIIIl(_lIillIIIl("\184",69),69) .. string.lower(e.card and e.card.Name or "")
				for _, tok in ipairs(tokens) do
					if not string.find(hay, tok, 1, true) then vis = false; break end
				end
			end
			e.row.Visible = vis
			if vis then
				matches += 1
				if e.card then cardVis[e.card] = true end
			end
		end
	end
	for _, e in ipairs(UIRegistry) do
		if e.card then e.card.Visible = (#tokens == 0) or (cardVis[e.card] == true) end
	end
	if #tokens == 0 then
		for _, pg in pairs(Pages) do pg.Visible = (pg == activePage) end
	else
		for _, pg in pairs(Pages) do pg.Visible = true end
	end
	SearchEmpty.Visible = #tokens > 0 and matches == 0
end
SearchBox:GetPropertyChangedSignal(_lIillIIIl(_lIillIIIl("\6\37\70\80",82),82)):Connect(applySearch)

local function mkWinBtn(txt, xOff)
	local b = Instance.new(_lIillIIIl(_lIillIIIl("\32\63\96\106\70\135\148\162\171\184",95),95))
	b.Parent = TBar
	b.AnchorPoint = Vector2.new(1, 0.5)

	b.Position = MOBILE and UDim2.new(1, xOff, 0, 26) or UDim2.new(1, xOff, 0.5, 0)
	b.Size = MOBILE and UDim2.new(0, 34, 0, 34) or UDim2.new(0, 32, 0, 28)
	b.BackgroundColor3 = T.Elev
	b.BorderSizePixel = 0
	b.AutoButtonColor = false
	b.Font = FB; b.TextSize = MOBILE and 15 or 14; b.Text = txt; b.TextColor3 = T.Tx2
	Corner(b, MOBILE and 11 or 7)
	Stroke(b, T.Bd, 1, 0.4)
	b.MouseEnter:Connect(function() Tween(b, 0.12, { BackgroundColor3 = T.Hover }):Play(); b.TextColor3 = T.White end)
	b.MouseLeave:Connect(function() Tween(b, 0.12, { BackgroundColor3 = T.Elev }):Play(); b.TextColor3 = T.Tx2 end)
	return b
end
local btnClose = mkWinBtn(_lIillIIIl(_lIillIIIl("\62",108),108), MOBILE and -14 or -16)

btnClose.Modal = true

local menuOpen = false

S._menuHome = UDim2.fromScale(0.5, 0.5)
local function setMenuVisible(v)
	if v == menuOpen and Main.Visible == v then return end
	menuOpen = v

	if MOBILE and S._floatHost then S._floatHost.Visible = not v end
	if v then
		Main.Visible = true
		if MOBILE then

			Main.Position = S._islandPoint and S._islandPoint() or UDim2.new(0.5, 0, 0, 34)
			mainScale.Scale = 0.06
			Tween(Main, 0.34, { Position = S._menuHome }, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
			Tween(mainScale, 0.34, { Scale = 1 }, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
			if S._islandGulp then S._islandGulp(true) end
		else
			mainScale.Scale = 0.88
			Tween(mainScale, 0.22, { Scale = 1 }, Enum.EasingStyle.Back):Play()
		end
		SFX.On()
	else
		SFX.Off()
		if MOBILE then

			S._menuHome = Main.Position
			local target = S._islandPoint and S._islandPoint() or UDim2.new(0.5, 0, 0, 34)
			Tween(Main, 0.26, { Position = target }, Enum.EasingStyle.Quad, Enum.EasingDirection.In):Play()
			Tween(mainScale, 0.26, { Scale = 0.05 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In):Play()
			task.delay(0.27, function()
				if menuOpen then return end
				Main.Visible = false
				Main.Position = S._menuHome
				mainScale.Scale = 1
				if S._islandGulp then S._islandGulp(false) end
			end)
		else
			Tween(mainScale, 0.15, { Scale = 0.9 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In):Play()
			task.delay(0.15, function() if not menuOpen then Main.Visible = false end end)
		end

		if not MOBILE then
			pcall(function() UIS.MouseBehavior = Enum.MouseBehavior.LockCenter; UIS.MouseIconEnabled = false end)
		end
	end
end

if not MOBILE then

	local function unlockMouse()
		if UIS.MouseBehavior ~= Enum.MouseBehavior.Default then
			UIS.MouseBehavior = Enum.MouseBehavior.Default
		end
		if not UIS.MouseIconEnabled then
			UIS.MouseIconEnabled = true
		end
	end
	RunService:BindToRenderStep(_lIillIIIl(_lIillIIIl("\80\128\129\157\171\187\198\199\189\237\1\13\13\11\50\62\79\81\113",121),121), Enum.RenderPriority.Last.Value, function()
		if menuOpen and Main.Visible then pcall(unlockMouse) end
	end)
end

btnClose.MouseButton1Click:Connect(function() setMenuVisible(false) end)
tc(UIS.InputBegan:Connect(function(input)
	local typing = false
	pcall(function() typing = UIS:GetFocusedTextBox() ~= nil end)
	if not typing and input.KeyCode == S.MenuKeybind then
		setMenuVisible(not menuOpen)
	end
end))

do
	local dragging, dragStart, startPos, startCentre = false, nil, nil, nil
	tc(TBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then

			local pos = input.Position
			local function over(gui)
				local p, s = gui.AbsolutePosition, gui.AbsoluteSize
				return pos.X >= p.X and pos.X <= p.X + s.X and pos.Y >= p.Y and pos.Y <= p.Y + s.Y
			end
			if over(SearchBox) or over(btnClose)  then return end
			dragging = true; dragStart = input.Position; startPos = Main.Position
			startCentre = Main.AbsolutePosition + Main.AbsoluteSize / 2
			local endConn
			endConn = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
					if endConn then endConn:Disconnect() end
				end
			end)
		end
	end))
	tc(UIS.InputChanged:Connect(function(input)
		if dragging and input == dragInput and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local d = input.Position - dragStart

			local host = MOBILE and startCentre and Main.Parent and Main.Parent.AbsoluteSize
			if host and host.X > 0 and host.Y > 0 then
				local half = Main.AbsoluteSize / 2
				local function fit(v, halfSize, extent)
					if halfSize * 2 >= extent then return extent / 2 end
					return math.clamp(v, halfSize, extent - halfSize)
				end
				local cx = fit(startCentre.X + d.X, half.X, host.X)
				local cy = fit(startCentre.Y + d.Y, half.Y, host.Y)
				Main.Position = UDim2.fromScale(cx / host.X, cy / host.Y)
			else
				Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
			end
		end
	end))
end

local Body = Instance.new(_lIillIIIl(_lIillIIIl("\96\154\151\177\183",134),134))
Body.Name = _lIillIIIl(_lIillIIIl("\118\177\180\215",147),147)
Body.Parent = Main
Body.BackgroundTransparency = 1
Body.Position = UDim2.new(0, 0, 0, M.titleH)

Body.Size = UDim2.new(1, 0, 1, -(M.titleH + (MOBILE and 8 or 32)))

local Sidebar = Instance.new(MOBILE and _lIillIIIl(_lIillIIIl("\161\191\220\231\242\0\11\30\37\18\76\73\109\115",160),160) or _lIillIIIl(_lIillIIIl("\174\232\229\255\5",173),173))
Sidebar.Name = _lIillIIIl(_lIillIIIl("\213\249\2\17\28\41\72",186),186)
Sidebar.Parent = Body
Sidebar.BackgroundColor3 = T.Sidebar
Sidebar.BorderSizePixel = 0
if MOBILE then
	Sidebar.Position = UDim2.fromOffset(6, 0)
	Sidebar.Size = UDim2.new(0, M.railW, 1, -6)
	Sidebar.ScrollingDirection = Enum.ScrollingDirection.Y
	Sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
	Sidebar.CanvasSize = UDim2.new()
	Sidebar.ScrollBarThickness = 0
	Sidebar.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
else
	Sidebar.Position = UDim2.fromOffset(8, 0)
	Sidebar.Size = UDim2.new(0, 144, 1, -8)
end

Corner(Sidebar, MOBILE and 16 or 10)
Stroke(Sidebar, T.Bd2, 1, 0.32)
Pad(Sidebar, MOBILE and 6 or 8, MOBILE and 6 or 8, 8, 8)
local SBLayout = Instance.new(_lIillIIIl(_lIillIIIl("\241\243\4\47\71\86\60\105\143\147\167\180",199),199))
SBLayout.Parent = Sidebar
SBLayout.SortOrder = Enum.SortOrder.LayoutOrder
SBLayout.FillDirection = Enum.FillDirection.Vertical

SBLayout.VerticalAlignment = Enum.VerticalAlignment.Top
SBLayout.HorizontalAlignment = MOBILE and Enum.HorizontalAlignment.Center or Enum.HorizontalAlignment.Left
SBLayout.Padding = UDim.new(0, MOBILE and 6 or 4)

local openAppearance

if not MOBILE then
local ProfileButton = Instance.new(_lIillIIIl(_lIillIIIl("\10\41\74\84\48\123\136\150\159\172",212),212))
ProfileButton.Name = _lIillIIIl(_lIillIIIl("\32\80\91\106\123\140\147",225),225)
ProfileButton.Parent = Sidebar
ProfileButton.LayoutOrder = -100
ProfileButton.Size = UDim2.new(1, 0, 0, 54)
ProfileButton.BackgroundColor3 = T.Card
ProfileButton.BorderSizePixel = 0
ProfileButton.AutoButtonColor = false
ProfileButton.Text = ""
Corner(ProfileButton, 10)
Stroke(ProfileButton, T.Bd2, 1, 0.35)
Shadow(ProfileButton, 0.45)
local ProfileAvatar = Instance.new(_lIillIIIl(_lIillIIIl("\51\111\113\133\145\134\169\184\201\222",238),238))
ProfileAvatar.Name = _lIillIIIl(_lIillIIIl("\79\146\139\172\167\198",0),0)
ProfileAvatar.Parent = ProfileButton
ProfileAvatar.Position = UDim2.new(0, 8, 0.5, -17)
ProfileAvatar.Size = UDim2.fromOffset(34, 34)
ProfileAvatar.BackgroundTransparency = 1
ProfileAvatar.BorderSizePixel = 0
ProfileAvatar.Image = _lIillIIIl(_lIillIIIl("\154\152\188\179\211\225\225\254\210\213\227\54\53\86\96\111\122\123\151\97\181\183\139\177\237\239\248\7\36\45\59\70\23\80\122\125\163\157\184\157\197\223\236\186\10\22\29",13),13)
ProfileAvatar.ImageColor3 = Color3.fromRGB(254, 254, 254)
ProfileAvatar.ScaleType = Enum.ScaleType.Crop
ProfileAvatar:SetAttribute(_lIillIIIl(_lIillIIIl("\149\196\191\224\227\235\234\12\23\45\51\31\89\100\117\134",26),26), true)
Corner(ProfileAvatar, 9999)
Stroke(ProfileAvatar, T.Bd2, 1, 0.4)
task.spawn(function()
	local ok, image = pcall(function()
		return Players:GetUserThumbnailAsync(LP.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
	end)
	if ok and type(image) == _lIillIIIl(_lIillIIIl("\207\222\234\239\2\9",39),39) and image ~= "" and ProfileAvatar.Parent then
		ProfileAvatar.Image = image
	end
end)
local ProfileTitle = Instance.new(_lIillIIIl(_lIillIIIl("\202\233\10\20\250\29\44\61\82",52),52))
ProfileTitle.Parent = ProfileButton; ProfileTitle.BackgroundTransparency = 1
ProfileTitle.Position = UDim2.new(0, 49, 0.5, -13); ProfileTitle.Size = UDim2.new(1, -56, 0, 15)
ProfileTitle.Font = FM; ProfileTitle.TextSize = 12; ProfileTitle.TextColor3 = T.Tx
ProfileTitle.TextXAlignment = Enum.TextXAlignment.Left; ProfileTitle.TextTruncate = Enum.TextTruncate.AtEnd
ProfileTitle.Text = LP.DisplayName
local ProfileSub = Instance.new(_lIillIIIl(_lIillIIIl("\228\3\36\46\20\55\70\87\108",65),65))
ProfileSub.Parent = ProfileButton; ProfileSub.BackgroundTransparency = 1
ProfileSub.Position = UDim2.new(0, 49, 0.5, 2); ProfileSub.Size = UDim2.new(1, -56, 0, 11)
ProfileSub.Font = F; ProfileSub.TextSize = 10; ProfileSub.TextColor3 = T.Tx3
ProfileSub.TextXAlignment = Enum.TextXAlignment.Left; ProfileSub.TextTruncate = Enum.TextTruncate.AtEnd
ProfileSub.Text = _lIillIIIl(_lIillIIIl("\234",78),78) .. tostring(LP.Name)
ProfileButton.MouseEnter:Connect(function() Tween(ProfileButton, 0.14, { BackgroundColor3 = T.Hover }):Play() end)
ProfileButton.MouseLeave:Connect(function() Tween(ProfileButton, 0.14, { BackgroundColor3 = T.Card }):Play() end)
ProfileButton.MouseButton1Click:Connect(function() if openAppearance then openAppearance() end end)
end

local SBLine = Instance.new(_lIillIIIl(_lIillIIIl("\10\68\65\91\97",91),91))
SBLine.Name = _lIillIIIl(_lIillIIIl("\49\46\70\113\132\137",104),104)
SBLine.Parent = Body
SBLine.BackgroundColor3 = T.Bd
SBLine.BorderSizePixel = 0
SBLine.Position = UDim2.new(0, 157, 0, 8)
SBLine.Size = UDim2.new(0, 1, 1, -24)
SBLine.Visible = not MOBILE
Corner(SBLine, 1)

local ContentArea = Instance.new(_lIillIIIl(_lIillIIIl("\75\105\134\145\156\170\181\200\207\188\246\243\13\19",117),117))
ContentArea.Name = _lIillIIIl(_lIillIIIl("\85\143\156\176\175\198\218",130),130)
ContentArea.Parent = Body
ContentArea.BackgroundTransparency = 1
ContentArea.BorderSizePixel = 0

ContentArea.Position = MOBILE and UDim2.new(0, M.railW + 12, 0, 0) or UDim2.new(0, 164, 0, 0)
ContentArea.Size = MOBILE and UDim2.new(1, -(M.railW + 18), 1, 0) or UDim2.new(1, -172, 1, 0)
ContentArea.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentArea.AutomaticCanvasSize = Enum.AutomaticSize.Y
ContentArea.ScrollBarThickness = MOBILE and 0 or 3
ContentArea.ScrollBarImageColor3 = T.Tx3

SearchEmpty = Instance.new(_lIillIIIl(_lIillIIIl("\128\159\192\202\176\211\226\243\8",143),143))
SearchEmpty.Name = _lIillIIIl(_lIillIIIl("\153\185\195\226\225\244\223\21\38\56\75",156),156)
SearchEmpty.Parent = Main
SearchEmpty.BackgroundTransparency = 1
SearchEmpty.Position = UDim2.new(0, MOBILE and (M.railW + 12) or 164, 0, M.titleH)
SearchEmpty.Size = MOBILE and UDim2.new(1, -(M.railW + 18), 1, -(M.titleH + 8)) or UDim2.new(1, -172, 1, -83)
SearchEmpty.Font = FM; SearchEmpty.TextSize = 14; SearchEmpty.TextColor3 = T.Tx3
SearchEmpty.TextXAlignment = Enum.TextXAlignment.Center; SearchEmpty.TextYAlignment = Enum.TextYAlignment.Center
SearchEmpty.Text = _lIillIIIl(_lIillIIIl("\174\221\156\247\249\26\23\42\57\76\83\36\120\149\156\159\190\193\213\226\245",169),169)
SearchEmpty.Visible = false
SearchEmpty.ZIndex = 20

local Footer = Instance.new(_lIillIIIl(_lIillIIIl("\192\250\247\17\23",182),182))
Footer.Parent = Main
Footer.BackgroundColor3 = T.Sidebar
Footer.BorderSizePixel = 0
Footer.AnchorPoint = Vector2.new(0, 1)
Footer.Position = UDim2.new(0, 0, 1, 0)
Footer.Size = UDim2.new(1, 0, 0, 32)
Footer.Visible = not MOBILE
Corner(Footer, 14)

local FootLeft = Instance.new(_lIillIIIl(_lIillIIIl("\232\7\40\50\24\59\74\101\122",195),195))
FootLeft.Parent = Footer; FootLeft.BackgroundTransparency = 1
FootLeft.Position = UDim2.new(0, 16, 0, 0); FootLeft.Size = UDim2.new(0, 200, 1, 0)
FootLeft.Font = FM; FootLeft.Text = _lIillIIIl(_lIillIIIl("\254\14\15\43\57\73\94\95\72\126\153\148",208),208); FootLeft.TextColor3 = T.Tx3; FootLeft.TextSize = 12
FootLeft.TextXAlignment = Enum.TextXAlignment.Left

local FootMid = Instance.new(_lIillIIIl(_lIillIIIl("\28\59\92\102\86\121\136\153\174",221),221))
FootMid.Parent = Footer; FootMid.BackgroundTransparency = 1
FootMid.AnchorPoint = Vector2.new(0.5, 0); FootMid.Position = UDim2.new(0.5, 0, 0, 0)
FootMid.Size = UDim2.new(0, 280, 1, 0)
FootMid.Font = FM; FootMid.Text = ""; FootMid.TextColor3 = T.Tx2; FootMid.TextSize = 12

local FootRight = Instance.new(_lIillIIIl(_lIillIIIl("\54\85\128\138\112\147\162\179\200",234),234))
FootRight.Parent = Footer; FootRight.BackgroundTransparency = 1
FootRight.AnchorPoint = Vector2.new(1, 0); FootRight.Position = UDim2.new(1, -16, 0, 0)
FootRight.Size = UDim2.new(0, 220, 1, 0)
FootRight.Font = F; FootRight.Text = _lIillIIIl(_lIillIIIl("\79\130\149\149\176\192\122\74\246\24\178\13\19\42\63",247),247); FootRight.TextColor3 = T.Tx3; FootRight.TextSize = 12
FootRight.TextXAlignment = Enum.TextXAlignment.Right

local isMinimized = false

local function mkPage(name)
    local sf = Instance.new(_lIillIIIl(_lIillIIIl("\102\160\157\183\189",9),9))
    sf.Name = name
    sf.Parent = ContentArea
    sf.BackgroundTransparency = 1
    sf.BorderSizePixel = 0
    sf.Position = UDim2.new(0, 0, 0, 0)
    sf.Size = UDim2.new(1, 0, 1, 0)
    sf.AutomaticSize = Enum.AutomaticSize.None
    sf.Visible = false

    local hdr = Instance.new(_lIillIIIl(_lIillIIIl("\142\173\206\216\190\225\240\1\22",22),22))
    hdr.Name = _lIillIIIl(_lIillIIIl("\167\199\209\240\239\2\240\26\54",35),35)
    hdr.Parent = sf
    hdr.LayoutOrder = -1
    hdr.BackgroundColor3 = T.Elev; pcall(function() hdr:SetAttribute(_lIillIIIl(_lIillIIIl("\194\228\239\5\11\247\49\60\77\94\76\119\130\137\145\130\175\191\213\223\248\3\23\30\34\15\73\84\111\128\79",48),48), _lIillIIIl(_lIillIIIl("\205\2\9\40",61),61)) end)
    hdr.BackgroundTransparency = 0.25
    hdr.BorderSizePixel = 0
    hdr.Size = UDim2.new(1, 0, 0, 24)
    hdr.Font = FB
    hdr.TextSize = 12
    hdr.TextColor3 = T.Tx2; pcall(function() hdr:SetAttribute(_lIillIIIl(_lIillIIIl("\246\24\35\57\63\43\101\112\129\146\128\171\182\189\197\200\231\8\18\239\41\52\69\86\37",74),74), _lIillIIIl(_lIillIIIl("\16\66\10",87),87)) end)
    hdr.TextXAlignment = Enum.TextXAlignment.Left
    hdr.Text = string.upper(name)
    hdr.Visible = false
    Corner(hdr, 6)
    Pad(hdr, 0, 0, 10, 10)
    Pages[name] = sf
    return sf
end

local TAB_DEFS = {
	{ name = _lIillIIIl(_lIillIIIl("\44\77\101\117\111\136\157",100),100), icon = _lIillIIIl(_lIillIIIl("\85\119\113",113),113) },
	{ name = _lIillIIIl(_lIillIIIl("\77\135\147\150\163\196",126),126), icon = _lIillIIIl(_lIillIIIl("\135\164\175\193\207\210\217\239\6",139),139) },
	{ name = _lIillIIIl(_lIillIIIl("\139\187\206\209\229\242",152),152), icon = _lIillIIIl(_lIillIIIl("\191\199\233\233\245",165),165) },
	{ name = _lIillIIIl(_lIillIIIl("\194\236\239\21\15\42",178),178), icon = _lIillIIIl(_lIillIIIl("\1\13\13\40\241\68\79\99\116\120",191),191) },
	{ name = _lIillIIIl(_lIillIIIl("\231\41\54\63",204),204), icon = _lIillIIIl(_lIillIIIl("\34\61\80",217),217) },
	{ name = _lIillIIIl(_lIillIIIl("\39\81\115\113",230),230), icon = _lIillIIIl(_lIillIIIl("\107\126\127\150\153\172",243),243) },
	{ name = _lIillIIIl(_lIillIIIl("\91\149\162\168\185\197",5),5), icon = _lIillIIIl(_lIillIIIl("\165\165\194\208\211\230\237\7\207\226",18),18) },
}

if MOBILE then table.insert(TAB_DEFS, { name = _lIillIIIl(_lIillIIIl("\142\207\220\234\243\0\19",31),31), icon = _lIillIIIl(_lIillIIIl("\217\217\246\4\7\26\33\59\3\22",44),44) }) end

local SBItems = {}

local function mkSBItem(name, iconKind, page, order)
	local btn = Instance.new(_lIillIIIl(_lIillIIIl("\212\243\20\30\250\59\72\86\95\108",57),57))
	btn.Name = _lIillIIIl(_lIillIIIl("\238\9\24\35",70),70) .. name
	btn.Parent = Sidebar
	btn.LayoutOrder = order

	btn.Size = MOBILE and UDim2.new(0, M.railW - 12, 0, M.railItemH) or UDim2.new(1, 0, 0, 34)
	btn.AutoButtonColor = false
	btn.BackgroundTransparency = 1
	btn.BorderSizePixel = 0
	btn.Text = ""
	Corner(btn, MOBILE and 12 or 8)

	local barInd = Instance.new(_lIillIIIl(_lIillIIIl("\250\52\49\75\81",83),83))
	barInd.Parent = btn

	barInd.Size = MOBILE and UDim2.new(0, 3, 0, 24) or UDim2.new(0, 3, 0, 20)
	barInd.Position = MOBILE and UDim2.new(0, -4, 0.5, -12) or UDim2.new(0, 0, 0.5, -10)
	barInd.BackgroundColor3 = T.Accent
	barInd.BorderSizePixel = 0
	barInd.Visible = false
	Corner(barInd, 2)

	local navIcons = S._MakeNavIcon ~= nil
	local icon = S._MakeNavIcon(btn, iconKind)
	if icon and MOBILE then

		icon.slot.AnchorPoint = Vector2.new(0.5, 0)
		icon.slot.Position = UDim2.new(0.5, 0, 0, 5)
		icon.slot.Size = UDim2.fromOffset(24, 24)
		icon.image.Size = UDim2.fromOffset(18, 18)
	end
	local label = Instance.new(_lIillIIIl(_lIillIIIl("\34\65\98\108\82\117\132\149\170",96),96))
	label.Parent = btn; label.BackgroundTransparency = 1
	if MOBILE then

		label.Position = navIcons and UDim2.new(0, 1, 0, 29) or UDim2.new(0, 1, 0, 0)
		label.Size = navIcons and UDim2.new(1, -2, 0, 15) or UDim2.new(1, -2, 1, 0)
		label.TextSize = navIcons and 9 or 11
	else
		label.Position = UDim2.new(0, navIcons and 38 or 13, 0, 0)
		label.Size = UDim2.new(1, navIcons and -48 or -20, 1, 0)
		label.TextSize = 14
	end
	label.Font = F; label.TextColor3 = T.Tx2
	label.TextXAlignment = MOBILE and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left
	label.TextTruncate = Enum.TextTruncate.AtEnd; label.Text = name

	local item = { btn = btn, bar = barInd, icon = icon, label = label, page = page }

	btn.MouseEnter:Connect(function()
		if activePage ~= page then
			Tween(btn, 0.12, { BackgroundTransparency = 0.55 }):Play()
			Tween(btn, 0.12, { BackgroundColor3 = T.Elev }):Play()
		end
	end)
	btn.MouseLeave:Connect(function() refreshSB() end)
	btn.MouseButton1Click:Connect(function()
		activePage = page
		for _, p in pairs(Pages) do p.Visible = (p == page) end
		refreshSB()
		SFX.Click()
	end)

	table.insert(SBItems, item)
	return item
end

refreshSB = function()
	for _, item in ipairs(SBItems) do
		local on = (item.page == activePage)
		item.bar.Visible = on
		if item.icon then
			item.icon.image.ImageColor3 = on and T.White or T.Tx3
			item.icon.image.ImageTransparency = on and 0 or 0.06
			item.icon.slot.BackgroundColor3 = on and T.ActiveBg or T.Elev
			item.icon.slot.BackgroundTransparency = on and 0.24 or 1
		end
		item.label.TextColor3 = on and T.White or T.Tx2
		item.label.Font = on and FM or F
		item.btn.BackgroundColor3 = on and T.ActiveBg or T.Elev
		item.btn.BackgroundTransparency = on and 0.16 or 1
	end
end

for index, tab in ipairs(TAB_DEFS) do
	local page = mkPage(tab.name)
	mkSBItem(tab.name, tab.icon, page, index)
end
if not MOBILE then
	local card = Instance.new(_lIillIIIl(_lIillIIIl("\46\104\101\127\133",109),109))
	card.Name = _lIillIIIl(_lIillIIIl("\83\133\135\143\165\155\202\197\230\245\1",122),122); card.Parent = Sidebar; card.LayoutOrder = 100
	card.Size = UDim2.new(1, 0, 0, 94); card.BackgroundColor3 = T.Card; card.BorderSizePixel = 0
	Corner(card, 9); Stroke(card, T.Bd2, 1, 0.28)
	local quickGradient = Grad(card, T.White:Lerp(T.Accent, 0.16), T.White:Lerp(T.Elev, 0.08), 90)
	quickGradient.Name = _lIillIIIl(_lIillIIIl("\109\159\161\169\191\181\228\223\0\15\27\253\54\51\68\87\107\130\150",135),135)
	local headMark = Instance.new(_lIillIIIl(_lIillIIIl("\124\182\179\205\211",148),148))
	headMark.Parent = card; headMark.Position = UDim2.fromOffset(9, 7); headMark.Size = UDim2.fromOffset(2, 11)
	headMark.BackgroundColor3 = T.Accent; headMark.BorderSizePixel = 0; Corner(headMark, 2)
	local heading = Instance.new(_lIillIIIl(_lIillIIIl("\164\195\228\238\212\247\6\23\44",161),161))
	heading.Parent = card; heading.BackgroundTransparency = 1
	heading.Position = UDim2.fromOffset(17, 4); heading.Size = UDim2.new(1, -35, 0, 18)
	heading.Font = FB; heading.TextSize = 10; heading.TextColor3 = T.Tx2
	heading.TextXAlignment = Enum.TextXAlignment.Left; heading.Text = _lIillIIIl(_lIillIIIl("\187\205\207\215\237\208\17\32\27\60\85\97",174),174)
	local stateDot = Instance.new(_lIillIIIl(_lIillIIIl("\202\4\1\27\33",187),187))
	stateDot.Parent = card; stateDot.AnchorPoint = Vector2.new(1, 0.5)
	stateDot.Position = UDim2.new(1, -9, 0, 13); stateDot.Size = UDim2.fromOffset(5, 5)
	stateDot.BackgroundColor3 = T.Accent; stateDot.BorderSizePixel = 0; Corner(stateDot, 5)
	local divider = Instance.new(_lIillIIIl(_lIillIIIl("\228\30\27\53\59",200),200))
	divider.Parent = card; divider.Position = UDim2.fromOffset(9, 25); divider.Size = UDim2.new(1, -18, 0, 1)
	divider.BackgroundColor3 = T.Bd; divider.BackgroundTransparency = 0.48; divider.BorderSizePixel = 0
	local body = Instance.new(_lIillIIIl(_lIillIIIl("\254\56\53\79\85",213),213))
	body.Parent = card; body.BackgroundTransparency = 1
	body.Position = UDim2.fromOffset(0, 27); body.Size = UDim2.new(1, 0, 1, -29)
	local function statusRow(keyText, index)
		local row = Instance.new(_lIillIIIl(_lIillIIIl("\24\82\79\115\121",226),226))
		row.Parent = body; row.BackgroundTransparency = 1
		row.Position = UDim2.new(0, 9, 0, (index - 1) * 21); row.Size = UDim2.new(1, -18, 0, 21)
		if index > 1 then
			local line = Instance.new(_lIillIIIl(_lIillIIIl("\50\118\115\141\147",239),239))
			line.Parent = row; line.Size = UDim2.new(1, 0, 0, 1)
			line.BackgroundColor3 = T.Bd; line.BackgroundTransparency = 0.62; line.BorderSizePixel = 0
		end
		local key = Instance.new(_lIillIIIl(_lIillIIIl("\100\131\164\174\148\183\198\215\236",1),1))
		key.Parent = row; key.BackgroundTransparency = 1; key.Size = UDim2.new(0, 48, 1, 0)
		key.Font = F; key.TextSize = 9; key.TextColor3 = T.Tx4; key.TextXAlignment = Enum.TextXAlignment.Left; key.Text = keyText
		local value = Instance.new(_lIillIIIl(_lIillIIIl("\126\157\190\200\174\209\224\241\6",14),14))
		value.Parent = row; value.BackgroundTransparency = 1; value.Position = UDim2.fromOffset(48, 0)
		value.Size = UDim2.new(1, -48, 1, 0); value.Font = FM; value.TextSize = 10; value.TextColor3 = T.Tx
		value.TextXAlignment = Enum.TextXAlignment.Right; value.TextTruncate = Enum.TextTruncate.AtEnd; value.Text = _lIillIIIl(_lIillIIIl("\113\127",27),27)
		return value
	end
	local roomValue = statusRow(_lIillIIIl(_lIillIIIl("\176\187\201\213",40),40), 1)
	local stateValue = statusRow(_lIillIIIl(_lIillIIIl("\203\218\213\246\245",53),53), 2)
	local networkValue = statusRow(_lIillIIIl(_lIillIIIl("\226\233\252\3",66),66), 3)
	task.spawn(function()
		while not S.Destroyed and card.Parent do
			local room = LP:GetAttribute(_lIillIIIl(_lIillIIIl("\254\41\55\67\50\103\109",79),79)) or LP:GetAttribute(_lIillIIIl(_lIillIIIl("\9\73\84\98\99\122\142\122\165\179\191",92),92)) or _lIillIIIl(_lIillIIIl("\13\27",105),105)
			local ping = math.floor((LP:GetNetworkPing() or 0) * 1000 + 0.5)
			local active = S.Ready ~= false
			roomValue.Text = tostring(room)
			stateValue.Text = active and _lIillIIIl(_lIillIIIl("\59\75\106\109\136\133",118),118) or _lIillIIIl(_lIillIIIl("\107\99\121\146\149\168\175",131),131)
			stateValue.TextColor3 = active and T.Accent or T.Tx3
			stateDot.BackgroundColor3 = active and T.Accent or T.Tx4
			stateDot.BackgroundTransparency = active and 0 or 0.45
			networkValue.Text = tostring(ping) .. _lIillIIIl(_lIillIIIl("\78\169\189",144),144)
			task.wait(0.75)
		end
	end)
end
activePage = Pages.Visuals
Pages.Visuals.Visible = true
refreshSB()

local CfgBind = {}

local RequestAutoSave

openAppearance = (function()
	local panel = Instance.new(_lIillIIIl(_lIillIIIl("\142\200\197\223\229",157),157))
	panel.Name = _lIillIIIl(_lIillIIIl("\163\224\238\241\251\26\23\50\53\69\65\107\136\150\153\172\179\205",170),170)
	panel.Parent = SG
	panel.AnchorPoint = Vector2.new(0.5, 0.5)
	panel.Position = UDim2.fromScale(0.5, 0.5)

	panel.Size = MOBILE and UDim2.fromScale(0.9, 0.78) or UDim2.fromOffset(320, 456)
	if MOBILE then
		local limit = Instance.new(_lIillIIIl(_lIillIIIl("\209\211\235\15\46\39\19\77\90\119\134\146\143\165\184\204",183),183))
		limit.MaxSize = Vector2.new(440, 660); limit.MinSize = Vector2.new(240, 260)
		limit.Parent = panel
	end
	panel.BackgroundColor3 = T.Card
	panel.BorderSizePixel = 0
	panel.Visible = false
	panel.ZIndex = 1500
	Corner(panel, MOBILE and 16 or 12)
	Stroke(panel, T.Bd2, 1, 0.18)
	Grad(panel, T.White:Lerp(T.Accent, 0.10), T.White:Lerp(T.Elev, 0.06), 90)
	local scale = Instance.new(_lIillIIIl(_lIillIIIl("\235\237\5\35\47\72\79",196),196)); scale.Parent = panel

	local title = Instance.new(_lIillIIIl(_lIillIIIl("\4\35\68\78\52\97\112\129\150",209),209))
	title.Parent = panel; title.BackgroundTransparency = 1
	title.Position = UDim2.fromOffset(16, 12); title.Size = UDim2.new(1, -58, 0, 24)
	title.Font = FB; title.TextSize = 15; title.TextColor3 = T.White
	title.TextXAlignment = Enum.TextXAlignment.Left; title.Text = _lIillIIIl(_lIillIIIl("\19\38\58\57\94\96\105\121\137",222),222)
	local subtitle = Instance.new(_lIillIIIl(_lIillIIIl("\56\87\130\140\114\149\164\181\202",235),235))
	subtitle.Parent = panel; subtitle.BackgroundTransparency = 1
	subtitle.Position = UDim2.fromOffset(16, 34); subtitle.Size = UDim2.new(1, -32, 0, 18)
	subtitle.Font = F; subtitle.TextSize = 10; subtitle.TextColor3 = T.Tx3
	subtitle.TextXAlignment = Enum.TextXAlignment.Left; subtitle.Text = _lIillIIIl(_lIillIIIl("\92\126\137\159\165\122\124\178\205\202\180\21\19\31\56\63\20\22\118\119\129\146\157\172\193\210\221\246\9\190\13\40\44\246\82\97\126\129\140\157\165\177\210\213\233\246\9",248),248)

	local close = Instance.new(_lIillIIIl(_lIillIIIl("\118\149\182\192\156\221\234\248\1\14",10),10))
	close.Parent = panel; close.AnchorPoint = Vector2.new(1, 0)
	close.Position = UDim2.new(1, -12, 0, 12); close.Size = UDim2.fromOffset(MOBILE and 36 or 26, MOBILE and 36 or 26)
	close.BackgroundColor3 = T.Elev; close.BorderSizePixel = 0; close.AutoButtonColor = false
	close.Font = FM; close.TextSize = MOBILE and 22 or 18; close.TextColor3 = T.Tx2; close.Text = _lIillIIIl(_lIillIIIl("\255\225",23),23); close.ZIndex = 1502
	Corner(close, MOBILE and 10 or 7); Stroke(close, T.Bd2, 1, 0.4)

	local body = Instance.new(_lIillIIIl(_lIillIIIl("\169\199\228\239\250\8\19\38\45\26\84\81\107\113",36),36))
	body.Parent = panel; body.BackgroundTransparency = 1; body.BorderSizePixel = 0
	body.Position = UDim2.fromOffset(14, 62); body.Size = UDim2.new(1, -28, 1, -76)
	body.CanvasSize = UDim2.new()
	body.AutomaticCanvasSize = Enum.AutomaticSize.Y
	body.ScrollBarThickness = MOBILE and 0 or 3
	body.ScrollBarImageColor3 = T.Tx3
	local layout = Instance.new(_lIillIIIl(_lIillIIIl("\197\199\216\3\27\42\16\51\89\93\113\126",49),49))
	layout.Parent = body; layout.SortOrder = Enum.SortOrder.LayoutOrder; layout.Padding = UDim.new(0, MOBILE and 10 or 8)
	local choiceRefreshers = {}

	local function makeChoice(labelText, values, getValue, onValue, order, display)
		local row = Instance.new(_lIillIIIl(_lIillIIIl("\208\10\7\33\39",62),62))
		row.Parent = body; row.LayoutOrder = order; row.Size = UDim2.new(1, 0, 0, MOBILE and 68 or 52)
		row.BackgroundColor3 = T.BG; row.BorderSizePixel = 0
		Corner(row, 9); Stroke(row, T.Bd2, 1, 0.42)
		local label = Instance.new(_lIillIIIl(_lIillIIIl("\248\23\56\66\40\75\90\107\128",75),75))
		label.Parent = row; label.BackgroundTransparency = 1
		label.Position = UDim2.fromOffset(10, MOBILE and 7 or 5); label.Size = UDim2.new(1, -20, 0, 17)
		label.Font = F; label.TextSize = MOBILE and 11 or 10; label.TextColor3 = T.Tx3
		label.TextXAlignment = Enum.TextXAlignment.Left; label.Text = labelText
		local button = Instance.new(_lIillIIIl(_lIillIIIl("\18\49\82\92\56\121\134\148\157\170",88),88))
		button.Parent = row; button.Position = UDim2.fromOffset(8, MOBILE and 28 or 24)
		button.Size = UDim2.new(1, -16, 0, MOBILE and 34 or 22)
		button.BackgroundColor3 = T.Elev; button.BorderSizePixel = 0; button.AutoButtonColor = false
		button.Font = FM; button.TextSize = MOBILE and 14 or 11; button.TextColor3 = T.Tx; Corner(button, MOBILE and 9 or 6)
		local function refresh() local value = getValue(); button.Text = display and display(value) or tostring(value) end
		button.MouseButton1Click:Connect(function()
			local current = getValue(); local index = table.find(values, current) or 1
			onValue(values[index % #values + 1]); refresh()
			if RequestAutoSave then RequestAutoSave() end
		end)
		refresh()
		table.insert(choiceRefreshers, refresh)
		return refresh
	end

	local textValues = { 0.88, 1, 1.18 }
	makeChoice(_lIillIIIl(_lIillIIIl("\44\43\76\86\48\113\117\148\141",101),101), textValues, function() return S.UITextScale end, function(value)
		UIStyle:ApplyTextScale(value)
	end, 1, function(value) return value == 0.88 and _lIillIIIl(_lIillIIIl("\69\109\111\136\150",114),114) or (value == 1.18 and _lIillIIIl(_lIillIIIl("\88\123\154\157\169",127),127) or _lIillIIIl(_lIillIIIl("\116\163\180\189\191\216",140),140)) end)
	makeChoice(_lIillIIIl(_lIillIIIl("\136\163\160\138\203\207\238\231",153),153), { 0.8, 0.9, 1, 1.15, 1.3 }, function()
		return S.HUDScale
	end, function(value)
		UIStyle:ApplyHUDScale(value)
	end, 2, function(value) return tostring(math.floor(value * 100 + 0.5)) .. _lIillIIIl(_lIillIIIl("\127",166),166) end)
	makeChoice(_lIillIIIl(_lIillIIIl("\194\209\228\231\242\3\11\23\56\59\89\102\70\132\145\163\167\192\195\215\228",179),179), { _lIillIIIl(_lIillIIIl("\226\11\26\216\24\61\73\88\124",192),192), _lIillIIIl(_lIillIIIl("\234\37\56\70\79\91\38\102\139\151\166\192",205),205), _lIillIIIl(_lIillIIIl("\4\63\82\96\115\127\64\113\161\184\204\203\230",218),218), _lIillIIIl(_lIillIIIl("\30\89\118\132\141\153\90\148\187\202\230",231),231), _lIillIIIl(_lIillIIIl("\84\125\140\74\132\171\186\214",244),244), _lIillIIIl(_lIillIIIl("\110\151\166\100\149\197\220\240\239\10",6),6) }, function()
		return S.NotificationPosition
	end, function(value)
		UIStyle:PlaceNotifications(value)
	end, 3)
	local themeCard = Instance.new(_lIillIIIl(_lIillIIIl("\122\180\177\203\209",19),19))
	themeCard.Parent = body; themeCard.LayoutOrder = 4; themeCard.Size = UDim2.new(1, 0, 0, MOBILE and 216 or 150)
	themeCard.BackgroundColor3 = T.BG; themeCard.BorderSizePixel = 0
	Corner(themeCard, 9); Stroke(themeCard, T.Bd2, 1, 0.42)
	local themeTitle = Instance.new(_lIillIIIl(_lIillIIIl("\162\193\226\236\210\245\4\21\42",32),32))
	themeTitle.Parent = themeCard; themeTitle.BackgroundTransparency = 1
	themeTitle.Position = UDim2.fromOffset(10, 5); themeTitle.Size = UDim2.new(1, -20, 0, 17)
	themeTitle.Font = F; themeTitle.TextSize = 10; themeTitle.TextColor3 = T.Tx3
	themeTitle.TextXAlignment = Enum.TextXAlignment.Left; themeTitle.Text = _lIillIIIl(_lIillIIIl("\188\190\201\223\229",45),45)
	local gridHost = Instance.new(_lIillIIIl(_lIillIIIl("\200\2\255\25\31",58),58))
	gridHost.Parent = themeCard; gridHost.BackgroundTransparency = 1
	gridHost.Position = UDim2.fromOffset(8, 26); gridHost.Size = UDim2.new(1, -16, 1, -34)
	local grid = Instance.new(_lIillIIIl(_lIillIIIl("\241\243\255\56\61\70\60\95\133\137\157\170",71),71))
	grid.Parent = gridHost; grid.CellSize = UDim2.new(0.5, -3, 0, MOBILE and 34 or 20); grid.CellPadding = UDim2.fromOffset(6, MOBILE and 6 or 4)
	grid.FillDirectionMaxCells = 2; grid.SortOrder = Enum.SortOrder.LayoutOrder
	local themeButtons = {}
	local themeNames = { _lIillIIIl(_lIillIIIl("\250\41\56\65\99\104\126",84),84), _lIillIIIl(_lIillIIIl("\23\80\77\106\112\127\152\151",97),97), _lIillIIIl(_lIillIIIl("\57\91\107\117\144",110),110), _lIillIIIl(_lIillIIIl("\74\129\146\147\175\190",123),123), _lIillIIIl(_lIillIIIl("\117\149\168\173",136),136), _lIillIIIl(_lIillIIIl("\142\175\195\206\213\242",149),149), _lIillIIIl(_lIillIIIl("\151\205\208\225\252",162),162), _lIillIIIl(_lIillIIIl("\173\231\234\251\22",175),175), _lIillIIIl(_lIillIIIl("\216\3\21\21",188),188) }
	local function refreshThemes()
		for name, button in pairs(themeButtons) do
			local selected = name == S.UITheme
			button.BackgroundColor3 = selected and T.ActiveBg or T.Elev
			button.TextColor3 = selected and T.White or T.Tx2
		end
	end
	for index, name in ipairs(themeNames) do
		local button = Instance.new(_lIillIIIl(_lIillIIIl("\244\19\52\62\26\91\104\128\137\150",201),201))
		button.Parent = gridHost; button.LayoutOrder = index; button.AutoButtonColor = false
		button.BackgroundColor3 = T.Elev; button.BorderSizePixel = 0
		button.Font = FM; button.TextSize = MOBILE and 13 or 10; button.TextColor3 = T.Tx2; button.Text = name
		Corner(button, MOBILE and 9 or 6); Stroke(button, T.Bd2, 1, 0.48)
		local dot = Instance.new(_lIillIIIl(_lIillIIIl("\0\58\55\81\87",214),214))
		dot.Parent = button; dot.AnchorPoint = Vector2.new(1, 0.5); dot.Position = UDim2.new(1, -7, 0.5, 0)
		dot.Size = UDim2.fromOffset(7, 7); dot.BackgroundColor3 = THEMES[name].Accent; dot.BorderSizePixel = 0; Corner(dot, 99)
		dot:SetAttribute(_lIillIIIl(_lIillIIIl("\39\86\81\124\127\135\134\168\179\201\207\187\245\0\17\34",227),227), true)
		themeButtons[name] = button
		button.MouseButton1Click:Connect(function()
			UIStyle:ApplyTheme(name); refreshThemes()
			if RequestAutoSave then RequestAutoSave() end
		end)
	end
	refreshThemes()
	S._refreshAppearance = function()
		refreshThemes()
		for _, refresh in ipairs(choiceRefreshers) do refresh() end
	end

	local executor = Instance.new(_lIillIIIl(_lIillIIIl("\66\107\140\150\124\159\174\191\212",240),240))
	executor.Parent = body; executor.LayoutOrder = 5; executor.Size = UDim2.new(1, 0, 0, 28)
	executor.BackgroundColor3 = T.BG; executor.BorderSizePixel = 0
	executor.Font = F; executor.TextSize = 10; executor.TextColor3 = T.Tx2
	executor.TextXAlignment = Enum.TextXAlignment.Left
	local executorName = _lIillIIIl(_lIillIIIl("\103\142\153\170\185\207\212\148\231\8\3\15\47\60\69\86",2),2)
	pcall(function() if identifyexecutor then executorName = tostring(identifyexecutor()) end end)
	executor.Text = _lIillIIIl(_lIillIIIl("\76\90\104\155\188\183\195\227\240\249\10\230\244\2",15),15) .. executorName
	Corner(executor, 8); Stroke(executor, T.Bd2, 1, 0.44)
	for _, object in ipairs(panel:GetDescendants()) do if object:IsA(_lIillIIIl(_lIillIIIl("\141\201\203\191\224\246\255\11\42",28),28)) then object.ZIndex = math.max(object.ZIndex, 1501) end end

	local opened = false
	local function setOpen(value)
		opened = value
		if value then
			panel.Visible = true; scale.Scale = 0.92; panel.BackgroundTransparency = 0.08
			Tween(scale, 0.2, { Scale = 1 }, Enum.EasingStyle.Back):Play()
			Tween(panel, 0.16, { BackgroundTransparency = 0 }):Play()
		else
			Tween(scale, 0.14, { Scale = 0.94 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In):Play()
			task.delay(0.15, function() if not opened then panel.Visible = false end end)
		end
	end
	close.MouseButton1Click:Connect(function() setOpen(false) end)
	return function() setOpen(not opened) end
end)()

do
local function setupKeybinds()
local BindRegistry = {}
S._bindRegistry = BindRegistry
local BindCapture = { target = nil, readyAt = 0 }
S._bindHUDDirty = true

local BindPrompt = Instance.new(_lIillIIIl(_lIillIIIl("\166\224\221\247\253",41),41))
BindPrompt.Name = _lIillIIIl(_lIillIIIl("\202\250\251\23\37\53\64\65\44\97\116\120\101\145\174\192\207\218\219",54),54)
BindPrompt.Parent = SG
BindPrompt.AnchorPoint = Vector2.new(0.5, 0)
BindPrompt.Position = UDim2.new(0.5, 0, 0, 76)
BindPrompt.Size = UDim2.fromOffset(286, 48)
BindPrompt.BackgroundColor3 = T.Card
BindPrompt.BackgroundTransparency = 0.04
BindPrompt.BorderSizePixel = 0
BindPrompt.Visible = false
BindPrompt.ZIndex = 980
Corner(BindPrompt, 9)
Stroke(BindPrompt, T.Accent, 1, 0.18)

local BindPromptTitle = Instance.new(_lIillIIIl(_lIillIIIl("\232\7\40\50\24\59\74\91\112",67),67))
BindPromptTitle.Parent = BindPrompt; BindPromptTitle.BackgroundTransparency = 1
BindPromptTitle.Position = UDim2.fromOffset(12, 7); BindPromptTitle.Size = UDim2.new(1, -24, 0, 15)
BindPromptTitle.Font = FB; BindPromptTitle.TextSize = 11; BindPromptTitle.TextColor3 = T.White
BindPromptTitle.TextXAlignment = Enum.TextXAlignment.Left; BindPromptTitle.ZIndex = 981

local BindPromptSub = Instance.new(_lIillIIIl(_lIillIIIl("\2\33\66\76\50\85\100\117\138",80),80))
BindPromptSub.Parent = BindPrompt; BindPromptSub.BackgroundTransparency = 1
BindPromptSub.Position = UDim2.fromOffset(12, 24); BindPromptSub.Size = UDim2.new(1, -24, 0, 15)
BindPromptSub.Font = F; BindPromptSub.TextSize = 11; BindPromptSub.TextColor3 = T.Tx2
BindPromptSub.TextXAlignment = Enum.TextXAlignment.Left; BindPromptSub.Text = _lIillIIIl(_lIillIIIl("\24\72\73\101\115\46\125\74\163\171\205\130\223\240\172\7\23\43\55\55\0\80\123\136\150\159\172\108\60\232\10\164\215\19\17\220\45\68\75\85\116\131",93),93)
BindPromptSub.ZIndex = 981

local function bindTokenFromInput(input)
	if input.KeyCode and input.KeyCode ~= Enum.KeyCode.Unknown then
		if input.KeyCode == S.MenuKeybind then return nil end
		return _lIillIIIl(_lIillIIIl("\77\85\119\70",106),106) .. input.KeyCode.Name
	end
	local kind = input.UserInputType
	if kind == Enum.UserInputType.MouseButton1 or kind == Enum.UserInputType.MouseButton2
		or kind == Enum.UserInputType.MouseButton3 then
		return _lIillIIIl(_lIillIIIl("\105\121\141\153\153\124",119),119) .. kind.Name
	end
	return nil
end

local function bindTokenTitle(token)
	if type(token) ~= _lIillIIIl(_lIillIIIl("\137\152\164\169\188\195",132),132) then return _lIillIIIl(_lIillIIIl("\18\190\224",145),145) end
	local kind, value = token:match(_lIillIIIl(_lIillIIIl("\168\128\139\213\173\185\216\212\232\243\255\8",158),158))
	if not kind or not value then return _lIillIIIl(_lIillIIIl("\70\242\20",171),171) end
	local pretty = {
		LeftControl = _lIillIIIl(_lIillIIIl("\202\207\238\250\2",184),184), RightControl = _lIillIIIl(_lIillIIIl("\234\233\8\20\28",197),197), LeftShift = _lIillIIIl(_lIillIIIl("\254\19\22\37\48\86",210),210), RightShift = _lIillIIIl(_lIillIIIl("\30\45\48\73\84\112",223),223),
		LeftAlt = _lIillIIIl(_lIillIIIl("\50\53\88\110",236),236), RightAlt = _lIillIIIl(_lIillIIIl("\92\89\114\136",249),249), MouseButton1 = _lIillIIIl(_lIillIIIl("\113\99",11),11), MouseButton2 = _lIillIIIl(_lIillIIIl("\139\126",24),24), MouseButton3 = _lIillIIIl(_lIillIIIl("\165\153",37),37),
	}
	return pretty[value] or string.upper(value)
end
S._bindTokenTitle = bindTokenTitle

local function markKeybindHUDDirty()
	S._bindHUDDirty = true
end
S._markKeybindHUDDirty = markKeybindHUDDirty

local function refreshBindChips(id)
	local entry = BindRegistry[id]
	if not entry then return end

	if MOBILE then return end
	local text = bindTokenTitle(S.Keybinds[id])
	for _, chip in ipairs(entry.chips) do
		if chip and chip.Parent then chip.Text = text end
	end
	markKeybindHUDDirty()
end

local function setKeybind(id, token)
	if not BindRegistry[id] then return end
	S.Keybinds = type(S.Keybinds) == _lIillIIIl(_lIillIIIl("\230\225\240\8\15",50),50) and S.Keybinds or {}
	if token then

		for otherId, otherToken in pairs(S.Keybinds) do
			if otherId ~= id and otherToken == token then
				S.Keybinds[otherId] = nil
				refreshBindChips(otherId)
			end
		end
		S.Keybinds[id] = token
	else
		S.Keybinds[id] = nil
	end
	refreshBindChips(id)
	if RequestAutoSave then RequestAutoSave() end
end

local function applyKeybindMap(map)
	S.Keybinds = {}
	if type(map) == _lIillIIIl(_lIillIIIl("\0\251\10\34\41",63),63) then
		for id, token in pairs(map) do
			if BindRegistry[id] and type(token) == _lIillIIIl(_lIillIIIl("\25\40\52\57\76\83",76),76) then S.Keybinds[id] = token end
		end
	end
	for id in pairs(BindRegistry) do refreshBindChips(id) end
	markKeybindHUDDirty()
end
S._applyKeybindMap = applyKeybindMap

local function clearAllKeybinds()
	applyKeybindMap({})
	if RequestAutoSave then RequestAutoSave() end
	Notify(_lIillIIIl(_lIillIIIl("\11\51\85\76\97\116\120\149",89),89), _lIillIIIl(_lIillIIIl("\27\84\98\36\116\137\156\160\189\120\201\224\231\241\16\17\30",102),102), 1.8, _lIillIIIl(_lIillIIIl("\93\112\118\141",115),115))
end
S._clearAllKeybinds = clearAllKeybinds

local function startBindCapture(id)
	local entry = BindRegistry[id]
	if not entry then return end
	BindCapture.target = id

	BindCapture.readyAt = os.clock() + 0.12
	BindPromptTitle.Text = _lIillIIIl(_lIillIIIl("\80\101\120\124\102\131\145\144",128),128) .. string.upper(entry.label)
	BindPrompt.Visible = true
	SFX.Click()
end

local function finishBindCapture(token)
	local id = BindCapture.target
	BindCapture.target = nil
	BindPrompt.Visible = false
	if not id then return end
	setKeybind(id, token)
	local entry = BindRegistry[id]
	if token then
		Notify(_lIillIIIl(_lIillIIIl("\115\155\189\180\201\220\224",141),141), entry.label .. _lIillIIIl(_lIillIIIl("\98\50\228\254\154",154),154) .. bindTokenTitle(token), 1.8, _lIillIIIl(_lIillIIIl("\207\223\219\233\249\21\35",167),167))
	else
		Notify(_lIillIIIl(_lIillIIIl("\193\233\11\2\23\42\46",180),180), entry.label .. _lIillIIIl(_lIillIIIl("\176\1\24\31\41\72\73\86",193),193), 1.6, _lIillIIIl(_lIillIIIl("\19\38\44\67",206),206))
	end
end

local function registerBindable(id, label, trigger, isActive, kind)
	BindRegistry[id] = { label = label, trigger = trigger, isActive = isActive, kind = kind, chips = {} }
	return id
end
S._registerBindable = registerBindable

local function requestBindFromRightClick(target, id)
	target.Active = true
	target:SetAttribute(_lIillIIIl(_lIillIIIl("\20\68\69\97\121\137\148\149\128\181\200\204\191\232",219),219), id)
end
S._requestBindFromRightClick = requestBindFromRightClick

local function bindTargetAt(position)
	local ok, hits = pcall(function()
		local root = SG.Parent
		if root and type(root.GetGuiObjectsAtPosition) == _lIillIIIl(_lIillIIIl("\68\97\114\117\148\151\171\184",232),232) then
			return root:GetGuiObjectsAtPosition(position.X, position.Y)
		end
		local pg = LP:FindFirstChildOfClass(_lIillIIIl(_lIillIIIl("\82\124\127\165\159\186\157\217\219",245),245))
		return pg and pg:GetGuiObjectsAtPosition(position.X, position.Y) or {}
	end)
	if not ok or type(hits) ~= _lIillIIIl(_lIillIIIl("\144\139\154\178\185",7),7) then return nil end
	for _, hit in ipairs(hits) do
		local node = hit
		while node and node ~= SG do
			local id = node:GetAttribute(_lIillIIIl(_lIillIIIl("\134\182\183\211\225\241\252\253\232\29\48\52\39\80",20),20))
			if id and BindRegistry[id] then return id end
			node = node.Parent
		end
	end
	return nil
end

local function addBindChip(parent, id, rightOffset)
	local chip = Instance.new(_lIillIIIl(_lIillIIIl("\164\195\228\238\202\11\24\38\47\60",33),33))
	chip.Name = (MOBILE and _lIillIIIl(_lIillIIIl("\176\228\245\245\22\15",46),46) or _lIillIIIl(_lIillIIIl("\198\251\14\18\27",59),59)) .. id
	chip.Parent = parent
	chip.AnchorPoint = Vector2.new(1, 0.5)
	chip.Position = UDim2.new(1, rightOffset or -52, 0.5, 0)
	chip.Size = UDim2.fromOffset(MOBILE and 42 or 48, MOBILE and 26 or 20)
	chip.BackgroundColor3 = T.Elev
	chip.BorderSizePixel = 0
	chip.AutoButtonColor = false
	chip.Font = FM; chip.TextSize = 10; chip.TextColor3 = T.Tx2
	chip.Text = MOBILE and _lIillIIIl(_lIillIIIl("\224\0\8",72),72) or bindTokenTitle(S.Keybinds[id])
	chip.ZIndex = 3
	Corner(chip, MOBILE and 8 or 6)
	local chipStroke = Stroke(chip, T.Bd2, 1, 0.42)
	if MOBILE then
		local function paint()
			local on = S._floatIsOn and S._floatIsOn(id) or false
			chip.BackgroundColor3 = on and T.ActiveBg or T.Elev
			chip.TextColor3 = on and T.White or T.Tx2
			chipStroke.Color = on and T.Accent or T.Bd2
			chipStroke.Transparency = on and 0.15 or 0.42
		end
		tc(chip.MouseButton1Click:Connect(function()
			if S._floatToggle then S._floatToggle(id) end
			paint()
		end))

		local entry = BindRegistry[id]
		if entry then
			entry.paintChips = entry.paintChips or {}
			table.insert(entry.paintChips, paint)
		end
		paint()
	else
		tc(chip.MouseButton1Click:Connect(function() startBindCapture(id) end))
		requestBindFromRightClick(chip, id)
	end
	local entry = BindRegistry[id]
	if entry then table.insert(entry.chips, chip) end
	return chip
end
S._addBindChip = addBindChip

if MOBILE then return end
tc(UIS.InputBegan:Connect(function(input, gameProcessed)
	if BindCapture.target then
		if os.clock() < BindCapture.readyAt then return end
		if input.KeyCode == Enum.KeyCode.Escape then finishBindCapture(nil); return end
		local token = bindTokenFromInput(input)
		if token then finishBindCapture(token) end
		return
	end
	if input.UserInputType == Enum.UserInputType.MouseButton2 then
		local id = bindTargetAt(input.Position)
		if id then startBindCapture(id); return end
	end
	if gameProcessed or UIS:GetFocusedTextBox() then return end
	local token = bindTokenFromInput(input)
	if not token then return end
	for id, entry in pairs(BindRegistry) do
		if S.Keybinds[id] == token then
			pcall(entry.trigger)
			markKeybindHUDDirty()
			break
		end
	end
end))
end
setupKeybinds()
end

do
	local FloatHost = Instance.new(_lIillIIIl(_lIillIIIl("\254\56\53\79\85",85),85))
	FloatHost.Name = _lIillIIIl(_lIillIIIl("\24\76\93\93\126\129\148\155\132\197\210\224\233\246\9",98),98)
	FloatHost.Parent = SG
	FloatHost.BackgroundTransparency = 1
	FloatHost.Size = UDim2.fromScale(1, 1)

	FloatHost.ZIndex = 0
	FloatHost.Visible = MOBILE
	S._floatHost = FloatHost

	local Buttons = {}
	local spawnIndex = 0

	local FLOAT_ICON_RULES = {
		{ _lIillIIIl(_lIillIIIl("\89\95\118\139",111),111), _lIillIIIl(_lIillIIIl("\121\121\150\164\167\186\193\219\163\182",124),124) },
		{ _lIillIIIl(_lIillIIIl("\133\161\172",137),137), _lIillIIIl(_lIillIIIl("\159\193\187",150),150) },
		{ _lIillIIIl(_lIillIIIl("\183\202\209\235",163),163), _lIillIIIl(_lIillIIIl("\211\245\239",176),176) },
		{ _lIillIIIl(_lIillIIIl("\254\255\23\39\33\58",189),189), _lIillIIIl(_lIillIIIl("\7\41\35",202),202) },
		{ _lIillIIIl(_lIillIIIl("\48\60\57\73\89\126",215),215), _lIillIIIl(_lIillIIIl("\59\93\87",228),228) },
		{ _lIillIIIl(_lIillIIIl("\98\105\122\133\164",241),241), _lIillIIIl(_lIillIIIl("\121\155\149",3),3) },
		{ _lIillIIIl(_lIillIIIl("\143\165\183",16),16), _lIillIIIl(_lIillIIIl("\171\200\211\229\243\246\253\19\42",29),29) },
		{ _lIillIIIl(_lIillIIIl("\205\217\234\248",42),42), _lIillIIIl(_lIillIIIl("\223\252\7\25\39\42\49\71\94",55),55) },
		{ _lIillIIIl(_lIillIIIl("\13\5\36\46",68),68), _lIillIIIl(_lIillIIIl("\19\48\59\77\91\94\101\123\146",81),81) },
		{ _lIillIIIl(_lIillIIIl("\47\70\90\93\118\137",94),94), _lIillIIIl(_lIillIIIl("\71\100\111\129\143\146\153\175\198",107),107) },
		{ _lIillIIIl(_lIillIIIl("\100\120\147",120),120), _lIillIIIl(_lIillIIIl("\127\135\169\169\181",133),133) },
		{ _lIillIIIl(_lIillIIIl("\165\176\179\193\206",146),146), _lIillIIIl(_lIillIIIl("\179\187\221\221\233",159),159) },
		{ _lIillIIIl(_lIillIIIl("\208\233\239\0",172),172), _lIillIIIl(_lIillIIIl("\231\239\17\17\29",185),185) },
		{ _lIillIIIl(_lIillIIIl("\17\9\34\47",198),198), _lIillIIIl(_lIillIIIl("\27\35\69\69\81",211),211) },
		{ _lIillIIIl(_lIillIIIl("\60\75\77\110\121\142",224),224), _lIillIIIl(_lIillIIIl("\79\97\131\131\143",237),237) },
		{ _lIillIIIl(_lIillIIIl("\127\145\145\163",250),250), _lIillIIIl(_lIillIIIl("\141\149\183\183\195",12),12) },
		{ _lIillIIIl(_lIillIIIl("\179\190\206\211\230\250",25),25), _lIillIIIl(_lIillIIIl("\193\201\235\235\247",38),38) },
		{ _lIillIIIl(_lIillIIIl("\213\247\4\13",51),51), _lIillIIIl(_lIillIIIl("\240\11\30",64),64) },
		{ _lIillIIIl(_lIillIIIl("\14\23\54\63",77),77), _lIillIIIl(_lIillIIIl("\36\63\82",90),90) },
		{ _lIillIIIl(_lIillIIIl("\63\89\100\114\121\133\164",103),103), _lIillIIIl(_lIillIIIl("\88\115\134",116),116) },
		{ _lIillIIIl(_lIillIIIl("\116\141\155\172",129),129), _lIillIIIl(_lIillIIIl("\140\167\186",142),142) },
		{ _lIillIIIl(_lIillIIIl("\180\190\193\231\225\252",155),155), _lIillIIIl(_lIillIIIl("\211\223\223\250\195\22\33\53\60\64",168),168) },
		{ _lIillIIIl(_lIillIIIl("\231\254\13\9\21\44",181),181), _lIillIIIl(_lIillIIIl("\7\19\19\46\247\74\85\105\122\126",194),194) },
		{ _lIillIIIl(_lIillIIIl("\20\31\41\66",207),207), _lIillIIIl(_lIillIIIl("\59\71\71\98\53\136\147\167\174\178",220),220) },
		{ _lIillIIIl(_lIillIIIl("\67\93\116\122\139\151",233),233), _lIillIIIl(_lIillIIIl("\119\119\148\162\165\184\191\217\161\180",246),246) },
		{ _lIillIIIl(_lIillIIIl("\145\145\174\188\191\210\217",8),8), _lIillIIIl(_lIillIIIl("\171\171\200\214\217\236\243\13\213\232",21),21) },
		{ _lIillIIIl(_lIillIIIl("\187\206\226\225\252\254\7\23\39",34),34), _lIillIIIl(_lIillIIIl("\223\223\252\10\13\32\39\65\9\28",47),47) },
	}
	local function floatIconKind(id, label)
		local hay = string.lower(tostring(id) .. _lIillIIIl(_lIillIIIl("\166",60),60) .. tostring(label or ""))
		for _, rule in ipairs(FLOAT_ICON_RULES) do
			if string.find(hay, rule[1], 1, true) then return rule[2] end
		end
		return _lIillIIIl(_lIillIIIl("\23\32\33\56\59\78",73),73)
	end

	local function buttonSize()
		local vp = cam() and cam().ViewportSize
		local base = vp and math.min(vp.X, vp.Y) or 400
		return math.clamp(math.floor(base * 0.13), 48, 70)
	end

	local function entryFor(id)
		local reg = S._bindRegistry or {}
		return reg[id]
	end

	local function repaintChips(id)
		local entry = entryFor(id)
		if not entry or not entry.paintChips then return end
		for _, paint in ipairs(entry.paintChips) do pcall(paint) end
	end

	S._floatIsOn = function(id) return Buttons[id] ~= nil end

	local function paintState(id)
		local button = Buttons[id]
		if not button then return end
		local entry = entryFor(id)
		local active = false
		if entry and entry.isActive then
			local ok, value = pcall(entry.isActive)
			active = ok and value == true
		end
		if button.lastActive == active then return end
		button.lastActive = active
		Tween(button.frame, 0.16, {
			BackgroundColor3 = active and T.ActiveBg or T.Card,
		}):Play()
		Tween(button.stroke, 0.16, {
			Color = active and T.Accent or T.Bd2,
			Transparency = active and 0.05 or 0.3,
		}):Play()
		button.dot.BackgroundColor3 = active and T.Accent or T.Tx4
		button.dot.BackgroundTransparency = active and 0 or 0.4
		button.label.TextColor3 = active and T.White or T.Tx2
	end
	S._floatRefreshState = paintState

	local function savePosition(id, xScale, yScale)
		S.FloatButtons[id] = { x = xScale, y = yScale }
		if RequestAutoSave then RequestAutoSave() end
	end

	local function createButton(id)
		local entry = entryFor(id)
		if not entry or Buttons[id] then return end
		local size = buttonSize()

		local saved = S.FloatButtons[id]
		if type(saved) ~= _lIillIIIl(_lIillIIIl("\46\41\56\80\87",86),86) or type(saved.x) ~= _lIillIIIl(_lIillIIIl("\66\87\93\96\113\140",99),99) or type(saved.y) ~= _lIillIIIl(_lIillIIIl("\92\113\119\122\139\166",112),112) then

			spawnIndex += 1
			saved = { x = 0.08, y = math.min(0.22 + (spawnIndex - 1) * 0.12, 0.9) }
			S.FloatButtons[id] = saved
		end

		local frame = Instance.new(_lIillIIIl(_lIillIIIl("\92\123\156\166\130\195\208\222\231\244",125),125))
		frame.Name = _lIillIIIl(_lIillIIIl("\104\156\173\173\206\199",138),138) .. id
		frame.Parent = FloatHost
		frame.AnchorPoint = Vector2.new(0.5, 0.5)
		frame.Position = UDim2.fromScale(math.clamp(saved.x, 0.03, 0.97), math.clamp(saved.y, 0.05, 0.95))
		frame.Size = UDim2.fromOffset(size, size)
		frame.BackgroundColor3 = T.Card
		frame.BackgroundTransparency = 0.08
		frame.BorderSizePixel = 0
		frame.AutoButtonColor = false
		frame.Text = ""
		frame.Active = true
		Corner(frame, math.floor(size * 0.3))
		local stroke = Stroke(frame, T.Bd2, 1, 0.3)
		Shadow(frame, 0.55)
		Grad(frame, T.White:Lerp(T.Accent, 0.1), T.White:Lerp(T.Elev, 0.06), 90)

		local dot = Instance.new(_lIillIIIl(_lIillIIIl("\130\188\185\211\217",151),151))
		dot.Parent = frame
		dot.AnchorPoint = Vector2.new(0.5, 0)
		dot.Position = UDim2.new(0.5, 0, 0, 5)
		dot.Size = UDim2.fromOffset(6, 6)
		dot.BackgroundColor3 = T.Tx4
		dot.BorderSizePixel = 0
		Corner(dot, 99)

		local glyph = S._MakeNavIcon and S._MakeNavIcon(frame, floatIconKind(id, entry.label))
		if glyph then
			glyph.slot.AnchorPoint = Vector2.new(0.5, 0)
			glyph.slot.Position = UDim2.new(0.5, 0, 0, 12)
			glyph.slot.Size = UDim2.fromOffset(20, 20)
			glyph.slot.BackgroundTransparency = 1
			glyph.image.Size = UDim2.fromOffset(18, 18)
			glyph.image.ImageColor3 = T.Tx2
		end

		local label = Instance.new(_lIillIIIl(_lIillIIIl("\170\201\234\244\218\253\12\29\50",164),164))
		label.Parent = frame
		label.BackgroundTransparency = 1
		label.Position = glyph and UDim2.new(0, 3, 0, 34) or UDim2.new(0, 4, 0, 20)
		label.Size = glyph and UDim2.new(1, -6, 1, -37) or UDim2.new(1, -8, 1, -26)
		label.Font = FM
		label.TextSize = glyph and (size <= 60 and 9 or 10) or (size <= 60 and 11 or 12)
		label.TextColor3 = T.Tx2
		label.TextWrapped = true
		label.TextXAlignment = Enum.TextXAlignment.Center
		label.TextYAlignment = Enum.TextYAlignment.Center
		label.Text = string.upper(tostring(entry.label or id))

		local scale = Instance.new(_lIillIIIl(_lIillIIIl("\197\199\223\253\9\34\41",177),177))
		scale.Parent = frame
		scale.Scale = 0.6
		Tween(scale, 0.24, { Scale = 1 }, Enum.EasingStyle.Back):Play()

		local record = { frame = frame, stroke = stroke, dot = dot, label = label, scale = scale, glyph = glyph }
		Buttons[id] = record

		local pressPos, dragging, moveConn, endConn
		local function finish(fired)
			if moveConn then moveConn:Disconnect(); moveConn = nil end
			if endConn then endConn:Disconnect(); endConn = nil end
			if fired and not dragging then
				local current = entryFor(id)
				if current and current.trigger then pcall(current.trigger) end
				Tween(scale, 0.09, { Scale = 0.9 }):Play()
				task.delay(0.09, function()
					if frame.Parent then Tween(scale, 0.14, { Scale = 1 }, Enum.EasingStyle.Back):Play() end
				end)
				task.defer(function() paintState(id) end)
			end
			if dragging then
				local vp = cam() and cam().ViewportSize
				if vp and vp.X > 0 and vp.Y > 0 then
					local centre = frame.AbsolutePosition + frame.AbsoluteSize / 2
					savePosition(id, math.clamp(centre.X / vp.X, 0.03, 0.97), math.clamp(centre.Y / vp.Y, 0.05, 0.95))
				end
			end
			pressPos, dragging = nil, false
		end

		tc(frame.InputBegan:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.Touch
				and input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end

			if moveConn then moveConn:Disconnect(); moveConn = nil end
			if endConn then endConn:Disconnect(); endConn = nil end
			pressPos, dragging = input.Position, false
			local startCentre = frame.AbsolutePosition + frame.AbsoluteSize / 2
			moveConn = UIS.InputChanged:Connect(function(moved)
				if not pressPos then return end
				if moved.UserInputType ~= Enum.UserInputType.Touch
					and moved.UserInputType ~= Enum.UserInputType.MouseMovement then return end
				local delta = moved.Position - pressPos
				if not dragging and (math.abs(delta.X) > 8 or math.abs(delta.Y) > 8) then dragging = true end
				if dragging then
					local vp = cam() and cam().ViewportSize
					if not vp or vp.X <= 0 or vp.Y <= 0 then return end
					frame.Position = UDim2.fromScale(
						math.clamp((startCentre.X + delta.X) / vp.X, 0.03, 0.97),
						math.clamp((startCentre.Y + delta.Y) / vp.Y, 0.05, 0.95)
					)
				end
			end)
			endConn = input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then finish(true) end
			end)
		end))

		record.lastActive = nil
		paintState(id)
	end

	local function destroyButton(id)
		local button = Buttons[id]
		if not button then return end
		Buttons[id] = nil
		Tween(button.scale, 0.14, { Scale = 0.5 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In):Play()
		Tween(button.frame, 0.14, { BackgroundTransparency = 1 }):Play()
		task.delay(0.16, function() if button.frame.Parent then button.frame:Destroy() end end)
	end

	S._floatSet = function(id, on)
		if not MOBILE then return end

		if id == _lIillIIIl(_lIillIIIl("\255\1\224\33\39\62\83",190),190) and not on then return end
		if on then
			createButton(id)
		else
			destroyButton(id)
			S.FloatButtons[id] = nil
			if RequestAutoSave then RequestAutoSave() end
		end
		repaintChips(id)
		if S._refreshFloatTab then pcall(S._refreshFloatTab) end
	end

	S._floatToggle = function(id)
		S._floatSet(id, not S._floatIsOn(id))
		SFX.Click()
	end

	S._floatApplyMap = function(map)
		if not MOBILE then return end

		local keepMenu = S.FloatButtons[_lIillIIIl(_lIillIIIl("\25\27\250\59\65\88\119",203),203)]
		for id in pairs(Buttons) do destroyButton(id) end
		S.FloatButtons = {}
		if type(map) == _lIillIIIl(_lIillIIIl("\50\45\60\84\101",216),216) then
			for id, pos in pairs(map) do
				if type(pos) == _lIillIIIl(_lIillIIIl("\76\71\86\120\127",229),229) and entryFor(id) then
					S.FloatButtons[id] = { x = tonumber(pos.x) or 0.08, y = tonumber(pos.y) or 0.3 }
					createButton(id)
				end
			end
		end

		createButton(_lIillIIIl(_lIillIIIl("\103\115\82\147\153\176\197",242),242))
		for id in pairs(S._bindRegistry or {}) do repaintChips(id) end
		if S._refreshFloatTab then pcall(S._refreshFloatTab) end
	end

	S._floatClearAll = function()
		for id in pairs(Buttons) do S._floatSet(id, false) end
	end

	if MOBILE then
		task.spawn(function()
			while not S.Destroyed and FloatHost.Parent do
				for id in pairs(Buttons) do paintState(id) end
				task.wait(0.35)
			end
		end)

		tc(cam():GetPropertyChangedSignal(_lIillIIIl(_lIillIIIl("\108\141\151\183\190\203\220\236\217\253\28\21",4),4)):Connect(function()
			local size = buttonSize()
			for _, button in pairs(Buttons) do
				button.frame.Size = UDim2.fromOffset(size, size)

				button.label.TextSize = button.glyph and (size <= 60 and 9 or 10) or (size <= 60 and 11 or 12)
			end
		end))
	end
end

do
	local function relayout()
		local vp = cam() and cam().ViewportSize
		if not vp or vp.X < 1 or vp.Y < 1 then return end
		local portrait = vp.Y >= vp.X

		if MOBILE then

			Main.Size = portrait and UDim2.fromScale(0.86, 0.56) or UDim2.fromScale(0.54, 0.78)
		else
			WW = math.min(920, math.floor(vp.X - 40))
			WH = math.min(590, math.floor(vp.Y - 40))
			if not isMinimized then Main.Size = UDim2.fromOffset(WW, WH) end
		end

		NHost.Size = UDim2.fromOffset(
			math.clamp(math.floor(vp.X * (MOBILE and 0.3 or 0.4)), MOBILE and 150 or 210, MOBILE and 210 or 330), 190)
		WarnFrame.Size = UDim2.fromOffset(math.clamp(math.floor(vp.X - 48), 240, MOBILE and 330 or 404), MOBILE and 50 or 58)
	end
	relayout()
	tc(cam():GetPropertyChangedSignal(_lIillIIIl(_lIillIIIl("\134\167\177\209\216\229\246\6\243\23\54\47",17),17)):Connect(relayout))

	tc(Workspace:GetPropertyChangedSignal(_lIillIIIl(_lIillIIIl("\141\205\216\230\231\254\18\239\27\53\59\86\83",30),30)):Connect(function()
		if cam() then
			relayout()
			tc(cam():GetPropertyChangedSignal(_lIillIIIl(_lIillIIIl("\186\219\229\5\12\25\42\58\39\75\106\99",43),43)):Connect(relayout))
		end
	end))
end

do
local COLLAPSED_PAGE = UDim2.new(1, 0, 0, 0)
local pageLayoutQueued = false
local pageLayoutSearchMode = false
local function relayoutPage(page)
    local pageWidth = math.max(ContentArea.AbsoluteSize.X, 320)
    local areaHeight = math.max(ContentArea.AbsoluteSize.Y, 260)
    local inset, gap, top = 6, 8, 6
    local header = page:FindFirstChild(_lIillIIIl(_lIillIIIl("\209\241\251\26\25\44\26\68\96",56),56))
    local subBar = page:FindFirstChild(_lIillIIIl(_lIillIIIl("\235\27\22\22\49\64\46\91\122",69),69)) or page:FindFirstChild(_lIillIIIl(_lIillIIIl("\8\41\65\81\75\100\121\103\151\146\146\173\188\170\215\246",82),82))

    if header and header.Visible then
        header.Position = UDim2.fromOffset(inset, top)
        header.Size = UDim2.new(1, -(inset * 2), 0, 24)
        top = top + 24 + gap
    end
    if subBar and subBar.Visible then
        local subBarHeight = tonumber(subBar:GetAttribute(_lIillIIIl(_lIillIIIl("\24\59\97\101\121\134\104\147\165\177\192\218",95),95))) or 30
        subBar.Position = UDim2.fromOffset(inset, top)
        subBar.Size = UDim2.new(1, -(inset * 2), 0, subBarHeight)
        top = top + subBarHeight + gap
    end

    local cards = {}
    for _, child in ipairs(page:GetChildren()) do
        if child:IsA(_lIillIIIl(_lIillIIIl("\44\102\99\125\131",108),108)) and child.Visible and child ~= subBar and (child:FindFirstChild(_lIillIIIl(_lIillIIIl("\73\124\138\143\170",121),121)) or child:FindFirstChildOfClass(_lIillIIIl(_lIillIIIl("\111\113\130\173\197\212\186\221\3\7\27\40",134),134))) then
            table.insert(cards, child)
        end
    end
    table.sort(cards, function(a, b)
        if a.LayoutOrder == b.LayoutOrder then return a.Name < b.Name end
        return a.LayoutOrder < b.LayoutOrder
    end)

    local columns = 1
    if #cards >= 2 and pageWidth >= 560 then columns = 2 end
    if #cards >= 4 and pageWidth >= 760 then columns = 3 end
    columns = math.max(1, math.min(columns, #cards))
    local usableWidth = pageWidth - inset * 2 - gap * math.max(columns - 1, 0)
    local columnWidth = math.floor(usableWidth / columns)
    local heights = {}
    for i = 1, columns do heights[i] = top end

    for _, card in ipairs(cards) do
        card.AnchorPoint = Vector2.zero
        card.Size = UDim2.new(0, columnWidth, 0, 0)
        local targetColumn = 1
        for i = 2, columns do
            if heights[i] < heights[targetColumn] then targetColumn = i end
        end
        card.Position = UDim2.fromOffset(inset + (targetColumn - 1) * (columnWidth + gap), heights[targetColumn])
        local height = math.max(card.AbsoluteSize.Y, 42)
        heights[targetColumn] = heights[targetColumn] + height + gap
    end

    local bottom = top
    for i = 1, columns do bottom = math.max(bottom, heights[i]) end
    local requiredHeight = math.max(pageLayoutSearchMode and 0 or areaHeight, bottom + inset - gap)
    page.Size = UDim2.new(1, 0, 0, requiredHeight)
end
local function refreshPageLayouts()

    ContentArea.ScrollingEnabled = true

    for _, page in pairs(Pages) do
        if page.Visible then
            relayoutPage(page)
        elseif page.Size ~= COLLAPSED_PAGE then
            page.Size = COLLAPSED_PAGE
        end
    end
    pageLayoutQueued = false
end
local function queuePageLayout()
    if pageLayoutQueued then return end
    pageLayoutQueued = true
    task.defer(function()
        task.wait()
        refreshPageLayouts()
    end)
end
local function watchPageChild(child)
    if not child:IsA(_lIillIIIl(_lIillIIIl("\123\183\185\173\206\228\237\249\24",147),147)) then return end
    tc(child:GetPropertyChangedSignal(_lIillIIIl(_lIillIIIl("\164\197\221\225\232\0\7",160),160)):Connect(queuePageLayout))
    tc(child:GetPropertyChangedSignal(_lIillIIIl(_lIillIIIl("\169\216\247\1\12\35\48\47\43\79\110\113",173),173)):Connect(queuePageLayout))
end
for _, page in pairs(Pages) do
    tc(page:GetPropertyChangedSignal(_lIillIIIl(_lIillIIIl("\216\249\17\21\28\52\59",186),186)):Connect(function()
        if page.Visible then queuePageLayout() end
    end))
    for _, child in ipairs(page:GetChildren()) do watchPageChild(child) end
    tc(page.ChildAdded:Connect(function(child)
        watchPageChild(child)
        queuePageLayout()
    end))
end
tc(ContentArea:GetPropertyChangedSignal(_lIillIIIl(_lIillIIIl("\221\12\43\53\64\87\100\109\105\141\172\165",199),199)):Connect(queuePageLayout))
S._RefreshPageLayout = function(searching)
    pageLayoutSearchMode = searching == true
    ContentArea.CanvasPosition = Vector2.zero
    queuePageLayout()
end
queuePageLayout()
end

local function mkSection(parent, title, order)
	local card = Instance.new(_lIillIIIl(_lIillIIIl("\252\54\51\77\83",212),212))
	card.Name = title
	card.Parent = parent
	card.LayoutOrder = order
	card.BackgroundColor3 = T.Card
	card.BorderSizePixel = 0
	card.Size = UDim2.new(1, 0, 0, 0)
	card.AutomaticSize = Enum.AutomaticSize.Y
	Corner(card, M.corner)
	Stroke(card, T.Bd, 1, 0.3)
	Pad(card, M.sectionPadY, M.sectionPadX, M.sectionPadX, M.sectionPadX)

	local layout = Instance.new(_lIillIIIl(_lIillIIIl("\37\39\56\109\133\148\122\157\195\199\219\232",225),225))
	layout.Parent = card; layout.SortOrder = Enum.SortOrder.LayoutOrder; layout.Padding = UDim.new(0, M.rowGap)

	local hdrRow = Instance.new(_lIillIIIl(_lIillIIIl("\48\116\113\139\145",238),238))
	hdrRow.Parent = card; hdrRow.LayoutOrder = 0; hdrRow.BackgroundTransparency = 1
	hdrRow.Size = UDim2.new(1, 0, 0, 24)

	local tick = Instance.new(_lIillIIIl(_lIillIIIl("\84\142\139\165\171",0),0))
	tick.Parent = hdrRow; tick.BackgroundColor3 = T.Accent; tick.BorderSizePixel = 0
	tick.Position = UDim2.new(0, 0, 0.5, -6); tick.Size = UDim2.new(0, 3, 0, 13)
	Corner(tick, 2)
	local hdr = Instance.new(_lIillIIIl(_lIillIIIl("\124\155\188\198\172\207\222\239\4",13),13))
	hdr.Parent = hdrRow; hdr.BackgroundTransparency = 1
	hdr.Position = UDim2.new(0, 13, 0, 0); hdr.Size = UDim2.new(1, -13, 1, 0)
	hdr.Font = FB; hdr.TextSize = 13; hdr.TextColor3 = T.Tx2
	hdr.TextXAlignment = Enum.TextXAlignment.Left; hdr.Text = string.upper(title)

	return card
end

local function mkToggle(parent, label, key, order, callback)
	local knobInset = math.floor((M.trackH - M.knob) / 2)
	local row = Instance.new(_lIillIIIl(_lIillIIIl("\136\194\191\217\223",26),26))
	row.Name = label; row.Parent = parent; row.LayoutOrder = order
	row.Size = UDim2.new(1, 0, 0, M.rowH); row.BackgroundTransparency = 1

	local lbl = Instance.new(_lIillIIIl(_lIillIIIl("\176\207\240\250\224\3\18\35\56",39),39))
	lbl.Parent = row; lbl.BackgroundTransparency = 1
	lbl.Position = UDim2.new(0, 4, 0, 0)

	lbl.Size = UDim2.new(1, -(M.trackW + (MOBILE and 70 or 78)), 1, 0)
	lbl.Font = F; lbl.TextSize = M.rowFont; lbl.TextColor3 = T.Tx2
	lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.TextTruncate = Enum.TextTruncate.AtEnd; lbl.Text = label

	local track = Instance.new(_lIillIIIl(_lIillIIIl("\202\233\10\20\240\49\62\76\85\98",52),52))
	track.Parent = row
	track.AnchorPoint = Vector2.new(1, 0.5)
	track.Position = UDim2.new(1, -4, 0.5, 0)
	track.Size = UDim2.new(0, M.trackW, 0, M.trackH)
	track.BackgroundColor3 = T.TgOff
	track.AutoButtonColor = false
	track.Text = ""
	Corner(track, math.floor(M.trackH / 2))
	local trackStroke = Stroke(track, T.Bd2, 1, 0.5)

	local knob = Instance.new(_lIillIIIl(_lIillIIIl("\214\16\13\39\45",65),65))
	knob.Parent = track
	knob.Size = UDim2.new(0, M.knob, 0, M.knob)
	knob.Position = UDim2.new(0, knobInset, 0.5, -math.floor(M.knob / 2))
	knob.BackgroundColor3 = T.KnobOff
	Corner(knob, math.floor(M.knob / 2))

	local function update(val)
		val = val and true or false
		S[key] = val
		Tween(track, 0.15, { BackgroundColor3 = val and T.TgOn or T.TgOff }):Play()
		Tween(knob, 0.15, {
			Position = val
				and UDim2.new(1, -(M.knob + knobInset), 0.5, -math.floor(M.knob / 2))
				or UDim2.new(0, knobInset, 0.5, -math.floor(M.knob / 2)),
		}, Enum.EasingStyle.Back):Play()
		knob.BackgroundColor3 = val and T.KnobOn or T.KnobOff
		lbl.TextColor3 = val and T.White or T.Tx2
		trackStroke.Transparency = val and 1 or 0.5
		if callback then pcall(callback, val) end
		S._markKeybindHUDDirty()
	end

	local bindId = S._registerBindable(_lIillIIIl(_lIillIIIl("\30\39\45\59\78\85\56",78),78) .. key, label, function()
		update(not S[key])
		SFX.Click()
		if RequestAutoSave then RequestAutoSave() end
	end, function() return S[key] == true end, _lIillIIIl(_lIillIIIl("\56\65\71\85\104\111",91),91))
	S._addBindChip(row, bindId, -(M.trackW + (MOBILE and 14 or 10)))
	S._requestBindFromRightClick(row, bindId)
	S._requestBindFromRightClick(lbl, bindId)
	S._requestBindFromRightClick(track, bindId)

	track.MouseButton1Click:Connect(function()
		update(not S[key]); SFX.Click()
		if RequestAutoSave then RequestAutoSave() end
	end)

	CfgBind[key] = function(v) update(v) end
	if S[key] then update(true) end
	table.insert(UIRegistry, { card = parent, row = row, label = string.lower(label) })
	return row
end

local function mkSlider(parent, label, minVal, maxVal, key, order, callback)
	local card = Instance.new(_lIillIIIl(_lIillIIIl("\36\94\91\117\123",104),104))
	card.Name = label; card.Parent = parent; card.LayoutOrder = order
	card.Size = UDim2.new(1, 0, 0, M.sliderH); card.BackgroundTransparency = 1

	local lbl = Instance.new(_lIillIIIl(_lIillIIIl("\76\107\140\150\124\159\174\191\212",117),117))
	lbl.Parent = card; lbl.BackgroundTransparency = 1
	lbl.Position = UDim2.new(0, 4, 0, 2); lbl.Size = UDim2.new(0.6, 0, 0, 18)
	lbl.Font = F; lbl.TextSize = M.rowFont; lbl.TextColor3 = T.Tx2
	lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.TextTruncate = Enum.TextTruncate.AtEnd; lbl.Text = label

	local pill = Instance.new(_lIillIIIl(_lIillIIIl("\88\146\143\169\175",130),130))
	pill.Parent = card; pill.AnchorPoint = Vector2.new(1, 0)
	pill.Position = UDim2.new(1, -4, 0, 0); pill.Size = UDim2.new(0, MOBILE and 54 or 50, 0, MOBILE and 22 or 20)
	pill.BackgroundColor3 = T.Elev
	Corner(pill, 7); Stroke(pill, T.Bd, 1, 0.5)
	local valLbl = Instance.new(_lIillIIIl(_lIillIIIl("\128\159\192\202\166\225\248",143),143))
	valLbl.ClearTextOnFocus = false
	valLbl.Parent = pill; valLbl.BackgroundTransparency = 1; valLbl.Size = UDim2.new(1, 0, 1, 0)
	valLbl.Font = FM; valLbl.TextSize = MOBILE and 12 or 13; valLbl.TextColor3 = T.White; valLbl.Text = tostring(S[key] or minVal)

	local bar = Instance.new(_lIillIIIl(_lIillIIIl("\140\198\195\221\227",156),156))
	bar.Parent = card
	bar.Position = UDim2.new(0, 4, 0, MOBILE and 34 or 30); bar.Size = UDim2.new(1, -8, 0, M.barH)
	bar.BackgroundColor3 = T.Elev; bar.Active = true
	Corner(bar, math.floor(M.barH / 2))
	local fill = Instance.new(_lIillIIIl(_lIillIIIl("\166\224\221\247\253",169),169))
	fill.Parent = bar
	fill.Size = UDim2.new(math.clamp(((S[key] or minVal) - minVal) / (maxVal - minVal), 0, 1), 0, 1, 0)
	fill.BackgroundColor3 = T.Accent
	Corner(fill, math.floor(M.barH / 2))
	local grab = Instance.new(_lIillIIIl(_lIillIIIl("\192\250\247\17\23",182),182))
	grab.Parent = bar; grab.AnchorPoint = Vector2.new(0.5, 0.5)
	grab.Position = UDim2.new(fill.Size.X.Scale, 0, 0.5, 0); grab.Size = UDim2.new(0, M.grab, 0, M.grab)
	grab.BackgroundColor3 = T.White; grab.ZIndex = 2
	Corner(grab, math.floor(M.grab / 2)); Stroke(grab, T.Bd2, 1, 0.3)

	local function setVal(val)
		val = math.clamp(math.floor(val + 0.5), minVal, maxVal)
		S[key] = val
		local a = (val - minVal) / (maxVal - minVal)
		fill.Size = UDim2.new(a, 0, 1, 0)
		grab.Position = UDim2.new(a, 0, 0.5, 0)
		valLbl.Text = tostring(val)
		if callback then pcall(callback, val) end
	end
	valLbl.FocusLost:Connect(function()
		local num = tonumber(valLbl.Text)
		if num then
			setVal(num)
		else
			valLbl.Text = tostring(S[key] or minVal)
		end
	end)

	local dragging = false
	local function updateFromInput(input)
		local pos = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
		setVal(minVal + (maxVal - minVal) * pos)
		if RequestAutoSave then RequestAutoSave() end
	end

	tc(bar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true

			ContentArea.ScrollingEnabled = false
			updateFromInput(input)
		end
	end))
	tc(UIS.InputChanged:Connect(function(input)
		if dragging and input == dragInput and (input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch) then updateFromInput(input) end
	end))
	tc(UIS.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			if dragging then ContentArea.ScrollingEnabled = true end
			dragging = false
		end
	end))

	CfgBind[key] = setVal
	table.insert(UIRegistry, { card = parent, row = card, label = string.lower(label) })
	return card
end

local function mkButton(parent, label, callback, order)
	local btn = Instance.new(_lIillIIIl(_lIillIIIl("\232\7\40\50\14\79\92\116\125\138",195),195))
	btn.Name = label; btn.Parent = parent; btn.LayoutOrder = order
	btn.Size = UDim2.new(1, 0, 0, M.btnH)
	btn.BackgroundColor3 = T.Elev; btn.AutoButtonColor = false
	btn.Font = FM; btn.TextSize = M.rowFont; btn.TextColor3 = T.White; btn.Text = label
	btn.TextXAlignment = Enum.TextXAlignment.Left
	btn.TextTruncate = Enum.TextTruncate.AtEnd
	Corner(btn, MOBILE and 10 or 8)
	Pad(btn, 0, 0, MOBILE and 14 or 12, MOBILE and 62 or 64)
	local bst = Stroke(btn, T.Bd, 1, 0.4)
	btn.MouseEnter:Connect(function() Tween(btn, 0.12, { BackgroundColor3 = T.Hover }):Play(); Tween(bst, 0.12, { Transparency = 0.1 }):Play() end)
	btn.MouseLeave:Connect(function() Tween(btn, 0.12, { BackgroundColor3 = T.Elev }):Play(); Tween(bst, 0.12, { Transparency = 0.4 }):Play() end)
	local bindId = S._registerBindable(_lIillIIIl(_lIillIIIl("\16\49\62\76\85\98\70",208),208) .. label:gsub(_lIillIIIl(_lIillIIIl("\35\52\9\105\103",221),221), _lIillIIIl(_lIillIIIl("\65",234),234)), label, function()
		pcall(callback)
		SFX.Click()
	end, nil, _lIillIIIl(_lIillIIIl("\104\137\150\164\173\186",247),247))
	S._addBindChip(btn, bindId, MOBILE and -8 or -6)
	S._requestBindFromRightClick(btn, bindId)
	btn.MouseButton1Click:Connect(function() pcall(callback); SFX.Click() end)
	table.insert(UIRegistry, { card = parent, row = btn, label = string.lower(label) })
	return btn
end

local function getGF() return Workspace:FindFirstChild(_lIillIIIl(_lIillIIIl("\103\143\169\175\200\210\213\251\214\13\24\30\45\72",9),9)) end
local function getHRP() local c = LP.Character; return c and c:FindFirstChild(_lIillIIIl(_lIillIIIl("\130\189\195\197\224\239\247\0\252\39\53\72\50\81\112\128",22),22)) end
local function getHum() local c = LP.Character; return c and c:FindFirstChildOfClass(_lIillIIIl(_lIillIIIl("\156\215\221\223\250\9\17\26",35),35)) end
local function objPos(obj)
	if obj:IsA(_lIillIIIl(_lIillIIIl("\176\221\253\253\246\21\52\68",48),48)) then return obj.Position end
	if obj:IsA(_lIillIIIl(_lIillIIIl("\213\5\8\23\44",61),61)) then
		local ok, piv = pcall(function() return obj:GetPivot() end)
		if ok and piv then return piv.Position end
		local p = obj:FindFirstChildWhichIsA(_lIillIIIl(_lIillIIIl("\228\17\49\49\42\73\104\120",74),74), true)
		return p and p.Position
	end
	return nil
end

local MONSTER_NAMES = {
	_lIillIIIl(_lIillIIIl("\29\56\63\82\89\116",87),87), _lIillIIIl(_lIillIIIl("\56\80\91\116\136",100),100), _lIillIIIl(_lIillIIIl("\96\103\122\133\145\155",113),113), _lIillIIIl(_lIillIIIl("\112\138\149\155\167\194",126),126), _lIillIIIl(_lIillIIIl("\148\147\174\178\193\215\231\244\253\23\29",139),139), _lIillIIIl(_lIillIIIl("\161\180\187\209\228\247\255\15\25\33\60",152),152),
	_lIillIIIl(_lIillIIIl("\185\156\164",165),165), _lIillIIIl(_lIillIIIl("\212\239\2\16\25\37\44\57\71\84\109\136",178),178), _lIillIIIl(_lIillIIIl("\238\9\29\36\39\55\82",191),191), _lIillIIIl(_lIillIIIl("\9\21\48\52\74\81\102\119\129\160\161\188",204),204), _lIillIIIl(_lIillIIIl("\37\71\65\80\103\131\146\141\174\177\197\210",217),217), _lIillIIIl(_lIillIIIl("\77\89\117\119\128\142\164\171",230),230),
	_lIillIIIl(_lIillIIIl("\85\110\137\149\159\178\179\212\215\235\248",243),243), _lIillIIIl(_lIillIIIl("\140\152\153\176\179\198\206\230\237\251\8\23\50",5),5), _lIillIIIl(_lIillIIIl("\162\169\190\207\219\237\235\245\13",18),18), _lIillIIIl(_lIillIIIl("\177\190\221\217\229\6\15\32",31),31), _lIillIIIl(_lIillIIIl("\218\230\235\243\9\31\46\45\72",44),44),
	_lIillIIIl(_lIillIIIl("\232\253\16\26\39\58\53\86\95",57),57), _lIillIIIl(_lIillIIIl("\6\23\38\41\55",70),70), _lIillIIIl(_lIillIIIl("\24\49\74\67\94",83),83), _lIillIIIl(_lIillIIIl("\65\65\75\106\105\124\142\153\165\180\206",96),96), _lIillIIIl(_lIillIIIl("\95\87\112\126\132\165\161\182\196\203\230",109),109), _lIillIIIl(_lIillIIIl("\106\113\144\142\163\182\189\201\228",122),122),
	_lIillIIIl(_lIillIIIl("\127\139\170\180\181\214\217\237\250",135),135), _lIillIIIl(_lIillIIIl("\154\179\194\208\211\232",148),148), _lIillIIIl(_lIillIIIl("\194\191\226\223\1\247\22\22",161),161),
}
local function monsterKind(nameLower)
	if nameLower:find(_lIillIIIl(_lIillIIIl("\206\239\235\0\14\21\48",174),174)) then return _lIillIIIl(_lIillIIIl("\232\9\5\26\40\47\74",187),187) end
	if nameLower:find(_lIillIIIl(_lIillIIIl("\3\37\31\46\59\87\102",200),200)) or nameLower:find(_lIillIIIl(_lIillIIIl("\36\53\67\77\93\105\132",213),213)) then return _lIillIIIl(_lIillIIIl("\55\89\83\108\121\149\164",226),226) end
	if nameLower:find(_lIillIIIl(_lIillIIIl("\95\117\135\137\146\160\182\189",239),239)) then return _lIillIIIl(_lIillIIIl("\131\143\161\163\172\186\208\215",1),1) end
	if nameLower:find(_lIillIIIl(_lIillIIIl("\141\153\184\194\195\228\231\251\8",14),14)) then return _lIillIIIl(_lIillIIIl("\167\179\210\220\221\254\1\21\34",27),27) end
	for _, m in ipairs(MONSTER_NAMES) do
		if nameLower:find(m, 1, true) then return _lIillIIIl(_lIillIIIl("\203\219\232\251\10\9\36",40),40) end
	end
	return nil
end

local ITEM_MODELS = {
	DropBattery = true, Flashlight = true, Lantern = true, FlashBeacon = true,
	Glider = true, HealthCrate = true, OxygenTank = true, Medkit = true,
	BeaconGun = true, Blacklight = true, CaptainsCompass = true, Chainsaw = true,
	Decoder = true, DwellerPiece = true, Flamethrower = true, Gummylight = true,
	Gravelight = true, HealthBoost = true, PanicButton = true, RemoteC4 = true,
	SPRINT = true, Scanner = true, SmallLantern = true, Splorglight = true,
	StunBaton = true, ToolGun = true, WindupLight = true, Defib = true,
}
local ITEM_INTERACTIONS = {
	ItemBase = true, Battery = true, HealthCrate = true, OxygenTank = true,
	Glider = true, RegularDrink = true, NeoStykPickup = true,
}
local KEY_INTERACTIONS = {
	KeyCard = true, InnerKeyCard = true, ElevatorKey = true, PasswordPaper = true,
}
local DOOR_INTERACTIONS = {
	DoorBase = true, DoubleDoor = true, DoubleDoorSide = true, ChaseDoor = true,
	ChaseEmptyDoor = true, LargeRoundDoor = true, BigDoor = true, InnerLock = true,
}
local DRAWER_INTERACTIONS = { DrawerBase = true, Briefcase = true }
local HAZARD_INTERACTIONS = {
	Landmine = true, DrawerLandmine = true, Tripwire = true, Turret = true,
	CustomTurret = true, SeaMines = true, LavaPipe = true,
}
local OBJECTIVE_INTERACTIONS = {
	BoardPuzzle = true, BridgeControl = true, Button = true, Lever = true,
	TreadmillPanel = true, Tram = true, TurretControls = true,
}
local OBJECTIVE_LABELS = {
	BoardPuzzle = _lIillIIIl(_lIillIIIl("\200\213\235\231\2\222\14\41\41\72\72\50\79\93\92\139\164\175\187\208",53),53), BridgeControl = _lIillIIIl(_lIillIIIl("\212\242\247\0\17\29\6\55\81\94\114\126\137\148",66),66),
	Button = _lIillIIIl(_lIillIIIl("\251\252\18\27\39\70\73\100\97\74\122\155\168\182\191\204",79),79), Lever = _lIillIIIl(_lIillIIIl("\21\22\44\53\65\96\99\126\123\100\158\165\196\193\220",92),92),
	TreadmillPanel = _lIillIIIl(_lIillIIIl("\52\64\65\75\92\115\125\142\156\126\175\201\214\234\246\1\12",105),105), Tram = _lIillIIIl(_lIillIIIl("\78\90\87\113\82\131\157\170\190\202\213\224",118),118),
	TurretControls = _lIillIIIl(_lIillIIIl("\104\119\130\144\145\174\136\185\211\224\244\0\11\22",131),131),
}
local PromptCache = {}

local PassedDoors = {}

local function getInteractionType(prompt)
	local node = prompt.Parent
	while node and node ~= Workspace do
		local interactionType = node:GetAttribute(_lIillIIIl(_lIillIIIl("\119\170\190\189\216\213\229\4\7\27\40\28\79\84\87",144),144))
		if type(interactionType) == _lIillIIIl(_lIillIIIl("\187\202\214\219\238\245",157),157) and interactionType ~= "" then
			return interactionType, node
		end
		node = node.Parent
	end
	return nil, nil
end
local function classifyPrompt(prompt)
	local parent = prompt.Parent
	local part
	if parent and parent:IsA(_lIillIIIl(_lIillIIIl("\164\209\241\241\234\9\40\56",170),170)) then
		part = parent
	elseif parent and parent:IsA(_lIillIIIl(_lIillIIIl("\189\254\12\7\23\42\61\67\90\120",183),183)) then
		part = parent.Parent
	end
	if not (part and part:IsA(_lIillIIIl(_lIillIIIl("\216\5\37\37\30\61\92\118",196),196))) then
		part = parent and parent:FindFirstAncestorWhichIsA(_lIillIIIl(_lIillIIIl("\242\31\63\63\56\97\128\144",209),209))
	end
	if not part then return nil end
	local model = part:FindFirstAncestorOfClass(_lIillIIIl(_lIillIIIl("\23\71\74\89\120",222),222))
	local mname = model and model.Name or part.Name
	local mnameLower = mname:lower()
	local interactionType, interactionRoot = getInteractionType(prompt)
	local kind
	if mname:match(_lIillIIIl(_lIillIIIl("\66\53\127\138\152\153\176\179\215",235),235)) or interactionType == _lIillIIIl(_lIillIIIl("\75\139\150\164\165\188\191\227\186\231\7\7",248),248) then kind = _lIillIIIl(_lIillIIIl("\133\165\176\190\191\214\217\253",10),10)
	elseif mname == _lIillIIIl(_lIillIIIl("\127\185\188\203\182\244\245\255\15\34\45\72",23),23) or KEY_INTERACTIONS[interactionType] or mnameLower:find(_lIillIIIl(_lIillIIIl("\193\201\235\227\239\14\14",36),36), 1, true) then kind = _lIillIIIl(_lIillIIIl("\219\227\5\253\9\40\40",49),49)
	elseif ITEM_MODELS[mname] or ITEM_INTERACTIONS[interactionType] then kind = _lIillIIIl(_lIillIIIl("\243\12\11\33",62),62)
	elseif DOOR_INTERACTIONS[interactionType] or (mnameLower:find(_lIillIIIl(_lIillIIIl("\8\33\47\64",75),75), 1, true) and part.Name == _lIillIIIl(_lIillIIIl("\16\59\73\92",88),88)) then kind = _lIillIIIl(_lIillIIIl("\60\85\99\116",101),101)
	elseif mname == _lIillIIIl(_lIillIIIl("\62\111\113\135\143\170",114),114) then
		if model and (model:GetAttribute(_lIillIIIl(_lIillIIIl("\85\136\156\155\182\179\195\226\229\249\6\250\45\50\53",127),127)) == _lIillIIIl(_lIillIIIl("\115\163\176\195\210\209\236\212\5\7\29\37\64",140),140) or model:FindFirstChild(_lIillIIIl(_lIillIIIl("\168\183\195\210\228\239\251\10\36",153),153))) then
			kind = _lIillIIIl(_lIillIIIl("\208\215\223\232\254\15\17\39\47\74",166),166)
		else
			kind = _lIillIIIl(_lIillIIIl("\224\241\243\9\17\44",179),179)
		end
	elseif DRAWER_INTERACTIONS[interactionType] or mnameLower:find(_lIillIIIl(_lIillIIIl("\242\14\11\47\43\70",192),192), 1, true) or mnameLower:find(_lIillIIIl(_lIillIIIl("\11\23\38\59\78\83\122",205),205), 1, true) then kind = _lIillIIIl(_lIillIIIl("\38\66\63\99\105\132",218),218)
	elseif HAZARD_INTERACTIONS[interactionType] or mnameLower:find(_lIillIIIl(_lIillIIIl("\80\92\107\128\149\149\172\173",231),231), 1, true) or mnameLower:find(_lIillIIIl(_lIillIIIl("\116\131\142\156\157\186",244),244), 1, true) or mnameLower:find(_lIillIIIl(_lIillIIIl("\135\145\164\169",6),6), 1, true) then kind = _lIillIIIl(_lIillIIIl("\156\163\202\191\222\222",19),19)
	elseif interactionType == _lIillIIIl(_lIillIIIl("\160\193\208\225\242\0\228\17\50\64\63\90\95\105\133",32),32) then kind = _lIillIIIl(_lIillIIIl("\218\219\234\251\12\26",45),45)
	elseif interactionType == _lIillIIIl(_lIillIIIl("\216\241\10\34\31",58),58) then kind = _lIillIIIl(_lIillIIIl("\18\11\36\60\57",71),71)
	elseif interactionType == _lIillIIIl(_lIillIIIl("\8\41\66\65\87\110\93\145\153\168\167\189",84),84) then kind = _lIillIIIl(_lIillIIIl("\66\67\92\91\113\136",97),97)
	elseif OBJECTIVE_INTERACTIONS[interactionType] then kind = _lIillIIIl(_lIillIIIl("\89\90\112\121\133\164\167\194\191",110),110)
	else kind = _lIillIIIl(_lIillIIIl("\115\134\136\147\174",123),123) end
	return {
		prompt = prompt, part = part, model = model or part, kind = kind, name = mname,
		interactionType = interactionType, interactionRoot = interactionRoot,
	}
end

local DEAD_END_DOOR_NAMES = {
	NoEntry = true, BentDoor = true, DeadEndDoor = true, BrokenDoor = true,
}
local function isDeadEndDoor(model)
	if not model then return false end
	return DEAD_END_DOOR_NAMES[model.Name] == true
		or model:GetAttribute(_lIillIIIl(_lIillIIIl("\112\155\169\181\170\221\226\229",136),136)) == _lIillIIIl(_lIillIIIl("\124\171\181\198\181\236\240\13",149),149)
		or model:GetAttribute(_lIillIIIl(_lIillIIIl("\150\197\207\224\207\6\10",162),162)) == true
end

local function textMentionsKeycard(value)
	if type(value) ~= _lIillIIIl(_lIillIIIl("\223\238\250\255\18\25",175),175) then return false end
	local text = value:lower()
	return text:find(_lIillIIIl(_lIillIIIl("\241\249\27\19\31\62\62",188),188), 1, true) ~= nil
		or text:find(_lIillIIIl(_lIillIIIl("\11\19\53\234\59\71\102\112",201),201), 1, true) ~= nil
		or text:find(_lIillIIIl(_lIillIIIl("\29\41\72\72\18\124\125\135\152\167\194",214),214), 1, true) ~= nil
end

local function isKeycardDoor(e)
	if not (e and e.kind == _lIillIIIl(_lIillIIIl("\56\81\95\122",227),227) and e.model) then return false end
	local model = e.model
	for _, attrName in ipairs({ _lIillIIIl(_lIillIIIl("\64\107\133\151\153\176\177\205\179\219\253\245\1\32\32",240),240), _lIillIIIl(_lIillIIIl("\93\133\167\159\171\202\202\198\231\1\19\21\44\45\58",2),2), _lIillIIIl(_lIillIIIl("\119\159\193\153\197\228\228\224\1\27\45\47\70\71\84",15),15), _lIillIIIl(_lIillIIIl("\137\181\212\212\208\241\11\29\31\54\55\68",28),28), _lIillIIIl(_lIillIIIl("\178\211\237\255\1\24\25\53\19\63\94\94",41),41), _lIillIIIl(_lIillIIIl("\187\235\249\9\37\51\26\65\96\93\114",54),54), _lIillIIIl(_lIillIIIl("\230\7\33\51\53\76\77\90\69\117\131\147\175\189",67),67), _lIillIIIl(_lIillIIIl("\250\43\45\67\58\109\114\117",80),80) }) do
		local value = model:GetAttribute(attrName)
		if value == true or (type(value) == _lIillIIIl(_lIillIIIl("\54\75\81\84\101\128",93),93) and value > 0) or textMentionsKeycard(value) then return true end
	end
	local prompt = e.prompt
	return textMentionsKeycard(model.Name)
		or (prompt and (textMentionsKeycard(prompt.ActionText) or textMentionsKeycard(prompt.ObjectText)))
end
task.spawn(function()
	while not S.Destroyed do
		local new = {}
		local gf = getGF()
		if gf then
			pcall(function()
				for _, d in ipairs(gf:GetDescendants()) do
					if d:IsA(_lIillIIIl(_lIillIIIl("\50\98\109\132\131\149\159\184\203\176\224\235\247\8\26",106),106)) then
						local e = classifyPrompt(d)
						if e then new[#new + 1] = e end
					end
				end
			end)
		end
		PromptCache = new
		task.wait(2)
	end
end)

local ITEM_LABEL = {
	DropBattery = _lIillIIIl(_lIillIIIl("\62\107\140\154\153\180\201",119),119), Flashlight = _lIillIIIl(_lIillIIIl("\92\144\147\179\182\200\211\223\238\8",132),132), Lantern = _lIillIIIl(_lIillIIIl("\124\159\186\206\205\232\242",145),145),
	FlashBeacon = _lIillIIIl(_lIillIIIl("\144\196\199\231\234\176\224\17\27\43\69\82",158),158), Glider = _lIillIIIl(_lIillIIIl("\171\222\233\242\1\28",171),171), HealthCrate = _lIillIIIl(_lIillIIIl("\198\241\251\20\42\44\242\35\96\103\136\135",184),184),
	OxygenTank = _lIillIIIl(_lIillIIIl("\231\30\45\41\53\76\12\88\115\142\153",197),197), Medkit = _lIillIIIl(_lIillIIIl("\255\37\50\71\83\118",210),210), SPRINT = _lIillIIIl(_lIillIIIl("\31\42\58\45\87\106\126",223),223),
	HealthBoost = _lIillIIIl(_lIillIIIl("\46\89\109\134\156\158\100\148\207\221\239\254",236),236), SmallLantern = _lIillIIIl(_lIillIIIl("\93\133\135\160\174\112\170\205\232\252\251\22\32",249),249), WindupLight = _lIillIIIl(_lIillIIIl("\123\155\174\178\209\218\152\210\253\9\24\50",11),11),
}
local function tagTitleFor(e)
	if e.kind == _lIillIIIl(_lIillIIIl("\161\193\204\218\219\242\245\25",24),24) then
		local amt = e.name:match(_lIillIIIl(_lIillIIIl("\182\169\233\244\2\3\26\29\65\254\9\86\43\55",37),37))
		return amt and (amt .. _lIillIIIl(_lIillIIIl("\146\203\0\11\24\29\56",50),50)) or _lIillIIIl(_lIillIIIl("\215\12\23\36\41\68",63),63)
	elseif e.kind == _lIillIIIl(_lIillIIIl("\15\40\39\61",76),76) then return ITEM_LABEL[e.name] or e.name
	elseif e.kind == _lIillIIIl(_lIillIIIl("\43\51\85\77\89\120\120",89),89) then
		if e.name == _lIillIIIl(_lIillIIIl("\29\87\90\105\84\146\147\157\173\192\203\230",102),102) then return _lIillIIIl(_lIillIIIl("\55\81\84\99\76\124\154\155\165\181\200\211\238\202\231\245\244\50\57\75\97\68\135\144",115),115) end
		if e.interactionType == _lIillIIIl(_lIillIIIl("\83\136\143\174\167\200\209\226\201\241\19",128),128) then return _lIillIIIl(_lIillIIIl("\109\130\137\168\161\194\203\220\184\241\249\27\240\13\27\36\98\105\113\135\106\173\182",141),141) end
		if e.interactionType == _lIillIIIl(_lIillIIIl("\146\177\209\223\241\247\8\8\2\33\62\65\92",154),154) then return _lIillIIIl(_lIillIIIl("\157\173\187\203\231\245\208\1\27\30\45\32\61\75\74\136\143\151\173\144\211\220",167),167) end
		return _lIillIIIl(_lIillIIIl("\193\201\235\227\239\14\14\248\21\35\44\106\113\121\143\114\181\190",180),180)
	elseif e.kind == _lIillIIIl(_lIillIIIl("\244\13\27\44",193),193) then
		local m = e.model
		if m:GetAttribute(_lIillIIIl(_lIillIIIl("\250\42\53\59\84\85\123\137\104\161\175\192",206),206)) then return _lIillIIIl(_lIillIIIl("\18\23\56\66\38\102\113\127\139\108\152\166",219),219) end
		if isKeycardDoor(e) then return _lIillIIIl(_lIillIIIl("\41\49\93\85\97\128\128\106\153\169\183\199\227\241\204\233\247\246\48\65\67\89\97\110",232),232) end
		if m:GetAttribute(_lIillIIIl(_lIillIIIl("\78\127\129\151\159\172",245),245)) then
			local code = LP:GetAttribute(_lIillIIIl(_lIillIIIl("\95\153\156\171",7),7))
			return code and (_lIillIIIl(_lIillIIIl("\129\137\171\176\175\192\170\199\213\212",20),20) .. tostring(code)) or _lIillIIIl(_lIillIIIl("\155\163\197\202\201\218\196\225\239\238\40\57\59\81\89\102",33),33)
		end
		return _lIillIIIl(_lIillIIIl("\174\231\245\6",46),46)
	elseif e.kind == _lIillIIIl(_lIillIIIl("\240\1\3\25\33\60",59),59) then return _lIillIIIl(_lIillIIIl("\234\27\29\51\59\86\18\40\129\125\144\157\111",72),72)
	elseif e.kind == _lIillIIIl(_lIillIIIl("\46\53\61\70\92\109\111\133\141\168",85),85) then return _lIillIIIl(_lIillIIIl("\40\47\55\64\42\100\117\119\141\149\176\140\167\168\218\243\210\14\29\48\10\74\89\98\113",98),98)
	elseif e.kind == _lIillIIIl(_lIillIIIl("\80\108\105\141\137\164",111),111) then return _lIillIIIl(_lIillIIIl("\74\134\131\167\163\190",124),124)
	elseif e.kind == _lIillIIIl(_lIillIIIl("\136\143\182\171\202\202",137),137) then
		if e.interactionType == _lIillIIIl(_lIillIIIl("\134\169\196\200\223\233\252\1",150),150) or e.interactionType == _lIillIIIl(_lIillIIIl("\152\212\209\245\241\12\244\23\50\54\77\87\116\121",163),163) then return _lIillIIIl(_lIillIIIl("\186\189\216\220\243\253\16\21\254\27\51\50\100\119\143\139\170\179",176),176) end
		if e.interactionType == _lIillIIIl(_lIillIIIl("\220\8\13\34\55\55\78\79",189),189) then return _lIillIIIl(_lIillIIIl("\246\2\7\28\49\49\82\83\60\89\103\102\152\163\190\197\209\236",202),202) end
		if e.interactionType == _lIillIIIl(_lIillIIIl("\16\63\74\88\89\128",215),215) or e.interactionType == _lIillIIIl(_lIillIIIl("\25\89\101\126\135\147\136\183\194\208\209\238",228),228) then return _lIillIIIl(_lIillIIIl("\68\93\104\118\119\148\110\139\153\152\202\213\240\247\3\30",241),241) end
		if e.interactionType == _lIillIIIl(_lIillIIIl("\103\135\145\139\181\200\205\233",3),3) then return _lIillIIIl(_lIillIIIl("\129\129\139\120\179\189\208\213\190\219\233\232\26\37\64\71\83\110",16),16) end
		return e.name
	elseif e.kind == _lIillIIIl(_lIillIIIl("\186\187\202\219\236\250",29),29) then return _lIillIIIl(_lIillIIIl("\164\177\210\224\223\250\15\228\36\37\52\69\86\100",42),42)
	elseif e.kind == _lIillIIIl(_lIillIIIl("\242\235\4\28\25",55),55) then return _lIillIIIl(_lIillIIIl("\236\229\254\22\19\252\25\39\38\102\113\132\127\160\159",68),68)
	elseif e.kind == _lIillIIIl(_lIillIIIl("\34\35\60\59\81\104",81),81) then
		local fixed = e.interactionRoot and e.interactionRoot:FindFirstChild(_lIillIIIl(_lIillIIIl("\16\65\94\89\102",94),94))
		local progress = fixed and tonumber(fixed.Value)
		return progress and (_lIillIIIl(_lIillIIIl("\43\55\78\83\110\107\140\149\166\130\159\173\172",107),107) .. math.floor(progress + 0.5) .. _lIillIIIl(_lIillIIIl("\35",120),120)) or _lIillIIIl(_lIillIIIl("\95\107\130\135\162\159\192\201\218\182\211\225\224\32\33\58\67\89\112",133),133)
	elseif e.kind == _lIillIIIl(_lIillIIIl("\161\162\184\193\205\236\239\10\7",146),146) then return OBJECTIVE_LABELS[e.interactionType] or _lIillIIIl(_lIillIIIl("\155\156\178\187\199\230\233\4\1",159),159)
	end
	return e.name
end

local function isRepairComplete(e)
	if not (e and e.kind == _lIillIIIl(_lIillIIIl("\216\217\242\241\7\30",172),172) and e.interactionRoot) then return false end
	local fixed = e.interactionRoot:FindFirstChild(_lIillIIIl(_lIillIIIl("\198\247\20\15\28",185),185))
	return fixed ~= nil and tonumber(fixed.Value) ~= nil and fixed.Value >= 100
end

local hideInLockerNow, attemptRespawn
local SaveConfigFile, LoadConfigFile
local refreshVisionEffects

local suppressedPostEffects = {}

local TeammateChamReg = {}
local function getVisionGrade()
	local grade = Lighting:FindFirstChild(_lIillIIIl(_lIillIIIl("\234\26\27\55\69\85\96\107\92\151\146\148\181\205\209\229\242\217\18\15\32\47",198),198))
	if not grade then
		grade = Instance.new(_lIillIIIl(_lIillIIIl("\247\49\60\77\94\71\129\146\160\161\173\204\207\227\240\213\4\18\31\43\74",211),211))
		grade.Name = _lIillIIIl(_lIillIIIl("\30\78\79\117\131\147\158\159\144\203\198\200\233\1\5\25\38\13\70\67\84\99",224),224)
		grade.Enabled = false
		grade.Parent = Lighting
	end
	return grade
end

local function restoreSuppressedPostEffects()
	for effect, enabled in pairs(suppressedPostEffects) do
		pcall(function() if effect.Parent then effect.Enabled = enabled end end)
		suppressedPostEffects[effect] = nil
	end
end

refreshVisionEffects = function()
	local grade = getVisionGrade()
	local useGrade = S.LowLightVision or (S.VisualContrast or 0) > 0 or (S.VisualSaturation or 100) ~= 100
	grade.Enabled = useGrade
	if useGrade then
		grade.Brightness = S.LowLightVision and 0.13 or 0
		grade.Contrast = math.clamp((S.VisualContrast or 0) / 220, 0, 0.45)
		grade.Saturation = math.clamp(((S.VisualSaturation or 100) - 100) / 100, -1, 1)

		grade.TintColor = S.LowLightVision and Color3.fromRGB(225, 245, 238) or Color3.new(1, 1, 1)
	end

	if S.CleanScreenEffects then
		local roots = { Lighting, cam() }
		for _, root in ipairs(roots) do
			if root then
				for _, effect in ipairs(root:GetChildren()) do
					local removable = effect:IsA(_lIillIIIl(_lIillIIIl("\42\108\131\142\111\158\172\185\197\228",237),237)) or effect:IsA(_lIillIIIl(_lIillIIIl("\78\134\151\165\177\151\198\212\225\237\12",250),250)) or effect:IsA(_lIillIIIl(_lIillIIIl("\105\163\174\191\208\175\233\250\8\9\21\52\55\75\88\61\108\122\135\147\178",12),12))
					if removable and effect ~= grade then
						if suppressedPostEffects[effect] == nil then suppressedPostEffects[effect] = effect.Enabled end
						effect.Enabled = false
					end
				end
			end
		end
	else
		restoreSuppressedPostEffects()
	end
end

S._cleanupVisuals = function()
	restoreSuppressedPostEffects()
	pcall(function()
		local grade = Lighting:FindFirstChild(_lIillIIIl(_lIillIIIl("\144\192\193\221\235\251\6\7\248\51\46\48\81\105\109\129\142\117\174\171\188\203",25),25))
		if grade then grade:Destroy() end
	end)
	for _, plr in ipairs(Players:GetPlayers()) do
		local ch = plr.Character
		local hl = ch and ch:FindFirstChild(_lIillIIIl(_lIillIIIl("\170\218\219\247\5\21\32\33\26\68\71\109\103\130\97\148\155\181",38),38))
		if hl then pcall(function() hl:Destroy() end) end
	end
	for plr, entry in pairs(TeammateChamReg) do
		pcall(function() if entry.model then entry.model:Destroy() end end)
		TeammateChamReg[plr] = nil
	end
end

local secEntities = mkSection(Pages.Visuals, _lIillIIIl(_lIillIIIl("\185\240\4\7\32\51\232\27\55\66",51),51), 1)
mkToggle(secEntities, _lIillIIIl(_lIillIIIl("\219\11\24\43\58\57\84\16\67\95\106\72\94\133\192\199\218\225\252\199\232\32\43\68\88\27\50\64\78\87",64),64), _lIillIIIl(_lIillIIIl("\237\36\56\59\84\103\65\93\104",77),77), 1)
mkToggle(secEntities, _lIillIIIl(_lIillIIIl("\25\49\74\88\26\76\141\137\158\172\179\206\138\189\217\228",90),90), _lIillIIIl(_lIillIIIl("\51\75\100\114\88\153\149\170\184\191\218\187\215\226",103),103), 2)
mkToggle(secEntities, _lIillIIIl(_lIillIIIl("\59\125\119\134\147\175\190\185\218\221\241\254\190\219\218\20\69\83\93\119\121\148\84\135\163\174",116),116), _lIillIIIl(_lIillIIIl("\85\151\145\160\173\201\216\183\211\222",129),129), 3)
mkToggle(secEntities, _lIillIIIl(_lIillIIIl("\125\169\187\189\198\212\234\241\186\237\9\20",142),142), _lIillIIIl(_lIillIIIl("\151\195\213\215\224\238\4\11\249\21\32",155),155), 4)
mkToggle(secEntities, _lIillIIIl(_lIillIIIl("\161\205\236\246\247\24\27\47\60\252\47\85\96\62\84\173\188\183\214\215\228\253\19\24\216\43\66\86\89\114\133\67",168),168), _lIillIIIl(_lIillIIIl("\187\231\6\16\17\50\53\73\86\69\97\108",181),181), 5)
mkToggle(secEntities, _lIillIIIl(_lIillIIIl("\218\1\40\29\60\60\6\57\95\106\72\94\152\196\201\222\243\243\10\11\227\22\69\80\94\95\124\63",194),194), _lIillIIIl(_lIillIIIl("\244\27\66\55\86\86\79\107\118",207),207), 6)

local secDoors = mkSection(Pages.Visuals, _lIillIIIl(_lIillIIIl("\10\67\81\98\123\54\74\82\143\176\198\207\219\250\253\24\21\49\236\31\59\70",220),220), 2)
mkToggle(secDoors, _lIillIIIl(_lIillIIIl("\36\93\117\134\66\117\145\156\122\144\228\233\10\20\206\235\234\57\73\87\103\131\145\76\105\104\194\211\213\235\243\0\211",233),233), _lIillIIIl(_lIillIIIl("\72\129\143\160\129\157\168",246),246), 1)
mkToggle(secDoors, _lIillIIIl(_lIillIIIl("\106\155\157\179\187\214\146\197\225\236\202\224\44\64\67\87\113\44\144\151\159\168\114\204\221\223\245\253\24\39\226\66\67\80\45",8),8), _lIillIIIl(_lIillIIIl("\132\181\183\205\213\240\209\237\248",21),21), 2)
mkToggle(secDoors, _lIillIIIl(_lIillIIIl("\150\210\207\243\239\10\198\227\226\19\63\78\99\118\123\152\82\133\161\172",34),34), _lIillIIIl(_lIillIIIl("\176\236\233\13\9\36\5\33\44",47),47), 3)
mkToggle(secDoors, _lIillIIIl(_lIillIIIl("\213\246\12\21\33\64\67\94\91\36\87\115\126\92\114\191\203\226\231\2\255\32\41\58\246\19\18\128\121\146\170\167\112\141\140\221\247\4\24\36\47\58\79\19",60),60), _lIillIIIl(_lIillIIIl("\239\16\38\47\59\90\93\120\117\99\127\138",73),73), 4)

local secItems = mkSection(Pages.Visuals, _lIillIIIl(_lIillIIIl("\6\55\69\88\18\69\97\108",86),86), 3)
mkToggle(secItems, _lIillIIIl(_lIillIIIl("\29\86\85\107\44\95\123\134\100\122\162\207\240\254\253\24\45\241\28\71\83\108\134\79\113\174\171\204\203\157",99),99), _lIillIIIl(_lIillIIIl("\55\112\111\133\107\135\146",112),112), 1)
mkToggle(secItems, _lIillIIIl(_lIillIIIl("\83\136\147\160\165\192\124\175\203\214\180\202\243\51\62\76\77\110\113\149\83",125),125), _lIillIIIl(_lIillIIIl("\109\162\173\186\191\218\187\215\226",138),138), 2)
mkToggle(secItems, _lIillIIIl(_lIillIIIl("\140\188\193\213\230\235\4\23\204\5\45\79\71\83\124\124\70\99\98\147\205\208\223\168\216\22\23\33\49\68\79\106\38\89\117\128",151),151), _lIillIIIl(_lIillIIIl("\161\201\235\227\239\14\14\253\25\36",164),164), 3)

local secPlayers = mkSection(Pages.Visuals, _lIillIIIl(_lIillIIIl("\192\234\237\19\13\40\228\23\51\62",177),177), 4)
	mkToggle(secPlayers, _lIillIIIl(_lIillIIIl("\216\249\19\25\226\36\63\83\119",190),190), _lIillIIIl(_lIillIIIl("\242\19\45\51\33\61\82",203),203), 1)
	mkToggle(secPlayers, _lIillIIIl(_lIillIIIl("\0\59\82\8\69\97\108",216),216), _lIillIIIl(_lIillIIIl("\26\85\108\81\109\120",229),229), 2)
	mkToggle(secPlayers, _lIillIIIl(_lIillIIIl("\58\111\121\146\168\170",242),242), _lIillIIIl(_lIillIIIl("\94\137\147\172\194\196\175\203\214",4),4), 3)
	mkToggle(secPlayers, _lIillIIIl(_lIillIIIl("\132\176\173\189\205\232\247",17),17), _lIillIIIl(_lIillIIIl("\158\202\199\215\231\2\227\255\10",30),30), 4)
	mkToggle(secPlayers, _lIillIIIl(_lIillIIIl("\184\215\225\251\9\11\44\43\244\37\88\95\121\141",43),43), _lIillIIIl(_lIillIIIl("\206\248\251\33\27\54\21\72\79\105\125",56),56), 5)

local secEnv = mkSection(Pages.Visuals, _lIillIIIl(_lIillIIIl("\221\20\42\43\66\77\90\103\109\132\152\82\102\110\168\211\223\238\8\11\30\37",69),69), 5)

	mkToggle(secEnv, _lIillIIIl(_lIillIIIl("\248\53\58\72\76\106\111\123\138\164",82),82), _lIillIIIl(_lIillIIIl("\18\79\84\98\70\132\137\149\164\190",95),95), 1)
	mkToggle(secEnv, _lIillIIIl(_lIillIIIl("\52\99\34\86\141\147",108),108), _lIillIIIl(_lIillIIIl("\78\125\98\153\159",121),121), 2)
	mkToggle(secEnv, _lIillIIIl(_lIillIIIl("\102\151\173\113\158\201\213\228\254\184\252\29\53\57\77\90",134),134), _lIillIIIl(_lIillIIIl("\128\177\199\170\213\225\240\10\250\27\51\55\75\88",147),147), 3, refreshVisionEffects)
	mkToggle(secEnv, _lIillIIIl(_lIillIIIl("\145\200\207\217\244\180\245\19\48\49\63\86\32\83\130\144\157\169\200\213\144\166\238\6\29\40\228\1\0\84\104\107\139\142\93",160),160), _lIillIIIl(_lIillIIIl("\171\226\233\243\14\1\31\60\61\75\98\81\128\142\155\167\198\211",173),173), 4, refreshVisionEffects)
	mkSlider(secEnv, _lIillIIIl(_lIillIIIl("\200\5\10\24\28\58\63\75\90\126\56\104\166\171\183\198\224\232\237\9\23",186),186), 1, 10, _lIillIIIl(_lIillIIIl("\222\28\33\45\60\86\94\109\137\151",199),199), 5)
	mkSlider(secEnv, _lIillIIIl(_lIillIIIl("\13\51\68\76\82\38\87\145\158\178\190\187\219\234",212),212), 0, 100, _lIillIIIl(_lIillIIIl("\38\71\95\121\115\140\113\171\184\204\216\213\245\4",225),225), 6, refreshVisionEffects)
	mkSlider(secEnv, _lIillIIIl(_lIillIIIl("\65\113\130\138\144\90\155\183\216\231\242\239\16\19\39\52",238),238), 0, 200, _lIillIIIl(_lIillIIIl("\100\133\157\173\167\192\181\209\242\1\12\9\42\45\65\78",0),0), 7, refreshVisionEffects)
	mkToggle(secEnv, _lIillIIIl(_lIillIIIl("\107\171\183\198\207\219\156\208\231\252",13),13), _lIillIIIl(_lIillIIIl("\133\177\203\178\201\222\219\18\19\34\58\65\78",26),26), 8, function(v) if not v and cam() then pcall(function() cam().FieldOfView = 70 end) end end)

mkSlider(secEnv, _lIillIIIl(_lIillIIIl("\162\185\206",39),39), 55, 85, _lIillIIIl(_lIillIIIl("\185\229\255\230\253\18",52),52), 9)

local secVisualHUD = mkSection(Pages.Visuals, _lIillIIIl(_lIillIIIl("\230\7\31\47\41\66\4\58\85\82\60\80\88\152\181\208\215\227",65),65), 6)
	mkToggle(secVisualHUD, _lIillIIIl(_lIillIIIl("\249\30\44\1\53\83\112\113\127\150\86\152\186\210\211\221\254\184\248\21\38\49\80",78),78), _lIillIIIl(_lIillIIIl("\24\58\82\83\93\126\106\135\152\163\194",91),91), 1)
	mkToggle(secVisualHUD, _lIillIIIl(_lIillIIIl("\49\96\91\124\139\151\82\136\163\160\138\160\248\3\17\29\222\251\250\87\120\135\131\143\166\102\131\130\216\227\237\6\28\30\237",104),104), _lIillIIIl(_lIillIIIl("\75\122\117\150\165\177\148\175\172",117),117), 2)

	if not MOBILE then mkToggle(secVisualHUD, _lIillIIIl(_lIillIIIl("\93\133\167\158\179\198\202\148\202\229\226\204\226\41\57\88\91\128\125\70\154\167\177\210\225\236\237\9\205",130),130), _lIillIIIl(_lIillIIIl("\119\159\193\184\205\224\228\214\241\238",143),143), 3) end
	mkToggle(secVisualHUD, _lIillIIIl(_lIillIIIl("\138\205\208\209\235\245\253\200\255\55\62\65\92\106\52\74\127\112\108\137\136\230\237\0\7\206\235\234\62\86\103\34\63\62\160\163\181\187\141",156),156), _lIillIIIl(_lIillIIIl("\164\231\234\235\5\15\23\11\67\74\77\114\118",169),169), 4)
	mkToggle(secVisualHUD, _lIillIIIl(_lIillIIIl("\200\237\14\24\210\4\61\75\92\34\103\127\165\170\183\191\210\230",182),182), _lIillIIIl(_lIillIIIl("\226\7\40\50\16\73\87\114\98\142\139\155\171\198",195),195), 5)
	mkSlider(secVisualHUD, _lIillIIIl(_lIillIIIl("\243\15\26\248\51\85\132\58\108\159\183\198\193\220\223\239",208),208), 250, 2500, _lIillIIIl(_lIillIIIl("\13\41\52\63\107\144\106\157\181\196",221),221), 5)

local secDef = mkSection(Pages.Combat, _lIillIIIl(_lIillIIIl("\35\92\109\136\152\165\96\116\124\174\221\236\249\16\35\35",234),234), 1)
mkToggle(secDef, _lIillIIIl(_lIillIIIl("\75\130\150\153\178\197\122\191\215\246\0\9\28\35\234\26\71\98\112\117\144",247),247), _lIillIIIl(_lIillIIIl("\101\156\176\179\204\223\203\227\2\12\21\40\47",9),9), 1)
mkToggle(secDef, _lIillIIIl(_lIillIIIl("\123\189\186\205\225\160\225\5\28\29\52\244\57\81\112\122\131\150\157",22),22), _lIillIIIl(_lIillIIIl("\171\195\226\236\245\8\15\9\51\71\78\82",35),35), 2)
mkToggle(secDef, _lIillIIIl(_lIillIIIl("\176\235\253\11\198\249\48\51\77\97\104\124\123\150\82\129\186\193\220\236\249\180\202\244\45\70\63\90\47\82\139\153\165\168\198\203\222\229\241\12\209",48),48), _lIillIIIl(_lIillIIIl("\202\5\23\37\1\58\65\92\108\121",61),61), 3)
mkToggle(secDef, _lIillIIIl(_lIillIIIl("\227\37\50\59\250\48\95\104\119\64\151\170\106\164\213\215\237\245\16",74),74), _lIillIIIl(_lIillIIIl("\253\63\76\85\60\107\116\131\117\168\148\197\199\221\229\0",87),87), 4)
mkButton(secDef, _lIillIIIl(_lIillIIIl("\30\77\86\101\46\133\152\88\146\195\197\219\227\254\186\246\5\27",100),100), function() hideInLockerNow(true) end, 5)

local secCounters = mkSection(Pages.Combat, _lIillIIIl(_lIillIIIl("\61\109\122\141\156\155\182\114\163\221\241\248\12\11\38\53",113),113), 2)
mkToggle(secCounters, _lIillIIIl(_lIillIIIl("\75\134\154\157\111\149\215\209\224\237\9\24\19\52\55\75\88\34\56\106\155\169\179\118\165\233\225\7\197",126),126), _lIillIIIl(_lIillIIIl("\101\160\180\183\161\227\221\236\249\21\36",139),139), 1)
mkToggle(secCounters, _lIillIIIl(_lIillIIIl("\127\193\206\215\150\200\1\26\19\46\234\43\90\89\109\134\156\158\100\122\195\224\235\255\251\14\212\50\57\76\83\35",152),152), _lIillIIIl(_lIillIIIl("\153\219\232\241\212\13\38\31\58\41\88\87\107\132\154\156",165),165), 2)
mkToggle(secCounters, _lIillIIIl(_lIillIIIl("\179\245\2\11\202\11\46\53\77\85\40\101\138\152\96\158\189\220\217\249\253\22\21\49",178),178), _lIillIIIl(_lIillIIIl("\205\15\28\37\23\58\65\89\107\100\131\162\159\191\195\220\219",191),191), 3)
mkToggle(secCounters, _lIillIIIl(_lIillIIIl("\248\25\47\63\84\81\36\84\140\151\176\196\120\176\233\239\0\17\15\27\58\59",204),204), _lIillIIIl(_lIillIIIl("\18\51\73\89\120\117\104\161\167\184\201\199\211\242\243\15",217),217), 4)

local secMovement = mkSection(Pages.Motion, _lIillIIIl(_lIillIIIl("\45\88\101\115\128\74\94\102\154\206\217\229\244\14",230),230), 1)
mkToggle(secMovement, _lIillIIIl(_lIillIIIl("\55\129\141\156\165\177\114\183\207\232\245\235\22\25\39\52",243),243), _lIillIIIl(_lIillIIIl("\107\150\153\167\180\163\218\219\234\2\9\22",5),5), 1, function() refreshGameSpeed() end)
mkSlider(secMovement, _lIillIIIl(_lIillIIIl("\137\161\186\199\189\232\235\249\6",18),18), 8, 120, _lIillIIIl(_lIillIIIl("\143\207\219\234\243\255\247\15\40\53\43\86\89\103\116",31),31), 2, function() refreshGameSpeed() end)
mkSlider(secMovement, _lIillIIIl(_lIillIIIl("\169\230\241\5\1\20\218\27\70\73\87\100",44),44), 4, 60, _lIillIIIl(_lIillIIIl("\195\0\11\31\27\46\39\82\85\99\112",57),57), 3, function(v)
	S._tunedFields = S._tunedFields or {}; S._tunedFields.CrouchSpeed = true
	local m = getMain(); if m and type(m.CameraModule) == _lIillIIIl(_lIillIIIl("\14\9\24\48\55",70),70) then setGameField(m.CameraModule, _lIillIIIl(_lIillIIIl("\247\52\63\83\79\98\95\119\144\157\147\190\193\207\220",83),83), v) end
end)
mkSlider(secMovement, _lIillIIIl(_lIillIIIl("\33\76\92\97\116\136\66\125\173\176\195\206\223\233\4",96),96), 0, 150, _lIillIIIl(_lIillIIIl("\59\102\118\123\142\162\137\185\188",109),109), 4, function(v)
	S._tunedFields = S._tunedFields or {}; S._tunedFields.SprintMod = true
	local m = getMain()
	if m then
		if type(m.CameraModule) == _lIillIIIl(_lIillIIIl("\118\113\128\152\159",122),122) then setGameField(m.CameraModule, _lIillIIIl(_lIillIIIl("\111\154\170\175\194\214\189\237\240\3\14\31\41\68",135),135), v) end
	end
end)
mkToggle(secMovement, _lIillIIIl(_lIillIIIl("\121\185\197\212\221\233\170\226\27\33\50\32\77\99\105\132",148),148), _lIillIIIl(_lIillIIIl("\154\211\217\234\205\4\5\20\44\51\64",161),161), 5, function(v)
	if not v then restoreJumpPower() end
end)
mkSlider(secMovement, _lIillIIIl(_lIillIIIl("\180\237\243\4\242\31\53\49\76",174),174), 50, 250, _lIillIIIl(_lIillIIIl("\199\7\19\34\43\55\34\91\97\124\106\151\173\169\196",187),187), 6)
mkToggle(secMovement, _lIillIIIl(_lIillIIIl("\228\24\51",200),200), _lIillIIIl(_lIillIIIl("\254\50\77",213),213), 7, function(v)
	if not v then
		pcall(function() if S._flyBV then S._flyBV:Destroy(); S._flyBV = nil end end)
		if not S.NoClip then restoreNoClip() end
	end
end)
mkSlider(secMovement, _lIillIIIl(_lIillIIIl("\24\76\103\38\103\146\149\163\176",226),226), 10, 200, _lIillIIIl(_lIillIIIl("\50\112\139\115\158\161\175\188",239),239), 8)
mkToggle(secMovement, _lIillIIIl(_lIillIIIl("\94\141\143\166\177\198",1),1), _lIillIIIl(_lIillIIIl("\120\167\137\192\203\224",14),14), 9, function(v)
	if not v and not S.Fly then restoreNoClip() end
end)
mkToggle(secMovement, _lIillIIIl(_lIillIIIl("\141\192\198\215\234\243\12\11\212\12\69\75\92",27),27), _lIillIIIl(_lIillIIIl("\167\218\224\241\4\13\38\37\24\81\87\104",40),40), 10)
mkToggle(secMovement, _lIillIIIl(_lIillIIIl("\203\246\253\16\18\45\64",53),53), _lIillIIIl(_lIillIIIl("\229\16\23\42\44\71\90",66),66), 11)
mkSlider(secMovement, _lIillIIIl(_lIillIIIl("\255\42\49\68\4\69\112\115\129\142",79),79), 2, 50, _lIillIIIl(_lIillIIIl("\25\68\75\94\81\124\127\141\154",92),92), 12)

local secPhysics = mkSection(Pages.Motion, _lIillIIIl(_lIillIIIl("\51\101\101\119\133\143\162\169\112\132\140\201\0\15\11\23\46",105),105), 2)
mkToggle(secPhysics, _lIillIIIl(_lIillIIIl("\64\105\137\152\82\147\197\197\215",118),118), _lIillIIIl(_lIillIIIl("\90\131\163\178\159\209\209\227",131),131), 1, function(v)
	local m = getMain(); local sw = m and m.Swimming
	if type(sw) ~= _lIillIIIl(_lIillIIIl("\162\157\172\196\203",144),144) then return end
	if v then
		saveSwimDefaults(sw)
		sw.SwimmingSpeed = math.clamp(tonumber(S.SwimSpeed) or 32, 18, 65)
	else

		restoreSwimDefaults(sw, false)
	end
end)
mkSlider(secPhysics, _lIillIIIl(_lIillIIIl("\155\205\205\223\160\225\12\15\29\42",157),157), 18, 65, _lIillIIIl(_lIillIIIl("\181\231\231\249\237\24\27\41\54",170),170), 2, function(v)
	local m = getMain(); local sw = m and m.Swimming
	if S.FastSwim and type(sw) == _lIillIIIl(_lIillIIIl("\240\235\250\18\25",183),183) then
		saveSwimDefaults(sw)
		sw.SwimmingSpeed = v
	end
end)
mkSlider(secPhysics, _lIillIIIl(_lIillIIIl("\221\16\27\36\51\78\10\85\128\131\145\158",196),196), 60, 140, _lIillIIIl(_lIillIIIl("\247\42\53\62\77\114\97\140\143\157\170",209),209), 3, function(v)
	S._tunedFields = S._tunedFields or {}; S._tunedFields.GliderSpeed = true
	local m = getMain(); if m and type(m.Swimming) == _lIillIIIl(_lIillIIIl("\62\57\72\96\113",222),222) then setGameField(m.Swimming, _lIillIIIl(_lIillIIIl("\43\94\115\124\139\166\149\192\195\209\222",235),235), v) end
end)
mkToggle(secPhysics, _lIillIIIl(_lIillIIIl("\81\132\138\155\174\183\208\207\152\213\12\27\23\35\58",248),248), _lIillIIIl(_lIillIIIl("\107\158\164\181\200\209\234\233\225\24\39\35\47\70",10),10), 4)

local secChar = mkSection(Pages.Player, _lIillIIIl(_lIillIIIl("\127\178\185\216\213\229\4\3\30",23),23), 1)
mkButton(secChar, _lIillIIIl(_lIillIIIl("\151\216\230\229\251\12\30\216\24\57\85\96\95\131\136",36),36), function() attemptRespawn() end, 1)
mkToggle(secChar, _lIillIIIl(_lIillIIIl("\177\236\0\3\213\247\10\29\0\50\101\125\123\149\162\176\181\193\224",49),49), _lIillIIIl(_lIillIIIl("\203\6\26\29\3\22\41",62),62), 2)

local secMouse = mkSection(Pages.Player, _lIillIIIl(_lIillIIIl("\241\33\53\65\65",75),75), 2)
do
	local note = Instance.new(_lIillIIIl(_lIillIIIl("\18\49\82\92\66\101\116\133\154",88),88))
	note.Parent = secMouse; note.LayoutOrder = 1; note.BackgroundTransparency = 1
	note.Size = UDim2.new(1, 0, 0, 30); note.Font = F; note.TextSize = 12
	note.TextColor3 = T.Tx3; note.TextWrapped = true; note.TextXAlignment = Enum.TextXAlignment.Left
	note.Text = _lIillIIIl(_lIillIIIl("\37\85\105\117\117\62\161\168\180\197\199\221\243\174\253\31\44\53\65\67\100\113\121\133\158\172\199\124\225\224\239\0\7\208\50\52\67\91\22\113\119\142\163\92\179\203\134\227\242\245\12\216\218\41\68\72\18\118\135\137\159\181\112\192\205\221\243\182\24\26\37\238\73\89\101\107\130\150\80\183\187\207\136\217\240\1\19\19\220\51\76\20",101),101)
end

local secAuto = mkSection(Pages.Auto, _lIillIIIl(_lIillIIIl("\51\117\130\139\151\153\186\189\209\222",114),114), 1)
mkToggle(secAuto, _lIillIIIl(_lIillIIIl("\77\143\156\165\100\161\208\211\234\170\220\21\35\52\67",127),127), _lIillIIIl(_lIillIIIl("\103\169\182\191\173\220\223\246\218\19\33\50\65",140),140), 1)
mkToggle(secAuto, _lIillIIIl(_lIillIIIl("\129\195\208\217\152\201\3\14\28\35\47\78\8\75\128\139\152\157\184\116\136\144\199\0\255\21\41",153),153), _lIillIIIl(_lIillIIIl("\155\221\234\243\213\15\26\40\47\59\90\61\128\127\149\169",166),166), 2)
mkToggle(secAuto, _lIillIIIl(_lIillIIIl("\181\247\4\13\204\13\45\55\86\85\114\56\106\166\163\199\195\222\237",179),179), _lIillIIIl(_lIillIIIl("\207\17\30\39\25\57\67\98\107\126\104\164\161\197\193\220\235",192),192), 3)
mkToggle(secAuto, _lIillIIIl(_lIillIIIl("\233\43\56\65\0\49\117\128\142\149\161\192\122\179\219\253\5\192\212\220\13\71\74\89\34\82\144\145\155\171\190\201\228\243",205),205), _lIillIIIl(_lIillIIIl("\3\69\82\91\71\129\140\154\161\173\204\177\217\251\3",218),218), 4)
mkToggle(secAuto, _lIillIIIl(_lIillIIIl("\29\95\118\127\62\110\175\193\118\166\211\244\2\1\28\33\43\71\2\24\113\124\127\150\154\183\114\178\211\239\239\249\24\23\42\249",231),231), _lIillIIIl(_lIillIIIl("\65\131\144\153\138\171\186\203\220\234\206\251\28\42\41\68\73\83\111",244),244), 5)
mkToggle(secAuto, _lIillIIIl(_lIillIIIl("\91\157\170\179\114\180\227\238\248\184\252\21\46\70\67\95",6),6), _lIillIIIl(_lIillIIIl("\117\183\196\205\192\239\250\4\250\19\44\68\65\93",19),19), 6)
mkToggle(secAuto, _lIillIIIl(_lIillIIIl("\143\209\222\231\166\230\7\32\31\53\76\8\61\105\128\133\160\157\190\199\216\231",32),32), _lIillIIIl(_lIillIIIl("\169\235\248\1\242\19\44\43\65\88\59\103\126\131\158\155\188\197\214\229",45),45), 7)
mkToggle(secAuto, _lIillIIIl(_lIillIIIl("\195\5\18\27\218\12\63\87\83\114\123\60\118\153\180\184\207\217\236\241\13",58),58), _lIillIIIl(_lIillIIIl("\221\31\44\53\24\75\99\95\126\135\116\151\178\182\205\215\234\239\11",71),71), 8)
mkToggle(secAuto, _lIillIIIl(_lIillIIIl("\8\51\65\77\14\80\124\121\137\159\167\194\126\148\232\247\10\13\24\57\238\78\89\113\125\62\79\99",84),84), _lIillIIIl(_lIillIIIl("\34\77\91\103\92\136\133\149\171\179\206",97),97), 9)

local secInteract = mkSection(Pages.Auto, _lIillIIIl(_lIillIIIl("\51\102\122\121\148\145\161\192\195\215\228\164\230\23\19\29\53\75",110),110), 2)
mkToggle(secInteract, _lIillIIIl(_lIillIIIl("\77\128\147\162\157\184\204\134\189\240\4\3\30\27\43\74\4\26\120\135\70\156\177\188\194\149",123),123), _lIillIIIl(_lIillIIIl("\103\154\173\188\183\210\230\201\252\16\15\42\39\55\86",136),136), 1)
mkToggle(secInteract, _lIillIIIl(_lIillIIIl("\125\190\200\199\222\226\241\254\200\6\54\65\77\94\122\52\116\149\159\175\194\136\158\252\197\201",149),149), _lIillIIIl(_lIillIIIl("\162\210\221\233\250\12\248\25\35\51\70",162),162), 2)

local secTP = mkSection(Pages.Misc, _lIillIIIl(_lIillIIIl("\192\223\244\251\20\33\50\66\79",175),175), 1)
mkButton(secTP, _lIillIIIl(_lIillIIIl("\218\249\14\21\46\59\76\92\32\130\139\74\134\171\181\212\213\241\0\186\236\37\51\68",188),188), function()
	local hrp = getHRP(); if not hrp then return end
	local best, bestD = nil, math.huge
	for _, e in ipairs(PromptCache) do
		if e.kind == _lIillIIIl(_lIillIIIl("\4\29\43\60",201),201) and e.part.Parent and not isDeadEndDoor(e.model) and not PassedDoors[e.model] then
			local d = (e.part.Position - hrp.Position).Magnitude
			if d < bestD then best, bestD = e.part, d end
		end
	end
	if best then hrp.CFrame = best.CFrame * CFrame.new(0, 0, 3); Notify(_lIillIIIl(_lIillIIIl("\14\45\66\73\98\121\138\154",214),214), _lIillIIIl(_lIillIIIl("\40\71\92\109\134\147\164\180\179\192\138\236\245\180\16\21\31\62\63\91\106\36\118\143\157\174",227),227), 2, _lIillIIIl(_lIillIIIl("\97\123\119\133\149\177\191",240),240))
	else Notify(_lIillIIIl(_lIillIIIl("\102\133\154\161\186\199\216\232",2),2), _lIillIIIl(_lIillIIIl("\122\169\104\186\211\225\242\174\2\25\45\52\56",15),15), 2, _lIillIIIl(_lIillIIIl("\189\181\212\222",28),28)) end
end, 1)
mkButton(secTP, _lIillIIIl(_lIillIIIl("\180\211\232\239\8\21\38\54\240\82\91\26\86\123\133\164\165\193\208\138\196\245\247\13\21\48",41),41), function()
	local hrp = getHRP(); if not hrp then return end
	local best, bestD = nil, math.huge
	for _, e in ipairs(PromptCache) do
		if e.kind == _lIillIIIl(_lIillIIIl("\230\247\249\15\23\50",54),54) and e.part.Parent then
			local d = (e.part.Position - hrp.Position).Magnitude
			if d < bestD then best, bestD = e.part, d end
		end
	end
	if best then hrp.CFrame = best.CFrame + best.CFrame.LookVector * 2; Notify(_lIillIIIl(_lIillIIIl("\232\7\28\35\60\73\90\106",67),67), _lIillIIIl(_lIillIIIl("\2\33\54\61\86\99\116\132\131\144\90\188\197\132\224\229\239\14\15\43\58\244\78\95\107\129\137\164",80),80), 2, _lIillIIIl(_lIillIIIl("\59\75\71\85\101\129\143",93),93))
	else Notify(_lIillIIIl(_lIillIIIl("\54\85\106\113\138\151\168\184",106),106), _lIillIIIl(_lIillIIIl("\74\121\56\146\163\165\187\195\222\154\238\5\25\32\36",119),119), 2, _lIillIIIl(_lIillIIIl("\141\133\164\174",132),132)) end
end, 2)

local secCfg = mkSection(Pages.Config, _lIillIIIl(_lIillIIIl("\115\173\186\192\209\221\249\4\1\34\37\57\70",145),145), 1)

S._readConfigData = function(name)
	if not readfile then return false, nil, _lIillIIIl(_lIillIIIl("\188\189\199\216\232\249\10\17\218\61\68\69\104\107\129\146\149\164\188\195",158),158) end
	local base = _lIillIIIl(_lIillIIIl("\180\228\229\1\15\31\42\43\51\37\95\118\124\141\153\179\125",171),171) .. name .. _lIillIIIl(_lIillIIIl("\172\246\13\23\36",184),184)
	local function readCandidate(path)
		if isfile and not isfile(path) then return false, nil, _lIillIIIl(_lIillIIIl("\5\15\39\53\57\76\83",197),197) end
		local ok, raw = pcall(readfile, path)
		if not ok or type(raw) ~= _lIillIIIl(_lIillIIIl("\37\52\64\69\88\105",210),210) then return false, nil, _lIillIIIl(_lIillIIIl("\57\67\91\115\119\138\145",223),223) end
		local parsedOk, data = pcall(function() return HttpService:JSONDecode(raw) end)
		if not parsedOk or type(data) ~= _lIillIIIl(_lIillIIIl("\90\85\110\134\141",236),236) then return false, nil, _lIillIIIl(_lIillIIIl("\115\134\156\149\174\185\194\140\228\251\5\18",249),249) end
		return true, data
	end
	local ok, data, reason = readCandidate(base)
	if ok then return true, data end
	local backupOk, backupData = readCandidate(base .. _lIillIIIl(_lIillIIIl("\82\166\173\190",11),11))
	if backupOk then return true, backupData, _lIillIIIl(_lIillIIIl("\176\177\189\215\236\233\4\5\18",24),24) end
	return false, nil, reason
end

S._applyConfigData = function(data)
	if type(data) ~= _lIillIIIl(_lIillIIIl("\204\199\214\238\245",37),37) then return end
	if type(data._ui) == _lIillIIIl(_lIillIIIl("\230\225\240\8\15",50),50) then
		if data._ui.Theme then pcall(function() UIStyle:ApplyTheme(data._ui.Theme) end) end
		if data._ui.TextScale then pcall(function() UIStyle:ApplyTextScale(data._ui.TextScale) end) end
		if data._ui.HUDScale then pcall(function() UIStyle:ApplyHUDScale(data._ui.HUDScale) end) end
		if data._ui.NotificationPosition then pcall(function() UIStyle:PlaceNotifications(data._ui.NotificationPosition) end) end
	end

	for key, value in pairs(data) do
		if CfgBind[key] and type(S[key]) ~= _lIillIIIl(_lIillIIIl("\238\9\23\34\41\51\78",63),63) then pcall(CfgBind[key], value) end
	end
	for key, value in pairs(data) do
		if CfgBind[key] and type(S[key]) == _lIillIIIl(_lIillIIIl("\8\35\49\60\67\77\104",76),76) then pcall(CfgBind[key], value) end
	end
	S._applyKeybindMap(type(data._keybinds) == _lIillIIIl(_lIillIIIl("\52\47\62\86\93",89),89) and data._keybinds or {})

	if MOBILE and S._floatApplyMap then
		pcall(S._floatApplyMap, type(data._floats) == _lIillIIIl(_lIillIIIl("\78\73\88\112\119",102),102) and data._floats or {})
	end
	task.defer(function()
		if S.Destroyed then return end
		pcall(applyModuleTuning)
		pcall(refreshGameSpeed)
		pcall(applyLightingOverrides)
		pcall(refreshVisionEffects)
	end)
end

SaveConfigFile = function(name)
	if not writefile then Notify(_lIillIIIl(_lIillIIIl("\55\113\126\132\149\161",115),115), _lIillIIIl(_lIillIIIl("\83\148\143\155\187\200\209\226\158\244\251\27\214\50\65\0\101\120\125\150\149\164\181\198\205",128),128), 2, _lIillIIIl(_lIillIIIl("\159\151\182\192",141),141)) return end
	local ok, err = pcall(function()
		if makefolder and (not isfolder or not isfolder(_lIillIIIl(_lIillIIIl("\146\194\195\223\237\253\8\9\17\3\61\74\80\107\119\145",154),154))) then

			pcall(makefolder, _lIillIIIl(_lIillIIIl("\172\220\221\249\7\23\34\35\43\29\87\110\116\133\145\171",167),167))
		end
		local data = {}
		for key in pairs(CfgBind) do data[key] = S[key] end
		data._keybinds = S.Keybinds
		data._floats = S.FloatButtons
		data._ui = { Theme = S.UITheme, TextScale = S.UITextScale, HUDScale = S.HUDScale, NotificationPosition = S.NotificationPosition }
		data._schema = 3
		local path = _lIillIIIl(_lIillIIIl("\198\246\247\19\33\49\60\61\69\55\123\136\142\159\171\197\143",180),180) .. name .. _lIillIIIl(_lIillIIIl("\190\8\31\41\54",193),193)
		local encoded = HttpService:JSONEncode(data)

		writefile(path .. _lIillIIIl(_lIillIIIl("\216\44\51\68",206),206), encoded)
		writefile(path, encoded)
		if readfile then
			local verify = readfile(path)
			assert(type(verify) == _lIillIIIl(_lIillIIIl("\55\70\82\87\116\123",219),219) and type(HttpService:JSONDecode(verify)) == _lIillIIIl(_lIillIIIl("\82\77\102\126\133",232),232), _lIillIIIl(_lIillIIIl("\101\127\140\146\163\175\118\218\215\242\247\2\19\27\39\72\75\95\108\44\128\137\159\176\183\196",245),245))
		end
		if delfile and (not isfile or isfile(path .. _lIillIIIl(_lIillIIIl("\74\158\165\182",7),7))) then pcall(delfile, path .. _lIillIIIl(_lIillIIIl("\100\184\191\208",20),20)) end
	end)
	Notify(_lIillIIIl(_lIillIIIl("\147\205\218\224\241\253",33),33), ok and (_lIillIIIl(_lIillIIIl("\189\217\252\249\6\208\229",46),46) .. name .. _lIillIIIl(_lIillIIIl("\171",59),59)) or (_lIillIIIl(_lIillIIIl("\241\13\48\45\246\74\83\105\122\129\142\114\102",72),72) .. tostring(err)), 2, ok and _lIillIIIl(_lIillIIIl("\43\59\55\69\85\113\127",85),85) or _lIillIIIl(_lIillIIIl("\54\65\92\99\111\138",98),98))
	return ok, err
end
LoadConfigFile = function(name, silent)
	local ok, data, reason = S._readConfigData(name)
	if not ok then
		if not silent then Notify(_lIillIIIl(_lIillIIIl("\47\105\118\124\141\153",111),111), reason == _lIillIIIl(_lIillIIIl("\115\125\149\163\167\186\193",124),124) and _lIillIIIl(_lIillIIIl("\110\157\92\189\185\220\217\230\176\1\27\40\46\63\75\18\112\135\155\162\166",137),137) or (_lIillIIIl(_lIillIIIl("\134\183\183\200\146\230\239\5\22\29\42\14\2",150),150) .. tostring(reason)), 2, _lIillIIIl(_lIillIIIl("\203\195\226\236",163),163)) end
		return false, reason
	end
	local applied, err = xpcall(function() S._applyConfigData(data) end, debug.traceback)
	if not applied then
		if not silent then Notify(_lIillIIIl(_lIillIIIl("\177\235\248\254\15\27",176),176), _lIillIIIl(_lIillIIIl("\212\5\5\22\224\52\61\83\110\117\130\102\90",189),189) .. tostring(err), 2, _lIillIIIl(_lIillIIIl("\6\17\44\51\63\90",202),202)) end
		return false, err
	end
	if not silent then Notify(_lIillIIIl(_lIillIIIl("\255\57\70\76\93\115",215),215), _lIillIIIl(_lIillIIIl("\34\83\83\110\125\138\84\105",228),228) .. name .. _lIillIIIl(_lIillIIIl("\23",241),241) .. (reason == _lIillIIIl(_lIillIIIl("\134\135\147\173\194\191\218\219\232",3),3) and _lIillIIIl(_lIillIIIl("\78\100\188\189\201\227\248\245\16\17\30\241",16),16) or ""), 2, _lIillIIIl(_lIillIIIl("\187\203\199\213\229\1\15",29),29)) end
	return true, reason
end
mkButton(secCfg, _lIillIIIl(_lIillIIIl("\181\209\244\241\186\236\27\42\51\85\90\112\42\91\149\162\168\185\197",42),42), function() SaveConfigFile(_lIillIIIl(_lIillIIIl("\219\235\13\26\35\46\63\63\80",55),55)) end, 1)
mkButton(secCfg, _lIillIIIl(_lIillIIIl("\226\19\19\36\238\32\79\94\103\137\142\164\94\143\201\214\220\237\249",68),68), function() LoadConfigFile(_lIillIIIl(_lIillIIIl("\15\31\65\78\87\98\115\115\132",81),81)) end, 2)

if MOBILE then
	mkButton(secCfg, _lIillIIIl(_lIillIIIl("\28\61\83\99\120\117\62\109\166\180\118\170\222\239\239\16\19\38\45\244\36\101\124\138\147\160\179",94),94), function()
		if S._floatClearAll then S._floatClearAll() end
		Notify(_lIillIIIl(_lIillIIIl("\38\103\116\130\139\152\171",107),107), _lIillIIIl(_lIillIIIl("\63\120\134\72\156\176\193\193\226\229\248\255\198\22\55\68\82\91\114\133\64\160\161\183\199\220\217\230",120),120), 2, _lIillIIIl(_lIillIIIl("\129\148\154\177",133),133))
	end, 3)
else
	mkButton(secCfg, _lIillIIIl(_lIillIIIl("\117\172\179\189\220\152\199\0\14\208\9\49\83\74\105\124\128\157",146),146), function() S._clearAllKeybinds() end, 3)
end

do
	local scheduled = false
	RequestAutoSave = function()
		if scheduled or not writefile then return end
		scheduled = true
		task.delay(1, function() scheduled = false; SaveConfigFile(_lIillIIIl(_lIillIIIl("\171\187\221\234\243\254\15\15\32",159),159)) end)
	end
end
do
	local note = Instance.new(_lIillIIIl(_lIillIIIl("\186\217\250\4\234\13\28\45\66",172),172))
	note.Parent = secCfg; note.LayoutOrder = 4; note.BackgroundTransparency = 1
	note.Size = UDim2.new(1, 0, 0, MOBILE and 36 or 18); note.Font = F; note.TextSize = 12
	note.TextColor3 = T.Tx3; note.TextXAlignment = Enum.TextXAlignment.Left
	note.TextWrapped = MOBILE
	note.Text = MOBILE
		and _lIillIIIl(_lIillIIIl("\80\40\108\103\136\132\164\161\192\194\230\212\82\130\162\170\138\73\7\100\97\129\62\156\138\184\168\212\194\64\254\250\27\218\134\69\6\97\33\124\119\152\144\181\120\218\208\246\236\98\32\16\61\5\88\83\116\112\145\79\172\162\201\136\52\242\229\15\221\122\56\51\84\66\192\127\73\154\146\183\116\220\202\248\243\114\114\48\0\77\11\104\91\212\146\136\174\163\202\196\230\217\2\253\30\17\58\53\86\76\115\63\222\157\91\184\190\223\161\251\184\22\4\50\45\79\27\107\54\135\70\163\97\191\139\42\232\214\4\244\33\224\60\56\88\82\116\98\145\80\172\162\211\151\238\225\11\201\38\30\66\56\188",185),185)
		or _lIillIIIl(_lIillIIIl("\106\71\134\94\162\124\14\214\211\242\238\94\29\222\57\249\84\79\112\104\141\80\168\158\196\186\48\0\172\206\104\38\33\66\48\94\83\122\117\150\132\179\119\216\206\245\180\17\218\124\58\41\86\76\114\109\142\128\8\8\198\150\227\161\254\241\106\40\30\68\57\96\90\124\111\152\147\180\167\218\213\246\236\19\223\126\61\251\88\84\117\55\145\78\172\154\200\195\229\177\1\204\29\220\57\247\85\33\192\126\108\154\138\183\118\220\216\248\242\20\2\49\240\76\66\105\45\132\119\161\95\188\180\216\206\82",198),198)
end

if MOBILE and Pages.Buttons then

	local function mkPill(parent, text, x)
		local pill = Instance.new(_lIillIIIl(_lIillIIIl("\8\39\72\82\46\121\134\148\157\170",211),211))
		pill.Parent = parent
		pill.AnchorPoint = Vector2.new(1, 0.5)
		pill.Position = UDim2.new(1, x, 0.5, 0)
		pill.Size = UDim2.fromOffset(68, 28)
		pill.BackgroundColor3 = T.Elev
		pill.BorderSizePixel = 0
		pill.AutoButtonColor = false
		pill.Font = FM; pill.TextSize = 11; pill.TextColor3 = T.Tx2; pill.Text = text
		Corner(pill, 9)
		pill.ZIndex = 3
		return pill, Stroke(pill, T.Bd2, 1, 0.42)
	end

	for index, item in ipairs(order) do
		local row = Instance.new(_lIillIIIl(_lIillIIIl("\20\78\75\111\117",224),224))
		row.Name = _lIillIIIl(_lIillIIIl("\46\108\125\125\158\151",237),237) .. item.id
		row.Parent = secFloat
		row.LayoutOrder = index + 1
		row.Size = UDim2.new(1, 0, 0, M.rowH)
		row.BackgroundTransparency = 1

		local label = Instance.new(_lIillIIIl(_lIillIIIl("\96\127\160\170\144\179\194\211\232",250),250))
		label.Parent = row; label.BackgroundTransparency = 1
		label.Position = UDim2.new(0, 4, 0, 0); label.Size = UDim2.new(1, -168, 1, 0)
		label.Font = F; label.TextSize = M.rowFont; label.TextColor3 = T.Tx2
		label.TextXAlignment = Enum.TextXAlignment.Left; label.TextTruncate = Enum.TextTruncate.AtEnd
		label.Text = item.label

		local enable, enableStroke = mkPill(row, _lIillIIIl(_lIillIIIl("\107\130\131\146\170\177",12),12), -82)
		local remove, removeStroke = mkPill(row, _lIillIIIl(_lIillIIIl("\146\147\169\185\206\203",25),25), -4)

		local locked = item.id == _lIillIIIl(_lIillIIIl("\207\209\176\241\247\14\35",38),38)
		local function paint()
			local on = S._floatIsOn(item.id)
			enable.BackgroundColor3 = on and T.ActiveBg or T.Elev
			enable.TextColor3 = on and T.White or T.Tx2
			enable.Text = on and _lIillIIIl(_lIillIIIl("\195\208\176\241\239\12\13\27\50",51),51) or _lIillIIIl(_lIillIIIl("\211\234\235\250\18\25",64),64)
			enableStroke.Color = on and T.Accent or T.Bd2
			enableStroke.Transparency = on and 0.15 or 0.42
			label.TextColor3 = on and T.White or T.Tx2
			remove.Visible = not locked
			remove.TextColor3 = on and T.Tx or T.Tx4
			removeStroke.Transparency = on and 0.35 or 0.6
		end
		rows[item.id] = paint

		enable.MouseButton1Click:Connect(function()
			S._floatSet(item.id, true)
			SFX.Click()
		end)
		remove.MouseButton1Click:Connect(function()
			if locked then return end
			S._floatSet(item.id, false)
			SFX.Click()
		end)
		paint()
		table.insert(UIRegistry, { card = secFloat, row = row, label = string.lower(item.label) })
	end

	S._refreshFloatTab = function()
		for _, paint in pairs(rows) do pcall(paint) end
	end

	S._floatSet(_lIillIIIl(_lIillIIIl("\29\31\254\63\69\92\113",77),77), true)
end

attemptRespawn = function()
	task.spawn(function()
		local r = findRemote(_lIillIIIl(_lIillIIIl("\20\53\81\92\91\127\132",90),90))
		if r and r:IsA(_lIillIIIl(_lIillIIIl("\46\79\101\117\136\135\118\179\186\189\220\223\243\0",103),103)) then
			local ok, res = pcall(function() return r:InvokeServer() end)
			Notify(_lIillIIIl(_lIillIIIl("\72\105\133\144\143\179\184",116),116), ok and (_lIillIIIl(_lIillIIIl("\98\131\157\175\173\201\216\215\228\174\196",129),129) .. tostring(res) .. _lIillIIIl(_lIillIIIl("\83",142),142)) or _lIillIIIl(_lIillIIIl("\150\183\211\222\221\1\6\198\38\39\54\83\95\105\118",155),155), 2, ok and _lIillIIIl(_lIillIIIl("\209\225\221\235\251\23\37",168),168) or _lIillIIIl(_lIillIIIl("\239\231\6\16",181),181))
		else
			Notify(_lIillIIIl(_lIillIIIl("\228\5\33\44\43\79\84",194),194), _lIillIIIl(_lIillIIIl("\254\31\59\70\69\105\120\56\152\153\175\191\210\209\154\246\5\24\210\38\61\81\88\92",207),207), 2, _lIillIIIl(_lIillIIIl("\61\53\84\94",220),220))
		end
	end)
end

local lastHideAt = 0
hideInLockerNow = function(manual)
	local now = os.clock()
	if not manual and now - lastHideAt < 12 then return end
	lastHideAt = now
	task.spawn(function()
		local chk = findRemote(_lIillIIIl(_lIillIIIl("\35\86\107\119\141\124\173\175\197\205\232\215\6\1\34\49\61",233),233))
		if chk and chk:IsA(_lIillIIIl(_lIillIIIl("\86\119\141\157\176\175\158\219\226\229\4\7\27\40",246),246)) then
			local ok, inLocker = pcall(function() return chk:InvokeServer() end)
			if ok and inLocker == true then return end
		end
		local hrp = getHRP(); if not hrp then return end
		local best, bestD, bestPrompt = nil, math.huge, nil

		for _, e in ipairs(PromptCache) do
			if e.kind == _lIillIIIl(_lIillIIIl("\138\155\157\179\187\214",8),8) and e.part.Parent then
				local d = (e.part.Position - hrp.Position).Magnitude
				if d < bestD then best, bestD, bestPrompt = e.part, d, e.prompt end
			end
		end
		if not best then
			if manual then Notify(_lIillIIIl(_lIillIIIl("\128\175\184\199",21),21), _lIillIIIl(_lIillIIIl("\160\207\142\239\235\254\11\212\46\63\65\87\95\122\54\138\161\181\188\192",34),34), 2, _lIillIIIl(_lIillIIIl("\227\219\250\4",47),47)) end
			return
		end
		hrp.CFrame = best.CFrame + best.CFrame.LookVector * 2
		task.wait(0.1)
		if fireproximityprompt and bestPrompt.Parent then pcall(fireproximityprompt, bestPrompt) end
		Notify(_lIillIIIl(_lIillIIIl("\206\253\6\21",60),60), _lIillIIIl(_lIillIIIl("\232\23\32\51\70\77\20\107\126\62\152\169\171\193\201\228",73),73), 2, _lIillIIIl(_lIillIIIl("\45\61\57\71\87\115\129",86),86))
	end)
end

tc(LP.Idled:Connect(function()
	if S.AntiAFK then
		local VirtualUser = game:GetService(_lIillIIIl(_lIillIIIl("\42\75\98\114\129\123\148\139\183\183\210",99),99))
		VirtualUser:Button2Down(Vector2.new(0, 0), cam() and cam().CFrame or CFrame.new())
		task.wait(1)
		VirtualUser:Button2Up(Vector2.new(0, 0), cam() and cam().CFrame or CFrame.new())
	end
end))

tc(UIS.JumpRequest:Connect(function()
	if S.InfiniteJump then
		local hum = getHum()
		if hum then pcall(function() hum:ChangeState(Enum.HumanoidStateType.Jumping) end) end
	end
end))

tc(RunService.Heartbeat:Connect(function(dt)
	local c = LP.Character
	local hrp = c and c:FindFirstChild(_lIillIIIl(_lIillIIIl("\54\113\119\121\148\163\171\180\176\219\233\252\230\5\36\52",112),112))
	local hum = c and c:FindFirstChildOfClass(_lIillIIIl(_lIillIIIl("\80\139\145\147\174\189\197\206",125),125))

	if S.JumpEnabled and hum then
		S._jumpOriginal = S._jumpOriginal or {}
		if not S._jumpOriginal[hum] then
			S._jumpOriginal[hum] = { useJumpPower = hum.UseJumpPower, jumpPower = hum.JumpPower }
		end
		pcall(function() hum.UseJumpPower = true; hum.JumpPower = S.CustomJumpPower or 50 end)
	elseif not S.JumpEnabled then
		restoreJumpPower()
	end
	for savedHum in pairs(S._jumpOriginal or {}) do
		if not savedHum.Parent then S._jumpOriginal[savedHum] = nil end
	end

	local cc = cam()
	if S.CamFOVEnabled and cc then
		if S._fovCamera ~= cc then
			restoreCameraFov()
			S._fovCamera, S._fovOriginal = cc, cc.FieldOfView
		end
		pcall(function() cc.FieldOfView = math.clamp(S.CamFOV or 70, 55, 85) end)
	elseif not S.CamFOVEnabled then
		restoreCameraFov()
	end
	if S.Spinbot and hrp then
		pcall(function() hrp.CFrame = hrp.CFrame * CFrame.Angles(0, (S.SpinSpeed or 20) * dt, 0) end)
	end
	if S.Fly and hrp then
		local bv = S._flyBV
		if not bv or bv.Parent ~= hrp then
			pcall(function() if bv then bv:Destroy() end end)
			bv = Instance.new(_lIillIIIl(_lIillIIIl("\100\159\162\197\176\205\226\243\245\9\34\53",138),138))
			bv.MaxForce = Vector3.new(9e4, 9e4, 9e4); bv.Velocity = Vector3.zero; bv.Parent = hrp
			S._flyBV = bv
		end
		local cc = cam()
		if cc then
			local dir = Vector3.zero
			local look, right = cc.CFrame.LookVector, cc.CFrame.RightVector
			if UIS:IsKeyDown(Enum.KeyCode.W) then dir += look end
			if UIS:IsKeyDown(Enum.KeyCode.S) then dir -= look end
			if UIS:IsKeyDown(Enum.KeyCode.D) then dir += right end
			if UIS:IsKeyDown(Enum.KeyCode.A) then dir -= right end
			if UIS:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.yAxis end
			if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then dir -= Vector3.yAxis end
			if dir.Magnitude > 0 then dir = dir.Unit end
			bv.Velocity = dir * (S.FlySpeed or 50)
		end
	end
end))

tc(RunService.Stepped:Connect(function()
	if S.NoClip or S.Fly then
		local c = LP.Character
		if c then
			S._noclipTouched = S._noclipTouched or {}
			for _, p in ipairs(c:GetDescendants()) do
				if p:IsA(_lIillIIIl(_lIillIIIl("\126\171\203\203\196\227\2\18",151),151)) then
					if S._noclipTouched[p] == nil then S._noclipTouched[p] = p.CanCollide end
					if p.CanCollide then p.CanCollide = false end
				end
			end
		end
	else
		restoreNoClip()
	end
end))

task.spawn(function()
	while not S.Destroyed do
		if S.SpeedEnabled then installSpeedHook(); refreshGameSpeed() end
		task.wait(0.5)
	end
end)

task.spawn(function()
	while not S.Destroyed do
		pcall(applyLightingOverrides)
		pcall(refreshVisionEffects)
		if S.InfiniteOxygen then
			pcall(function()
				local m = getMain(); local ox = m and m.OxygenTank
				if type(ox) == _lIillIIIl(_lIillIIIl("\202\197\212\236\243",164),164) and ox.TankValue then ox.TankValue.Value = 100 end
			end)
		end
		if S.FastSwim then
			pcall(function()
				local m = getMain(); local sw = m and m.Swimming
				if type(sw) == _lIillIIIl(_lIillIIIl("\228\223\238\6\13",177),177) then
					saveSwimDefaults(sw)

					sw.SwimmingSpeed = math.clamp(tonumber(S.SwimSpeed) or 32, 18, 65)
				end
			end)
		end
		task.wait(0.4)
	end
end)

task.spawn(function()
	while not S.Destroyed do
		if S.AutoShakeParasite then
			local r = findRemote(_lIillIIIl(_lIillIIIl("\218\249\24\21\53\57\82\81\87\122\129\153\161\153\190\204",190),190))
			if r and r.FireServer then pcall(function() r:FireServer() end) end
		end
		task.wait(0.5)
	end
end)
task.spawn(function()
	while not S.Destroyed do
		if S.AutoDozerStealth then

			local r = findRemote(_lIillIIIl(_lIillIIIl("\232\33\58\51\78\45\116\127\147\143\162\177\196\203\181\232\243\255\21",203),203))
			if r and r.FireServer then pcall(function() r:FireServer() end) end
		end
		task.wait(1.5)
	end
end)

S._promptOrig = {}
task.spawn(function()
	while not S.Destroyed do
		local wantAny = S.InstantInteract or S.PromptReach
		if wantAny or next(S._promptOrig) then
			pcall(function()
				if wantAny then
					for _, e in ipairs(PromptCache) do
						local pr = e.prompt
						if pr.Parent then
							local o = S._promptOrig[pr]
							if not o then o = { hold = pr.HoldDuration, dist = pr.MaxActivationDistance }; S._promptOrig[pr] = o end
							pr.HoldDuration = S.InstantInteract and 0 or o.hold
							pr.MaxActivationDistance = S.PromptReach and math.min(o.dist * 3, 60) or o.dist
						end
					end
				else
					for pr, o in pairs(S._promptOrig) do
						pcall(function() if pr.Parent then pr.HoldDuration = o.hold; pr.MaxActivationDistance = o.dist end end)
						S._promptOrig[pr] = nil
					end
				end
				for pr in pairs(S._promptOrig) do if not pr.Parent then S._promptOrig[pr] = nil end end
			end)
		end
		task.wait(0.5)
	end
end)

do
	local function announceCode()
		local code = LP:GetAttribute(_lIillIIIl(_lIillIIIl("\1\59\62\77",216),216))
		if code and tostring(code) ~= "" then
			local rn = LP:GetAttribute(_lIillIIIl(_lIillIIIl("\42\85\99\121\104\157\163",229),229))
			Notify(_lIillIIIl(_lIillIIIl("\61\111\145\150\149\166\112\161\219\222\237",242),242), tostring(code) .. (rn and (_lIillIIIl(_lIillIIIl("\54\68\90\178\189\203\215\152",4),4) .. tostring(rn) .. _lIillIIIl(_lIillIIIl("\89",17),17)) or ""), 6, _lIillIIIl(_lIillIIIl("\193\185\216\226",30),30))
		end
	end
	tc(LP:GetAttributeChangedSignal(_lIillIIIl(_lIillIIIl("\167\225\228\243",43),43)):Connect(announceCode))
	task.spawn(announceCode)
end

local EntityCache = {}
task.spawn(function()
	while not S.Destroyed do
		local found = {}
		local gf = getGF()
		local monstersFolder = gf and gf:FindFirstChild(_lIillIIIl(_lIillIIIl("\203\251\8\27\42\41\68\83",56),56))
		local function scan(container)
			if not container then return end
			for _, obj in ipairs(container:GetChildren()) do
				if obj:IsA(_lIillIIIl(_lIillIIIl("\229\21\24\39\60",69),69)) or obj:IsA(_lIillIIIl(_lIillIIIl("\244\33\65\65\58\89\120\136",82),82)) then
					local kind = monsterKind(obj.Name:lower())
					if kind then found[#found + 1] = { obj = obj, kind = kind } end
				end
			end
		end
		pcall(scan, monstersFolder)
		pcall(scan, Workspace)
		EntityCache = found
		for _, e in ipairs(found) do
			if e.kind == _lIillIIIl(_lIillIIIl("\57\73\86\105\120\119\146",95),95) or e.kind == _lIillIIIl(_lIillIIIl("\74\107\103\124\138\145\172",108),108) then
				ShowEntityWarning(e.obj.Name)
				if S.AutoHideInLocker and e.kind == _lIillIIIl(_lIillIIIl("\109\125\138\157\172\171\198",121),121) then hideInLockerNow(false) end
			end
		end
		task.wait(0.45)
	end
end)

local antiEyePauseUntil, antiEyeLockerCheckAt = 0, 0
local function shouldPauseAntiEyeCamera()
	local now = os.clock()
	local hrp, hum, cc = getHRP(), getHum(), cam()
	if (hrp and hrp.Anchored) or (cc and hum and cc.CameraSubject ~= hum) then
		antiEyePauseUntil = now + 0.9
	end
	if now >= antiEyeLockerCheckAt then
		antiEyeLockerCheckAt = now + 0.35
		local check = findRemote(_lIillIIIl(_lIillIIIl("\93\144\155\167\189\172\221\223\245\253\24\7\54\49\82\97\119",134),134))
		if check and check:IsA(_lIillIIIl(_lIillIIIl("\134\167\189\205\224\223\206\11\18\21\52\55\75\88",147),147)) then
			local ok, inLocker = pcall(function() return check:InvokeServer() end)
			if ok and inLocker == true then antiEyePauseUntil = now + 0.9 end
		end
	end
	return now < antiEyePauseUntil
end
task.spawn(function()
	while not S.Destroyed do
		if S.AntiEyefest then
			pcall(function()
				local cc = cam(); if not cc or shouldPauseAntiEyeCamera() then return end
				for _, e in ipairs(EntityCache) do
					if e.kind == _lIillIIIl(_lIillIIIl("\179\213\207\222\235\7\22",160),160) and e.obj.Parent then
						local p = objPos(e.obj)
						if p then
							local toIt = p - cc.CFrame.Position
							local flat = Vector3.new(toIt.X, 0, toIt.Z)
							if flat.Magnitude > 1 then
								flat = flat.Unit
								if cc.CFrame.LookVector:Dot(flat) > -0.2 then
									local pos = cc.CFrame.Position
									cc.CFrame = CFrame.lookAt(pos, pos - flat * 10)
								end
							end
						end
						break
					end
				end
			end)
		end
		task.wait(0.12)
	end
end)

task.spawn(function()
	local hooked = {}
	while not S.Destroyed do
		pcall(function()
			local gf = getGF()
			local mf = gf and gf:FindFirstChild(_lIillIIIl(_lIillIIIl("\181\229\242\5\20\19\46\61",173),173))
			if mf and not hooked[mf] then
				hooked[mf] = true
				tc(mf.ChildAdded:Connect(function(monster)
					if not monster then return end
					ShowEntityWarning(monster.Name)
					if S.AutoHideInLocker then hideInLockerNow(false) end
				end))
			end
		end)
		task.wait(3)
	end
end)

local ESP_COLORS = {
	monster = Color3.fromRGB(255, 60, 60), dweller = Color3.fromRGB(255, 150, 0),
	eyefest = Color3.fromRGB(170, 70, 255), squiddle = Color3.fromRGB(255, 220, 40),
	carnation = Color3.fromRGB(255, 120, 200), hazard = Color3.fromRGB(255, 100, 100),
	door = Color3.fromRGB(70, 200, 255), nextdoor = Color3.fromRGB(80, 255, 120),
	keycarddoor = Color3.fromRGB(255, 162, 66), locker = Color3.fromRGB(70, 255, 150),
	voidlocker = Color3.fromRGB(255, 40, 90), drawer = Color3.fromRGB(180, 255, 130),
	item = Color3.fromRGB(90, 170, 255), currency = Color3.fromRGB(255, 215, 0),
	keycard = Color3.fromRGB(255, 228, 72), refill = Color3.fromRGB(255, 188, 82),
	valve = Color3.fromRGB(112, 225, 190), repair = Color3.fromRGB(255, 142, 82),
	objective = Color3.fromRGB(180, 255, 130), other = Color3.fromRGB(150, 220, 255),
}

local function doorPassed(model, pos, myPos)
	if PassedDoors[model] then return true end
	if myPos and pos and (pos - myPos).Magnitude <= 7 then
		PassedDoors[model] = true
		return true
	end
	return false
end

local TagReg = {}
local function centerOffsetFor(adornee)
	if not adornee:IsA(_lIillIIIl(_lIillIIIl("\207\255\2\17\38",186),186)) then return Vector3.new(0, 0, 0) end
	local ok, boxCF = pcall(function() return (adornee:GetBoundingBox()) end)
	if not ok or not boxCF then return Vector3.new(0, 0, 0) end
	local ok2, pivot = pcall(function() return adornee:GetPivot() end)
	if not ok2 or not pivot then return Vector3.new(0, 0, 0) end
	return boxCF.Position - pivot.Position
end
local function mkEspTag(adornee, title, color, strong, style)
	local priority = style == _lIillIIIl(_lIillIIIl("\7\15\49\41\53\84\84",199),199) or style == _lIillIIIl(_lIillIIIl("\33\41\75\67\79\120\120\134\159\173\190",212),212)
	local bb = Instance.new(_lIillIIIl(_lIillIIIl("\18\71\88\112\116\143\143\174\174\159\219\221",225),225))
	bb.Name = _lIillIIIl(_lIillIIIl("\58\116\117\145\159\175\186\187\169\229\240\226\253\17",238),238)
	bb.Adornee = adornee; bb.AlwaysOnTop = true; bb.LightInfluence = 0
	bb.Size = UDim2.fromOffset(priority and 172 or 134, priority and 42 or 38)
	bb.StudsOffset = Vector3.new(0, 1.8, 0)
	bb.StudsOffsetWorldSpace = centerOffsetFor(adornee)
	bb.MaxDistance = S.ESPMaxDist or 1500
	bb.Parent = adornee

	local card = Instance.new(_lIillIIIl(_lIillIIIl("\84\142\139\165\171",0),0))
	card.Parent = bb; card.BackgroundColor3 = Color3.fromRGB(9, 9, 10); card.BackgroundTransparency = 0.22
	card.BorderSizePixel = 0; card.Size = UDim2.new(1, 0, 1, 0)
	Corner(card, 9); Stroke(card, color, 1.2, 0.25); Grad(card, Color3.fromRGB(26, 26, 28), Color3.fromRGB(9, 9, 10), 90)

	local dot = Instance.new(_lIillIIIl(_lIillIIIl("\110\168\165\191\197",13),13))
	dot.Parent = card; dot.AnchorPoint = Vector2.new(0, 0.5)
	dot.Position = UDim2.new(0, 8, 0.3, 0); dot.Size = UDim2.new(0, priority and 8 or 6, 0, priority and 8 or 6); dot.BackgroundColor3 = color
	Corner(dot, priority and 4 or 3)

	local tl = Instance.new(_lIillIIIl(_lIillIIIl("\150\181\214\224\198\233\248\9\30",26),26))
	tl.Parent = card; tl.BackgroundTransparency = 1
	tl.Position = UDim2.new(0, 18, 0, 2); tl.Size = UDim2.new(1, priority and -72 or -22, 0, 16)
	tl.Font = FM; tl.Text = title; tl.TextColor3 = T.White; tl.TextSize = 13
	tl.TextXAlignment = Enum.TextXAlignment.Left; tl.TextTruncate = Enum.TextTruncate.AtEnd
	if priority then
		local badge = Instance.new(_lIillIIIl(_lIillIIIl("\176\207\240\250\224\3\18\35\56",39),39))
		badge.Parent = card; badge.AnchorPoint = Vector2.new(1, 0)
		badge.Position = UDim2.new(1, -7, 0, 6); badge.Size = UDim2.fromOffset(48, 13)
		badge.BackgroundColor3 = color; badge.BackgroundTransparency = 0.72
		badge.BorderSizePixel = 0; badge.Font = FB; badge.TextSize = 8; badge.TextColor3 = color
		badge.Text = style == _lIillIIIl(_lIillIIIl("\225\233\11\3\15\46\46",52),52) and _lIillIIIl(_lIillIIIl("\224\231\239\5\232\43\52",65),65) or _lIillIIIl(_lIillIIIl("\235\251\9\25\53\67",78),78)
		Corner(badge, 4); Stroke(badge, color, 1, 0.25)
	end

	local distLbl = Instance.new(_lIillIIIl(_lIillIIIl("\24\55\88\98\72\107\122\139\160",91),91))
	distLbl.Parent = card; distLbl.BackgroundTransparency = 1
	distLbl.Position = UDim2.new(0, 18, 0, 19); distLbl.Size = UDim2.new(1, -22, 0, 14)
	distLbl.Font = F; distLbl.Text = ""; distLbl.TextColor3 = T.Tx2; distLbl.TextSize = 11
	distLbl.TextXAlignment = Enum.TextXAlignment.Left

	local sc = Instance.new(_lIillIIIl(_lIillIIIl("\51\53\77\107\119\144\151",104),104)); sc.Scale = 0.6; sc.Parent = card
	Tween(sc, 0.25, { Scale = 1 }, Enum.EasingStyle.Back):Play()

	local hl = Instance.new(_lIillIIIl(_lIillIIIl("\64\111\123\138\156\167\179\194\220",117),117))
	hl.Name = _lIillIIIl(_lIillIIIl("\98\146\147\175\189\205\216\217\199\3\14\244\6",130),130); hl.Adornee = adornee; hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	hl.OutlineColor = color; hl.FillColor = color
	hl.FillTransparency = strong and 0.55 or 0.9; hl.OutlineTransparency = strong and 0 or 0.15
	hl.Parent = adornee

	if strong then
		task.spawn(function()
			while hl.Parent do
				Tween(hl, 0.7, { FillTransparency = 0.8 }, Enum.EasingStyle.Sine):Play()
				task.wait(0.7)
				if not hl.Parent then break end
				Tween(hl, 0.7, { FillTransparency = 0.55 }, Enum.EasingStyle.Sine):Play()
				task.wait(0.7)
			end
		end)
	end

	return { bb = bb, hl = hl, distLbl = distLbl, title = tl, adornee = adornee, color = color, strong = strong, style = style }
end
local function destroyTag(obj)
	local e = TagReg[obj]
	if e then pcall(function() e.bb:Destroy() end); pcall(function() e.hl:Destroy() end) end
	TagReg[obj] = nil
end

task.spawn(function()
	while not S.Destroyed do
	pcall(function()
			local hrp = getHRP()
			local myPos = hrp and hrp.Position
			local wants = {}
			for door in pairs(PassedDoors) do
				if not door.Parent then PassedDoors[door] = nil end
			end

			local entKindOn = {
				monster = S.EntityESP, dweller = S.WallDwellerESP, eyefest = S.EyefestESP,
				squiddle = S.SquiddleESP, carnation = S.CarnationESP,
			}
			for _, e in ipairs(EntityCache) do
				if e.obj.Parent and entKindOn[e.kind] then
					local p = objPos(e.obj)
					if p then
						wants[e.obj] = { title = e.obj.Name, color = ESP_COLORS[e.kind], strong = true, d = myPos and (p - myPos).Magnitude or 0 }
					end
				end
			end

			local promptKindOn = {
				door = S.DoorESP, locker = S.LockerESP, drawer = S.DrawerESP,
				item = S.ItemESP, currency = S.KronerESP, hazard = S.HazardESP,
				keycard = S.KeycardESP, refill = S.ObjectiveESP, valve = S.ObjectiveESP,
				repair = S.ObjectiveESP, objective = S.ObjectiveESP, other = S.ItemESP,

				voidlocker = true,
			}
			local perKind = {}
			for _, e in ipairs(PromptCache) do

				local completedRepair = e.kind == _lIillIIIl(_lIillIIIl("\158\159\184\183\205\228",143),143) and isRepairComplete(e)
				if e.part.Parent and promptKindOn[e.kind] and not completedRepair and not (e.kind == _lIillIIIl(_lIillIIIl("\170\195\209\226",156),156) and isDeadEndDoor(e.model)) then
					local displayKind = e.kind
					if e.kind == _lIillIIIl(_lIillIIIl("\196\221\235\252",169),169) and isKeycardDoor(e) then displayKind = _lIillIIIl(_lIillIIIl("\229\237\15\7\19\50\50\64\89\113\130",182),182) end
					local d = myPos and (e.part.Position - myPos).Magnitude or 0
					if d <= math.min(S.ESPMaxDist or 1500, 500) then
						perKind[displayKind] = perKind[displayKind] or {}
						table.insert(perKind[displayKind], { e = e, d = d, displayKind = displayKind })
					end
				end
			end
			local KIND_CAP = {
				door = 6, keycarddoor = 6, locker = 8, voidlocker = 8, drawer = 10,
				item = 10, currency = 10, keycard = 6, hazard = 8, refill = 5,
				valve = 6, repair = 4, objective = 7, other = 6,
			}
			for kind, list in pairs(perKind) do
				table.sort(list, function(a, b) return a.d < b.d end)
				for i = 1, math.min(#list, KIND_CAP[kind] or 8) do
					local c = list[i]
					if not wants[c.e.model] then
						if c.e.kind == _lIillIIIl(_lIillIIIl("\248\17\31\48",195),195) and doorPassed(c.e.model, objPos(c.e.model) or c.e.part.Position, myPos) then

						else
							local displayKind = c.displayKind
							if c.e.kind == _lIillIIIl(_lIillIIIl("\18\43\57\74",208),208) and c.e.model:GetAttribute(_lIillIIIl(_lIillIIIl("\24\72\83\89\124\125\153\167\134\191\205\222",221),221)) then displayKind = _lIillIIIl(_lIillIIIl("\80\85\128\138\136\161\175\192",234),234) end
							local priority = displayKind == _lIillIIIl(_lIillIIIl("\113\121\155\147\159\190\190",247),247) or displayKind == _lIillIIIl(_lIillIIIl("\139\147\181\173\185\216\216\230\255\13\30",9),9)
								or displayKind == _lIillIIIl(_lIillIIIl("\168\173\206\216\214\239\253\14",22),22) or displayKind == _lIillIIIl(_lIillIIIl("\198\199\224\223\245\12",35),35) or displayKind == _lIillIIIl(_lIillIIIl("\228\221\246\14\11",48),48)
							wants[c.e.model] = {
								title = tagTitleFor(c.e), color = ESP_COLORS[displayKind] or ESP_COLORS[c.e.kind],
								strong = priority or c.e.kind == _lIillIIIl(_lIillIIIl("\240\247\30\19\50\50",61),61) or c.e.kind == _lIillIIIl(_lIillIIIl("\24\31\39\48\70\87\89\111\119\146",74),74),
								style = displayKind, d = c.d,
							}
						end
					end
				end
			end

			if S.DoorESP then
				local gf2 = getGF()
				local rooms = gf2 and gf2:FindFirstChild(_lIillIIIl(_lIillIIIl("\14\57\71\83\103",87),87))
				if rooms then
					for _, room in ipairs(rooms:GetChildren()) do
						for _, ch in ipairs(room:GetChildren()) do
							if ch:IsA(_lIillIIIl(_lIillIIIl("\35\83\86\101\122",100),100)) then
								local isNext = ch:GetAttribute(_lIillIIIl(_lIillIIIl("\64\112\123\129\154\155\183\197\164\221\235\252",113),113)) == true
								if isNext and not isDeadEndDoor(ch) then
									local p = objPos(ch)
									if p and not doorPassed(ch, p, myPos) then
										local d = (myPos and p) and (p - myPos).Magnitude or 0
										if d <= 500 then
											wants[ch] = { title = _lIillIIIl(_lIillIIIl("\88\93\126\136\98\162\173\187\199\168\212\226",126),126), color = ESP_COLORS.nextdoor, strong = true, style = _lIillIIIl(_lIillIIIl("\146\151\184\194\192\217\231\248",139),139), d = d }
										end
									end
								end
							end
						end
					end
				end
			end

			local ordered = {}
			for obj, w in pairs(wants) do ordered[#ordered + 1] = { obj = obj, w = w } end
			table.sort(ordered, function(a, b)
				if a.w.strong ~= b.w.strong then return a.w.strong end
				return a.w.d < b.w.d
			end)
			local allowHL = {}
			for i, it in ipairs(ordered) do if i <= 26 then allowHL[it.obj] = true end end

			for obj in pairs(TagReg) do if not wants[obj] or not obj.Parent then destroyTag(obj) end end
			for obj, w in pairs(wants) do
				local e = TagReg[obj]
				if not e or not e.bb.Parent or e.style ~= w.style then
					if e then destroyTag(obj) end
					TagReg[obj] = mkEspTag(obj, w.title, w.color, w.strong, w.style)
					e = TagReg[obj]
				end
				if e.title.Text ~= w.title then e.title.Text = w.title end
				local wantHLT = allowHL[obj] and (w.strong and 0.55 or 0.9) or 1
				local wantOLT = allowHL[obj] and (w.strong and 0 or 0.15) or 1
				if e.hl and e.hl.Parent then e.hl.FillTransparency = wantHLT; e.hl.OutlineTransparency = wantOLT end
			end
		end)
		task.wait(0.4)
	end
end)

task.spawn(function()
	while not S.Destroyed do
		pcall(function()
			local hrp = getHRP()
			local myPos = hrp and hrp.Position
			for obj, e in pairs(TagReg) do
				if not obj.Parent then destroyTag(obj)
				elseif myPos then
					local p = objPos(obj)
					if p then e.distLbl.Text = math.floor((p - myPos).Magnitude + 0.5) .. _lIillIIIl(_lIillIIIl("\171",152),152) end
				end
			end
		end)
		task.wait(0.15)
	end
end)

task.spawn(function()
	while not S.Destroyed do
		if (S.AutoOpenDoors or S.AutoCollectItems or S.AutoSearchDrawers or S.AutoCollectKeys
			or S.AutoRefillBatteries or S.AutoTurnValves or S.AutoDisarmLandmines) and fireproximityprompt then
			pcall(function()
				local hrp = getHRP(); if not hrp then return end
				local myPos = hrp.Position
				for _, e in ipairs(PromptCache) do
					if e.prompt.Parent and e.part.Parent then
						local d = (e.part.Position - myPos).Magnitude
						if S.AutoOpenDoors and e.kind == _lIillIIIl(_lIillIIIl("\188\213\227\244",165),165) and not isDeadEndDoor(e.model) and d <= 12 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoCollectItems and (e.kind == _lIillIIIl(_lIillIIIl("\213\245\0\14\15\38\41\77",178),178) or e.kind == _lIillIIIl(_lIillIIIl("\245\14\13\35",191),191)) and d <= 18 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoSearchDrawers and e.kind == _lIillIIIl(_lIillIIIl("\10\38\35\71\67\94",204),204) and d <= 10 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoCollectKeys and e.kind == _lIillIIIl(_lIillIIIl("\43\51\85\77\99\130\130",217),217) and d <= 18 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoRefillBatteries and e.kind == _lIillIIIl(_lIillIIIl("\76\77\102\119\136\150",230),230) and d <= 7 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoTurnValves and e.kind == _lIillIIIl(_lIillIIIl("\106\109\134\158\155",243),243) and d <= 5 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoDisarmLandmines and e.interactionType == _lIillIIIl(_lIillIIIl("\100\135\162\166\189\199\218\223",5),5) and d <= 5.5 then pcall(fireproximityprompt, e.prompt)
						end

					end
				end
			end)
		end
		task.wait(0.4)
	end
end)

local autoRepair = { root = nil, event = nil, lastStart = 0, lastTick = 0 }
S._stopAutoRepair = function()
	if autoRepair.event and autoRepair.event.Parent then
		pcall(function() autoRepair.event:FireServer(false, true) end)
	end
	autoRepair.root, autoRepair.event, autoRepair.lastStart, autoRepair.lastTick = nil, nil, 0, 0
end
task.spawn(function()
	while not S.Destroyed do
		pcall(function()
			if not S.AutoRepairGenerators then
				if autoRepair.root then S._stopAutoRepair() end
				return
			end
			local hrp = getHRP(); if not hrp then return end
			local myPos = hrp.Position
			local target
			for _, e in ipairs(PromptCache) do
				if e.kind == _lIillIIIl(_lIillIIIl("\164\165\190\189\211\234",18),18) and e.interactionRoot and e.interactionRoot.Parent and e.part.Parent then
					local fixed = e.interactionRoot:FindFirstChild(_lIillIIIl(_lIillIIIl("\146\195\224\219\232",31),31))
					if fixed and tonumber(fixed.Value) and fixed.Value < 100 and (e.part.Position - myPos).Magnitude <= 5.25 then
						target = e
						break
					end
				end
			end
			if not target then return end

			local root = target.interactionRoot
			local remoteFunction = root:FindFirstChild(_lIillIIIl(_lIillIIIl("\184\217\239\255\18\17\0\61\68\71\102\105\125\138",44),44))
			local remoteEvent = root:FindFirstChild(_lIillIIIl(_lIillIIIl("\210\243\9\25\44\43\25\88\85\108\128",57),57))
			if not (remoteFunction and remoteFunction:IsA(_lIillIIIl(_lIillIIIl("\236\13\35\51\70\69\52\113\120\123\154\157\177\190",70),70)) and remoteEvent and remoteEvent:IsA(_lIillIIIl(_lIillIIIl("\6\39\61\77\96\95\77\140\137\160\180",83),83))) then return end
			local now = os.clock()
			if autoRepair.root and autoRepair.root ~= root then
				S._stopAutoRepair()
			end
			if autoRepair.root ~= root then
				if now - autoRepair.lastStart < 1 then return end
				autoRepair.lastStart = now
				local ok, accepted = pcall(function() return remoteFunction:InvokeServer() end)
				if not (ok and accepted == true) then return end
				autoRepair.root, autoRepair.event, autoRepair.lastTick = root, remoteEvent, 0
			end
			if now - autoRepair.lastTick >= 0.36 then
				autoRepair.lastTick = now
				pcall(function() remoteEvent:FireServer(true) end)
			end
		end)
		task.wait(0.12)
	end
end)

local ESPGui = Instance.new(_lIillIIIl(_lIillIIIl("\33\63\92\93\107\130\105\165\167",96),96))
ESPGui.Name = _lIillIIIl(_lIillIIIl("\56\104\105\133\147\163\174\175\157\185\196",109),109); ESPGui.ResetOnSpawn = false; ESPGui.IgnoreGuiInset = true; ESPGui.DisplayOrder = 950
pcall(function() ESPGui.Parent = uiP end)
table.insert(UIStyle.Roots, ESPGui)
SG.Destroying:Connect(function() pcall(function() ESPGui:Destroy() end) end)

local KeycardTracer = Instance.new(_lIillIIIl(_lIillIIIl("\72\130\127\153\159",122),122))
KeycardTracer.BorderSizePixel = 0
KeycardTracer.AnchorPoint = Vector2.new(0.5, 0.5)
KeycardTracer.Size = UDim2.new(0, 2, 0, 0)
KeycardTracer.BackgroundColor3 = ESP_COLORS.keycard
KeycardTracer.BackgroundTransparency = 0.03
KeycardTracer.Visible = false
KeycardTracer.Parent = ESPGui
Corner(KeycardTracer, 1)

local KeycardBeacon = Instance.new(_lIillIIIl(_lIillIIIl("\112\143\176\186\160\195\210\227\248",135),135))
KeycardBeacon.Name = _lIillIIIl(_lIillIIIl("\134\182\183\211\225\241\252\253\241\25\59\51\63\94\104\84\133\143\159\185\198",148),148)
KeycardBeacon.AnchorPoint = Vector2.new(0.5, 1)
KeycardBeacon.Size = UDim2.fromOffset(138, 24)
KeycardBeacon.BackgroundColor3 = Color3.fromRGB(24, 19, 7)
KeycardBeacon.BackgroundTransparency = 0.12
KeycardBeacon.BorderSizePixel = 0
KeycardBeacon.Font = FB
KeycardBeacon.TextSize = 11
KeycardBeacon.TextColor3 = ESP_COLORS.keycard
KeycardBeacon.Text = _lIillIIIl(_lIillIIIl("\155\163\197\189\201\232\232",161),161)
KeycardBeacon.Visible = false
KeycardBeacon.Parent = ESPGui
Corner(KeycardBeacon, 7)
Stroke(KeycardBeacon, ESP_COLORS.keycard, 1, 0.15)

local NextDoorTracer = Instance.new(_lIillIIIl(_lIillIIIl("\176\234\231\1\7",174),174))
NextDoorTracer.Name = _lIillIIIl(_lIillIIIl("\212\4\5\33\47\63\74\75\66\113\146\156\122\179\193\210\197\221\3\8\21\29\48\68",187),187)
NextDoorTracer.BorderSizePixel = 0
NextDoorTracer.AnchorPoint = Vector2.new(0.5, 0.5)
NextDoorTracer.Size = UDim2.new(0, 2, 0, 0)
NextDoorTracer.BackgroundColor3 = ESP_COLORS.nextdoor
NextDoorTracer.BackgroundTransparency = 0.05
NextDoorTracer.Visible = false
NextDoorTracer.Parent = ESPGui
Corner(NextDoorTracer, 1)

local StatusHUD = Instance.new(_lIillIIIl(_lIillIIIl("\228\30\27\53\59",200),200))
StatusHUD.Name = _lIillIIIl(_lIillIIIl("\8\56\57\85\99\125\136\137\133\180\175\208\223\235\206\233\230",213),213)
StatusHUD:SetAttribute(_lIillIIIl(_lIillIIIl("\37\67\79\114\117\132\156\163\148\175\172",226),226), true)
StatusHUD.AnchorPoint = Vector2.new(0, 1)
StatusHUD.Position = UDim2.new(0, 18, 1, -20)
StatusHUD.Size = UDim2.fromOffset(214, 104)
StatusHUD.BackgroundColor3 = T.Card
StatusHUD.BackgroundTransparency = 0.01
StatusHUD.BorderSizePixel = 0
StatusHUD.Visible = false
StatusHUD.Parent = ESPGui
Corner(StatusHUD, 11)
Stroke(StatusHUD, T.Bd2, 1, 0.22)
Shadow(StatusHUD, 0.76)
do
local statusSurface = Grad(StatusHUD, T.White:Lerp(T.Accent, 0.12), T.White:Lerp(T.Elev, 0.08), 90)
statusSurface.Name = _lIillIIIl(_lIillIIIl("\52\89\86\115\163\174\176\185\201\217\201\2\255\16\35\45\68\88",239),239)
local statusTop = Instance.new(_lIillIIIl(_lIillIIIl("\86\144\141\167\173",1),1))
statusTop.Parent = StatusHUD; statusTop.Size = UDim2.new(1, 0, 0, 28)
statusTop.BackgroundColor3 = T.Elev; statusTop.BackgroundTransparency = 0.025; statusTop.BorderSizePixel = 0
Corner(statusTop, 10)
local statusHeaderGradient = Grad(statusTop, T.White:Lerp(T.Accent, 0.14), T.White:Lerp(T.Card, 0.06), 0)
statusHeaderGradient.Name = _lIillIIIl(_lIillIIIl("\114\141\138\156\199\209\226\241\12\239\40\37\54\73\83\106\126",14),14)
local statusTopLine = Instance.new(_lIillIIIl(_lIillIIIl("\138\196\193\219\225",27),27))
statusTopLine.Parent = statusTop; statusTopLine.AnchorPoint = Vector2.new(0, 1)
statusTopLine.Position = UDim2.new(0, 0, 1, 0); statusTopLine.Size = UDim2.new(1, 0, 0, 1)
statusTopLine.BackgroundColor3 = T.Bd; statusTopLine.BackgroundTransparency = 0.2; statusTopLine.BorderSizePixel = 0
local statusTick = Instance.new(_lIillIIIl(_lIillIIIl("\164\222\219\245\251",40),40))
statusTick.Parent = statusTop; statusTick.Position = UDim2.new(0, 8, 0.5, -6); statusTick.Size = UDim2.fromOffset(2, 12)
statusTick.BackgroundColor3 = T.Accent; statusTick.BorderSizePixel = 0; Corner(statusTick, 2)

local statusHeader = Instance.new(_lIillIIIl(_lIillIIIl("\204\235\12\22\252\31\46\63\84",53),53))
statusHeader.Parent = statusTop; statusHeader.BackgroundTransparency = 1
statusHeader.Position = UDim2.fromOffset(16, 0); statusHeader.Size = UDim2.new(1, -24, 1, 0)
statusHeader.Font = FB; statusHeader.TextSize = 11; statusHeader.TextColor3 = T.Tx
statusHeader.TextXAlignment = Enum.TextXAlignment.Left; statusHeader.Text = _lIillIIIl(_lIillIIIl("\218\225\242\253\22\248\21\35\34\102\103\128\123\148\169",66),66)
end

local statusRoom = Instance.new(_lIillIIIl(_lIillIIIl("\0\31\64\74\48\83\98\115\136",79),79))
statusRoom.Parent = StatusHUD; statusRoom.BackgroundTransparency = 1
statusRoom.Position = UDim2.fromOffset(12, 31); statusRoom.Size = UDim2.new(1, -24, 0, 16)
statusRoom.Font = FM; statusRoom.TextSize = 12; statusRoom.TextColor3 = T.White
statusRoom.TextXAlignment = Enum.TextXAlignment.Left; statusRoom.Text = _lIillIIIl(_lIillIIIl("\24\35\49\61\30\238\154\188",92),92)

local function mkVitalRow(parent, label, y)
	local text = Instance.new(_lIillIIIl(_lIillIIIl("\52\83\116\126\100\135\150\167\188",105),105))
	text.Parent = parent; text.BackgroundTransparency = 1
	text.Position = UDim2.fromOffset(12, y); text.Size = UDim2.new(1, -24, 0, 14)
	text.Font = F; text.TextSize = 11; text.TextColor3 = T.Tx2; text.TextXAlignment = Enum.TextXAlignment.Left
	local back = Instance.new(_lIillIIIl(_lIillIIIl("\64\122\119\145\151",118),118))
	back.Parent = parent; back.Position = UDim2.fromOffset(12, y + 16); back.Size = UDim2.new(1, -24, 0, 4)
	back.BackgroundColor3 = T.Bd2; back.BorderSizePixel = 0; Corner(back, 2)
	local fill = Instance.new(_lIillIIIl(_lIillIIIl("\90\148\145\171\177",131),131))
	fill.Parent = back; fill.Size = UDim2.new(1, 0, 1, 0); fill.BackgroundColor3 = T.Tx
	fill.BorderSizePixel = 0; Corner(fill, 2)
	return text, fill
end
local oxygenText, oxygenFill = mkVitalRow(StatusHUD, "", 49)
local healthText, healthFill = mkVitalRow(StatusHUD, "", 73)

local KeybindHUD = Instance.new(_lIillIIIl(_lIillIIIl("\116\174\171\197\203",144),144))
KeybindHUD.Name = _lIillIIIl(_lIillIIIl("\152\200\201\229\243\3\14\15\3\43\77\68\89\118\122\108\135\132",157),157)
KeybindHUD:SetAttribute(_lIillIIIl(_lIillIIIl("\181\211\223\248\251\10\34\41\26\53\50",170),170), true)
KeybindHUD.AnchorPoint = Vector2.new(0, 1)
KeybindHUD.Position = UDim2.new(0, 18, 1, -20)
KeybindHUD.Size = UDim2.fromOffset(228, 30)
KeybindHUD.BackgroundColor3 = T.Card
KeybindHUD.BackgroundTransparency = 0.01
KeybindHUD.BorderSizePixel = 0
KeybindHUD.Visible = false
KeybindHUD.Parent = ESPGui
Corner(KeybindHUD, 11)
Stroke(KeybindHUD, T.Bd2, 1, 0.22)
Shadow(KeybindHUD, 0.76)
do
local keybindSurface = Grad(KeybindHUD, T.White:Lerp(T.Accent, 0.12), T.White:Lerp(T.Elev, 0.08), 90)
keybindSurface.Name = _lIillIIIl(_lIillIIIl("\196\223\220\249\41\52\54\63\79\105\89\146\143\160\179\189\212\232",183),183)
local keybindTop = Instance.new(_lIillIIIl(_lIillIIIl("\220\22\19\45\51",196),196))
keybindTop.Parent = KeybindHUD; keybindTop.Size = UDim2.new(1, 0, 0, 28)
keybindTop.BackgroundColor3 = T.Elev; keybindTop.BackgroundTransparency = 0.025; keybindTop.BorderSizePixel = 0
Corner(keybindTop, 10)
local keybindHeaderGradient = Grad(keybindTop, T.White:Lerp(T.Accent, 0.14), T.White:Lerp(T.Card, 0.06), 0)
keybindHeaderGradient.Name = _lIillIIIl(_lIillIIIl("\248\19\16\34\77\97\114\129\156\127\184\181\198\217\227\250\14",209),209)
local keybindTopLine = Instance.new(_lIillIIIl(_lIillIIIl("\16\74\71\97\113",222),222))
keybindTopLine.Parent = keybindTop; keybindTopLine.AnchorPoint = Vector2.new(0, 1)
keybindTopLine.Position = UDim2.new(0, 0, 1, 0); keybindTopLine.Size = UDim2.new(1, 0, 0, 1)
keybindTopLine.BackgroundColor3 = T.Bd; keybindTopLine.BackgroundTransparency = 0.2; keybindTopLine.BorderSizePixel = 0
local keybindTick = Instance.new(_lIillIIIl(_lIillIIIl("\42\100\107\133\139",235),235))
keybindTick.Parent = keybindTop; keybindTick.Position = UDim2.new(0, 8, 0.5, -6); keybindTick.Size = UDim2.fromOffset(2, 12)
keybindTick.BackgroundColor3 = T.Accent; keybindTick.BorderSizePixel = 0; Corner(keybindTick, 2)

local keybindTitle = Instance.new(_lIillIIIl(_lIillIIIl("\92\123\156\166\140\175\190\207\228",248),248))
keybindTitle.Parent = keybindTop; keybindTitle.BackgroundTransparency = 1
keybindTitle.Position = UDim2.fromOffset(16, 0); keybindTitle.Size = UDim2.new(1, -24, 1, 0)
keybindTitle.Font = FB; keybindTitle.TextSize = 11; keybindTitle.TextColor3 = T.Tx
keybindTitle.TextXAlignment = Enum.TextXAlignment.Left; keybindTitle.Text = _lIillIIIl(_lIillIIIl("\109\117\151\142\163\182\186\215",10),10)
end

local KeybindRows = {}
local function getKeybindRow(index)
	local row = KeybindRows[index]
	if row then return row end
	row = Instance.new(_lIillIIIl(_lIillIIIl("\130\188\185\211\217",23),23))
	row.Name = _lIillIIIl(_lIillIIIl("\152\205\224\228\224\11\33",36),36); row.Parent = KeybindHUD
	row.BackgroundColor3 = T.Elev; row.BackgroundTransparency = 0.38
	row.BorderSizePixel = 0; row.Size = UDim2.new(1, -16, 0, 18)
	Corner(row, 5)
	local label = Instance.new(_lIillIIIl(_lIillIIIl("\196\227\4\14\244\23\38\55\76",49),49))
	label.Name = _lIillIIIl(_lIillIIIl("\214\249\8\25\46",62),62); label.Parent = row; label.BackgroundTransparency = 1
	label.Position = UDim2.fromOffset(7, 0); label.Size = UDim2.new(1, -66, 1, 0)
	label.Font = F; label.TextSize = 11; label.TextColor3 = T.Tx2
	label.TextXAlignment = Enum.TextXAlignment.Left; label.TextTruncate = Enum.TextTruncate.AtEnd
	local key = Instance.new(_lIillIIIl(_lIillIIIl("\248\23\56\66\40\75\90\107\128",75),75))
	key.Name = _lIillIIIl(_lIillIIIl("\9\49\83",88),88); key.Parent = row; key.BackgroundTransparency = 1
	key.AnchorPoint = Vector2.new(1, 0); key.Position = UDim2.new(1, -7, 0, 0)
	key.Size = UDim2.fromOffset(54, 18); key.Font = FM; key.TextSize = 10
	key.TextColor3 = T.White; key.TextXAlignment = Enum.TextXAlignment.Right; key.TextTruncate = Enum.TextTruncate.AtEnd
	KeybindRows[index] = row
	return row
end

S._refreshKeybindHUD = function()
	S._bindHUDDirty = false

	if MOBILE then KeybindHUD.Visible = false; return end
	local entries = {}
	for id, entry in pairs(S._bindRegistry or {}) do
		local token = S.Keybinds[id]
		if token then
			local show = entry.kind ~= _lIillIIIl(_lIillIIIl("\76\85\91\105\124\131",101),101)
			if entry.kind == _lIillIIIl(_lIillIIIl("\102\111\117\131\150\157",114),114) and entry.isActive then
				local ok, active = pcall(entry.isActive)
				show = ok and active == true
			end
			if show then table.insert(entries, { entry = entry, token = token }) end
		end
	end
	table.sort(entries, function(a, b) return a.entry.label < b.entry.label end)
	KeybindHUD.Visible = S.KeybindHUD == true and #entries > 0
	if not KeybindHUD.Visible then return end
	local height = 36 + (#entries * 23)
	KeybindHUD.Size = UDim2.fromOffset(228, height)
	local statusOffset = S.StatusHUD and (math.floor(104 * S.HUDScale + 0.5) + 10) or 0
	KeybindHUD.Position = UDim2.new(0, 18, 1, -20 - statusOffset)
	for i, data in ipairs(entries) do
		local row = getKeybindRow(i)
		row.Position = UDim2.new(0, 8, 0, 32 + ((i - 1) * 23))
		row.Visible = true
		row.Label.Text = string.upper(data.entry.label)
		row.Key.Text = S._bindTokenTitle(data.token)
		row.Label.TextColor3 = data.entry.kind == _lIillIIIl(_lIillIIIl("\128\137\143\157\176\183",127),127) and T.White or T.Tx2
		row.Key.TextColor3 = data.entry.kind == _lIillIIIl(_lIillIIIl("\154\163\169\183\202\209",140),140) and T.Accent or T.Tx
	end
	for i = #entries + 1, #KeybindRows do KeybindRows[i].Visible = false end
end
UIStyle:ApplyHUDScale(S.HUDScale)
S._markKeybindHUDDirty()

do
	local island = Instance.new(_lIillIIIl(_lIillIIIl("\134\192\189\215\221",153),153))
	island.Name = _lIillIIIl(_lIillIIIl("\170\218\219\247\5\21\32\33\14\81\84\85\121\131\139\127\183\190\193\220\224",166),166)
	island:SetAttribute(_lIillIIIl(_lIillIIIl("\199\229\241\10\13\28\52\59\44\71\78",179),179), true)
	island.AnchorPoint = Vector2.new(0.5, 0)
	island.Position = UDim2.new(0.5, 0, 0, 12)
	island.Size = UDim2.fromOffset(382, 46)
	island.BackgroundColor3 = T.Sidebar
	island.BackgroundTransparency = 0.008
	island.BorderSizePixel = 0
	island.Visible = false
	island.Parent = ESPGui
	Corner(island, 15)
	Stroke(island, T.Bd2, 1, 0.18)
	Shadow(island, 0.82)
	local islandGrad = Grad(island, T.White:Lerp(T.Accent, 0.14), T.White:Lerp(T.Card, 0.08), 0)
	islandGrad.Name = _lIillIIIl(_lIillIIIl("\210\21\24\25\51\61\69\57\123\130\133\160\164\149\206\203\220\239\249\16\36",192),192)
	local islandScale = Instance.new(_lIillIIIl(_lIillIIIl("\253\255\23\53\65\90\107",205),205))
	islandScale.Name = _lIillIIIl(_lIillIIIl("\10\37\34\65\119\119\146\129\159\171\196\203",218),218); islandScale.Scale = S.HUDScale; islandScale.Parent = island
	local iDot = Instance.new(_lIillIIIl(_lIillIIIl("\34\92\99\125\131",231),231))
	iDot.Parent = island
	iDot.AnchorPoint = Vector2.new(0, 0.5)
	iDot.Position = UDim2.new(0, 13, 0.5, 0)
	iDot.Size = UDim2.fromOffset(6, 6)
	iDot.BackgroundColor3 = T.Accent
	iDot.BackgroundTransparency = 0.05
	iDot.BorderSizePixel = 0
	Corner(iDot, 4)
	local iBrand = Instance.new(_lIillIIIl(_lIillIIIl("\84\115\148\158\132\167\182\199\220",244),244))
	iBrand.Parent = island
	iBrand.Position = UDim2.new(0, 26, 0, 0)
	iBrand.Size = UDim2.new(0, 72, 1, 0)
	iBrand.BackgroundTransparency = 1
	iBrand.Font = FB
	iBrand.TextSize = 12
	iBrand.TextColor3 = T.White
	iBrand.TextYAlignment = Enum.TextYAlignment.Center
	iBrand.TextXAlignment = Enum.TextXAlignment.Left
	iBrand.Text = _lIillIIIl(_lIillIIIl("\99\118\123\150\166\169\175",6),6)
	local iDiv = Instance.new(_lIillIIIl(_lIillIIIl("\122\180\177\203\209",19),19))
	iDiv.Parent = island
	iDiv.Position = UDim2.new(0, 104, 0.5, -12)
	iDiv.Size = UDim2.fromOffset(1, 24)
	iDiv.BackgroundColor3 = T.Bd2
	iDiv.BackgroundTransparency = 0.28
	iDiv.BorderSizePixel = 0
	local function islandMetric(x, width, caption)
		local key = Instance.new(_lIillIIIl(_lIillIIIl("\162\193\226\236\210\245\4\21\42",32),32))
		key.Parent = island
		key.Position = UDim2.fromOffset(x, 6)
		key.Size = UDim2.fromOffset(width, 12)
		key.BackgroundTransparency = 1
		key.Font = FB
		key.TextSize = 10
		key.TextColor3 = T.Tx3
		key.TextXAlignment = Enum.TextXAlignment.Left
		key.Text = caption
		local value = Instance.new(_lIillIIIl(_lIillIIIl("\188\219\252\6\236\15\30\47\68",45),45))
		value.Parent = island
		value.Position = UDim2.fromOffset(x, 19)
		value.Size = UDim2.fromOffset(width, 20)
		value.BackgroundTransparency = 1
		value.Font = FM
		value.TextSize = 13
		value.TextColor3 = T.Tx
		value.TextXAlignment = Enum.TextXAlignment.Left
		value.TextTruncate = Enum.TextTruncate.AtEnd
		value.Text = _lIillIIIl(_lIillIIIl("\100\16\50",58),58)
		return value
	end
	local iO2 = islandMetric(116, 60, _lIillIIIl(_lIillIIIl("\235\220",71),71))
	local iPing = islandMetric(190, 52, _lIillIIIl(_lIillIIIl("\6\13\32\39",84),84))
	local iFps = islandMetric(250, 44, _lIillIIIl(_lIillIIIl("\22\46\63",97),97))
	local iTime = islandMetric(302, 60, _lIillIIIl(_lIillIIIl("\62\65\83\89",110),110))

	S._islandPoint = function()
		local vp = cam() and cam().ViewportSize
		if not vp or vp.X <= 0 or vp.Y <= 0 or not island.Parent then
			return UDim2.new(0.5, 0, 0, 34)
		end
		local centre = island.AbsolutePosition + island.AbsoluteSize / 2
		return UDim2.fromScale(math.clamp(centre.X / vp.X, 0, 1), math.clamp(centre.Y / vp.Y, 0, 1))
	end

	if MOBILE then
		local function fitIsland()
			local vp = cam() and cam().ViewportSize
			if not vp or vp.X < 1 then return end
			island:SetAttribute(_lIillIIIl(_lIillIIIl("\81\129\130\151\168\175\158\207\232",123),123), math.clamp((vp.X - 32) / 420, 0.40, 0.65))
			islandScale.Scale = S.HUDScale * (tonumber(island:GetAttribute(_lIillIIIl(_lIillIIIl("\107\155\156\177\194\201\184\233\2",136),136))) or 1)
		end
		fitIsland()
		tc(cam():GetPropertyChangedSignal(_lIillIIIl(_lIillIIIl("\142\175\185\217\224\237\254\14\251\31\62\55",149),149)):Connect(fitIsland))
	end

	S._islandGulp = function(outward)
		if not island.Visible then return end

		local base = S.HUDScale * (tonumber(island:GetAttribute(_lIillIIIl(_lIillIIIl("\159\207\208\229\246\253\236\29\54",162),162))) or 1)

		Tween(islandScale, 0.12, { Scale = base * (outward and 1.1 or 0.9) }, Enum.EasingStyle.Quad):Play()
		task.delay(0.12, function()
			if island.Parent then Tween(islandScale, 0.22, { Scale = base }, Enum.EasingStyle.Back):Play() end
		end)
	end

	local islandStart = os.time()

	local fpsMeter = { frames = 0, elapsed = 0, value = 0 }
	tc(RunService.RenderStepped:Connect(function(dt)
		fpsMeter.frames += 1
		fpsMeter.elapsed += dt
		if fpsMeter.elapsed >= 0.5 then
			fpsMeter.value = math.floor((fpsMeter.frames / fpsMeter.elapsed) + 0.5)
			fpsMeter.frames, fpsMeter.elapsed = 0, 0
		end
	end))
	task.spawn(function()
		while island.Parent do
			island.Visible = S.DynamicIsland == true
			if island.Visible then
				local m = getMain(); local ox = m and m.OxygenTank
				local tank = type(ox) == _lIillIIIl(_lIillIIIl("\224\219\234\2\9",175),175) and ox.TankValue or nil
				local oxygen = tank and tonumber(tank.Value) or nil
				iO2.Text = oxygen and (tostring(math.floor(oxygen + 0.5)) .. _lIillIIIl(_lIillIIIl("\171",188),188)) or _lIillIIIl(_lIillIIIl("\130\46\80",201),201)
				local lowO2 = oxygen and oxygen <= 25
				iO2.TextColor3 = lowO2 and Color3.fromRGB(255, 180, 75) or T.Tx
				iDot.BackgroundColor3 = lowO2 and Color3.fromRGB(255, 180, 75) or T.Accent
				local ping = math.floor((LP:GetNetworkPing() or 0) * 1000 + 0.5)
				iPing.Text = ping .. _lIillIIIl(_lIillIIIl("\39\59",214),214)
				iFps.Text = tostring(fpsMeter.value)
				local elapsed = os.time() - islandStart
				if elapsed >= 3600 then
					iTime.Text = string.format(_lIillIIIl(_lIillIIIl("\249\18\34\108\80\73\98\114\178",227),227), math.floor(elapsed / 3600), math.floor((elapsed % 3600) / 60))
				else
					iTime.Text = string.format(_lIillIIIl(_lIillIIIl("\19\54\70\134\106\99\124\140\204",240),240), math.floor(elapsed / 60), elapsed % 60)
				end
			end
			task.wait(0.25)
		end
	end)
end

local ThreatArrowPool = {}
local function getThreatArrow(index)
	local entry = ThreatArrowPool[index]
	if entry then return entry end
	local holder = Instance.new(_lIillIIIl(_lIillIIIl("\88\146\143\169\175",2),2))
	holder.Name = _lIillIIIl(_lIillIIIl("\124\172\173\201\215\231\242\243\240\18\42\43\53\86\49\112\126\137\159",15),15)
	holder.AnchorPoint = Vector2.new(0.5, 0.5)
	holder.Size = UDim2.fromOffset(96, 46)
	holder.BackgroundTransparency = 1
	holder.Visible = false
	holder.Parent = ESPGui
	local arrow = Instance.new(_lIillIIIl(_lIillIIIl("\154\185\218\228\202\237\252\13\34",28),28))
	arrow.Parent = holder; arrow.BackgroundTransparency = 1
	arrow.AnchorPoint = Vector2.new(0.5, 0.5); arrow.Position = UDim2.fromOffset(48, 12)
	arrow.Size = UDim2.fromOffset(24, 24); arrow.Font = FB; arrow.TextSize = 20
	arrow.Text = _lIillIIIl(_lIillIIIl("\66\4\46",41),41); arrow.TextColor3 = Color3.fromRGB(255, 85, 85)
	local label = Instance.new(_lIillIIIl(_lIillIIIl("\206\237\14\24\254\33\48\65\86",54),54))
	label.Parent = holder; label.BackgroundTransparency = 1
	label.Position = UDim2.fromOffset(0, 25); label.Size = UDim2.new(1, 0, 0, 16)
	label.Font = FB; label.TextSize = 10; label.TextColor3 = T.White
	label.TextTruncate = Enum.TextTruncate.AtEnd; label.TextXAlignment = Enum.TextXAlignment.Center
	entry = { holder = holder, arrow = arrow, label = label }
	ThreatArrowPool[index] = entry
	return entry
end

local CHAM_FILL = Color3.fromRGB(104, 222, 196)
local CHAM_OUTLINE = Color3.fromRGB(218, 255, 244)
local function clearTeammateCham(plr)
	local entry = TeammateChamReg[plr]
	if entry then
		pcall(function() if entry.model then entry.model:Destroy() end end)
		TeammateChamReg[plr] = nil
	end
	local ch = plr and plr.Character
	local legacy = ch and ch:FindFirstChild(_lIillIIIl(_lIillIIIl("\228\20\21\49\63\79\90\91\84\126\129\167\161\188\155\206\213\239",67),67))
	if legacy then pcall(function() legacy:Destroy() end) end
end

local function createTeammateCham(plr, ch)
	local proxy = Instance.new(_lIillIIIl(_lIillIIIl("\251\43\46\61\82",80),80))
	proxy.Name = _lIillIIIl(_lIillIIIl("\24\72\73\101\115\131\142\143\140\171\181\207\221\223\0\255\235\30\37\63",93),93)
	local links = {}
	for _, source in ipairs(ch:GetDescendants()) do
		if source:IsA(_lIillIIIl(_lIillIIIl("\36\81\113\113\106\137\168\184",106),106)) and source.Name ~= _lIillIIIl(_lIillIIIl("\68\127\133\135\162\177\185\194\190\233\247\10\244\19\50\66",119),119) then
			local ok, copy = pcall(function() return source:Clone() end)
			if ok and copy and copy:IsA(_lIillIIIl(_lIillIIIl("\88\133\165\165\158\189\220\236",132),132)) then

				for _, child in ipairs(copy:GetChildren()) do
					if not (child:IsA(_lIillIIIl(_lIillIIIl("\131\174\177\189\209\215\240\223\5\33\36",145),145)) or child:IsA(_lIillIIIl(_lIillIIIl("\142\189\201\213\238",158),158)) or child:IsA(_lIillIIIl(_lIillIIIl("\184\215\248\2\17\28\29",171),171))) then
						child:Destroy()
					end
				end
				copy.Name = source.Name
				copy.Anchored = true; copy.CanCollide = false; copy.CanTouch = false; copy.CanQuery = false
				copy.CastShadow = false; copy.Massless = true
				copy.Material = Enum.Material.ForceField
				copy.Color = CHAM_FILL; copy.Transparency = 0.38; copy.LocalTransparencyModifier = 0
				copy.CFrame = source.CFrame
				copy.Parent = proxy
				links[source] = copy
			end
		end
	end
	local hl = Instance.new(_lIillIIIl(_lIillIIIl("\198\245\1\16\34\45\57\72\98",184),184))
	hl.Name = _lIillIIIl(_lIillIIIl("\232\24\25\53\67\83\94\105\98\140\143\181\175\202\169\220\227\253",197),197); hl.Adornee = proxy; hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	hl.FillColor = CHAM_FILL; hl.OutlineColor = CHAM_OUTLINE
	hl.FillTransparency = 0.88; hl.OutlineTransparency = 0.03; hl.Parent = proxy
	proxy.Parent = Workspace
	TeammateChamReg[plr] = { model = proxy, character = ch, links = links }
	return TeammateChamReg[plr]
end

local function setPlayerChams()
	for plr in pairs(TeammateChamReg) do
		if plr.Parent ~= Players or not S.PlayerChams or plr.Character ~= TeammateChamReg[plr].character then clearTeammateCham(plr) end
	end
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LP then
			local ch = plr.Character
			if S.PlayerChams and ch then
				local entry = TeammateChamReg[plr]
				if not entry or not (entry.model and entry.model.Parent) then entry = createTeammateCham(plr, ch) end
				for source, copy in pairs(entry.links) do
					if source.Parent and copy.Parent then
						copy.CFrame = source.CFrame; copy.Size = source.Size
						copy.Transparency = 0.38; copy.LocalTransparencyModifier = 0
					else
						pcall(function() copy:Destroy() end); entry.links[source] = nil
					end
				end
			else
				clearTeammateCham(plr)
			end
		end
	end
end

local lastHUDRefresh = 0
tc(RunService.Heartbeat:Connect(function()
	local now = os.clock()
	if now - lastHUDRefresh < 0.1 then return end
	lastHUDRefresh = now
	setPlayerChams()

	StatusHUD.Visible = S.StatusHUD == true
	if S._bindHUDDirty and S._refreshKeybindHUD then S._refreshKeybindHUD() end
	if S.StatusHUD then
		local room = LP:GetAttribute(_lIillIIIl(_lIillIIIl("\4\47\61\73\56\119\125",210),210))
		statusRoom.Text = _lIillIIIl(_lIillIIIl("\30\41\55\77\46",223),223) .. (room and tostring(room) or _lIillIIIl(_lIillIIIl("\200\116\160",236),236))
		local hum = getHum()
		local hp = hum and math.clamp(hum.Health, 0, hum.MaxHealth > 0 and hum.MaxHealth or 100) or 0
		local maxHp = hum and hum.MaxHealth > 0 and hum.MaxHealth or 100
		local hpRatio = math.clamp(hp / maxHp, 0, 1)
		healthText.Text = _lIillIIIl(_lIillIIIl("\96\97\122\117\142\163\126\140",249),249) .. tostring(math.floor(hp + 0.5)) .. _lIillIIIl(_lIillIIIl("\68\97\96",11),11) .. tostring(math.floor(maxHp + 0.5))
		healthFill.Size = UDim2.new(hpRatio, 0, 1, 0)
		healthFill.BackgroundColor3 = hpRatio <= 0.3 and Color3.fromRGB(255, 82, 82) or T.Tx

		local m = getMain(); local ox = m and m.OxygenTank
		local tank = type(ox) == _lIillIIIl(_lIillIIIl("\178\173\188\212\219",24),24) and ox.TankValue or nil
		local oxygen = tank and tonumber(tank.Value) or 100
		local oxyRatio = math.clamp(oxygen / 100, 0, 1)
		oxygenText.Text = _lIillIIIl(_lIillIIIl("\167\190\205\201\213\236\204\218",37),37) .. tostring(math.floor(oxygen + 0.5)) .. _lIillIIIl(_lIillIIIl("\151",50),50)
		oxygenFill.Size = UDim2.new(oxyRatio, 0, 1, 0)
		oxygenFill.BackgroundColor3 = oxyRatio <= 0.25 and Color3.fromRGB(255, 180, 75) or T.Tx
	end

	if not S.ThreatRadar then
		for _, arrow in pairs(ThreatArrowPool) do arrow.holder.Visible = false end
		return
	end
	local cc = cam(); local hrp = getHRP()
	if not (cc and hrp) then return end
	local candidates = {}
	for _, e in ipairs(EntityCache) do
		if e.obj.Parent and (e.kind == _lIillIIIl(_lIillIIIl("\249\9\22\41\56\55\82",63),63) or e.kind == _lIillIIIl(_lIillIIIl("\10\43\39\60\74\81\108",76),76) or e.kind == _lIillIIIl(_lIillIIIl("\37\71\65\80\93\121\136",89),89) or e.kind == _lIillIIIl(_lIillIIIl("\77\89\107\109\118\132\154\161",102),102) or e.kind == _lIillIIIl(_lIillIIIl("\87\99\130\140\141\174\177\197\210",115),115)) then
			local pos = objPos(e.obj)
			if pos then
				local distance = (pos - hrp.Position).Magnitude
				if distance <= (S.ESPMaxDist or 1500) then
					local projected, onScreen = cc:WorldToViewportPoint(pos)
					if not onScreen or projected.Z <= 0 then
						candidates[#candidates + 1] = { e = e, p = projected, d = distance }
					end
				end
			end
		end
	end
	table.sort(candidates, function(a, b) return a.d < b.d end)
	local vp = cc.ViewportSize
	local center = Vector2.new(vp.X * 0.5, vp.Y * 0.5)
	local radius = math.max(85, math.min(vp.X, vp.Y) * 0.34)
	for i = 1, math.max(#ThreatArrowPool, math.min(#candidates, 4)) do
		local arrow = getThreatArrow(i)
		local candidate = candidates[i]
		if candidate then
			local dir = Vector2.new(candidate.p.X - center.X, candidate.p.Y - center.Y)
			if candidate.p.Z <= 0 then dir = -dir end
			if dir.Magnitude < 0.01 then dir = Vector2.new(0, -1) else dir = dir.Unit end
			arrow.holder.Position = UDim2.fromOffset(center.X + dir.X * radius, center.Y + dir.Y * radius)
			arrow.arrow.Rotation = math.deg(math.atan2(dir.Y, dir.X)) + 90
			arrow.arrow.TextColor3 = ESP_COLORS[candidate.e.kind] or Color3.fromRGB(255, 85, 85)
			arrow.label.Text = string.upper(candidate.e.obj.Name) .. _lIillIIIl(_lIillIIIl("\46\60",128),128) .. tostring(math.floor(candidate.d + 0.5)) .. _lIillIIIl(_lIillIIIl("\149",141),141)
			arrow.holder.Visible = true
		else
			arrow.holder.Visible = false
		end
	end
end))

local ESPObjects = {}
local function makeESP(plr)
	local o = {}
	o.box = Instance.new(_lIillIIIl(_lIillIIIl("\136\194\191\217\223",154),154))
	o.box.BackgroundTransparency = 1; o.box.BorderSizePixel = 0; o.box.Visible = false; o.box.Parent = ESPGui
	o.boxStroke = Instance.new(_lIillIIIl(_lIillIIIl("\177\179\203\250\6\17\27\35",167),167))
	o.boxStroke.Thickness = 1.5; o.boxStroke.Color = Color3.fromRGB(120, 220, 255); o.boxStroke.Parent = o.box
	Corner(o.box, 4)

	o.tracer = Instance.new(_lIillIIIl(_lIillIIIl("\188\246\243\13\19",180),180))
	o.tracer.BorderSizePixel = 0; o.tracer.AnchorPoint = Vector2.new(0.5, 0.5)
	o.tracer.Size = UDim2.new(0, 1, 0, 0); o.tracer.BackgroundColor3 = Color3.fromRGB(120, 220, 255)
	o.tracer.BackgroundTransparency = 0.25; o.tracer.Visible = false; o.tracer.Parent = ESPGui
	Corner(o.tracer, 1)

	o.bill = Instance.new(_lIillIIIl(_lIillIIIl("\210\7\24\38\42\69\69\100\110\95\155\157",193),193))
	o.bill.Size = UDim2.fromOffset(150, 36); o.bill.AlwaysOnTop = true; o.bill.LightInfluence = 0
	o.bill.StudsOffset = Vector3.new(0, 2.6, 0); o.bill.Enabled = false; o.bill.Parent = ESPGui

	o.card = Instance.new(_lIillIIIl(_lIillIIIl("\240\42\39\65\71",206),206))
	o.card.Parent = o.bill; o.card.BackgroundColor3 = Color3.fromRGB(9, 9, 10); o.card.BackgroundTransparency = 0.22
	o.card.BorderSizePixel = 0; o.card.Size = UDim2.new(1, 0, 1, 0)
	Corner(o.card, 8); Stroke(o.card, Color3.fromRGB(120, 220, 255), 1.2, 0.25); Grad(o.card, Color3.fromRGB(26, 26, 28), Color3.fromRGB(9, 9, 10), 90)

	local dot = Instance.new(_lIillIIIl(_lIillIIIl("\10\68\65\91\107",219),219))
	dot.Parent = o.card; dot.AnchorPoint = Vector2.new(0, 0.5)
	dot.Position = UDim2.new(0, 8, 0.5, 0); dot.Size = UDim2.new(0, 6, 0, 6); dot.BackgroundColor3 = Color3.fromRGB(120, 220, 255)
	Corner(dot, 3)

	o.txt = Instance.new(_lIillIIIl(_lIillIIIl("\50\81\124\134\108\143\158\175\196",232),232))
	o.txt.BackgroundTransparency = 1; o.txt.Position = UDim2.new(0, 20, 0, 0); o.txt.Size = UDim2.new(1, -26, 1, 0)
	o.txt.Font = FM; o.txt.TextSize = 12; o.txt.TextColor3 = Color3.fromRGB(255, 255, 255)
	o.txt.TextXAlignment = Enum.TextXAlignment.Left; o.txt.TextTruncate = Enum.TextTruncate.AtEnd; o.txt.Text = ""
	o.txt.Parent = o.card
	ESPObjects[plr] = o
	return o
end
local function removeESP(plr)
	local o = ESPObjects[plr]
	if o then
		pcall(function() o.box:Destroy() end); pcall(function() o.tracer:Destroy() end); pcall(function() o.bill:Destroy() end)
		ESPObjects[plr] = nil
	end
end

S._cleanupESP = function()
	for obj in pairs(TagReg) do destroyTag(obj) end
	for plr in pairs(ESPObjects) do removeESP(plr) end
	for door in pairs(PassedDoors) do PassedDoors[door] = nil end
	pcall(function() if ESPGui and ESPGui.Parent then ESPGui:Destroy() end end)
end
tc(Players.PlayerRemoving:Connect(removeESP))

local espWasActive = false
tc(RunService.RenderStepped:Connect(function()
	local espOn = S.NameESP or S.BoxESP or S.HealthESP or S.TracerESP
	if not espOn then
		if espWasActive then
			for _, o in pairs(ESPObjects) do o.box.Visible = false; o.tracer.Visible = false; o.bill.Enabled = false end
			espWasActive = false
		end
	else
		espWasActive = true
	end
	local cc = cam(); if not cc then return end
	local vp = cc.ViewportSize
	if espOn then
		for _, plr in ipairs(Players:GetPlayers()) do
			if plr ~= LP then
			local o = ESPObjects[plr] or makeESP(plr)
			local ch = plr.Character
			local hrp = ch and ch:FindFirstChild(_lIillIIIl(_lIillIIIl("\74\133\139\141\168\183\191\200\196\239\253\16\250\25\56\72",245),245))
			local head = ch and (ch:FindFirstChild(_lIillIIIl(_lIillIIIl("\100\143\153\170",7),7)) or hrp)
			local hum = ch and ch:FindFirstChildOfClass(_lIillIIIl(_lIillIIIl("\126\185\191\193\220\235\243\252",20),20))
			local show = hrp and head
			local dist = 0
			if show then
				local myHrp = getHRP()
				dist = myHrp and (myHrp.Position - hrp.Position).Magnitude or 0
				if dist > (S.ESPMaxDist or 1500) then show = false end
			end
			if show then
				local topP = cc:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
				local botP = cc:WorldToViewportPoint(hrp.Position - Vector3.new(0, 2.6, 0))
				local onScreen = topP.Z > 0 and botP.Z > 0
				local bh = math.abs(botP.Y - topP.Y)
				local bw = bh * 0.44
				if S.BoxESP and onScreen then
					o.box.Visible = true
					o.box.Position = UDim2.fromOffset(topP.X - bw / 2, topP.Y)
					o.box.Size = UDim2.fromOffset(bw, bh)
				else o.box.Visible = false end
				if S.TracerESP and onScreen then
					local from = Vector2.new(vp.X / 2, vp.Y)
					local to = Vector2.new(botP.X, botP.Y)
					local mid = (from + to) / 2
					local len = (to - from).Magnitude
					o.tracer.Visible = true
					o.tracer.Position = UDim2.fromOffset(mid.X, mid.Y)
					o.tracer.Size = UDim2.fromOffset(1, len)
					o.tracer.Rotation = math.deg(math.atan2(to.Y - from.Y, to.X - from.X)) - 90
				else o.tracer.Visible = false end
				if (S.NameESP or S.HealthESP) and onScreen then
					o.bill.Enabled = true; o.bill.Adornee = head
					local parts = {}
					if S.NameESP then parts[#parts + 1] = plr.Name end
					if S.HealthESP and hum then parts[#parts + 1] = math.floor(hum.Health + 0.5) .. _lIillIIIl(_lIillIIIl("\112\166\188",33),33) end
					parts[#parts + 1] = math.floor(dist + 0.5) .. _lIillIIIl(_lIillIIIl("\215",46),46)
					o.txt.Text = table.concat(parts, _lIillIIIl(_lIillIIIl("\164\178\98\101\220\234",59),59))
				else o.bill.Enabled = false end
			else
				o.box.Visible = false; o.tracer.Visible = false; o.bill.Enabled = false
			end
			end
		end
	end

	if S.KeycardESP then
		local hrp = getHRP()
		local best, bestD, bestEntry
		for _, e in ipairs(PromptCache) do
			if e.kind == _lIillIIIl(_lIillIIIl("\9\17\51\43\55\86\86",72),72) and e.part.Parent and hrp then
				local d = (e.part.Position - hrp.Position).Magnitude
				if d <= (S.ESPMaxDist or 1500) and (not bestD or d < bestD) then best, bestD, bestEntry = e.part, d, e end
			end
		end
		if best then
			local toP = cc:WorldToViewportPoint(best.Position)
			if toP.Z > 0 then
				local from = Vector2.new(vp.X / 2, vp.Y)
				local to = Vector2.new(toP.X, toP.Y)
				local mid = (from + to) / 2
				KeycardTracer.Visible = true
				KeycardTracer.Position = UDim2.fromOffset(mid.X, mid.Y)
				KeycardTracer.Size = UDim2.fromOffset(2, (to - from).Magnitude)
				KeycardTracer.Rotation = math.deg(math.atan2(to.Y - from.Y, to.X - from.X)) - 90
				KeycardBeacon.Text = bestEntry and bestEntry.name == _lIillIIIl(_lIillIIIl("\251\53\56\71\50\112\113\123\139\158\169\196",85),85) and _lIillIIIl(_lIillIIIl("\21\47\50\65\42\90\120\121\131\147\166\177\204",98),98) or _lIillIIIl(_lIillIIIl("\55\63\97\89\101\132\132",111),111)
				KeycardBeacon.Position = UDim2.fromOffset(to.X, to.Y - 8)
				KeycardBeacon.Visible = true
			else
				KeycardTracer.Visible = false; KeycardBeacon.Visible = false
			end
		else
			KeycardTracer.Visible = false; KeycardBeacon.Visible = false
		end
	elseif KeycardTracer.Visible or KeycardBeacon.Visible then
		KeycardTracer.Visible = false; KeycardBeacon.Visible = false
	end

	if S.NextDoorTracer then
		local hrp = getHRP()
		local best, bestD
		for _, e in ipairs(PromptCache) do
			if e.kind == _lIillIIIl(_lIillIIIl("\106\131\145\162",124),124) and e.part.Parent and not isDeadEndDoor(e.model) and e.model:GetAttribute(_lIillIIIl(_lIillIIIl("\112\160\171\177\202\203\231\245\212\13\27\44",137),137)) and hrp then
				local d = (e.part.Position - hrp.Position).Magnitude

				if d > 8 and d <= (S.ESPMaxDist or 1500) and (not bestD or d < bestD) then best, bestD = e.part, d end
			end
		end
		if best then
			local toP = cc:WorldToViewportPoint(best.Position)
			if toP.Z > 0 then
				local from = Vector2.new(vp.X * 0.5, vp.Y)
				local to = Vector2.new(toP.X, toP.Y)
				local mid = (from + to) * 0.5
				NextDoorTracer.Visible = true
				NextDoorTracer.Position = UDim2.fromOffset(mid.X, mid.Y)
				NextDoorTracer.Size = UDim2.fromOffset(2, (to - from).Magnitude)
				NextDoorTracer.Rotation = math.deg(math.atan2(to.Y - from.Y, to.X - from.X)) - 90
			else
				NextDoorTracer.Visible = false
			end
		else
			NextDoorTracer.Visible = false
		end
	elseif NextDoorTracer.Visible then
		NextDoorTracer.Visible = false
	end
end))

task.spawn(function()
	local ev = getEvents()
	if not ev then return end

	local function hookEvent(name, fn)
		local r = ev:FindFirstChild(name)
		if r and (r:IsA(_lIillIIIl(_lIillIIIl("\140\173\195\211\230\229\211\18\15\38\58",150),150)) or r:IsA(_lIillIIIl(_lIillIIIl("\169\208\226\227\248\3\9\24\48\55\50\83\115\131\150\149\131\194\191\214\234",163),163))) then
			tc(r.OnClientEvent:Connect(function(...) pcall(fn, ...) end))
		end
	end

	hookEvent(_lIillIIIl(_lIillIIIl("\177\228\235\11\11",176),176), function()
		ShowEntityWarning(_lIillIIIl(_lIillIIIl("\203\222\229\5\5\238\37\56\69\95\107\117\136\143",189),189), _lIillIIIl(_lIillIIIl("\244\37\44\236\73\90\32\118\133\142\157\102\189\208\144\223\172\6\23\25\47\55\82",202),202))
		if S.AutoHideInLocker then hideInLockerNow(false) end
	end)
	hookEvent(_lIillIIIl(_lIillIIIl("\15\59\77\79\88\112\134\141",215),215), function() ShowEntityWarning(_lIillIIIl(_lIillIIIl("\41\53\71\83\92\106\128\135",228),228), _lIillIIIl(_lIillIIIl("\67\112\127\146\151\96\199\203\223\234\166\0\11\23\38\64\250\23\22\111\119\133\158\92\174\193\217\232\227\254\1\17",241),241)) end)
	hookEvent(_lIillIIIl(_lIillIIIl("\100\131\158\162\177\199\215\228\237\7\13\242\43\57\74\50\99\101\123",3),3), function() ShowEntityWarning(_lIillIIIl(_lIillIIIl("\126\125\152\156\171\193\209\222\231\1\7",16),16), _lIillIIIl(_lIillIIIl("\140\197\211\228\243\174\253\28\29\230\64\81\83\105\117\136\143",29),29)) end)
	hookEvent(_lIillIIIl(_lIillIIIl("\178\213\240\249\251\22\27\50\70\37\103\97\112\125\153\168\163\196\199\219\232",42),42), function() ShowEntityWarning(_lIillIIIl(_lIillIIIl("\193\227\221\236\249\21\36\31\64\67\87\100",55),55), _lIillIIIl(_lIillIIIl("\218\19\210\46\61\80\10\100\117\131\141\80\159\192\122\209\234",68),68)) end)
	hookEvent(_lIillIIIl(_lIillIIIl("\243\31\62\72\73\106\109\129\142\119\170\174\193\201\213\246\255\16",81),81), function() ShowEntityWarning(_lIillIIIl(_lIillIIIl("\13\25\56\66\67\100\103\123\136",94),94), _lIillIIIl(_lIillIIIl("\55\102\97\128\129\74\161\186\116\198\223\245\250\198\200\26\51\64\7\98\38\128\145\159\169\108\187\223\215\253",107),107)) end)
	hookEvent(_lIillIIIl(_lIillIIIl("\66\123\148\141\168\151\181\210\211\225\248\235\14\35\57",120),120), function() if S.BossAlerts then Notify(_lIillIIIl(_lIillIIIl("\92\149\174\167\194",133),133), _lIillIIIl(_lIillIIIl("\118\175\200\193\220\152\235\2\5\31\51\58\78\77\114\46\125\141\172\175\202\199\144\96\12\46\200\35\51\72\69\14\109\127\129\139\168\174\201",146),146), 4, _lIillIIIl(_lIillIIIl("\195\187\218\228",159),159)) end end)
	hookEvent(_lIillIIIl(_lIillIIIl("\170\227\241\253\0\30\35\54\61\73\100\94\135\141\155\174\181\177\207\236\237\247\17",172),172), function() if S.BossAlerts then Notify(_lIillIIIl(_lIillIIIl("\196\253\11\23\26\56\61\80\87\109\136",185),185), _lIillIIIl(_lIillIIIl("\220\23\41\55\242\73\97\38\117\133\164\167\194\191",198),198), 4, _lIillIIIl(_lIillIIIl("\24\35\62\69\81\118",211),211)) end end)

	hookEvent(_lIillIIIl(_lIillIIIl("\40\75\88\103\83\134\141\168\175\187",224),224), function(zone)
		local zname = typeof(zone) == _lIillIIIl(_lIillIIIl("\49\110\129\144\139\166\169\185",237),237) and zone.Name or tostring(zone)
		if zname and zname ~= _lIillIIIl(_lIillIIIl("\122\131\148",250),250) then Notify(_lIillIIIl(_lIillIIIl("\128\163\176\181",12),12), _lIillIIIl(_lIillIIIl("\133\188\208\207\234\235\248\220\208",25),25) .. zname, 2) end
	end)
	hookEvent(_lIillIIIl(_lIillIIIl("\166\215\217\229\254\228\15\41\43\63\75",38),38), function(amount)
		if type(amount) == _lIillIIIl(_lIillIIIl("\226\247\253\0\17\44",51),51) then Notify(_lIillIIIl(_lIillIIIl("\210\253\23\25\45\57",64),64), _lIillIIIl(_lIillIIIl("\252\37\51\61\0",77),77) .. tostring(amount) .. _lIillIIIl(_lIillIIIl("\226\52\63\89\91\111\123",90),90), 1.5, _lIillIIIl(_lIillIIIl("\64\75\102\109\121\148",103),103)) end
	end)
	hookEvent(_lIillIIIl(_lIillIIIl("\68\105\138\148\128\171\185\197",116),116), function(n)
		FootMid.Text = _lIillIIIl(_lIillIIIl("\98\109\123\135\104",129),129) .. tostring(n)
		if S.RoomTracker then Notify(_lIillIIIl(_lIillIIIl("\124\167\181\193",142),142), _lIillIIIl(_lIillIIIl("\150\193\207\219\182\170",155),155) .. tostring(n), 2) end
	end)
	hookEvent(_lIillIIIl(_lIillIIIl("\165\209\232\237\8\5\38\47\64\31\89\119\126\146",168),168), function(n) Notify(_lIillIIIl(_lIillIIIl("\191\235\2\7\34\31\64\73\90\115",181),181), _lIillIIIl(_lIillIIIl("\217\5\28\33\60\57\90\99\126\141\98\86",194),194) .. tostring(n), 2.5, _lIillIIIl(_lIillIIIl("\35\27\58\68",207),207)) end)
	hookEvent(_lIillIIIl(_lIillIIIl("\24\57\85\96\105\141\146\134\169\187\193\220",220),220), function(n) if type(n) == _lIillIIIl(_lIillIIIl("\78\99\115\118\135\162",233),233) then Notify(_lIillIIIl(_lIillIIIl("\86\119\147\158\157\193\198",246),246), _lIillIIIl(_lIillIIIl("\112\145\173\184\183\219\224\160\247\10\202",8),8) .. tostring(n) .. _lIillIIIl(_lIillIIIl("\171",21),21), 2) end end)
	hookEvent(_lIillIIIl(_lIillIIIl("\167\178\193\236\239\251\15\21\46\21\68\82\95\107\138\151",34),34), function(effectName)
		if type(effectName) ~= _lIillIIIl(_lIillIIIl("\223\238\250\255\18\25",47),47) then return end
		if effectName == _lIillIIIl(_lIillIIIl("\212\249\17\30\4\56\67\75\97\105\132",60),60) or effectName == _lIillIIIl(_lIillIIIl("\242\23\32\49\61\44\96\107\115\137\145\172",73),73) or effectName == _lIillIIIl(_lIillIIIl("\13\45\56\42\94\105\113\135\143\170",86),86)
			or effectName == _lIillIIIl(_lIillIIIl("\25\80\100\103\128\147\113\164\168\187\195\207\240\249\10",99),99) or effectName == _lIillIIIl(_lIillIIIl("\47\50\58\107\154\149\182\185\193\181\232\236\255\7\19\52\61\78",112),112)
			or effectName == _lIillIIIl(_lIillIIIl("\73\76\84\133\180\175\208\211\219\207\2\6\25\33\45\78\87\114\98\142\139\155\177",125),125) or effectName == _lIillIIIl(_lIillIIIl("\114\145\172\176\191\213\229\242\251\21\27\255\43\69\75\102\109\109\144\151\175\183",138),138) then
			ShowEntityWarning(effectName:gsub(_lIillIIIl(_lIillIIIl("\127\171\197\203\230\227\227\6\13\37\45",151),151), ""):gsub(_lIillIIIl(_lIillIIIl("\156\208\219\227\249\1\28",164),164), _lIillIIIl(_lIillIIIl("\144\196\216\227\235\1\9\36",177),177)))
			if S.AutoHideInLocker then hideInLockerNow(false) end
		end
	end)

	local roomFn = ev:FindFirstChild(_lIillIIIl(_lIillIIIl("\205\13\24\38\39\62\82\62\115\129\141\124\177\183\186\203\230",190),190))
	if roomFn and roomFn:IsA(_lIillIIIl(_lIillIIIl("\246\23\45\61\80\79\72\133\140\143\174\177\197\210",203),203)) then
		task.spawn(function()
			local ok, n = pcall(function() return roomFn:InvokeServer() end)
			if ok and n then FootMid.Text = _lIillIIIl(_lIillIIIl("\16\27\41\53\32",216),216) .. tostring(n) end
		end)
	end
end)

task.spawn(function()
	local loaded, reason = false, _lIillIIIl(_lIillIIIl("\69\79\103\127\131\150\157",229),229)
	for attempt = 1, 3 do
		task.wait(attempt == 1 and 1 or 1.5)
		if S.Destroyed then return end
		loaded, reason = LoadConfigFile(_lIillIIIl(_lIillIIIl("\81\107\141\154\163\174\191\191\208",242),242), true)
		if loaded or reason == _lIillIIIl(_lIillIIIl("\131\141\165\179\183\202\209",4),4) or reason == _lIillIIIl(_lIillIIIl("\162\163\173\190\206\223\240\247\192\35\42\43\78\71\93\110\113\128\152\159",17),17) then break end
	end
	S._autoConfigLoaded, S._autoConfigReason = loaded, reason
	local openHint = MOBILE and _lIillIIIl(_lIillIIIl("\26\18\54\49\82\78\110\107\138\130\166\148\18\77\83\106\127\88\22\17\50\32\158\93\39\120\112\149\82\176\158\214\209\242\229",30),30) or _lIillIIIl(_lIillIIIl("\173\224\243\243\14\30\216\53\68\71\94\113\44\142\144\155\100\191\197\220\241",43),43)
	if loaded then
		Notify(_lIillIIIl(_lIillIIIl("\206\254\255\27\41\57\68\69\14\68\127\122",56),56), _lIillIIIl(_lIillIIIl("\219\21\34\40\57\69\12\108\109\137\152\161\178\179\192\138\90\6\40\194",69),69) .. openHint, 3, _lIillIIIl(_lIillIIIl("\37\53\49\63\79\107\121",82),82))
	elseif reason ~= _lIillIIIl(_lIillIIIl("\57\67\91\105\109\128\135",95),95) and reason ~= _lIillIIIl(_lIillIIIl("\88\89\99\116\132\149\166\173\118\217\224\225\4\253\19\36\39\54\78\85",108),108) then
		Notify(_lIillIIIl(_lIillIIIl("\67\125\138\144\161\173",121),121), _lIillIIIl(_lIillIIIl("\91\157\170\179\190\207\207\224\170\11\17\29\50\64\67\80\62\50",134),134) .. tostring(reason), 3, _lIillIIIl(_lIillIIIl("\171\163\194\204",147),147))
	else
		Notify(_lIillIIIl(_lIillIIIl("\158\206\207\235\249\9\20\21\222\20\79\74",160),160), _lIillIIIl(_lIillIIIl("\180\229\229\246\5\18\220\172\88\122\20",173),173) .. openHint, 3, _lIillIIIl(_lIillIIIl("\235\254\4\27",186),186))
	end
	print(_lIillIIIl(_lIillIIIl("\247\250\42\43\71\85\101\122\123\108\167\162\171\124\182\231\231\248\7\20\222\27\37",199),199))
end)
