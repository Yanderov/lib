local _1ii1lIli1 do local c=string.char local b=string.byte _1ii1lIli1=function(s,k) local o={} for i=1,#s do o[i]=c(((b(s,i)-((k+i*7)%251))%256)) end return table.concat(o) end end
_G.INERTIA_MOBILE = true
if _G.Pressure_Script then
	pcall(function() _G.Pressure_Script:Destroy() end)
	_G.Pressure_Script = nil
end

do
	local Players2 = game:GetService(_1ii1lIli1("\180\215\211\242\229\249\1",93))
	local parents = {}
	local CoreGui2
	pcall(function() CoreGui2 = game:GetService(_1ii1lIli1("\180\231\241\235\212\9\4",106)) end)
	if CoreGui2 then
		table.insert(parents, CoreGui2)
		local robloxGui = CoreGui2:FindFirstChild(_1ii1lIli1("\208\244\238\255\9\25\239\36\31",119))
		if robloxGui then table.insert(parents, robloxGui) end
	end
	local playerGui = Players2.LocalPlayer:FindFirstChild(_1ii1lIli1("\219\254\250\25\12\32\252\49\44",132))
	if playerGui then table.insert(parents, playerGui) end
	if gethui then pcall(function() table.insert(parents, gethui()) end) end
	local seen = {}
	for _, parent in ipairs(parents) do
		if parent then

			for _, guiName in ipairs({ _1ii1lIli1("\232\17\11\32\39\48\52\46\24\76\64",145), _1ii1lIli1("\245\30\24\45\52\61\65\59\34\55\59",158) }) do
				local direct = parent:FindFirstChild(guiName)
				if direct and direct:IsA(_1ii1lIli1("\5\28\50\44\51\67\35\88\83",171)) then
					seen[direct] = true
					pcall(function() direct:Destroy() end)
				end
			end

			for _, inst in ipairs(parent:GetDescendants()) do
				if not seen[inst] and inst:IsA(_1ii1lIli1("\18\41\63\57\64\80\48\101\96",184)) and (inst.Name == _1ii1lIli1("\28\69\63\84\91\100\104\103\81\133\121",197) or inst.Name == _1ii1lIli1("\41\82\76\97\104\118\122\116\91\112\116",210)) then
					seen[inst] = true
					pcall(function() inst:Destroy() end)
				end
			end
		end
	end

	for _, inst in ipairs(game:GetService(_1ii1lIli1("\61\92\102\107\122\126\118\127\136",223)):GetDescendants()) do
		if inst.Name == _1ii1lIli1("\67\108\107\128\135\144\148\142\117\170\174\153\173\186",236) or inst.Name == _1ii1lIli1("\85\126\120\141\148\157\161\155\130\183\187\154\165",249) or inst.Name == _1ii1lIli1("\98\139\133\154\161\170\174\168\158\182\185\204\211\206\232\224\197\241\241\4",11) then
			pcall(function() inst:Destroy() end)
		end
	end
end

local Players = game:GetService(_1ii1lIli1("\111\146\142\173\160\180\188",24))
local RunService = game:GetService(_1ii1lIli1("\126\168\168\148\173\193\204\198\199\208",37))
local UIS = game:GetService(_1ii1lIli1("\142\179\172\192\158\202\211\223\229\203\228\248\3\253\254\7",50))
local SoundService = game:GetService(_1ii1lIli1("\153\188\201\201\198\188\213\233\244\238\239\248",63))
local Lighting = game:GetService(_1ii1lIli1("\159\195\200\208\227\223\235\235",76))
local Workspace = game:GetService(_1ii1lIli1("\183\214\224\224\239\243\235\244\253",89))
local ReplicatedStorage = game:GetService(_1ii1lIli1("\191\217\235\238\242\243\248\18\10\16\6\46\48\58\48\61\66",102))
local HttpService = game:GetService(_1ii1lIli1("\194\245\252\255\233\2\22\33\27\28\37",115))
local TweenService = game:GetService(_1ii1lIli1("\219\5\250\1\17\253\22\42\53\47\48\57",128))

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

	UITheme = _1ii1lIli1("\216\0\8\10\37\35\50",141), UITextScale = 1, HUDScale = 1,
	NotificationPosition = MOBILE and _1ii1lIli1("\245\23\31\214\0\41\57\70\62\82",154) or _1ii1lIli1("\2\36\44\227\28\58\63\71\90",167),

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
	if type(container) ~= _1ii1lIli1("\47\35\43\60\60",180) then return end
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
		if effect:IsA(_1ii1lIli1("\9\67\67\76\87\91\90\94\119\113",193)) then
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
				if effect:IsA(_1ii1lIli1("\22\80\80\89\100\104\108\112\132\126",206)) then applied.atmospheres[effect] = { density = effect.Density, haze = effect.Haze } end
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
			if effect:IsA(_1ii1lIli1("\35\93\93\102\118\122\121\125\145\139",219)) then
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
local function getEvents() return ReplicatedStorage:FindFirstChild(_1ii1lIli1("\52\108\103\119\132\138",232)) end
local function findRemote(name)
	local ev = getEvents()
	local r = ev and ev:FindFirstChild(name)
	if r and (r:IsA(_1ii1lIli1("\83\109\124\133\145\137\112\168\158\174\187",245)) or r:IsA(_1ii1lIli1("\99\131\142\136\150\154\153\161\178\178\166\192\207\216\228\220\195\251\241\1\14",7)) or r:IsA(_1ii1lIli1("\109\135\150\159\171\163\139\193\193\189\213\209\222\228",20))) then
		return r
	end
	return nil
end

local function applyModuleTuning()
	local m = getMain()
	local tuned = S._tunedFields
	if not (m and tuned) then return end
	if tuned.CrouchSpeed and type(m.CameraModule) == _1ii1lIli1("\156\144\152\169\169",33) then
		setGameField(m.CameraModule, _1ii1lIli1("\120\174\178\191\180\192\182\199\217\223\206\242\238\245\251",46), S.CrouchSpeed)
	end
	if tuned.SprintMod then
		if type(m.CameraModule) == _1ii1lIli1("\182\170\178\195\195",59) then setGameField(m.CameraModule, _1ii1lIli1("\162\198\207\205\217\230\198\239\235\247\251\5\8\28",72), S.SprintMod) end
	end
	if tuned.GliderSpeed and type(m.Swimming) == _1ii1lIli1("\208\196\204\221\221",85) then
		setGameField(m.Swimming, _1ii1lIli1("\176\220\224\226\234\254\230\10\6\13\19",98), S.GliderSpeed)
	end
end

local function saveSwimDefaults(sw)
	if type(sw) ~= _1ii1lIli1("\234\222\230\247\247",111) then return nil end
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
	if type(sw) ~= _1ii1lIli1("\247\235\243\4\4",124) or not saved then return end
	if saved.swim ~= nil then sw.SwimmingSpeed = saved.swim end
	if saved.current ~= nil then sw.CurrentSwimSpeed = saved.current end
	if restoreGlider and saved.glider ~= nil then sw.GliderSpeed = saved.glider end
end

local function installSpeedHook()
	if SpeedHook.installed then return end
	local m = getMain()
	local se = m and m.StatusEffects
	if type(se) ~= _1ii1lIli1("\4\248\0\17\17",137) or type(se.GetSpeed) ~= _1ii1lIli1("\3\25\25\21\45\41\54\60",150) then return end
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
	if m and type(m.StatusEffects) == _1ii1lIli1("\30\18\26\43\43",163) then
		pcall(function() m.StatusEffects:RefreshSpeed(LP) end)
	end
end

local function installJumpscareHook()
	if JumpscareHook.installed then return end
	local m = getMain()
	local bj = m and m.BlitzJumpscare
	if type(bj) ~= _1ii1lIli1("\43\31\39\56\56",176) or type(bj.Start) ~= _1ii1lIli1("\42\64\64\60\84\80\93\99",189) then return end
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
			local pg = LP:FindFirstChild(_1ii1lIli1("\33\68\64\95\82\102\71\124\119",202))
			local mg = pg and pg:FindFirstChild(_1ii1lIli1("\43\70\85\97",215))
			local cl = mg and mg:FindFirstChild(_1ii1lIli1("\46\94\98\106\122\135",228))
			local mc = cl and cl:FindFirstChild(_1ii1lIli1("\69\101\116\128\92\140\144\147\163\176",241))
			local cmod = mc and mc:FindFirstChild(_1ii1lIli1("\77\114\133\132\152\142\129\170\166\190\188\188",3))
			if cmod then
				local cmv = require(cmod)
				if type(cmv) == _1ii1lIli1("\139\127\135\152\152",16) and type(cmv.Main) == _1ii1lIli1("\152\140\148\165\165",29) then
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
	pcall(function() RunService:UnbindFromRenderStep(_1ii1lIli1("\129\170\164\185\192\201\205\199\182\223\236\241\234\225\1\6\16\11\26",42)) end)
	pcall(function() if SpeedHook.installed and SpeedHook.se then SpeedHook.se.GetSpeed = SpeedHook.orig end end)
	pcall(function() if JumpscareHook.installed and JumpscareHook.mod then JumpscareHook.mod.Start = JumpscareHook.orig end end)
	pcall(function() LP.CameraMode = Enum.CameraMode.LockFirstPerson; LP.CameraMaxZoomDistance = _origMaxZoom or 0.5 end)
	pcall(function()
		local m = getMain()
		local sw = m and m.Swimming
		if type(sw) == _1ii1lIli1("\178\166\174\191\191",55) and self._savedSwim then
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
			s = Instance.new(_1ii1lIli1("\158\193\206\206\203",68)); s.SoundId = id; s.Parent = SoundService; SndCache[k] = s
		end
		s.PlaybackSpeed = pitch; s.Volume = vol or 0.3; s:Play()
	end) end)
end
local SFX = {
	On = function() snd(_1ii1lIli1("\202\193\222\206\231\238\231\253\249\251\216\212\219\233\242\250\253\255\13\22\28\32\37",81), 1.35, 0.4) end,
	Off = function() snd(_1ii1lIli1("\215\206\235\219\244\251\244\10\6\8\229\225\232\246\255\7\10\12\26\35\41\45\55",94), 0.8, 0.25) end,
	Click = function() snd(_1ii1lIli1("\228\219\248\232\1\8\1\23\19\21\242\238\245\3\12\20\23\25\39\48\59\63\68",107), 1.05, 0.3) end,
	Pop = function() snd(_1ii1lIli1("\241\232\5\245\14\21\14\36\32\34\255\251\2\14\22\33\31\44\56\59\71\77\84",120), 1.2, 0.35) end,
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
	return THEMES[name] and name or _1ii1lIli1("\208\248\0\2\29\27\42",133)
end
S.UITheme = loadPalette(S.UITheme)
local TONE = {
	info = Color3.fromRGB(218, 223, 228),
	warn = Color3.fromRGB(255, 192, 88),
	danger = Color3.fromRGB(255, 92, 92),
}
local F, FM, FB = Enum.Font.Gotham, Enum.Font.GothamMedium, Enum.Font.GothamBold

local function Corner(i, r) local c = Instance.new(_1ii1lIli1("\238\233\234\29\39\42\40\60",146)); c.CornerRadius = UDim.new(0, r or 6); c.Parent = i; return c end
local function Stroke(i, col, th, tr)
	local s = Instance.new(_1ii1lIli1("\251\246\7\47\52\56\59\60",159))
	s.Color = col or T.Bd; s.Thickness = th or 1; s.Transparency = tr or 0
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; s.Parent = i
	return s
end
local function Grad(i, c1, c2, rot)
	local g = Instance.new(_1ii1lIli1("\8\3\8\58\48\58\70\73\89\102",172)); g.Color = ColorSequence.new(c1, c2); g.Rotation = rot or 90; g.Parent = i
	return g
end
local function Pad(i, t, b, l, r)
	local p = Instance.new(_1ii1lIli1("\21\16\30\54\64\71\83\95\95",185))
	p.PaddingTop = UDim.new(0, t or 0); p.PaddingBottom = UDim.new(0, b or 0)
	p.PaddingLeft = UDim.new(0, l or 0); p.PaddingRight = UDim.new(0, r or 0)
	p.Parent = i
	return p
end
local function Shadow(i, tr)
	local s = Instance.new(_1ii1lIli1("\34\29\46\86\91\95\98\104",198))
	s.Color = T.Bd2; s.Thickness = 2; s.Transparency = tr or 0.6
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; s.Parent = i
	return s
end
local function Tween(inst, time, props, style, dir)
	return TweenService:Create(inst, TweenInfo.new(time, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out), props)
end

S._NavIconData = {
	[_1ii1lIli1("\63\90\77",211)] = _1ii1lIli1("\80\68\55\80\90\134\70\104\107\146\161\122\129\136\143\163\175\184\210\182\205\230\199\206\213\223\227\234\241\248\255\60\15\20\51\34\41\48\56\90\74\134\132\102\102\109\116\123\132\160\145\159\180\188\184\179\186\193\192\246\214\221\228\250\10\9\6\53\29\10\63\82\42\49\56\70\53\124\132\100\119\131\134\170\169\174\130\176\213\186\164\199\203\211\220\214\12\20\251\238\42\254\17\60\7\43\40\55\99\50\99\84\112\85\95\86\104\112\128\144\136\180\191\161\146\154\178\188\190\196\2\255\237\208\26\21\43\235\245\51\52\74\42\48\81\105\63\118\68\84\83\98\108\112\153\127\166\131\187\163\199\157\175\226\231\197\203\249\226\225\231\1\251\244\13\47\56\12\14\82\102\75\77\56\92\70\75\122\110\126\103\180\119\174\167\188\199\204\158\169\176\239\3\0\204\18\220\227\10\43\50\31\28\46\42\81\24\62\56\89\88\88\97\102\130\123\141\111\146\156\193\192\141\203\231\223\201\216\220\3\15\11\240\228\1\34\48\12\2\74\22\82\68\74\108\122\122\138\126\103\116\130\162\150\175\158\128\179\164\178\194\187\179\190\206\246\10\231\35\42\2\0\59\65\34\40\35\29\93\101\72\60\81\109\110\102\160\171\155\132\178\194\161\172\148\208\233\175\182\178\210\221\3\230\226\251\250\44\251\55\21\83\74\91\58\96\100\128\97\105\97\137\152\154\141\149\121\189\170\163\184\193\203\226\179\254\195\1\254\249\222\5\37\51\16\255\59\14\38\79\75\48\124\60\101\82\107\120\158\119\131\137\175\135\173\201\183\226\159\172\242\215\251\254\225\237\227\234\50\3\43\39\60\31\19\98\65\80\81\83\135\137\105\112\128\129\113\138\126\172\211\200\201\217\217\235\245\1\222\203\209\29\224\223\9\52\13\70\28\34\29\49\77\105\78\130\136\131\155\110\128\169\175\147\125\196\162\165\226\233\170\244\180\214\2\16\240\222\242\35\1\9\250\22\37\84\22\52\43\118\74\102\98\128\146\92\106\167\131\113\167\199\177\219\224\177\176\202\246\211\223\197\217\25\23\231\20\239\33\63\64\50\50\101\72\91\111\128\143\72\126\98\117\156\170\142\177\153\209\176\212\165\234\235\177\7\9\198\27\222\1\46\52\248\5\3\84\46\58\52\58\69\65\81\113\141\102\128\117\113\166\147\148\136\173\184\184\186\228\193\204\5\204\17\240\20\232\46\2\241\16\30\66\19\99\103\58\75\64\134\105\132\103\95\105\165\185\144\136\186\200\167\183\171\211\199\216\6\255\0\251\28\4\238\42\247\22\37\42\37\48\41\62\104\88\119\142\150\116\133\106\180\148\163\179\157\177\154\207\236\194\173\202\4\251\7\19\243\6\42\25\66\41\72\46\38\34\97\70\91\114\120\73\103\137\123\143\104\144\126\164\156\143\152\207\205\213\251\3\7\1\20\255\226\22\48\39\1\72\42\87\55\50\43\45\92\124\128\78\104\159\98\128\131\180\177\126\199\176\183\228\197\179\184\207\224\210\250\249\22\228\37\59\11\2\78\15\17\57\96\71\64\120\130\104\135\158\127\140\183\117\153\154\208\141\221\233\162\232\206\217\251\12\210\238\251\25\47\244\37\6\32\84\81\32\76\99\108\125\106\149\90\149\120\136\118\182\121\182\145\205\190\189\239\205\247\207\198\220\24\22\17\28\35\12\56\73\49\16\62\48\58\89\56\133\113\152\126\95\118\135\108\188\122\199\192\154\174\235\176\182\209\248\247\225\21\20\23\26\6\21\29\59\18\18\90\87\95\91\89\69\112\140\121\116\152\141\187\183\200\197\170\178\219\189\203\250\0\253\237\231\25\24\32\251\48\25\29\29\53\21\55\66\62\51\68\86\91\89\122\164\162\166\136\141\160\203\168\185\225\198\204\215\248\243\13\0\17\16\253\0\243\65\68\65\62\87\68\101\45\53\90\123\100\99\111\114\142\151\171\131\130\167\193\176\178\199\190\187\250\212\17\241\217\29\247\52\19\2\26\30\87\93\87\56\96\58\94\92\125\138\128\99\177\170\124\176\137\203\164\151\194\171\238\203\182\255\251\2\242\241\229\40\23\15\36\58\53\90\96\101\113\54\92\132\141\154\161\161\154\138\119\149\127\179\146\212\225\193\204\207\227\4\235\249\16\6\233\2\46\36\69\58\51\94\47\78\102\106\62\79\79\102\92\120\173\140\172\130\192\163\179\209\192\197\204\241\194\205\203\9\224\23\8\36\6\13\68\10\20\76\103\91\79\91\131\139\116\136\134\127\174\122\155\150\156\148\202\192\196\204\214\244\195\199\199\23\225\244\44\52\22\24\9\39\57\53\39\74\60\120\122\98\101\143\149\133\171\113\176\190\143\159\189\176\195\179\240\253\245\7\206\215\31\243\250\1\8\15\26\72\41\62\92\75\121\92\127\92\99",224),
	[_1ii1lIli1("\87\114\118\129\136\132\132\147\163",237)] = _1ii1lIli1("\111\99\86\106\116\160\96\130\133\172\187\148\155\162\169\189\201\210\236\208\231\0\225\232\239\249\253\4\11\18\25\86\41\46\77\65\72\79\87\116\100\160\158\128\128\135\142\149\158\186\171\185\206\214\210\205\212\219\218\16\240\247\254\20\36\35\32\79\55\36\89\113\73\80\87\97\103\91\158\126\145\157\160\196\195\200\156\210\235\212\186\239\229\237\229\240\10\232\12\13\63\64\67\52\79\98\102\75\91\124\90\99\89\110\152\123\138\187\182\135\204\211\184\193\233\229\209\228\230\14\19\251\2\253\47\41\30\29\49\53\33\49\65\56\75\130\107\138\90\110\164\132\137\178\184\164\159\191\179\218\187\212\207\186\220\233\9\221\227\236\14\57\51\0\21\27\68\32\107\111\58\133\138\75\149\134\100\110\177\129\198\145\146\202\218\216\192\181\247\214\241\229\237\37\22\251\10\33\20\44\72\55\86\74\78\87\125\108\144\106\143\158\160\138\173\190\186\187\193\150\183\220\197\247\237\250\221\14\20\246\33\20\44\1\21\33\36\75\100\91\100\127\67\88\83\156\144\116\168\181\136\125\204\173\169\216\212\205\212\185\182\215\209\227\23\37\35\1\9\250\33\80\86\42\30\76\69\80\128\140\94\137\145\148\155\162\190\175\186\211\195\177\161\207\231\237\213\194\222\209\249\243\248\3\59\13\253\17\33\84\97\68\75\120\103\77\99\152\86\107\154\114\143\199\160\195\207\220\215\172\205\235\209\227\203\219\20\4\239\255\246\37\29\72\23\58\71\75\54\89\102\97\147\157\154\119\109\179\153\122\163\180\187\184\230\197\175\203\240\12\14\231\26\229\249\16\250\39\33\34\22\49\50\88\71\125\130\140\129\126\150\106\132\122\138\137\204\200\206\216\162\244\234\212\199\218\228\11\243\21\40\1\8\49\0\83\69\52\97\39\123\88\120\102\143\152\164\170\150\187\145\146\160\217\205\211\236\208\195\223\249\230\213\31\222\234\4\38\248\6\39\49\94\77\83\62\104\94\96\100\113\107\129\97\172\133\151\153\132\205\187\167\164\228\246\2\225\16\3\245\15\29\7\56\29\31\38\88\26\77\55\108\49\99\127\133\149\121\95\125\139\166\176\190\170\171\203\158\202\204\188\4\202\222\10\239\27\5\42\58\250\51\42\32\92\70\109\77\73\132\69\108\151\147\129\176\138\191\127\158\161\197\194\193\166\210\233\252\199\242\8\243\17\9\32\46\30\31\46\38\76\51\101\55\75\126\89\81\109\143\118\145\177\171\132\162\201\199\157\218\226\206\242\3\4\202\251\242\42\236\21\251\70\32\9\75\44\54\37\68\80\98\78\73\151\165\163\174\166\161\180\158\181\185\194\215\207\249\187\225\6\228\26\238\254\41\11\50\16\70\65\86\95\103\102\125\85\73\80\135\151\124\123\161\164\144\168\192\210\217\191\158\171\179\236\6\255\17\239\214\233\41\56\11\49\56\37\80\51\34\102\79\125\94\97\129\88\163\118\132\179\180\137\186\172\213\194\198\232\233\253\232\234\206\26\19\248\45\12\19\31\72\84\89\62\93\97\62\109\140\135\109\105\112\109\164\176\143\194\200\182\215\181\196\227\248\240\212\223\211\8\220\3\8\246\66\20\37\67\49\36\107\114\120\135\100\106\123\108\135\160\138\188\152\199\174\199\175\182\192\197\239\218\254\218\214\28\239\250\244\5\18\27\77\49\45\64\98\65\74\62\76\77\145\141\122\163\171\182\151\196\205\163\219\229\218\237\231\205\246\221\18\216\23\23\238\246\4\73\71\37\42\92\90\56\80\121\129\95\121\113\164\136\151\118\125\184\157\176\158\198\168\224\248\245\247\7\236\237\230\232\4\38\69\4\80\44\89\52\68\85\62\118\100\130\126\141\132\180\149\180\158\156\173\147\229\231\194\209\214\245\227\246\26\218\27\28\7\254\253\37\18\27\59\99\88\75\64\126\80\118\86\157\128\172\174\149\189\171\192\149\216\223\169\229\225\7\234\12\19\228\234\0\23\43\36\38\70\51\94\83\76\110\124\116\72\129\117\116\173\139\146\129\149\176\179\151\224\231\227\177\254\223\6\213\220\244\20\242\244\47\49\66\47\37\100\53\94\80\124\134\111\132\138\169\171\161\136\150\193\208\172\173\182\235\196\185\245\221\240\227\251\244\10\53\41\16\31\10\45\74\32\62\105\83\111\142\96\134\106\114\170\169\154\196\130\205\197\205\161\232\198\183\218\244\239\26\18\6\231\6\60\49\66\63\48\82\29\85\76\82\132\97\144\120\150\132\138\147\189\163\167\157\187\158\233\189\198\180\209\221\224\234\255\227\36\5\252\51\41\82\38\30\85\107\77\80\112\132\110\146\144\151\167\130\175\121\192\135\153\216\179\231\245\237\188\226\239\11\1\231\40\33\12\66\9\64\73\29\62\46\88\120\59\96\77\122\145\118\180\175\139\146\188\175\152\218\179\186\193\200\207\232\241\249\249\3\3\244\9\38\29\36\31",250),
	[_1ii1lIli1("\122\123\150\143\148",12)] = _1ii1lIli1("\137\125\112\132\142\186\122\156\159\198\213\174\181\188\195\215\227\236\6\234\1\26\251\2\9\19\23\30\37\44\51\112\72\77\108\91\98\105\113\142\126\186\184\154\154\161\168\175\184\212\197\211\232\240\236\231\238\245\244\42\10\17\24\46\62\61\58\105\86\67\120\139\99\106\113\122\110\154\184\152\171\183\186\222\221\226\182\228\225\203\23\251\255\7\14\9\253\1\50\88\39\30\75\75\110\83\126\133\118\111\120\131\144\137\142\189\161\165\205\187\227\209\207\252\246\220\246\24\25\23\49\13\63\24\27\51\57\99\65\85\64\69\132\128\153\108\121\131\152\190\148\159\163\214\171\161\167\193\245\252\213\225\240\239\224\252\20\15\13\44\49\69\57\56\97\87\83\96\139\111\138\111\172\129\118\192\187\196\142\157\162\214\233\206\238\0\7\243\245\223\232\239\53\60\71\28\75\20\67\106\39\108\119\101\98\139\159\155\135\140\133\190\153\162\159\216\198\185\212\199\189\212\6\8\252\22\39\2\39\42\27\9\65\44\61\63\40\103\89\100\96\144\144\161\158\115\140\139\186\138\147\219\223\216\238\182\204\10\232\224\19\5\253\44\50\250\35\59\15\62\95\61\62\73\101\85\80\144\97\112\122\177\153\131\168\196\216\209\199\223\226\211\204\213\15\231\21\242\39\1\243\67\56\37\51\70\57\61\75\91\60\87\101\115\95\105\129\118\134\131\186\158\167\177\176\200\198\203\241\232\206\19\31\225\247\33\19\36\7\34\41\58\46\108\98\113\118\135\75\139\139\149\145\128\180\180\150\175\178\192\196\228\210\220\191\231\5\212\216\232\2\51\44\61\64\64\65\93\85\78\108\97\71\127\129\113\151\157\173\152\114\197\134\194\198\195\197\237\192\220\242\213\2\250\224\24\41\18\249\16\29\72\49\56\31\77\45\117\65\80\97\104\117\94\177\153\149\145\163\181\217\182\194\231\234\214\251\253\0\246\240\34\232\2\10\68\75\82\39\79\85\88\56\82\87\108\99\146\116\129\141\117\162\148\153\169\222\177\192\208\185\202\5\223\231\220\20\38\228\235\43\28\41\13\86\58\104\96\102\91\97\135\87\106\129\172\167\189\191\203\191\212\181\231\220\232\249\1\227\12\15\22\246\33\4\13\10\18\23\72\59\82\84\104\57\120\139\73\140\105\148\129\114\157\185\199\141\184\182\217\172\238\181\238\200\239\231\216\238\228\252\40\49\60\8\63\75\97\43\83\54\110\124\141\123\138\164\125\114\166\194\182\161\148\153\200\224\243\244\242\214\15\232\0\242\45\239\244\26\54\47\24\25\48\106\49\117\85\95\138\100\155\115\158\166\141\162\163\211\181\204\165\233\173\219\183\8\16\241\29\254\255\0\58\1\53\30\86\95\103\94\79\121\128\135\133\152\160\160\112\142\159\126\204\178\185\163\234\232\206\235\207\219\208\20\216\31\232\16\42\30\60\31\34\59\63\71\109\91\127\93\145\85\157\116\170\149\157\154\154\209\178\187\211\226\230\210\192\206\8\239\245\27\238\42\57\66\4\75\77\96\94\59\106\89\73\145\113\146\132\123\156\181\190\128\206\194\209\229\221\231\250\247\249\231\17\28\18\248\47\51\53\23\70\17\26\29\61\108\75\118\108\127\150\128\114\151\107\143\187\180\187\161\200\210\218\221\185\185\231\249\213\10\219\40\39\52\52\53\56\83\85\33\29\74\54\82\136\113\107\83\101\131\180\139\177\131\155\181\158\158\224\223\253\203\235\250\211\223\227\38\34\40\44\6\31\88\41\93\100\44\74\67\74\111\101\84\134\176\160\126\183\195\211\219\207\223\189\200\246\255\223\200\250\252\224\29\4\244\36\2\40\33\95\24\73\78\84\130\138\71\87\119\106\159\130\117\152\154\170\147\207\197\195\202\216\216\225\239\240\234\41\249\45\42\60\43\77\75\91\35\100\68\113\85\119\143\93\129\104\110\107\114\177\206\214\203\171\166\241\225\219\192\213\224\25\10\230\235\243\61\46\38\30\67\24\60\56\103\84\138\100\106\86\120\160\158\149\144\191\162\178\222\154\225\174\234\222\0\4\224\250\4\250\41\247\51\56\56\43\67\29\52\103\50\99\131\125\144\149\119\173\142\180\192\197\195\208\175\213\216\219\206\193\1\8\9\212\248\41\16\242\31\64\42\11\42\32\35\47\122\118\100\139\140\93\165\128\166\142\159\146\141\204\179\199\193\242\250\192\248\12\12\230\26\231\43\27\21\60\46\40\80\58\94\112\59\95\62\73\155\150\162\135\137\190\142\200\198\177\168\175\182\189\197\212\227\237\212\235\31\31\5\41\48\55\20\27",25),
	[_1ii1lIli1("\162\167\160\180\118\194\198\211\211\208",38)] = _1ii1lIli1("\163\151\138\158\168\212\148\182\185\224\239\200\207\214\221\241\253\6\32\4\27\52\21\28\35\45\49\56\68\75\82\143\98\103\134\117\124\131\139\168\152\212\210\180\180\187\194\201\210\238\223\237\2\10\6\1\8\15\14\68\36\43\50\72\93\92\89\136\112\93\146\165\125\132\139\148\204\202\210\178\197\209\212\248\247\252\208\254\252\229\233\21\25\17\64\36\60\33\64\102\80\102\91\137\82\115\132\144\145\144\190\185\196\186\152\157\188\177\218\205\211\218\232\249\6\7\4\21\29\32\40\34\92\45\106\96\117\115\140\117\155\144\129\169\134\150\143\157\209\201\209\197\227\210\189\204\233\229\234\253\247\37\40\20\13\20\45\49\82\69\40\77\86\99\139\145\106\164\166\176\185\120\178\139\161\186\212\219\202\177\242\240\8\197\5\221\226\44\13\40\1\1\40\42\51\58\57\66\55\134\73\109\110\125\159\176\137\176\153\136\174\196\187\225\193\231\234\210\238\232\213\225\20\10\255\46\20\37\34\22\49\50\64\57\119\133\125\87\137\119\160\156\136\171\144\207\149\166\188\203\198\232\192\210\197\207\4\223\19\6\247\47\22\59\39\55\80\71\43\70\62\137\136\131\149\115\106\109\109\158\129\190\183\172\177\158\241\194\204\232\226\234\24\227\2\28\26\255\21\12\67\43\21\54\60\74\99\94\79\85\88\98\106\134\178\190\184\198\214\189\193\195\177\180\247\228\217\22\20\246\222\36\27\21\1\80\32\26\49\62\100\114\121\86\148\100\117\119\167\126\178\129\157\136\168\156\182\186\231\251\1\5\224\23\244\19\13\29\52\42\74\25\17\26\47\61\48\77\65\124\130\101\94\95\131\181\183\149\168\192\172\183\181\168\191\237\193\203\227\21\221\28\234\16\43\52\64\60\83\59\37\75\115\83\120\124\94\153\128\121\175\114\135\126\183\212\163\171\160\168\223\243\192\218\230\13\225\39\28\21\18\58\32\47\66\23\90\109\76\124\105\101\96\149\118\125\110\130\158\181\139\190\174\194\196\225\216\208\221\213\2\251\27\8\0\42\56\56\58\5\23\90\100\91\104\76\90\134\101\116\149\164\115\154\171\144\169\145\213\224\190\239\199\233\247\232\208\4\253\7\13\17\58\31\42\84\13\98\55\43\116\116\126\90\132\128\114\152\159\164\178\168\141\191\200\215\228\212\216\255\251\0\209\236\253\40\238\47\64\32\44\64\89\90\55\108\84\109\72\107\130\159\96\96\169\143\178\171\199\175\176\210\188\228\233\180\234\205\233\10\6\247\13\35\26\24\15\70\22\94\63\74\87\109\109\108\145\142\113\105\150\190\181\154\143\161\191\197\184\181\228\218\223\250\22\244\22\246\230\19\11\58\48\41\88\53\39\42\124\78\141\147\137\125\130\111\127\112\132\148\195\149\170\220\237\190\218\227\224\13\13\239\35\5\16\29\63\59\31\40\26\69\107\70\82\115\74\146\134\147\131\125\165\135\155\198\158\195\208\221\237\212\190\206\255\224\217\240\226\3\7\21\54\76\40\72\87\84\92\71\119\86\144\141\150\147\98\129\170\188\126\195\207\218\159\235\206\177\255\221\213\15\231\248\251\44\255\16\4\60\5\35\19\37\46\68\62\101\94\85\86\147\151\111\186\153\151\143\195\182\190\203\242\194\191\7\203\229\7\11\31\27\35\64\21\77\32\54\90\70\96\82\120\65\102\136\156\157\142\144\151\125\153\202\173\200\192\169\188\217\225\194\6\5\252\227\34\252\235\13\4\39\62\55\96\33\63\58\113\71\109\103\148\89\168\181\152\128\148\208\216\173\214\196\177\213\248\252\235\255\12\23\32\4\5\42\7\68\67\81\58\108\78\124\99\116\127\150\95\157\106\129\168\154\169\143\139\173\189\168\194\247\228\196\200\243\217\222\8\51\28\67\54\9\35\90\51\71\99\115\60\90\105\124\162\134\158\129\122\180\171\144\148\220\223\191\227\219\195\7\230\1\33\25\37\253\11\253\63\16\82\46\67\94\103\97\68\96\76\155\89\149\133\135\118\144\170\142\186\211\188\209\196\183\226\234\8\233\22\35\32\11\41\50\29\33\79\75\39\46\123\55\94\93\84\141\165\129\161\180\143\191\189\142\154\163\196\205\176\239\254\0\223\242\1\0\39\3\20\58\56\47\83\74\30\55\67\122\115\93\77\156\110\152\143\154\175\188\140\161\184\178\204\202\193\200\207\214\222\237\252\6\237\4\56\56\30\66\73\80\45\52",51),
	[_1ii1lIli1("\169\189\201",64)] = _1ii1lIli1("\189\177\164\184\194\238\174\208\211\250\9\226\233\240\247\11\23\32\58\30\53\78\47\54\66\76\80\87\94\101\108\169\124\129\160\143\150\157\165\194\178\238\236\206\206\213\220\227\236\8\249\7\28\36\32\27\34\41\40\94\67\74\81\103\119\118\115\162\138\119\172\191\151\158\165\173\211\190\236\204\223\235\238\18\17\22\234\24\19\35\32\31\47\43\50\61\77\95\130\108\102\143\97\122\134\154\146\156\142\197\166\165\205\243\194\189\211\240\236\243\22\235\32\24\64\17\41\42\82\34\52\58\110\109\84\133\119\137\119\158\131\114\164\130\198\203\212\227\163\180\173\1\0\248\23\242\1\5\12\7\31\34\42\30\38\92\89\83\117\115\108\76\145\142\98\97\134\184\143\138\189\148\207\209\197\233\184\3\223\240\0\218\38\237\16\246\19\51\26\50\50\77\84\84\127\120\123\142\112\149\148\161\165\134\191\187\187\152\182\222\206\226\247\225\11\8\249\238\249\250\237\20\11\32\25\49\75\46\87\79\118\115\137\137\117\94\106\137\131\183\128\171\172\149\178\166\230\191\207\190\220\210\244\22\9\29\33\25\22\35\32\18\41\81\39\103\109\104\137\78\154\164\105\173\152\147\145\164\159\197\172\164\229\241\253\208\5\209\11\23\253\12\243\248\253\42\74\43\33\89\61\80\115\123\77\114\92\123\148\128\122\187\193\168\173\218\205\200\178\245\189\221\248\230\213\14\255\254\23\245\51\255\82\38\76\32\80\71\66\85\103\121\104\130\101\160\155\116\196\171\200\171\159\218\235\219\215\227\200\2\232\22\248\15\47\45\63\62\21\89\34\62\46\56\96\137\135\102\96\158\140\164\120\157\138\198\215\183\159\165\179\219\1\187\253\1\26\5\20\236\11\55\68\39\15\88\51\37\96\94\118\117\114\83\91\159\157\108\125\179\154\169\185\218\199\195\235\199\208\247\240\21\216\250\25\1\40\55\8\41\35\83\46\64\99\127\119\93\125\147\95\99\98\166\117\185\188\155\145\222\214\185\235\211\220\216\252\234\29\8\30\245\21\67\57\14\67\58\71\42\72\127\80\68\132\154\156\157\112\117\141\184\141\170\211\152\181\175\178\200\227\2\202\3\243\247\225\39\38\16\53\72\25\61\32\92\66\94\105\107\107\151\126\134\167\153\140\185\155\163\171\227\161\229\204\212\192\230\10\19\242\31\10\44\30\247\20\59\84\54\59\38\121\127\82\110\143\86\109\116\123\130\137\148\194\163\184\214\197\238\209\244\209\216",77),
	[_1ii1lIli1("\216\218\212\228\224\236",90)] = _1ii1lIli1("\215\203\190\210\220\8\200\234\237\20\35\252\3\10\17\37\49\58\84\56\79\109\78\85\92\102\106\113\120\127\134\195\150\155\186\169\176\183\191\220\204\8\6\232\232\239\246\253\6\34\19\33\54\62\58\53\65\72\71\125\93\100\107\129\145\144\141\188\164\145\198\217\177\184\191\200\196\216\6\230\249\5\8\44\43\48\4\50\49\60\85\74\86\90\121\94\76\157\121\133\126\133\153\148\189\158\182\172\188\191\234\207\223\233\224\250\20\9\236\17\48\13\41\29\59\65\59\62\68\84\59\89\134\91\96\159\158\130\190\192\155\197\182\173\199\192\210\183\209\203\230\5\236\32\2\18\12\57\26\63\74\43\60\112\89\79\124\134\100\159\95\135\147\138\129\180\140\203\150\185\225\172\186\245\225\207\208\8\24\11\17\249\62\70\10\73\89\96\28\48\59\58\120\126\150\115\148\171\161\188\154\167\196\192\152\176\213\228\219\205\223\0\242\214\255\247\41\54\57\37\9\48\52\83\86\90\113\80\100\132\130\125\161\137\118\151\140\155\142\209\221\184\225\207\234\241\210\224\16\232\3\234\15\22\15\2\25\46\22\96\108\77\80\88\85\97\143\110\151\129\134\185\162\156\139\214\223\178\202\228\205\186\229\8\225\254\7\42\242\19\58\9\11\51\59\48\60\52\79\121\129\108\109\143\97\175\174\152\163\158\148\219\188\212\227\242\214\249\244\251\22\19\248\11\245\24\254\75\75\34\83\67\101\66\79\70\90\136\107\143\136\139\175\149\186\137\135\221\155\231\231\208\199\240\14\236\19\212\241\17\40\62\67\25\18\35\41\100\69\80\112\59\70\110\103\122\104\124\122\160\189\189\197\222\157\157\168\205\204\197\8\221\219\241\18\37\56\64\22\75\19\69\42\66\43\69\62\73\89\104\146\147\165\135\132\154\132\177\207\175\165\180\227\176\206\191\8\5\244\16\227\242\45\61\69\32\17\46\78\64\59\125\94\106\109\134\91\99\163\159\141\146\201\170\144\223\223\198\226\213\236\253\16\246\16\0\21\52\19\9\22\10\50\44\50\53\109\59\133\74\133\113\156\121\172\175\121\196\170\145\147\219\231\234\209\185\216\9\251\0\11\241\234\230\4\20\26\9\31\90\57\94\67\82\90\110\82\103\116\130\136\184\125\179\169\193\218\182\230\232\227\187\208\218\255\233\223\25\12\5\61\66\73\27\22\79\47\68\104\50\63\128\82\82\147\159\140\166\181\125\193\134\178\161\201\207\192\183\254\196\209\204\216\240\248\237\60\62\71\77\72\76\61\89\103\73\129\98\139\153\99\140\166\131\144\150\188\207\196\191\181\203\224\251\224\198\208\248\18\6\5\13\8\4\3\78\80\29\63\110\82\60\68\94\128\85\93\159\179\167\177\163\166\164\200\182\187\232\195\0\199\223\246\215\219\31\27\42\21\18\39\44\44\94\93\107\105\66\88\81\135\121\97\164\167\145\192\191\173\194\200\184\172\196\240\214\221\202\10\19\240\225\41\53\249\29\56\79\51\33\38\110\89\78\66\99\138\160\89\138\157\169\182\128\153\143\180\159\230\220\240\234\255\222\4\230\243\231\15\10\41\1\72\16\83\66\86\43\61\65\136\99\148\114\122\162\135\154\192\194\158\198\160\225\183\204\220\211\3\220\16\25\244\235\28\28\20\4\33\78\94\98\57\82\112\117\123\117\81\113\118\128\164\155\180\162\146\203\192\177\196\195\200\220\220\208\233\214\245\25\54\57\25\18\75\40\87\30\75\103\97\93\111\93\122\144\135\130\166\186\194\196\161\176\153\216\193\245\208\251\194\17\2\14\0\253\48\9\33\59\45\67\42\29\63\54\128\98\96\113\138\140\136\124\179\168\180\137\202\213\156\235\190\203\177\228\205\229\249\25\250\231\18\11\23\69\81\84\32\100\65\55\85\125\97\118\87\127\108\128\179\155\194\207\158\173\219\222\206\245\243\229\3\7\22\36\30\47\240\241\21\70\19\36\93\65\105\102\88\68\73\153\114\101\130\168\133\123\154\204\163\201\156\190\209\226\240\231\250\238\232\34\229\10\25\16\69\75\66\18\43\64\47\74\59\87\122\97\92\126\104\150\116\172\182\153\194\153\179\227\193\227\203\0\7\235\245\248\226\49\44\47\35\57\42\44\44\104\96\88\110\86\74\90\112\117\142\138\146\151\151\205\164\173\197\222\175\253\185\10\254\227\12\250\253\19\4\45\74\79\85\51\69\58\112\73\94\86\77\86\113\146\122\164\136\178\186\191\151\219\190\215\205\253\249\249\254\225\243\25\35\42\13\12\3\47\83\44\99\71\116\84\87\139\126\86\143\117\129\143\174\163\164\189\219\159\168\232\169\180\255\254\223\10\220\22\247\6\243\0\10\26\33\40\47\54\84\93\101\101\111\111\96\117\146\137\144\139",103),
	[_1ii1lIli1("\238\231\253\4\0\12\12\31\224\236",116)] = _1ii1lIli1("\241\229\216\236\246\34\226\4\7\46\61\22\29\36\43\63\75\89\115\87\110\135\104\111\118\128\132\139\146\153\160\221\176\181\212\195\202\209\217\246\230\34\32\2\2\9\16\23\32\60\45\59\80\93\89\84\91\98\97\151\119\126\133\155\171\170\167\214\190\171\224\243\203\210\217\225\249\2\32\0\19\31\34\70\69\74\30\75\71\93\68\87\108\100\107\118\102\181\158\184\156\194\197\177\231\187\233\215\182\249\208\3\232\28\254\14\48\56\20\78\24\49\34\109\65\57\118\87\111\142\125\124\138\106\139\155\161\196\214\160\184\205\243\198\240\204\223\217\33\8\14\21\247\250\27\63\65\31\83\90\77\128\124\93\118\123\124\116\134\129\149\165\166\157\206\205\160\190\199\188\1\248\9\251\216\28\38\0\13\28\20\41\24\47\91\100\57\131\102\140\128\113\101\161\159\145\152\193\191\173\171\188\214\207\202\205\185\225\2\4\22\220\16\24\60\54\43\63\27\87\105\43\101\94\71\90\96\150\151\106\170\113\139\194\187\182\198\215\163\188\207\221\9\232\10\5\25\44\13\47\17\53\6\34\85\55\83\111\76\77\129\139\97\88\124\123\142\137\192\129\139\182\204\156\205\188\210\214\5\202\23\215\250\27\50\56\51\31\40\54\59\30\98\43\127\130\69\74\130\115\148\137\179\182\190\183\167\207\170\226\216\167\183\187\219\6\8\218\36\31\9\56\28\65\80\31\87\23\55\50\82\110\95\105\122\123\166\130\148\185\150\188\146\175\155\210\199\207\212\249\193\235\13\253\251\43\231\21\29\42\38\38\79\62\45\83\78\119\108\135\120\162\119\132\181\192\165\181\141\170\213\190\206\243\231\254\254\233\20\220\17\8\39\11\47\53\67\18\86\34\55\109\63\81\91\133\89\100\121\126\115\144\178\153\212\203\220\193\223\211\242\227\228\13\210\217\22\11\8\247\254\52\60\85\74\49\56\105\82\59\131\138\126\124\99\178\108\181\163\201\181\143\209\213\206\181\215\192\7\6\243\34\249\47\51\28\248\58\47\53\34\61\101\92\99\101\78\78\118\131\158\130\150\176\146\208\141\213\178\189\230\243\208\227\253\9\30\243\19\28\13\62\56\25\43\50\80\34\82\108\99\126\111\104\117\160\105\125\132\139\146\153\178\187\195\195\205\205\190\211\240\231\238\233",129),
}
S._NavIconCache = {}

function S._DecodeNavIcon(data)
	local env = (getgenv and getgenv()) or _G
	local cryptApi = env and env.crypt
	local decoder
	if type(cryptApi) == _1ii1lIli1("\9\253\5\22\22",142) then
		if type(cryptApi.base64) == _1ii1lIli1("\22\10\18\35\35",155) then decoder = cryptApi.base64.decode end
		if type(decoder) ~= _1ii1lIli1("\21\43\43\39\63\59\72\78",168) then decoder = cryptApi.base64decode end
	end
	local synApi = env and env.syn
	if type(decoder) ~= _1ii1lIli1("\34\56\56\52\76\72\85\91",181) and type(synApi) == _1ii1lIli1("\61\49\57\74\74",194) and type(synApi.crypt) == _1ii1lIli1("\74\62\70\87\87",207)
		and type(synApi.crypt.base64) == _1ii1lIli1("\87\75\83\100\105",220) then
		decoder = synApi.crypt.base64.decode
	end
	if type(decoder) ~= _1ii1lIli1("\86\108\113\109\133\129\142\148",233) and env then decoder = env.base64_decode end
	if type(decoder) == _1ii1lIli1("\104\126\126\122\146\142\155\161",246) then
		local ok, decoded = pcall(decoder, data)
		if ok and type(decoded) == _1ii1lIli1("\130\138\143\141\153\153",8) then return decoded end
	end

	local alphabet = _1ii1lIli1("\93\101\109\117\125\133\141\149\157\165\173\181\189\197\205\213\221\229\237\245\253\5\13\21\29\37\51\59\67\75\83\91\104\112\120\128\136\144\152\160\168\176\184\192\200\208\216\224\232\240\248\0\189\197\205\213\221\229\237\245\253\5\254\9",21)
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
	if not data or type(getter) ~= _1ii1lIli1("\143\165\165\161\185\181\194\200",34) or type(writefile) ~= _1ii1lIli1("\156\178\178\174\198\194\207\213",47) then return nil end
	local path = _1ii1lIli1("\140\184\182\202\211\207\206\181\238\245\238\4\10\205\17\33\22\35\37\45\3\14\60",60) .. string.gsub(kind, _1ii1lIli1("\117\132",73), _1ii1lIli1("\188",86)) .. _1ii1lIli1("\152\225\230\230",99)
	local exists = false
	if type(isfile) == _1ii1lIli1("\221\243\243\239\7\3\16\22",112) then
		local ok, result = pcall(isfile, path)
		exists = ok and result == true
	end
	if not exists then
		pcall(function()
			if type(makefolder) == _1ii1lIli1("\234\0\0\252\20\16\29\35",125) and (type(isfolder) ~= _1ii1lIli1("\247\13\13\9\33\29\42\48",138) or not isfolder(_1ii1lIli1("\231\19\17\37\46\42\41\16\73\80\73\95\101",151))) then
				makefolder(_1ii1lIli1("\244\32\30\50\59\55\54\29\86\93\86\108\119",164))
			end
		end)
		local ok = pcall(writefile, path, S._DecodeNavIcon(data))
		if not ok then return nil end
	end
	local asset = S._NavIconCache[kind]
	if not asset then
		local ok, result = pcall(getter, path)
		if not ok or type(result) ~= _1ii1lIli1("\43\51\56\54\66\66",177) then return nil end
		asset = result
		S._NavIconCache[kind] = asset
	end

	local slot = Instance.new(_1ii1lIli1("\11\62\52\71\70",190))
	slot.Name = _1ii1lIli1("\32\58\86\48\81\100\111\91\123\133\145",203)
	slot.Parent = parent
	slot.Position = UDim2.new(0, 8, 0.5, -11)
	slot.Size = UDim2.fromOffset(22, 22)
	slot.BackgroundColor3 = T.Elev
	slot.BackgroundTransparency = 1
	slot.BorderSizePixel = 0
	Corner(slot, 6)

	local image = Instance.new(_1ii1lIli1("\40\83\78\91\101\83\111\119\129\143",216))
	image.Name = _1ii1lIli1("\58\84\112\79\112\131\137",229)
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

local SG = Instance.new(_1ii1lIli1("\76\104\126\120\127\143\111\164\159",242))
SG.Name = _1ii1lIli1("\91\132\126\147\154\163\167\161\139\191\179",4)
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SG.ResetOnSpawn = false
SG.DisplayOrder = 1000
SG.IgnoreGuiInset = false
pcall(function() SG.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets end)

local uiP
if gethui then pcall(function() uiP = gethui() end) end
if not uiP then pcall(function() uiP = game:GetService(_1ii1lIli1("\91\142\152\146\123\176\171",17)) end) end
if not uiP then uiP = LP:WaitForChild(_1ii1lIli1("\117\152\148\179\166\186\150\203\198",30)) end
SG.Parent = uiP
S.Gui = SG

local NHost = Instance.new(_1ii1lIli1("\120\171\161\180\179",43))
NHost.Name = _1ii1lIli1("\141\181\193\189\193\213",56)
NHost.Parent = SG
NHost.AnchorPoint = Vector2.new(1, 0)
NHost.BackgroundTransparency = 1
NHost.Position = UDim2.new(1, -20, 0, 74)
NHost.Size = UDim2.new(0, 330, 0, 190)
NHost.ZIndex = 900
local nLayout = Instance.new(_1ii1lIli1("\161\156\166\202\219\227\194\222\253\250\7\13",69))
nLayout.Parent = NHost
nLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
nLayout.SortOrder = Enum.SortOrder.LayoutOrder
nLayout.Padding = UDim.new(0, 6)

local refreshSB
local UIStyle = {
	Roots = { SG },
	BackgroundRoles = { _1ii1lIli1("\155\167",82), _1ii1lIli1("\185\214\216\224\228\234\2",95), _1ii1lIli1("\182\219\243\236",108), _1ii1lIli1("\197\243\243\11",121), _1ii1lIli1("\213\3\17\7\27",134), _1ii1lIli1("\219\4\28\24\44\34\6\50",147), _1ii1lIli1("\233\18",160), _1ii1lIli1("\246\31\244",173), _1ii1lIli1("\21\64\2",186), _1ii1lIli1("\34\77\16",199), _1ii1lIli1("\47\73\56\86\93",212), _1ii1lIli1("\60\86\69\112",225), _1ii1lIli1("\64\111\119\113\101\131\138",238), _1ii1lIli1("\82\124\132\126\114\152",0), _1ii1lIli1("\85\126\133\142\158\171",13), _1ii1lIli1("\120\144\152\170\162",26) },
	TextRoles = { _1ii1lIli1("\133\157\165\183\175",39), _1ii1lIli1("\143\186",52), _1ii1lIli1("\156\199\136",65), _1ii1lIli1("\169\212\150",78), _1ii1lIli1("\182\225\164",91), _1ii1lIli1("\176\217\224\233\249\6",104) },
	StrokeRoles = { _1ii1lIli1("\190\231",117), _1ii1lIli1("\203\244\201",130), _1ii1lIli1("\215\0\7\16\32\45",143), _1ii1lIli1("\250\18\26\44\36",156), _1ii1lIli1("\4\47",169), _1ii1lIli1("\17\60\253",182), _1ii1lIli1("\30\73\11",195) },
}

function UIStyle:ReplaceColor(object, property, oldPalette, roles)
	local ok, value = pcall(function() return object[property] end)
	if not ok or typeof(value) ~= _1ii1lIli1("\26\77\81\91\101\45",208) then return end
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
				if object:IsA(_1ii1lIli1("\43\96\91\72\103\118\120\125\149",221)) and not object:GetAttribute(_1ii1lIli1("\68\108\101\127\123\124\116\143\147\162\161\134\185\189\199\209",234)) then
					self:ReplaceColor(object, _1ii1lIli1("\69\107\116\131\134\152\156\169\169\166\140\191\195\205\215\159",247), oldPalette, self.BackgroundRoles)
				end
				if object:IsA(_1ii1lIli1("\100\124\150\153\120\148\156\166\180",9)) or object:IsA(_1ii1lIli1("\113\137\163\166\123\181\187\194\196\202",22)) or object:IsA(_1ii1lIli1("\126\150\176\179\136\188\204",35)) then
					self:ReplaceColor(object, _1ii1lIli1("\139\163\189\192\150\201\205\215\225\169",48), oldPalette, self.TextRoles)
					if object:IsA(_1ii1lIli1("\152\176\202\205\162\214\230",61)) then self:ReplaceColor(object, _1ii1lIli1("\161\196\192\201\210\220\234\238\237\245\9\225\20\24\34\44\244",74), oldPalette, self.TextRoles) end
				elseif (object:IsA(_1ii1lIli1("\167\210\205\218\223\205\233\241\251\9",87)) or object:IsA(_1ii1lIli1("\180\223\218\231\236\208\10\16\23\25\31",100))) and not object:GetAttribute(_1ii1lIli1("\203\243\231\1\253\254\246\17\21\36\35\8\59\63\73\83",113)) then
					self:ReplaceColor(object, _1ii1lIli1("\206\249\244\1\6\235\30\34\44\54\254",126), oldPalette, self.TextRoles)
				elseif object:IsA(_1ii1lIli1("\229\252\18\22\26\33\37\49\49\23\74\64\83\82",139)) then
					self:ReplaceColor(object, _1ii1lIli1("\242\9\31\35\39\46\11\49\73\39\82\77\90\95\73\124\128\138\148\92",152), oldPalette, self.TextRoles)
				elseif object:IsA(_1ii1lIli1("\1\252\13\53\58\62\65\66",165)) then
					self:ReplaceColor(object, _1ii1lIli1("\252\47\51\61\71",178), oldPalette, self.StrokeRoles)
				elseif object:IsA(_1ii1lIli1("\27\22\27\77\67\77\89\92\113\126",191)) and object.Parent and object.Parent:IsA(_1ii1lIli1("\26\79\74\55\81\96\103\108\132",204)) then
					if object.Name == _1ii1lIli1("\40\60\50\61\102\105\115\123\143\107\157\147\157\169\172\188\201",217) then
						object.Color = ColorSequence.new(T.White:Lerp(T.Accent, 0.14), T.White:Lerp(T.Card, 0.06))
					elseif object.Name == _1ii1lIli1("\62\105\105\106\121\104\144\132\158\166\171\134\184\174\184\196\199\215\228",230) then
						object.Color = ColorSequence.new(T.White:Lerp(T.Accent, 0.16), T.White:Lerp(T.Elev, 0.08))
					elseif object.Name == _1ii1lIli1("\62\127\123\117\136\139\140\121\170\170\166\186\183\161\211\201\211\223\226\242\255",243) then
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
				if object:IsA(_1ii1lIli1("\96\120\146\149\116\144\152\162\176",5)) or object:IsA(_1ii1lIli1("\109\133\159\162\119\177\183\190\192\198",18)) or object:IsA(_1ii1lIli1("\122\146\172\175\132\184\200",31)) then
					local original = object:GetAttribute(_1ii1lIli1("\131\172\166\187\194\203\207\201\186\228\226\231\240\252\246\8\247\15\41\44\18\47\71\57",44))
					if not original then
						original = object.TextSize
						pcall(function() object:SetAttribute(_1ii1lIli1("\144\185\179\200\207\216\220\214\199\241\239\244\253\9\3\21\4\28\54\57\31\60\84\70",57), original) end)
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
				if object:IsA(_1ii1lIli1("\148\201\196\177\203\218\220\225\249",70)) and object:GetAttribute(_1ii1lIli1("\173\196\201\219\215\223\240\240\218\238\228",83)) == true then
					local scaler = object:FindFirstChild(_1ii1lIli1("\175\195\185\209\246\239\3\235\2\7\25\25",96))
					if not scaler then
						scaler = Instance.new(_1ii1lIli1("\201\196\213\236\241\3\3",109))
						scaler.Name = _1ii1lIli1("\201\221\211\235\16\9\29\5\28\33\51\51",122)
						scaler.Parent = object
					end

					scaler.Scale = S.HUDScale * (tonumber(object:GetAttribute(_1ii1lIli1("\219\4\254\12\22\22\254\40\58",135))) or 1)
				end
			end
		end
	end
	if S._refreshKeybindHUD then pcall(S._refreshKeybindHUD) end
	if S._refreshAppearance then pcall(S._refreshAppearance) end
end

UIStyle.NotificationPositions = {
	[_1ii1lIli1("\239\17\25\208\3\35\43\64",148)] = true, [_1ii1lIli1("\252\30\38\221\7\48\64\77\69\89",161)] = true, [_1ii1lIli1("\9\43\51\234\35\65\70\78\97",174)] = true,
	[_1ii1lIli1("\4\56\68\75\77\82\12\63\95\108\129",187)] = true, [_1ii1lIli1("\17\69\81\88\90\95\25\72\113\129\142\134\154",200)] = true, [_1ii1lIli1("\30\82\94\101\103\113\43\100\130\135\143\162",213)] = true,
}
function UIStyle:PlaceNotifications(value)
	S.NotificationPosition = self.NotificationPositions[value] and value or _1ii1lIli1("\61\95\103\35\92\122\127\135\154",226)
	local top = S.NotificationPosition:sub(1, 3) == _1ii1lIli1("\74\113\121",239)
	local left = S.NotificationPosition:sub(-4) == _1ii1lIli1("\84\116\124\145",1)
	local right = S.NotificationPosition:sub(-5) == _1ii1lIli1("\103\133\138\146\165",14)
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
	local toneKey = tone == _1ii1lIli1("\134\138\158\158\163\183",27) and _1ii1lIli1("\147\151\171\171\176\196",40) or tone == _1ii1lIli1("\179\164\188\191",53) and _1ii1lIli1("\192\177\201\204",66) or _1ii1lIli1("\191\203\202\218",79)
	local key = toneKey .. _1ii1lIli1("\99",92) .. tostring(title or "") .. _1ii1lIli1("\112",105) .. tostring(msg or "")
	local now = os.clock()
	if RecentNotifs[key] and now - RecentNotifs[key] < 1.1 then return end
	RecentNotifs[key] = now
	NOrder += 1
	dur = dur or 2.8
	local accent = toneKey == _1ii1lIli1("\230\242\241\1",118) and T.Accent or TONE[toneKey]
	SFX.Pop()

	local toast = Instance.new(_1ii1lIli1("\208\3\249\12\11",131))
	toast.Name = _1ii1lIli1("\229",144)
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

	local bar = Instance.new(_1ii1lIli1("\234\29\19\38\37",157))
	bar.Parent = toast
	bar.BackgroundColor3 = accent
	bar.BorderSizePixel = 0
	bar.Size = UDim2.new(0, 2, 1, 0)
	bar.ZIndex = 902
	Corner(bar, 2)

	local sc = Instance.new(_1ii1lIli1("\6\1\18\41\46\64\64",170)); sc.Scale = 0.9; sc.Parent = toast

	local tt = Instance.new(_1ii1lIli1("\18\42\68\71\38\66\74\84\98",183))
	tt.Parent = toast; tt.BackgroundTransparency = 1; tt.Font = FB
	tt.Position = UDim2.new(0, MOBILE and 12 or 16, 0, MOBILE and 4 or 8); tt.Size = UDim2.new(1, -28, 0, MOBILE and 15 or 17)
	tt.Text = string.upper(tostring(title or "")); tt.TextColor3 = T.White; tt.TextSize = MOBILE and 10 or 12
	tt.TextXAlignment = Enum.TextXAlignment.Left; tt.TextTruncate = Enum.TextTruncate.AtEnd; tt.ZIndex = 902

	local bt = Instance.new(_1ii1lIli1("\31\55\81\84\51\79\87\102\116",196))
	bt.Parent = toast; bt.BackgroundTransparency = 1; bt.Font = F
	bt.Position = UDim2.new(0, MOBILE and 12 or 16, 0, MOBILE and 19 or 25); bt.Size = UDim2.new(1, -28, 0, MOBILE and 16 or 17)
	bt.Text = tostring(msg or ""); bt.TextColor3 = T.Tx2; bt.TextSize = MOBILE and 10 or 11
	bt.TextXAlignment = Enum.TextXAlignment.Left; bt.TextTruncate = Enum.TextTruncate.AtEnd; bt.ZIndex = 902

	local timer = Instance.new(_1ii1lIli1("\30\81\71\90\89",209))
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

local WarnFrame = Instance.new(_1ii1lIli1("\43\94\84\103\107",222))
WarnFrame.Name = _1ii1lIli1("\55\103\121\117\135\147\98\148\148\168\177",235)
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

local warnBar = Instance.new(_1ii1lIli1("\74\125\115\134\133",248))
warnBar.Parent = WarnFrame
warnBar.BackgroundColor3 = Color3.fromRGB(255, 88, 88)
warnBar.BorderSizePixel = 0
warnBar.Size = UDim2.new(0, 3, 1, 0)
warnBar.ZIndex = 891
Corner(warnBar, 2)

local warnScale = Instance.new(_1ii1lIli1("\102\97\114\137\142\160\160",10)); warnScale.Parent = WarnFrame

local WarnTxt = Instance.new(_1ii1lIli1("\114\138\164\167\134\162\170\180\194",23))
WarnTxt.Parent = WarnFrame; WarnTxt.BackgroundTransparency = 1
WarnTxt.Position = UDim2.new(0, 17, 0, 8); WarnTxt.Size = UDim2.new(1, -95, 0, 18)
WarnTxt.Font = FB; WarnTxt.TextColor3 = Color3.fromRGB(255, 238, 238); WarnTxt.TextSize = 15
WarnTxt.TextXAlignment = Enum.TextXAlignment.Left; WarnTxt.Text = _1ii1lIli1("\112\128\141\137\155\167\117\165\177\173\192\197\200\212\212",36); WarnTxt.TextTruncate = Enum.TextTruncate.AtEnd; WarnTxt.ZIndex = 891

local warnPill = Instance.new(_1ii1lIli1("\140\164\190\193\160\188\196\206\220",49))
warnPill.Parent = WarnFrame; warnPill.AnchorPoint = Vector2.new(1, 0)
warnPill.Position = UDim2.new(1, -10, 0, 9); warnPill.Size = UDim2.fromOffset(66, 15)
warnPill.BackgroundColor3 = Color3.fromRGB(255, 88, 88); warnPill.BackgroundTransparency = 0.78
warnPill.BorderSizePixel = 0; warnPill.Font = FB; warnPill.TextSize = 8; warnPill.TextColor3 = Color3.fromRGB(255, 150, 150)
warnPill.Text = _1ii1lIli1("\153\148\165\159\162\188",62); warnPill.ZIndex = 891
Corner(warnPill, 5)

local WarnSub = Instance.new(_1ii1lIli1("\166\190\216\219\186\214\222\232\246",75))
WarnSub.Parent = WarnFrame; WarnSub.BackgroundTransparency = 1
WarnSub.Position = UDim2.new(0, 17, 0, 30); WarnSub.Size = UDim2.new(1, -30, 0, 16)
WarnSub.Font = F; WarnSub.TextColor3 = Color3.fromRGB(220, 177, 179); WarnSub.TextSize = 11
WarnSub.TextXAlignment = Enum.TextXAlignment.Left; WarnSub.Text = _1ii1lIli1("\166\203\225\148\239\241\169\243\6\20\10\30",88); WarnSub.ZIndex = 891

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
	WarnSub.Text = _1ii1lIli1("\192\187\204\198\201\227\182\204\211\203",101) .. (subText or _1ii1lIli1("\192\229\251\174\9\11\195\13\32\46\36\56\237\3\251\74\82\84\92",114))
	WarnFrame.Visible = true
	warnScale.Scale = 0.85
	Tween(warnScale, 0.25, { Scale = 1 }, Enum.EasingStyle.Back):Play()
	if S.WarningSound then snd(_1ii1lIli1("\248\239\12\252\21\28\21\43\39\41\6\2\9\26\25\32\42\52\59\67\72\85\92",127), 1, 0.6) end
	task.delay(3.5, function() if warnToken == my then WarnFrame.Visible = false end end)
end

local WW, WH = 920, 590

local Main = Instance.new(_1ii1lIli1("\217\12\2\21\20",140))
Main.Name = _1ii1lIli1("\237\8\23\35",153)
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
local mainScale = Instance.new(_1ii1lIli1("\2\253\14\37\42\60\60",166)); mainScale.Parent = Main
mainScale.Scale = 0.9
if MOBILE then

	local limit = Instance.new(_1ii1lIli1("\15\10\27\56\80\66\39\90\96\108\121\126\116\131\143\156",179))
	limit.MaxSize = Vector2.new(540, 430)
	limit.MinSize = Vector2.new(300, 260)
	limit.Parent = Main
end

local TBar = Instance.new(_1ii1lIli1("\13\64\54\73\72",192))
TBar.Name = _1ii1lIli1("\40\29\67\91",205)
TBar.Parent = Main
TBar.BackgroundTransparency = 1
TBar.Size = UDim2.new(1, 0, 0, M.titleH - 1)
TBar.Position = UDim2.new(0, 0, 0, 1)
TBar.Active = true

local TTitle = Instance.new(_1ii1lIli1("\53\77\103\106\78\106\114\124\138",218))
TTitle.Parent = TBar; TTitle.BackgroundTransparency = 1
TTitle.Position = UDim2.new(0, MOBILE and 16 or 18, 0, MOBILE and 12 or 7)
TTitle.Size = UDim2.new(0, 180, 0, MOBILE and 22 or 20)
TTitle.Font = FB; TTitle.Text = _1ii1lIli1("\62\71\70\91\98\107\111\105",231); TTitle.TextColor3 = T.White; TTitle.TextSize = 17
TTitle.TextXAlignment = Enum.TextXAlignment.Left

local TSub = Instance.new(_1ii1lIli1("\84\108\134\137\104\132\140\150\164",244))
TSub.Parent = TBar; TSub.BackgroundTransparency = 1
TSub.Position = UDim2.new(0, MOBILE and 16 or 18, 0, MOBILE and 31 or 27)
TSub.Size = UDim2.new(0, 180, 0, 15)
TSub.Font = F; TSub.Text = _1ii1lIli1("\85\85\95\99\117\80\121\138\134\143\158\173\170\188\180",6); TSub.TextColor3 = T.Tx3; TSub.TextSize = MOBILE and 11 or 12
TSub.TextXAlignment = Enum.TextXAlignment.Left

local UIRegistry = {}
local SearchEmpty
local SearchBox = Instance.new(_1ii1lIli1("\110\134\160\163\120\172\188",19))
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
SearchBox.PlaceholderText = _1ii1lIli1("\122\147\150\174\166\178\127\134\141",32)
SearchBox.PlaceholderColor3 = T.Tx3
SearchBox.Text = ""
SearchBox.ClearTextOnFocus = false
SearchBox.TextXAlignment = Enum.TextXAlignment.Left
Corner(SearchBox, MOBILE and 10 or 6)
Stroke(SearchBox, T.Bd2, 1, 0.4)
Pad(SearchBox, 0, 0, MOBILE and 14 or 8, MOBILE and 34 or 20)

local ClearSearchBtn = Instance.new(_1ii1lIli1("\136\160\186\189\146\204\210\217\219\225",45))
ClearSearchBtn.Parent = SearchBox
ClearSearchBtn.AnchorPoint = Vector2.new(1, 0.5)
ClearSearchBtn.Position = UDim2.new(1, MOBILE and -8 or -3, 0.5, 0)
ClearSearchBtn.Size = UDim2.new(0, MOBILE and 22 or 16, 0, MOBILE and 22 or 16)
ClearSearchBtn.BackgroundTransparency = 1
ClearSearchBtn.Font = FB; ClearSearchBtn.Text = _1ii1lIli1("\185",58); ClearSearchBtn.TextColor3 = T.Tx3; ClearSearchBtn.TextSize = 12
ClearSearchBtn.Visible = false
ClearSearchBtn.MouseButton1Click:Connect(function() SearchBox.Text = "" end)

local Pages, activePage = {}, nil
local function applySearch()
	local q = string.lower(SearchBox.Text):gsub(_1ii1lIli1("\172\122\207\142",71), ""):gsub(_1ii1lIli1("\128\213\148\148",84), "")
	local tokens = {}
	for w in string.gmatch(q, _1ii1lIli1("\141\194\161",97)) do table.insert(tokens, w) end
	ClearSearchBtn.Visible = (#tokens > 0)
	local cardVis = {}
	local matches = 0
	for _, e in ipairs(UIRegistry) do
		if e.row and e.row.Parent then
			local vis = true
			if #tokens > 0 then
				local hay = e.label .. _1ii1lIli1("\149",110) .. string.lower(e.card and e.card.Name or "")
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
SearchBox:GetPropertyChangedSignal(_1ii1lIli1("\214\238\8\11",123)):Connect(applySearch)

local function mkWinBtn(txt, xOff)
	local b = Instance.new(_1ii1lIli1("\227\251\21\24\237\39\45\52\54\60",136))
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
local btnClose = mkWinBtn(_1ii1lIli1("\244",149), MOBILE and -14 or -16)

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
	RunService:BindToRenderStep(_1ii1lIli1("\249\34\28\49\56\65\69\63\46\87\100\105\103\94\126\131\141\136\151",162), Enum.RenderPriority.Last.Value, function()
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

local Body = Instance.new(_1ii1lIli1("\252\47\37\56\55",175))
Body.Name = _1ii1lIli1("\5\57\53\81",188)
Body.Parent = Main
Body.BackgroundTransparency = 1
Body.Position = UDim2.new(0, 0, 0, M.titleH)

Body.Size = UDim2.new(1, 0, 1, -(M.titleH + (MOBILE and 8 or 32)))

local Sidebar = Instance.new(MOBILE and _1ii1lIli1("\35\58\80\84\88\95\99\116\116\90\141\131\150\149",201) or _1ii1lIli1("\35\86\76\95\94",214))
Sidebar.Name = _1ii1lIli1("\61\90\92\105\109\115\139",227)
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
local SBLayout = Instance.new(_1ii1lIli1("\76\76\86\122\139\147\114\142\173\170\183\189",240))
SBLayout.Parent = Sidebar
SBLayout.SortOrder = Enum.SortOrder.LayoutOrder
SBLayout.FillDirection = Enum.FillDirection.Vertical

SBLayout.VerticalAlignment = Enum.VerticalAlignment.Top
SBLayout.HorizontalAlignment = MOBILE and Enum.HorizontalAlignment.Center or Enum.HorizontalAlignment.Left
SBLayout.Padding = UDim.new(0, MOBILE and 6 or 4)

local openAppearance

if not MOBILE then
local ProfileButton = Instance.new(_1ii1lIli1("\93\117\143\146\103\161\167\174\176\182",2))
ProfileButton.Name = _1ii1lIli1("\102\143\147\145\155\165\165",15)
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
local ProfileAvatar = Instance.new(_1ii1lIli1("\108\151\146\159\164\146\174\182\192\206",28))
ProfileAvatar.Name = _1ii1lIli1("\113\173\159\185\173\197",41)
ProfileAvatar.Parent = ProfileButton
ProfileAvatar.Position = UDim2.new(0, 8, 0.5, -17)
ProfileAvatar.Size = UDim2.fromOffset(34, 34)
ProfileAvatar.BackgroundTransparency = 1
ProfileAvatar.BorderSizePixel = 0
ProfileAvatar.Image = _1ii1lIli1("\175\166\195\179\204\211\204\226\175\171\178\254\246\16\19\27\31\25\46\241\62\57\6\37\90\85\87\95\122\124\131\135\81\121\156\152\183\170\190\156\189\208\214\157\230\235\235",54)
ProfileAvatar.ImageColor3 = Color3.fromRGB(254, 254, 254)
ProfileAvatar.ScaleType = Enum.ScaleType.Crop
ProfileAvatar:SetAttribute(_1ii1lIli1("\157\197\185\211\207\208\200\227\231\246\245\218\13\17\27\37",67), true)
Corner(ProfileAvatar, 9999)
Stroke(ProfileAvatar, T.Bd2, 1, 0.4)
task.spawn(function()
	local ok, image = pcall(function()
		return Players:GetUserThumbnailAsync(LP.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
	end)
	if ok and type(image) == _1ii1lIli1("\202\210\215\213\225\225",80) and image ~= "" and ProfileAvatar.Parent then
		ProfileAvatar.Image = image
	end
end)
local ProfileTitle = Instance.new(_1ii1lIli1("\184\208\234\237\204\232\240\250\8",93))
ProfileTitle.Parent = ProfileButton; ProfileTitle.BackgroundTransparency = 1
ProfileTitle.Position = UDim2.new(0, 49, 0.5, -13); ProfileTitle.Size = UDim2.new(1, -56, 0, 15)
ProfileTitle.Font = FM; ProfileTitle.TextSize = 12; ProfileTitle.TextColor3 = T.Tx
ProfileTitle.TextXAlignment = Enum.TextXAlignment.Left; ProfileTitle.TextTruncate = Enum.TextTruncate.AtEnd
ProfileTitle.Text = LP.DisplayName
local ProfileSub = Instance.new(_1ii1lIli1("\197\221\247\250\217\245\253\7\21",106))
ProfileSub.Parent = ProfileButton; ProfileSub.BackgroundTransparency = 1
ProfileSub.Position = UDim2.new(0, 49, 0.5, 2); ProfileSub.Size = UDim2.new(1, -56, 0, 11)
ProfileSub.Font = F; ProfileSub.TextSize = 10; ProfileSub.TextColor3 = T.Tx3
ProfileSub.TextXAlignment = Enum.TextXAlignment.Left; ProfileSub.TextTruncate = Enum.TextTruncate.AtEnd
ProfileSub.Text = _1ii1lIli1("\190",119) .. tostring(LP.Name)
ProfileButton.MouseEnter:Connect(function() Tween(ProfileButton, 0.14, { BackgroundColor3 = T.Hover }):Play() end)
ProfileButton.MouseLeave:Connect(function() Tween(ProfileButton, 0.14, { BackgroundColor3 = T.Card }):Play() end)
ProfileButton.MouseButton1Click:Connect(function() if openAppearance then openAppearance() end end)
end

local SBLine = Instance.new(_1ii1lIli1("\209\4\250\13\12",132))
SBLine.Name = _1ii1lIli1("\235\225\242\22\34\32",145)
SBLine.Parent = Body
SBLine.BackgroundColor3 = T.Bd
SBLine.BorderSizePixel = 0
SBLine.Position = UDim2.new(0, 157, 0, 8)
SBLine.Size = UDim2.new(0, 1, 1, -24)
SBLine.Visible = not MOBILE
Corner(SBLine, 1)

local ContentArea = Instance.new(_1ii1lIli1("\248\15\37\41\45\52\56\68\68\42\93\83\102\106",158))
ContentArea.Name = _1ii1lIli1("\245\40\46\59\51\67\80",171)
ContentArea.Parent = Body
ContentArea.BackgroundTransparency = 1
ContentArea.BorderSizePixel = 0

ContentArea.Position = MOBILE and UDim2.new(0, M.railW + 12, 0, 0) or UDim2.new(0, 164, 0, 0)
ContentArea.Size = MOBILE and UDim2.new(1, -(M.railW + 18), 1, 0) or UDim2.new(1, -172, 1, 0)
ContentArea.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentArea.AutomaticCanvasSize = Enum.AutomaticSize.Y
ContentArea.ScrollBarThickness = MOBILE and 0 or 3
ContentArea.ScrollBarImageColor3 = T.Tx3

SearchEmpty = Instance.new(_1ii1lIli1("\19\43\69\72\39\67\75\85\99",184))
SearchEmpty.Name = _1ii1lIli1("\31\56\59\83\75\87\59\111\121\132\144",197)
SearchEmpty.Parent = Main
SearchEmpty.BackgroundTransparency = 1
SearchEmpty.Position = UDim2.new(0, MOBILE and (M.railW + 12) or 164, 0, M.titleH)
SearchEmpty.Size = MOBILE and UDim2.new(1, -(M.railW + 18), 1, -(M.titleH + 8)) or UDim2.new(1, -172, 1, -83)
SearchEmpty.Font = FM; SearchEmpty.TextSize = 14; SearchEmpty.TextColor3 = T.Tx3
SearchEmpty.TextXAlignment = Enum.TextXAlignment.Center; SearchEmpty.TextYAlignment = Enum.TextYAlignment.Center
SearchEmpty.Text = _1ii1lIli1("\39\79\7\91\86\117\107\119\127\139\139\75\152\174\174\170\194\190\203\209\221",210)
SearchEmpty.Visible = false
SearchEmpty.ZIndex = 20

local Footer = Instance.new(_1ii1lIli1("\44\95\85\109\108",223))
Footer.Parent = Main
Footer.BackgroundColor3 = T.Sidebar
Footer.BorderSizePixel = 0
Footer.AnchorPoint = Vector2.new(0, 1)
Footer.Position = UDim2.new(0, 0, 1, 0)
Footer.Size = UDim2.new(1, 0, 0, 32)
Footer.Visible = not MOBILE
Corner(Footer, 14)

local FootLeft = Instance.new(_1ii1lIli1("\71\95\126\129\96\124\132\142\156",236))
FootLeft.Parent = Footer; FootLeft.BackgroundTransparency = 1
FootLeft.Position = UDim2.new(0, 16, 0, 0); FootLeft.Size = UDim2.new(0, 200, 1, 0)
FootLeft.Font = FM; FootLeft.Text = _1ii1lIli1("\85\94\88\109\116\125\129\123\93\140\160\148",249); FootLeft.TextColor3 = T.Tx3; FootLeft.TextSize = 12
FootLeft.TextXAlignment = Enum.TextXAlignment.Left

local FootMid = Instance.new(_1ii1lIli1("\102\126\152\155\122\150\158\168\182",11))
FootMid.Parent = Footer; FootMid.BackgroundTransparency = 1
FootMid.AnchorPoint = Vector2.new(0.5, 0); FootMid.Position = UDim2.new(0.5, 0, 0, 0)
FootMid.Size = UDim2.new(0, 280, 1, 0)
FootMid.Font = FM; FootMid.Text = ""; FootMid.TextColor3 = T.Tx2; FootMid.TextSize = 12

local FootRight = Instance.new(_1ii1lIli1("\115\139\165\168\135\163\171\181\195",24))
FootRight.Parent = Footer; FootRight.BackgroundTransparency = 1
FootRight.AnchorPoint = Vector2.new(1, 0); FootRight.Position = UDim2.new(1, -16, 0, 0)
FootRight.Size = UDim2.new(0, 220, 1, 0)
FootRight.Font = F; FootRight.Text = _1ii1lIli1("\117\161\173\166\186\195\118\63\228\255\146\230\229\245\3",37); FootRight.TextColor3 = T.Tx3; FootRight.TextSize = 12
FootRight.TextXAlignment = Enum.TextXAlignment.Right

local isMinimized = false

local function mkPage(name)
    local sf = Instance.new(_1ii1lIli1("\127\178\168\187\186",50))
    sf.Name = name
    sf.Parent = ContentArea
    sf.BackgroundTransparency = 1
    sf.BorderSizePixel = 0
    sf.Position = UDim2.new(0, 0, 0, 0)
    sf.Size = UDim2.new(1, 0, 1, 0)
    sf.AutomaticSize = Enum.AutomaticSize.None
    sf.Visible = false

    local hdr = Instance.new(_1ii1lIli1("\154\178\204\207\174\202\210\220\234",63))
    hdr.Name = _1ii1lIli1("\166\191\194\218\210\222\197\232\253",76)
    hdr.Parent = sf
    hdr.LayoutOrder = -1
    hdr.BackgroundColor3 = T.Elev; pcall(function() hdr:SetAttribute(_1ii1lIli1("\180\207\211\226\225\198\249\253\7\17\248\28\32\32\33\11\49\58\73\76\94\98\111\116\113\87\138\142\152\162\106",89), _1ii1lIli1("\178\224\224\248",102)) end)
    hdr.BackgroundTransparency = 0.25
    hdr.BorderSizePixel = 0
    hdr.Size = UDim2.new(1, 0, 0, 24)
    hdr.Font = FB
    hdr.TextSize = 12
    hdr.TextColor3 = T.Tx2; pcall(function() hdr:SetAttribute(_1ii1lIli1("\206\233\237\252\251\224\19\23\33\43\18\54\58\58\59\55\79\105\108\71\122\126\136\146\90",115), _1ii1lIli1("\219\6\199",128)) end)
    hdr.TextXAlignment = Enum.TextXAlignment.Left
    hdr.Text = string.upper(name)
    hdr.Visible = false
    Corner(hdr, 6)
    Pad(hdr, 0, 0, 10, 10)
    Pages[name] = sf
    return sf
end

local TAB_DEFS = {
	{ name = _1ii1lIli1("\234\4\21\30\17\35\49",141), icon = _1ii1lIli1("\6\33\20",154) },
	{ name = _1ii1lIli1("\241\36\41\37\43\69",167), icon = _1ii1lIli1("\30\52\56\67\74\70\70\85\101",180) },
	{ name = _1ii1lIli1("\21\62\74\70\83\89",193), icon = _1ii1lIli1("\60\61\88\81\86",206) },
	{ name = _1ii1lIli1("\50\85\81\112\104\124",219), icon = _1ii1lIli1("\100\105\103\123\61\137\141\154\154\151",232) },
	{ name = _1ii1lIli1("\66\125\131\133",245), icon = _1ii1lIli1("\112\132\144",7) },
	{ name = _1ii1lIli1("\104\139\156\147",20), icon = _1ii1lIli1("\159\161\155\171\167\179",33) },
	{ name = _1ii1lIli1("\120\171\177\176\186\191",46), icon = _1ii1lIli1("\181\174\196\203\199\211\211\230\167\179",59) },
}

if MOBILE then table.insert(TAB_DEFS, { name = _1ii1lIli1("\145\203\209\216\218\224\236",72), icon = _1ii1lIli1("\207\200\222\229\225\237\237\0\193\205",85) }) end

local SBItems = {}

local function mkSBItem(name, iconKind, page, order)
	local btn = Instance.new(_1ii1lIli1("\189\213\239\242\199\1\7\14\16\22",98))
	btn.Name = _1ii1lIli1("\202\222\230\234",111) .. name
	btn.Parent = Sidebar
	btn.LayoutOrder = order

	btn.Size = MOBILE and UDim2.new(0, M.railW - 12, 0, M.railItemH) or UDim2.new(1, 0, 0, 34)
	btn.AutoButtonColor = false
	btn.BackgroundTransparency = 1
	btn.BorderSizePixel = 0
	btn.Text = ""
	Corner(btn, MOBILE and 12 or 8)

	local barInd = Instance.new(_1ii1lIli1("\201\252\242\5\4",124))
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
	local label = Instance.new(_1ii1lIli1("\228\252\22\25\248\20\28\38\52",137))
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
	local card = Instance.new(_1ii1lIli1("\227\22\12\31\30",150))
	card.Name = _1ii1lIli1("\251\38\33\34\49\32\72\60\86\94\99",163); card.Parent = Sidebar; card.LayoutOrder = 100
	card.Size = UDim2.new(1, 0, 0, 94); card.BackgroundColor3 = T.Card; card.BorderSizePixel = 0
	Corner(card, 9); Stroke(card, T.Bd2, 1, 0.28)
	local quickGradient = Grad(card, T.White:Lerp(T.Accent, 0.16), T.White:Lerp(T.Elev, 0.08), 90)
	quickGradient.Name = _1ii1lIli1("\8\51\46\47\62\45\85\73\99\107\117\80\130\120\130\142\145\161\174",176)
	local headMark = Instance.new(_1ii1lIli1("\10\61\51\70\69",189))
	headMark.Parent = card; headMark.Position = UDim2.fromOffset(9, 7); headMark.Size = UDim2.fromOffset(2, 11)
	headMark.BackgroundColor3 = T.Accent; headMark.BorderSizePixel = 0; Corner(headMark, 2)
	local heading = Instance.new(_1ii1lIli1("\37\61\87\90\57\85\98\108\122",202))
	heading.Parent = card; heading.BackgroundTransparency = 1
	heading.Position = UDim2.fromOffset(17, 4); heading.Size = UDim2.new(1, -35, 0, 18)
	heading.Font = FB; heading.TextSize = 10; heading.TextColor3 = T.Tx2
	heading.TextXAlignment = Enum.TextXAlignment.Left; heading.Text = _1ii1lIli1("\47\58\53\54\69\38\96\104\92\118\126\131",215)
	local stateDot = Instance.new(_1ii1lIli1("\49\100\90\114\113",228))
	stateDot.Parent = card; stateDot.AnchorPoint = Vector2.new(1, 0.5)
	stateDot.Position = UDim2.new(1, -9, 0, 13); stateDot.Size = UDim2.fromOffset(5, 5)
	stateDot.BackgroundColor3 = T.Accent; stateDot.BorderSizePixel = 0; Corner(stateDot, 5)
	local divider = Instance.new(_1ii1lIli1("\62\118\108\127\126",241))
	divider.Parent = card; divider.Position = UDim2.fromOffset(9, 25); divider.Size = UDim2.new(1, -18, 0, 1)
	divider.BackgroundColor3 = T.Bd; divider.BackgroundTransparency = 0.48; divider.BorderSizePixel = 0
	local body = Instance.new(_1ii1lIli1("\80\131\121\140\139",3))
	body.Parent = card; body.BackgroundTransparency = 1
	body.Position = UDim2.fromOffset(0, 27); body.Size = UDim2.new(1, 0, 1, -29)
	local function statusRow(keyText, index)
		local row = Instance.new(_1ii1lIli1("\93\144\134\153\152",16))
		row.Parent = body; row.BackgroundTransparency = 1
		row.Position = UDim2.new(0, 9, 0, (index - 1) * 21); row.Size = UDim2.new(1, -18, 0, 21)
		if index > 1 then
			local line = Instance.new(_1ii1lIli1("\106\157\147\166\165",29))
			line.Parent = row; line.Size = UDim2.new(1, 0, 0, 1)
			line.BackgroundColor3 = T.Bd; line.BackgroundTransparency = 0.62; line.BorderSizePixel = 0
		end
		local key = Instance.new(_1ii1lIli1("\133\157\183\186\153\181\189\199\213",42))
		key.Parent = row; key.BackgroundTransparency = 1; key.Size = UDim2.new(0, 48, 1, 0)
		key.Font = F; key.TextSize = 9; key.TextColor3 = T.Tx4; key.TextXAlignment = Enum.TextXAlignment.Left; key.Text = keyText
		local value = Instance.new(_1ii1lIli1("\146\170\196\199\166\194\202\212\226",55))
		value.Parent = row; value.BackgroundTransparency = 1; value.Position = UDim2.fromOffset(48, 0)
		value.Size = UDim2.new(1, -48, 1, 0); value.Font = FM; value.TextSize = 10; value.TextColor3 = T.Tx
		value.TextXAlignment = Enum.TextXAlignment.Right; value.TextTruncate = Enum.TextTruncate.AtEnd; value.Text = _1ii1lIli1("\120\127",68)
		return value
	end
	local roomValue = statusRow(_1ii1lIli1("\170\174\181\186",81), 1)
	local stateValue = statusRow(_1ii1lIli1("\184\192\180\206\198",94), 2)
	local networkValue = statusRow(_1ii1lIli1("\194\194\206\206",107), 3)
	task.spawn(function()
		while not S.Destroyed and card.Parent do
			local room = LP:GetAttribute(_1ii1lIli1("\209\245\252\1\233\23\22",120)) or LP:GetAttribute(_1ii1lIli1("\207\8\12\19\13\29\42\15\51\58\63",133)) or _1ii1lIli1("\198\205",146)
			local ping = math.floor((LP:GetNetworkPing() or 0) * 1000 + 0.5)
			local active = S.Ready ~= false
			roomValue.Text = tostring(room)
			stateValue.Text = active and _1ii1lIli1("\231\240\8\4\24\14",159) or _1ii1lIli1("\10\251\10\28\24\36\36",172)
			stateValue.TextColor3 = active and T.Accent or T.Tx3
			stateDot.BackgroundColor3 = active and T.Accent or T.Tx4
			stateDot.BackgroundTransparency = active and 0 or 0.45
			networkValue.Text = tostring(ping) .. _1ii1lIli1("\224\52\65",185)
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
	local panel = Instance.new(_1ii1lIli1("\19\70\60\79\78",198))
	panel.Name = _1ii1lIli1("\27\81\88\84\87\116\106\126\122\131\120\145\167\174\170\182\182\201",211)
	panel.Parent = SG
	panel.AnchorPoint = Vector2.new(0.5, 0.5)
	panel.Position = UDim2.fromScale(0.5, 0.5)

	panel.Size = MOBILE and UDim2.fromScale(0.9, 0.78) or UDim2.fromOffset(320, 456)
	if MOBILE then
		local limit = Instance.new(_1ii1lIli1("\60\55\72\106\130\116\89\140\146\158\166\171\161\176\188\201",224))
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
	local scale = Instance.new(_1ii1lIli1("\73\73\90\113\118\136\136",237)); scale.Parent = panel

	local title = Instance.new(_1ii1lIli1("\90\114\140\143\110\138\146\156\170",250))
	title.Parent = panel; title.BackgroundTransparency = 1
	title.Position = UDim2.fromOffset(16, 12); title.Size = UDim2.new(1, -58, 0, 24)
	title.Font = FB; title.TextSize = 15; title.TextColor3 = T.White
	title.TextXAlignment = Enum.TextXAlignment.Left; title.Text = _1ii1lIli1("\92\104\117\109\129\124\126\135\144",12)
	local subtitle = Instance.new(_1ii1lIli1("\116\140\166\169\136\164\172\182\196",25))
	subtitle.Parent = panel; subtitle.BackgroundTransparency = 1
	subtitle.Position = UDim2.fromOffset(16, 34); subtitle.Size = UDim2.new(1, -32, 0, 18)
	subtitle.Font = F; subtitle.TextSize = 10; subtitle.TextColor3 = T.Tx3
	subtitle.TextXAlignment = Enum.TextXAlignment.Left; subtitle.Text = _1ii1lIli1("\129\156\160\175\174\124\119\166\186\176\147\237\228\233\251\251\201\196\29\23\26\36\40\48\62\72\76\94\106\24\101\121\118\57\142\150\162\158\162\172\173\178\204\200\213\219\231",38)

	local close = Instance.new(_1ii1lIli1("\142\166\192\195\152\210\216\223\225\231",51))
	close.Parent = panel; close.AnchorPoint = Vector2.new(1, 0)
	close.Position = UDim2.new(1, -12, 0, 12); close.Size = UDim2.fromOffset(MOBILE and 36 or 26, MOBILE and 36 or 26)
	close.BackgroundColor3 = T.Elev; close.BorderSizePixel = 0; close.AutoButtonColor = false
	close.Font = FM; close.TextSize = MOBILE and 22 or 18; close.TextColor3 = T.Tx2; close.Text = _1ii1lIli1("\10\229",64); close.ZIndex = 1502
	Corner(close, MOBILE and 10 or 7); Stroke(close, T.Bd2, 1, 0.4)

	local body = Instance.new(_1ii1lIli1("\167\190\212\216\220\227\231\243\243\217\12\2\21\20",77))
	body.Parent = panel; body.BackgroundTransparency = 1; body.BorderSizePixel = 0
	body.Position = UDim2.fromOffset(14, 62); body.Size = UDim2.new(1, -28, 1, -76)
	body.CanvasSize = UDim2.new()
	body.AutomaticCanvasSize = Enum.AutomaticSize.Y
	body.ScrollBarThickness = MOBILE and 0 or 3
	body.ScrollBarImageColor3 = T.Tx3
	local layout = Instance.new(_1ii1lIli1("\182\177\187\223\240\248\215\243\18\15\28\34",90))
	layout.Parent = body; layout.SortOrder = Enum.SortOrder.LayoutOrder; layout.Padding = UDim.new(0, MOBILE and 10 or 8)
	local choiceRefreshers = {}

	local function makeChoice(labelText, values, getValue, onValue, order, display)
		local row = Instance.new(_1ii1lIli1("\180\231\221\240\239",103))
		row.Parent = body; row.LayoutOrder = order; row.Size = UDim2.new(1, 0, 0, MOBILE and 68 or 52)
		row.BackgroundColor3 = T.BG; row.BorderSizePixel = 0
		Corner(row, 9); Stroke(row, T.Bd2, 1, 0.42)
		local label = Instance.new(_1ii1lIli1("\207\231\1\4\227\255\7\17\31",116))
		label.Parent = row; label.BackgroundTransparency = 1
		label.Position = UDim2.fromOffset(10, MOBILE and 7 or 5); label.Size = UDim2.new(1, -20, 0, 17)
		label.Font = F; label.TextSize = MOBILE and 11 or 10; label.TextColor3 = T.Tx3
		label.TextXAlignment = Enum.TextXAlignment.Left; label.Text = labelText
		local button = Instance.new(_1ii1lIli1("\220\244\14\17\230\32\38\45\47\53",129))
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
	makeChoice(_1ii1lIli1("\233\225\251\254\209\11\8\32\18",142), textValues, function() return S.UITextScale end, function(value)
		UIStyle:ApplyTextScale(value)
	end, 1, function(value) return value == 0.88 and _1ii1lIli1("\245\22\17\35\42",155) or (value == 1.18 and _1ii1lIli1("\251\23\47\43\48",168) or _1ii1lIli1("\10\50\60\62\57\75",181)) end)
	makeChoice(_1ii1lIli1("\17\37\27\254\56\53\77\63",194), { 0.8, 0.9, 1, 1.15, 1.3 }, function()
		return S.HUDScale
	end, function(value)
		UIStyle:ApplyHUDScale(value)
	end, 2, function(value) return tostring(math.floor(value * 100 + 0.5)) .. _1ii1lIli1("\251",207) end)
	makeChoice(_1ii1lIli1("\49\57\69\65\74\84\85\90\116\112\125\131\92\147\153\164\161\179\175\188\194",220), { _1ii1lIli1("\68\102\115\42\99\129\134\142\161",233), _1ii1lIli1("\68\120\132\139\141\146\76\133\163\168\176\195",246), _1ii1lIli1("\81\133\145\152\154\159\89\131\172\188\201\193\213",8), _1ii1lIli1("\94\146\158\165\167\172\102\153\185\193\214",21), _1ii1lIli1("\125\159\167\94\145\177\185\206",34), _1ii1lIli1("\138\172\180\107\149\190\206\219\211\231",47) }, function()
		return S.NotificationPosition
	end, function(value)
		UIStyle:PlaceNotifications(value)
	end, 3)
	local themeCard = Instance.new(_1ii1lIli1("\137\188\178\197\196",60))
	themeCard.Parent = body; themeCard.LayoutOrder = 4; themeCard.Size = UDim2.new(1, 0, 0, MOBILE and 216 or 150)
	themeCard.BackgroundColor3 = T.BG; themeCard.BorderSizePixel = 0
	Corner(themeCard, 9); Stroke(themeCard, T.Bd2, 1, 0.42)
	local themeTitle = Instance.new(_1ii1lIli1("\164\188\214\217\184\212\220\230\244",73))
	themeTitle.Parent = themeCard; themeTitle.BackgroundTransparency = 1
	themeTitle.Position = UDim2.fromOffset(10, 5); themeTitle.Size = UDim2.new(1, -20, 0, 17)
	themeTitle.Font = F; themeTitle.TextSize = 10; themeTitle.TextColor3 = T.Tx3
	themeTitle.TextXAlignment = Enum.TextXAlignment.Left; themeTitle.Text = _1ii1lIli1("\177\172\176\191\190",86)
	local gridHost = Instance.new(_1ii1lIli1("\176\227\217\236\235",99))
	gridHost.Parent = themeCard; gridHost.BackgroundTransparency = 1
	gridHost.Position = UDim2.fromOffset(8, 26); gridHost.Size = UDim2.new(1, -16, 1, -34)
	local grid = Instance.new(_1ii1lIli1("\204\199\204\254\252\254\237\9\40\37\50\56",112))
	grid.Parent = gridHost; grid.CellSize = UDim2.new(0.5, -3, 0, MOBILE and 34 or 20); grid.CellPadding = UDim2.fromOffset(6, MOBILE and 6 or 4)
	grid.FillDirectionMaxCells = 2; grid.SortOrder = Enum.SortOrder.LayoutOrder
	local themeButtons = {}
	local themeNames = { _1ii1lIli1("\200\240\248\250\21\19\34",125), _1ii1lIli1("\216\10\0\22\21\29\47\39",138), _1ii1lIli1("\237\8\17\20\40",151), _1ii1lIli1("\241\33\43\37\58\66",164), _1ii1lIli1("\15\40\52\50",177), _1ii1lIli1("\27\53\66\70\70\92",190), _1ii1lIli1("\23\70\66\76\96",203), _1ii1lIli1("\32\83\79\89\114",216), _1ii1lIli1("\62\98\109\107",229) }
	local function refreshThemes()
		for name, button in pairs(themeButtons) do
			local selected = name == S.UITheme
			button.BackgroundColor3 = selected and T.ActiveBg or T.Elev
			button.TextColor3 = selected and T.White or T.Tx2
		end
	end
	for index, name in ipairs(themeNames) do
		local button = Instance.new(_1ii1lIli1("\77\106\132\135\92\150\156\163\165\171",242))
		button.Parent = gridHost; button.LayoutOrder = index; button.AutoButtonColor = false
		button.BackgroundColor3 = T.Elev; button.BorderSizePixel = 0
		button.Font = FM; button.TextSize = MOBILE and 13 or 10; button.TextColor3 = T.Tx2; button.Text = name
		Corner(button, MOBILE and 9 or 6); Stroke(button, T.Bd2, 1, 0.48)
		local dot = Instance.new(_1ii1lIli1("\81\132\122\141\140",4))
		dot.Parent = button; dot.AnchorPoint = Vector2.new(1, 0.5); dot.Position = UDim2.new(1, -7, 0.5, 0)
		dot.Size = UDim2.fromOffset(7, 7); dot.BackgroundColor3 = THEMES[name].Accent; dot.BorderSizePixel = 0; Corner(dot, 99)
		dot:SetAttribute(_1ii1lIli1("\107\147\135\161\157\158\150\177\181\196\195\168\219\223\233\243",17), true)
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

	local executor = Instance.new(_1ii1lIli1("\121\145\171\174\141\169\177\187\201",30))
	executor.Parent = body; executor.LayoutOrder = 5; executor.Size = UDim2.new(1, 0, 0, 28)
	executor.BackgroundColor3 = T.BG; executor.BorderSizePixel = 0
	executor.Font = F; executor.TextSize = 10; executor.TextColor3 = T.Tx2
	executor.TextXAlignment = Enum.TextXAlignment.Left
	local executorName = _1ii1lIli1("\135\167\171\181\189\204\202\131\207\233\221\226\251\1\3\13",43)
	pcall(function() if identifyexecutor then executorName = tostring(identifyexecutor()) end end)
	executor.Text = _1ii1lIli1("\95\102\109\153\179\167\172\197\203\205\215\172\179\186",56) .. executorName
	Corner(executor, 8); Stroke(executor, T.Bd2, 1, 0.44)
	for _, object in ipairs(panel:GetDescendants()) do if object:IsA(_1ii1lIli1("\147\200\195\176\202\217\219\224\248",69)) then object.ZIndex = math.max(object.ZIndex, 1501) end end

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

local BindPrompt = Instance.new(_1ii1lIli1("\159\210\200\219\218",82))
BindPrompt.Name = _1ii1lIli1("\182\223\217\238\245\254\2\252\224\14\26\23\253\34\56\67\75\79\73",95)
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

local BindPromptTitle = Instance.new(_1ii1lIli1("\199\223\249\252\219\247\255\9\23",108))
BindPromptTitle.Parent = BindPrompt; BindPromptTitle.BackgroundTransparency = 1
BindPromptTitle.Position = UDim2.fromOffset(12, 7); BindPromptTitle.Size = UDim2.new(1, -24, 0, 15)
BindPromptTitle.Font = FB; BindPromptTitle.TextSize = 11; BindPromptTitle.TextColor3 = T.White
BindPromptTitle.TextXAlignment = Enum.TextXAlignment.Left; BindPromptTitle.ZIndex = 981

local BindPromptSub = Instance.new(_1ii1lIli1("\212\236\6\9\232\4\12\22\36",121))
BindPromptSub.Parent = BindPrompt; BindPromptSub.BackgroundTransparency = 1
BindPromptSub.Position = UDim2.fromOffset(12, 24); BindPromptSub.Size = UDim2.new(1, -24, 0, 15)
BindPromptSub.Font = F; BindPromptSub.TextSize = 11; BindPromptSub.TextColor3 = T.Tx2
BindPromptSub.TextXAlignment = Enum.TextXAlignment.Left; BindPromptSub.Text = _1ii1lIli1("\221\6\0\21\28\208\24\222\48\49\76\250\80\90\15\99\113\126\131\124\62\135\161\167\174\176\182\111\56\221\248\139\183\236\227\167\241\1\1\4\28\36",134)
BindPromptSub.ZIndex = 981

local function bindTokenFromInput(input)
	if input.KeyCode and input.KeyCode ~= Enum.KeyCode.Unknown then
		if input.KeyCode == S.MenuKeybind then return nil end
		return _1ii1lIli1("\5\6\33\233",147) .. input.KeyCode.Name
	end
	local kind = input.UserInputType
	if kind == Enum.UserInputType.MouseButton1 or kind == Enum.UserInputType.MouseButton2
		or kind == Enum.UserInputType.MouseButton3 then
		return _1ii1lIli1("\20\29\42\47\40\4",160) .. kind.Name
	end
	return nil
end

local function bindTokenTitle(token)
	if type(token) ~= _1ii1lIli1("\39\47\52\50\62\62",173) then return _1ii1lIli1("\163\72\99",186) end
	local kind, value = token:match(_1ii1lIli1("\44\253\1\68\21\26\50\44\57\61\66\68",199))
	if not kind or not value then return _1ii1lIli1("\189\98\125",212) end
	local pretty = {
		LeftControl = _1ii1lIli1("\52\50\74\84\85",225), RightControl = _1ii1lIli1("\71\68\92\97\98",238), LeftShift = _1ii1lIli1("\83\97\93\101\105\126",0), RightShift = _1ii1lIli1("\102\110\106\114\118\139",13),
		LeftAlt = _1ii1lIli1("\109\105\123\138",26), RightAlt = _1ii1lIli1("\128\118\136\151",39), MouseButton1 = _1ii1lIli1("\136\115",52), MouseButton2 = _1ii1lIli1("\149\129",65), MouseButton3 = _1ii1lIli1("\162\143",78),
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
	S.Keybinds = type(S.Keybinds) == _1ii1lIli1("\214\202\210\227\227",91) and S.Keybinds or {}
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
	if type(map) == _1ii1lIli1("\227\215\223\240\240",104) then
		for id, token in pairs(map) do
			if BindRegistry[id] and type(token) == _1ii1lIli1("\239\247\252\250\6\6",117) then S.Keybinds[id] = token end
		end
	end
	for id in pairs(BindRegistry) do refreshBindChips(id) end
	markKeybindHUDDirty()
end
S._applyKeybindMap = applyKeybindMap

local function clearAllKeybinds()
	applyKeybindMap({})
	if RequestAutoSave then RequestAutoSave() end
	Notify(_1ii1lIli1("\212\245\16\0\14\26\23\45",130), _1ii1lIli1("\215\9\16\203\20\34\46\43\65\245\63\79\79\82\106\105\111",143), 1.8, _1ii1lIli1("\12\24\23\39",156))
end
S._clearAllKeybinds = clearAllKeybinds

local function startBindCapture(id)
	local entry = BindRegistry[id]
	if not entry then return end
	BindCapture.target = id

	BindCapture.readyAt = os.clock() + 0.12
	BindPromptTitle.Text = _1ii1lIli1("\242\0\12\9\236\2\9\1",169) .. string.upper(entry.label)
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
		Notify(_1ii1lIli1("\8\41\68\52\66\78\75",182), entry.label .. _1ii1lIli1("\234\179\94\113\6",195) .. bindTokenTitle(token), 1.8, _1ii1lIli1("\74\83\72\79\88\109\121",208))
	else
		Notify(_1ii1lIli1("\47\80\107\91\110\122\119",221), entry.label .. _1ii1lIli1("\17\91\112\112\115\139\133\139",234), 1.6, _1ii1lIli1("\108\120\119\135",247))
	end
end

local function registerBindable(id, label, trigger, isActive, kind)
	BindRegistry[id] = { label = label, trigger = trigger, isActive = isActive, kind = kind, chips = {} }
	return id
end
S._registerBindable = registerBindable

local function requestBindFromRightClick(target, id)
	target.Active = true
	target:SetAttribute(_1ii1lIli1("\96\137\131\152\159\168\172\166\138\184\196\193\173\207",9), id)
end
S._requestBindFromRightClick = requestBindFromRightClick

local function bindTargetAt(position)
	local ok, hits = pcall(function()
		local root = SG.Parent
		if root and type(root.GetGuiObjectsAtPosition) == _1ii1lIli1("\131\153\153\149\173\169\182\188",22) then
			return root:GetGuiObjectsAtPosition(position.X, position.Y)
		end
		local pg = LP:FindFirstChildOfClass(_1ii1lIli1("\122\157\153\184\171\191\155\208\203",35))
		return pg and pg:GetGuiObjectsAtPosition(position.X, position.Y) or {}
	end)
	if not ok or type(hits) ~= _1ii1lIli1("\171\159\167\184\184",48) then return nil end
	for _, hit in ipairs(hits) do
		local node = hit
		while node and node ~= SG do
			local id = node:GetAttribute(_1ii1lIli1("\148\189\183\204\211\220\224\218\190\236\248\245\225\3",61))
			if id and BindRegistry[id] then return id end
			node = node.Parent
		end
	end
	return nil
end

local function addBindChip(parent, id, rightOffset)
	local chip = Instance.new(_1ii1lIli1("\165\189\215\218\175\233\239\246\248\254",74))
	chip.Name = (MOBILE and _1ii1lIli1("\164\209\219\212\238\224",87) or _1ii1lIli1("\173\219\231\228\230",100)) .. id
	chip.Parent = parent
	chip.AnchorPoint = Vector2.new(1, 0.5)
	chip.Position = UDim2.new(1, rightOffset or -52, 0.5, 0)
	chip.Size = UDim2.fromOffset(MOBILE and 42 or 48, MOBILE and 26 or 20)
	chip.BackgroundColor3 = T.Elev
	chip.BorderSizePixel = 0
	chip.AutoButtonColor = false
	chip.Font = FM; chip.TextSize = 10; chip.TextColor3 = T.Tx2
	chip.Text = MOBILE and _1ii1lIli1("\186\211\212",113) or bindTokenTitle(S.Keybinds[id])
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
	local FloatHost = Instance.new(_1ii1lIli1("\203\254\244\7\6",126))
	FloatHost.Name = _1ii1lIli1("\216\5\15\8\34\30\42\42\12\70\76\83\85\91\103",139)
	FloatHost.Parent = SG
	FloatHost.BackgroundTransparency = 1
	FloatHost.Size = UDim2.fromScale(1, 1)

	FloatHost.ZIndex = 0
	FloatHost.Visible = MOBILE
	S._floatHost = FloatHost

	local Buttons = {}
	local spawnIndex = 0

	local FLOAT_ICON_RULES = {
		{ _1ii1lIli1("\12\11\27\41",152), _1ii1lIli1("\31\24\46\53\49\61\61\80\17\29",165) },
		{ _1ii1lIli1("\30\51\55",178), _1ii1lIli1("\43\70\57",191) },
		{ _1ii1lIli1("\54\66\66\85",204), _1ii1lIli1("\69\96\83",217) },
		{ _1ii1lIli1("\99\93\115\124\111\129",230), _1ii1lIli1("\95\127\114",243) },
		{ _1ii1lIli1("\128\133\123\132\141\161",5), _1ii1lIli1("\126\153\140",18) },
		{ _1ii1lIli1("\152\142\152\156\180",31), _1ii1lIli1("\152\179\166",44) },
		{ _1ii1lIli1("\161\176\187",57), _1ii1lIli1("\176\198\202\213\220\216\216\231\247",70) },
		{ _1ii1lIli1("\197\202\212\219",83), _1ii1lIli1("\202\224\228\239\246\242\242\1\17",96) },
		{ _1ii1lIli1("\235\220\244\247",109), _1ii1lIli1("\228\250\254\9\16\12\12\27\43",122) },
		{ _1ii1lIli1("\243\3\16\12\30\42",135), _1ii1lIli1("\254\20\24\35\42\38\38\53\69",148) },
		{ _1ii1lIli1("\14\27\47",161), _1ii1lIli1("\28\29\56\49\54",174) },
		{ _1ii1lIli1("\53\57\53\60\66",187), _1ii1lIli1("\54\55\82\75\80",200) },
		{ _1ii1lIli1("\70\88\87\97",213), _1ii1lIli1("\80\81\108\106\111",226) },
		{ _1ii1lIli1("\109\99\117\123",239), _1ii1lIli1("\111\112\139\132\137",1) },
		{ _1ii1lIli1("\131\139\134\150\154\168",14), _1ii1lIli1("\137\138\165\158\163",27) },
		{ _1ii1lIli1("\162\173\166\177",40), _1ii1lIli1("\163\164\191\184\189",53) },
		{ _1ii1lIli1("\188\192\201\199\211\224",66), _1ii1lIli1("\189\190\217\210\215",79) },
		{ _1ii1lIli1("\196\223\229\231",92), _1ii1lIli1("\210\230\242",105) },
		{ _1ii1lIli1("\227\229\253\255",118), _1ii1lIli1("\236\0\12",131) },
		{ _1ii1lIli1("\250\13\17\24\24\29\53",144), _1ii1lIli1("\6\26\38",157) },
		{ _1ii1lIli1("\21\39\46\56",170), _1ii1lIli1("\32\52\64",183) },
		{ _1ii1lIli1("\59\62\58\89\76\96",196), _1ii1lIli1("\77\82\75\95\33\114\118\131\131\128",209) },
		{ _1ii1lIli1("\84\100\108\97\107\123",222), _1ii1lIli1("\103\108\106\126\64\140\144\157\157\154",235) },
		{ _1ii1lIli1("\108\112\115\133",248), _1ii1lIli1("\134\139\132\152\90\166\170\183\183\180",10) },
		{ _1ii1lIli1("\129\148\154\153\163\168",23), _1ii1lIli1("\158\151\173\180\176\188\188\207\144\156",36) },
		{ _1ii1lIli1("\171\164\186\193\189\201\201",49), _1ii1lIli1("\184\177\199\206\202\214\214\233\170\182",62) },
		{ _1ii1lIli1("\187\199\212\204\224\219\221\230\239",75), _1ii1lIli1("\210\203\225\232\228\240\240\3\196\208",88) },
	}
	local function floatIconKind(id, label)
		local hay = string.lower(tostring(id) .. _1ii1lIli1("\140",101) .. tostring(label or ""))
		for _, rule in ipairs(FLOAT_ICON_RULES) do
			if string.find(hay, rule[1], 1, true) then return rule[2] end
		end
		return _1ii1lIli1("\240\242\236\252\248\4",114)
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
		if type(saved) ~= _1ii1lIli1("\250\238\246\7\7",127) or type(saved.x) ~= _1ii1lIli1("\1\15\14\10\20\40",140) or type(saved.y) ~= _1ii1lIli1("\14\28\27\23\33\53",153) then

			spawnIndex += 1
			saved = { x = 0.08, y = math.min(0.22 + (spawnIndex - 1) * 0.12, 0.9) }
			S.FloatButtons[id] = saved
		end

		local frame = Instance.new(_1ii1lIli1("\1\25\51\54\11\69\75\82\84\90",166))
		frame.Name = _1ii1lIli1("\0\45\55\48\74\60",179) .. id
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

		local dot = Instance.new(_1ii1lIli1("\13\64\54\73\72",192))
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

		local label = Instance.new(_1ii1lIli1("\40\64\90\93\60\88\101\111\125",205))
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

		local scale = Instance.new(_1ii1lIli1("\54\49\66\89\99\117\117",218))
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

		if id == _1ii1lIli1("\99\94\59\117\116\132\146",231) and not on then return end
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

		local keepMenu = S.FloatButtons[_1ii1lIli1("\117\112\72\130\129\145\159",244)]
		for id in pairs(Buttons) do destroyButton(id) end
		S.FloatButtons = {}
		if type(map) == _1ii1lIli1("\129\117\125\142\142",6) then
			for id, pos in pairs(map) do
				if type(pos) == _1ii1lIli1("\142\130\138\155\155",19) and entryFor(id) then
					S.FloatButtons[id] = { x = tonumber(pos.x) or 0.08, y = tonumber(pos.y) or 0.3 }
					createButton(id)
				end
			end
		end

		createButton(_1ii1lIli1("\156\151\111\169\168\184\198",32))
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

		tc(cam():GetPropertyChangedSignal(_1ii1lIli1("\138\164\167\192\192\198\208\217\191\220\244\230",45)):Connect(function()
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
	tc(cam():GetPropertyChangedSignal(_1ii1lIli1("\151\177\180\205\205\211\221\230\204\233\1\243",58)):Connect(relayout))

	tc(Workspace:GetPropertyChangedSignal(_1ii1lIli1("\145\202\206\213\207\223\236\194\231\250\249\13\3",71)):Connect(function()
		if cam() then
			relayout()
			tc(cam():GetPropertyChangedSignal(_1ii1lIli1("\177\203\206\231\231\237\247\0\230\3\27\13",84)):Connect(relayout))
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
    local header = page:FindFirstChild(_1ii1lIli1("\187\212\215\239\231\243\218\253\18",97))
    local subBar = page:FindFirstChild(_1ii1lIli1("\200\241\229\222\242\250\225\7\31",110)) or page:FindFirstChild(_1ii1lIli1("\216\242\3\12\255\17\31\6\47\35\28\48\56\31\69\93",123))

    if header and header.Visible then
        header.Position = UDim2.fromOffset(inset, top)
        header.Size = UDim2.new(1, -(inset * 2), 0, 24)
        top = top + 24 + gap
    end
    if subBar and subBar.Visible then
        local subBarHeight = tonumber(subBar:GetAttribute(_1ii1lIli1("\219\247\22\19\32\38\1\37\48\53\61\80",136))) or 30
        subBar.Position = UDim2.fromOffset(inset, top)
        subBar.Size = UDim2.new(1, -(inset * 2), 0, subBarHeight)
        top = top + subBarHeight + gap
    end

    local cards = {}
    for _, child in ipairs(page:GetChildren()) do
        if child:IsA(_1ii1lIli1("\226\21\11\30\29",149)) and child.Visible and child ~= subBar and (child:FindFirstChild(_1ii1lIli1("\242\30\37\35\55",162)) or child:FindFirstChildOfClass(_1ii1lIli1("\11\6\16\52\69\77\44\72\103\100\118\124",175))) then
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
    if not child:IsA(_1ii1lIli1("\10\63\58\39\65\80\82\87\116",188)) then return end
    tc(child:GetPropertyChangedSignal(_1ii1lIli1("\38\64\81\78\78\95\95",201)):Connect(queuePageLayout))
    tc(child:GetPropertyChangedSignal(_1ii1lIli1("\30\70\94\97\101\122\128\120\109\138\162\148",214)):Connect(queuePageLayout))
end
for _, page in pairs(Pages) do
    tc(page:GetPropertyChangedSignal(_1ii1lIli1("\64\90\107\109\109\126\126",227)):Connect(function()
        if page.Visible then queuePageLayout() end
    end))
    for _, child in ipairs(page:GetChildren()) do watchPageChild(child) end
    tc(page.ChildAdded:Connect(function(child)
        watchPageChild(child)
        queuePageLayout()
    end))
end
tc(ContentArea:GetPropertyChangedSignal(_1ii1lIli1("\56\101\125\128\132\148\154\146\135\164\188\174",240)):Connect(queuePageLayout))
S._RefreshPageLayout = function(searching)
    pageLayoutSearchMode = searching == true
    ContentArea.CanvasPosition = Vector2.zero
    queuePageLayout()
end
queuePageLayout()
end

local function mkSection(parent, title, order)
	local card = Instance.new(_1ii1lIli1("\79\130\120\139\138",2))
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

	local layout = Instance.new(_1ii1lIli1("\107\102\112\148\165\173\140\168\199\196\209\215",15))
	layout.Parent = card; layout.SortOrder = Enum.SortOrder.LayoutOrder; layout.Padding = UDim.new(0, M.rowGap)

	local hdrRow = Instance.new(_1ii1lIli1("\105\156\146\165\164",28))
	hdrRow.Parent = card; hdrRow.LayoutOrder = 0; hdrRow.BackgroundTransparency = 1
	hdrRow.Size = UDim2.new(1, 0, 0, 24)

	local tick = Instance.new(_1ii1lIli1("\118\169\159\178\177",41))
	tick.Parent = hdrRow; tick.BackgroundColor3 = T.Accent; tick.BorderSizePixel = 0
	tick.Position = UDim2.new(0, 0, 0.5, -6); tick.Size = UDim2.new(0, 3, 0, 13)
	Corner(tick, 2)
	local hdr = Instance.new(_1ii1lIli1("\145\169\195\198\165\193\201\211\225",54))
	hdr.Parent = hdrRow; hdr.BackgroundTransparency = 1
	hdr.Position = UDim2.new(0, 13, 0, 0); hdr.Size = UDim2.new(1, -13, 1, 0)
	hdr.Font = FB; hdr.TextSize = 13; hdr.TextColor3 = T.Tx2
	hdr.TextXAlignment = Enum.TextXAlignment.Left; hdr.Text = string.upper(title)

	return card
end

local function mkToggle(parent, label, key, order, callback)
	local knobInset = math.floor((M.trackH - M.knob) / 2)
	local row = Instance.new(_1ii1lIli1("\144\195\185\204\203",67))
	row.Name = label; row.Parent = parent; row.LayoutOrder = order
	row.Size = UDim2.new(1, 0, 0, M.rowH); row.BackgroundTransparency = 1

	local lbl = Instance.new(_1ii1lIli1("\171\195\221\224\191\219\227\237\251",80))
	lbl.Parent = row; lbl.BackgroundTransparency = 1
	lbl.Position = UDim2.new(0, 4, 0, 0)

	lbl.Size = UDim2.new(1, -(M.trackW + (MOBILE and 70 or 78)), 1, 0)
	lbl.Font = F; lbl.TextSize = M.rowFont; lbl.TextColor3 = T.Tx2
	lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.TextTruncate = Enum.TextTruncate.AtEnd; lbl.Text = label

	local track = Instance.new(_1ii1lIli1("\184\208\234\237\194\252\2\9\11\17",93))
	track.Parent = row
	track.AnchorPoint = Vector2.new(1, 0.5)
	track.Position = UDim2.new(1, -4, 0.5, 0)
	track.Size = UDim2.new(0, M.trackW, 0, M.trackH)
	track.BackgroundColor3 = T.TgOff
	track.AutoButtonColor = false
	track.Text = ""
	Corner(track, math.floor(M.trackH / 2))
	local trackStroke = Stroke(track, T.Bd2, 1, 0.5)

	local knob = Instance.new(_1ii1lIli1("\183\234\224\243\242",106))
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

	local bindId = S._registerBindable(_1ii1lIli1("\242\244\243\250\6\6\226",119) .. key, label, function()
		update(not S[key])
		SFX.Click()
		if RequestAutoSave then RequestAutoSave() end
	end, function() return S[key] == true end, _1ii1lIli1("\255\1\0\7\19\19",132))
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
	local card = Instance.new(_1ii1lIli1("\222\17\7\26\25",145))
	card.Name = label; card.Parent = parent; card.LayoutOrder = order
	card.Size = UDim2.new(1, 0, 0, M.sliderH); card.BackgroundTransparency = 1

	local lbl = Instance.new(_1ii1lIli1("\249\17\43\46\13\41\49\59\73",158))
	lbl.Parent = card; lbl.BackgroundTransparency = 1
	lbl.Position = UDim2.new(0, 4, 0, 2); lbl.Size = UDim2.new(0.6, 0, 0, 18)
	lbl.Font = F; lbl.TextSize = M.rowFont; lbl.TextColor3 = T.Tx2
	lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.TextTruncate = Enum.TextTruncate.AtEnd; lbl.Text = label

	local pill = Instance.new(_1ii1lIli1("\248\43\33\52\51",171))
	pill.Parent = card; pill.AnchorPoint = Vector2.new(1, 0)
	pill.Position = UDim2.new(1, -4, 0, 0); pill.Size = UDim2.new(0, MOBILE and 54 or 50, 0, MOBILE and 22 or 20)
	pill.BackgroundColor3 = T.Elev
	Corner(pill, 7); Stroke(pill, T.Bd, 1, 0.5)
	local valLbl = Instance.new(_1ii1lIli1("\19\43\69\72\29\81\97",184))
	valLbl.ClearTextOnFocus = false
	valLbl.Parent = pill; valLbl.BackgroundTransparency = 1; valLbl.Size = UDim2.new(1, 0, 1, 0)
	valLbl.Font = FM; valLbl.TextSize = MOBILE and 12 or 13; valLbl.TextColor3 = T.White; valLbl.Text = tostring(S[key] or minVal)

	local bar = Instance.new(_1ii1lIli1("\18\69\59\78\77",197))
	bar.Parent = card
	bar.Position = UDim2.new(0, 4, 0, MOBILE and 34 or 30); bar.Size = UDim2.new(1, -8, 0, M.barH)
	bar.BackgroundColor3 = T.Elev; bar.Active = true
	Corner(bar, math.floor(M.barH / 2))
	local fill = Instance.new(_1ii1lIli1("\31\82\72\91\90",210))
	fill.Parent = bar
	fill.Size = UDim2.new(math.clamp(((S[key] or minVal) - minVal) / (maxVal - minVal), 0, 1), 0, 1, 0)
	fill.BackgroundColor3 = T.Accent
	Corner(fill, math.floor(M.barH / 2))
	local grab = Instance.new(_1ii1lIli1("\44\95\85\109\108",223))
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
	local btn = Instance.new(_1ii1lIli1("\71\95\126\129\86\144\150\157\159\165",236))
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
	local bindId = S._registerBindable(_1ii1lIli1("\103\129\135\142\144\150\105",249) .. label:gsub(_1ii1lIli1("\109\119\69\158\139",11), _1ii1lIli1("\126",24)), label, function()
		pcall(callback)
		SFX.Click()
	end, nil, _1ii1lIli1("\142\168\174\181\183\189",37))
	S._addBindChip(btn, bindId, MOBILE and -8 or -6)
	S._requestBindFromRightClick(btn, bindId)
	btn.MouseButton1Click:Connect(function() pcall(callback); SFX.Click() end)
	table.insert(UIRegistry, { card = parent, row = btn, label = string.lower(label) })
	return btn
end

local function getGF() return Workspace:FindFirstChild(_1ii1lIli1("\128\161\180\179\197\200\196\227\183\231\235\234\242\6",50)) end
local function getHRP() local c = LP.Character; return c and c:FindFirstChild(_1ii1lIli1("\142\194\193\188\208\216\217\219\208\244\251\7\234\2\26\35",63)) end
local function getHum() local c = LP.Character; return c and c:FindFirstChildOfClass(_1ii1lIli1("\155\207\206\201\221\229\230\232",76)) end
local function objPos(obj)
	if obj:IsA(_1ii1lIli1("\162\200\225\218\204\228\252\5",89)) then return obj.Position end
	if obj:IsA(_1ii1lIli1("\186\227\223\231\245",102)) then
		local ok, piv = pcall(function() return obj:GetPivot() end)
		if ok and piv then return piv.Position end
		local p = obj:FindFirstChildWhichIsA(_1ii1lIli1("\188\226\251\244\230\254\22\31",115), true)
		return p and p.Position
	end
	return nil
end

local MONSTER_NAMES = {
	_1ii1lIli1("\232\252\252\8\8\28",128), _1ii1lIli1("\246\7\11\29\42",141), _1ii1lIli1("\17\17\29\33\38\41",154), _1ii1lIli1("\20\39\43\42\47\67",167), _1ii1lIli1("\43\35\55\52\60\75\84\90\92\111\115",180), _1ii1lIli1("\43\55\55\70\82\94\95\104\112\113\133",193),
	_1ii1lIli1("\54\18\19",206), _1ii1lIli1("\68\88\100\107\114\119\119\125\132\138\146\166",219), _1ii1lIli1("\81\101\119\119\115\124\144",232), _1ii1lIli1("\100\105\125\122\137\137\141\151\154\178\172\192",245), _1ii1lIli1("\115\142\129\137\143\164\172\160\186\182\195\201",7), _1ii1lIli1("\142\147\158\153\155\162\177\177",20),
	_1ii1lIli1("\137\145\165\170\173\185\179\205\201\214\220",33), _1ii1lIli1("\169\174\168\184\180\192\193\210\210\217\223\231\251",46), _1ii1lIli1("\178\178\192\202\207\218\209\212\229",59), _1ii1lIli1("\180\186\210\199\204\230\232\242",72), _1ii1lIli1("\208\213\211\212\227\242\250\242\6",85),
	_1ii1lIli1("\209\223\235\238\244\0\244\14\16",98), _1ii1lIli1("\226\236\244\240\247",111), _1ii1lIli1("\231\249\11\253\17",124), _1ii1lIli1("\3\252\255\23\15\27\38\42\47\55\74",137), _1ii1lIli1("\20\5\23\30\29\55\44\58\65\65\85",150), _1ii1lIli1("\18\18\42\33\47\59\59\64\84",163),
	_1ii1lIli1("\26\31\55\58\52\78\74\87\93",176), _1ii1lIli1("\40\58\66\73\69\83",189), _1ii1lIli1("\67\57\85\75\102\85\114\107",202),
}
local function monsterKind(nameLower)
	if nameLower:find(_1ii1lIli1("\66\92\81\95\102\107\127",215)) then return _1ii1lIli1("\79\105\94\113\120\120\140",228) end
	if nameLower:find(_1ii1lIli1("\93\125\112\120\126\147\155",241)) or nameLower:find(_1ii1lIli1("\118\128\135\138\147\142\162",3)) then return _1ii1lIli1("\124\151\138\146\152\173\181",16) end
	if nameLower:find(_1ii1lIli1("\151\156\167\162\164\171\186\186",29)) then return _1ii1lIli1("\164\169\180\175\177\184\199\199",42) end
	if nameLower:find(_1ii1lIli1("\161\166\190\193\187\213\209\222\228",55)) then return _1ii1lIli1("\174\179\203\206\200\226\222\235\241",68) end
	for _, m in ipairs(MONSTER_NAMES) do
		if nameLower:find(m, 1, true) then return _1ii1lIli1("\197\206\212\224\232\224\244",81) end
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
	BoardPuzzle = _1ii1lIli1("\181\187\202\191\211\168\209\229\222\246\239\210\232\239\231\15\33\37\42\56",94), BridgeControl = _1ii1lIli1("\180\203\201\203\213\218\188\230\249\255\12\17\21\25",107),
	Button = _1ii1lIli1("\206\200\215\217\222\246\242\6\252\222\7\33\39\46\48\54",120), Lever = _1ii1lIli1("\219\213\228\230\235\3\255\19\9\235\30\30\54\44\64",133),
	TreadmillPanel = _1ii1lIli1("\237\242\236\239\249\9\12\22\29\248\34\53\59\72\82\86\90",146), Tram = _1ii1lIli1("\250\255\245\8\226\12\31\37\50\55\59\63",159),
	TurretControls = _1ii1lIli1("\7\15\19\26\20\42\253\39\58\64\77\87\91\95",172),
}
local PromptCache = {}

local PassedDoors = {}

local function getInteractionType(prompt)
	local node = prompt.Parent
	while node and node ~= Workspace do
		local interactionType = node:GetAttribute(_1ii1lIli1("\9\53\66\58\78\68\77\101\97\115\121\102\146\144\140",185))
		if type(interactionType) == _1ii1lIli1("\64\72\77\75\87\87",198) and interactionType ~= "" then
			return interactionType, node
		end
		node = node.Parent
	end
	return nil, nil
end
local function classifyPrompt(prompt)
	local parent = prompt.Parent
	local part
	if parent and parent:IsA(_1ii1lIli1("\28\66\91\84\70\99\123\132",211)) then
		part = parent
	elseif parent and parent:IsA(_1ii1lIli1("\40\98\105\98\107\119\131\130\146\159",224)) then
		part = parent.Parent
	end
	if not (part and part:IsA(_1ii1lIli1("\54\97\122\115\101\125\149\158",237))) then
		part = parent and parent:FindFirstAncestorWhichIsA(_1ii1lIli1("\72\110\135\128\114\138\162\171",250))
	end
	if not part then return nil end
	local model = part:FindFirstAncestorOfClass(_1ii1lIli1("\96\137\133\141\155",12))
	local mname = model and model.Name or part.Name
	local mnameLower = mname:lower()
	local interactionType, interactionRoot = getInteractionType(prompt)
	local kind
	if mname:match(_1ii1lIli1("\126\106\163\167\174\168\184\180\209",25)) or interactionType == _1ii1lIli1("\112\169\173\180\174\190\186\215\167\205\230\223",38) then kind = _1ii1lIli1("\157\182\186\193\187\203\199\228",51)
	elseif mname == _1ii1lIli1("\138\189\185\193\165\220\214\217\226\238\242\6",64) or KEY_INTERACTIONS[interactionType] or mnameLower:find(_1ii1lIli1("\191\192\219\204\209\233\226",77), 1, true) then kind = _1ii1lIli1("\204\205\232\217\222\246\239",90)
	elseif ITEM_MODELS[mname] or ITEM_INTERACTIONS[interactionType] then kind = _1ii1lIli1("\215\233\225\240",103)
	elseif DOOR_INTERACTIONS[interactionType] or (mnameLower:find(_1ii1lIli1("\223\241\248\2",116), 1, true) and part.Name == _1ii1lIli1("\218\254\5\17",129)) then kind = _1ii1lIli1("\249\11\18\28",142)
	elseif mname == _1ii1lIli1("\238\24\19\34\35\55",155) then
		if model and (model:GetAttribute(_1ii1lIli1("\248\36\49\41\61\51\60\84\80\93\99\85\129\127\123",168)) == _1ii1lIli1("\9\50\56\68\76\68\88\57\99\99\114\115\135",181) or model:FindFirstChild(_1ii1lIli1("\49\57\62\70\81\85\90\98\122",194))) then
			kind = _1ii1lIli1("\76\76\77\79\94\104\104\119\120\140",207)
		else
			kind = _1ii1lIli1("\79\89\84\99\105\125",220)
		end
	elseif DRAWER_INTERACTIONS[interactionType] or mnameLower:find(_1ii1lIli1("\84\105\100\129\118\138",233), 1, true) or mnameLower:find(_1ii1lIli1("\101\106\114\128\140\138\160",246), 1, true) then kind = _1ii1lIli1("\115\136\126\155\144\164",8)
	elseif HAZARD_INTERACTIONS[interactionType] or mnameLower:find(_1ii1lIli1("\144\149\147\161\175\168\184\178",21), 1, true) or mnameLower:find(_1ii1lIli1("\157\165\169\176\170\192",34), 1, true) or mnameLower:find(_1ii1lIli1("\163\166\178\176",47), 1, true) then kind = _1ii1lIli1("\171\171\203\185\209\202",60)
	elseif interactionType == _1ii1lIli1("\162\188\196\206\216\223\188\226\252\3\251\15\13\16\37",73) then kind = _1ii1lIli1("\207\201\209\219\229\236",86)
	elseif interactionType == _1ii1lIli1("\192\210\228\245\235",99) then kind = _1ii1lIli1("\237\223\241\2\248",112)
	elseif interactionType == _1ii1lIli1("\214\240\2\250\9\25\1\46\47\55\47\62",125) then kind = _1ii1lIli1("\3\253\15\7\22\38",138)
	elseif OBJECTIVE_INTERACTIONS[interactionType] then kind = _1ii1lIli1("\13\7\22\24\29\53\49\69\59",151)
	else kind = _1ii1lIli1("\26\38\33\37\57",164) end
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
		or model:GetAttribute(_1ii1lIli1("\10\46\53\58\40\84\82\78",177)) == _1ii1lIli1("\9\49\52\62\38\86\83\105",190)
		or model:GetAttribute(_1ii1lIli1("\22\62\65\75\51\99\101",203)) == true
end

local function textMentionsKeycard(value)
	if type(value) ~= _1ii1lIli1("\82\90\95\93\110\110",216) then return false end
	local text = value:lower()
	return text:find(_1ii1lIli1("\87\88\115\105\110\134\127",229), 1, true) ~= nil
		or text:find(_1ii1lIli1("\100\106\133\51\125\130\154\147",242), 1, true) ~= nil
		or text:find(_1ii1lIli1("\110\115\139\132\71\160\154\157\167\175\195",4), 1, true) ~= nil
end

local function isKeycardDoor(e)
	if not (e and e.kind == _1ii1lIli1("\124\142\149\159",17) and e.model) then return false end
	local model = e.model
	for _, attrName in ipairs({ _1ii1lIli1("\119\145\164\175\170\186\180\201\168\201\228\213\218\242\235",30), _1ii1lIli1("\125\158\185\170\175\199\192\181\207\226\237\232\248\242\248",43), _1ii1lIli1("\138\171\198\151\188\212\205\194\220\239\250\245\5\255\5",56), _1ii1lIli1("\143\180\204\197\186\212\231\242\237\253\247\253",69), _1ii1lIli1("\171\197\216\227\222\238\232\253\212\249\17\10",82), _1ii1lIli1("\167\208\215\224\245\252\220\252\20\10\24",95), _1ii1lIli1("\197\223\242\253\248\8\2\8\236\21\28\37\58\65",108), _1ii1lIli1("\204\246\241\0\240\28\26\22",121) }) do
		local value = model:GetAttribute(attrName)
		if value == true or (type(value) == _1ii1lIli1("\251\9\8\4\14\34",134) and value > 0) or textMentionsKeycard(value) then return true end
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
					if d:IsA(_1ii1lIli1("\234\19\23\39\31\42\45\63\75\41\82\86\91\101\117",147)) then
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
	DropBattery = _1ii1lIli1("\233\15\41\48\40\60\74",160), Flashlight = _1ii1lIli1("\250\39\35\60\56\67\71\76\84\103",173), Lantern = _1ii1lIli1("\13\41\61\74\66\86\89",186),
	FlashBeacon = _1ii1lIli1("\20\65\61\86\82\17\58\105\108\117\136\142",199), Glider = _1ii1lIli1("\34\78\82\84\92\117",212), HealthCrate = _1ii1lIli1("\48\84\87\110\125\120\55\97\151\141\167\159",225),
	OxygenTank = _1ii1lIli1("\68\121\129\118\123\139\68\127\147\167\171",238), Medkit = _1ii1lIli1("\84\115\121\135\140\158",0), SPRINT = _1ii1lIli1("\103\107\116\86\121\133\146",13),
	HealthBoost = _1ii1lIli1("\105\141\144\162\177\172\107\148\200\207\218\226",26), SmallLantern = _1ii1lIli1("\129\162\157\175\182\113\164\192\212\225\217\237\240",39), WindupLight = _1ii1lIli1("\146\171\183\180\204\206\133\184\220\225\233\252",52),
}
local function tagTitleFor(e)
	if e.kind == _1ii1lIli1("\171\196\200\207\201\217\213\242",65) then
		local amt = e.name:match(_1ii1lIli1("\179\159\216\220\227\221\237\233\6\188\192\6\212\217",78))
		return amt and (amt .. _1ii1lIli1("\130\180\226\230\236\234\254",91)) or _1ii1lIli1("\186\232\236\242\240\4",104)
	elseif e.kind == _1ii1lIli1("\229\247\239\254",117) then return ITEM_LABEL[e.name] or e.name
	elseif e.kind == _1ii1lIli1("\244\245\16\1\6\30\23",130) then
		if e.name == _1ii1lIli1("\217\12\8\16\244\43\37\40\49\61\65\85",143) then return _1ii1lIli1("\230\249\245\253\223\8\31\25\28\37\49\53\73\35\57\64\56\111\111\112\127\91\151\153",156) end
		if e.interactionType == _1ii1lIli1("\245\35\35\59\45\71\73\83\51\84\111",169) then return _1ii1lIli1("\2\16\16\40\26\52\54\64\21\76\77\104\54\76\83\75\130\130\131\146\110\170\172",182) end
		if e.interactionType == _1ii1lIli1("\26\50\75\82\93\92\102\100\87\111\133\129\149",195) then return _1ii1lIli1("\24\33\40\49\70\77\38\80\99\95\103\73\95\102\94\149\149\150\165\129\189\191",208) end
		return _1ii1lIli1("\47\48\75\60\70\94\87\58\80\87\79\134\134\135\150\114\174\176",221)
	elseif e.kind == _1ii1lIli1("\85\103\115\125",234) then
		local m = e.model
		if m:GetAttribute(_1ii1lIli1("\83\124\128\127\145\139\160\167\127\177\184\194",247)) then return _1ii1lIli1("\94\92\118\121\76\133\137\144\149\111\148\155",9) end
		if isKeycardDoor(e) then return _1ii1lIli1("\104\105\132\117\122\146\139\110\150\159\166\175\196\203\159\181\188\180\231\241\236\251\252\2",22) end
		if m:GetAttribute(_1ii1lIli1("\118\160\155\170\171\177",35)) then
			local code = LP:GetAttribute(_1ii1lIli1("\122\173\169\177",48))
			return code and (_1ii1lIli1("\143\144\171\169\161\171\142\164\171\163",61) .. tostring(code)) or _1ii1lIli1("\156\157\184\182\174\184\155\177\184\176\227\237\232\247\248\254",74)
		end
		return _1ii1lIli1("\162\212\219\229",87)
	elseif e.kind == _1ii1lIli1("\215\225\220\235\236\0",100) then return _1ii1lIli1("\196\238\233\248\249\13\194\209\35\24\36\42\245",113)
	elseif e.kind == _1ii1lIli1("\251\251\252\254\13\23\18\33\34\54",126) then return _1ii1lIli1("\232\232\233\235\206\1\11\6\21\22\42\255\19\13\56\79\39\92\100\112\67\114\122\124\132",139)
	elseif e.kind == _1ii1lIli1("\3\24\14\43\32\52",152) then return _1ii1lIli1("\240\37\27\56\45\65",165)
	elseif e.kind == _1ii1lIli1("\33\33\65\47\71\64",178) then
		if e.interactionType == _1ii1lIli1("\18\46\66\63\79\82\94\92",191) or e.interactionType == _1ii1lIli1("\23\76\66\95\84\104\78\106\126\123\139\142\154\152",204) then return _1ii1lIli1("\44\40\60\57\78\81\93\91\61\83\90\82\125\137\154\143\167\169",217) end
		if e.interactionType == _1ii1lIli1("\65\102\105\119\133\126\142\136",230) then return _1ii1lIli1("\78\88\86\100\114\107\123\117\87\109\116\108\151\155\175\175\180\200",243) end
		if e.interactionType == _1ii1lIli1("\96\136\140\147\141\163",5) or e.interactionType == _1ii1lIli1("\92\149\154\162\164\169\151\191\195\202\196\218",18) then return _1ii1lIli1("\122\130\134\141\135\157\112\134\141\133\176\180\200\200\205\225",31) end
		if e.interactionType == _1ii1lIli1("\134\159\162\149\184\196\194\215",44) then return _1ii1lIli1("\147\140\143\117\169\172\184\182\152\174\181\173\216\220\240\240\245\9",57) end
		return e.name
	elseif e.kind == _1ii1lIli1("\191\185\193\203\213\220",70) then return _1ii1lIli1("\156\162\188\195\187\207\221\171\228\222\230\240\250\1",83)
	elseif e.kind == _1ii1lIli1("\221\207\225\242\232",96) then return _1ii1lIli1("\202\188\206\223\213\183\205\212\204\5\9\21\9\35\27",109)
	elseif e.kind == _1ii1lIli1("\243\237\255\247\6\22",122) then
		local fixed = e.interactionRoot and e.interactionRoot:FindFirstChild(_1ii1lIli1("\212\254\20\8\14",135))
		local progress = fixed and tonumber(fixed.Value)
		return progress and (_1ii1lIli1("\226\231\247\245\9\255\25\27\37\250\16\23\15",148) .. math.floor(progress + 0.5) .. _1ii1lIli1("\205",161)) or _1ii1lIli1("\252\1\17\15\35\25\51\53\63\20\47\54\46\103\97\115\107\122\138",174)
	elseif e.kind == _1ii1lIli1("\49\43\58\60\65\89\85\105\95",187) then return OBJECTIVE_LABELS[e.interactionType] or _1ii1lIli1("\30\24\39\41\46\70\66\91\81",200)
	end
	return e.name
end

local function isRepairComplete(e)
	if not (e and e.kind == _1ii1lIli1("\78\72\90\82\97\118",213) and e.interactionRoot) then return false end
	local fixed = e.interactionRoot:FindFirstChild(_1ii1lIli1("\47\89\111\104\110",226))
	return fixed ~= nil and tonumber(fixed.Value) ~= nil and fixed.Value >= 100
end

local hideInLockerNow, attemptRespawn
local SaveConfigFile, LoadConfigFile
local refreshVisionEffects

local suppressedPostEffects = {}

local TeammateChamReg = {}
local function getVisionGrade()
	local grade = Lighting:FindFirstChild(_1ii1lIli1("\70\116\110\131\138\147\151\145\123\175\163\158\184\201\198\211\217\185\235\225\235\243",239))
	if not grade then
		grade = Instance.new(_1ii1lIli1("\75\126\130\140\150\110\161\171\178\172\177\201\197\210\216\182\222\229\235\240\8",1))
		grade.Name = _1ii1lIli1("\101\142\136\157\164\173\177\171\149\201\189\184\210\227\224\237\243\211\5\251\5\13",14)
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
					local removable = effect:IsA(_1ii1lIli1("\100\149\165\169\131\171\178\184\189\213",27)) or effect:IsA(_1ii1lIli1("\113\162\172\179\184\151\191\198\204\209\233",40)) or effect:IsA(_1ii1lIli1("\127\178\182\192\202\162\213\223\230\224\229\253\249\6\12\234\18\25\31\36\60",53))
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
		local grade = Lighting:FindFirstChild(_1ii1lIli1("\153\194\188\209\216\225\229\223\201\253\241\236\6\23\20\33\39\7\57\47\57\65",66))
		if grade then grade:Destroy() end
	end)
	for _, plr in ipairs(Players:GetPlayers()) do
		local ch = plr.Character
		local hl = ch and ch:FindFirstChild(_1ii1lIli1("\166\207\201\222\229\238\242\236\222\1\253\28\15\35\251\39\39\58",79))
		if hl then pcall(function() hl:Destroy() end) end
	end
	for plr, entry in pairs(TeammateChamReg) do
		pcall(function() if entry.model then entry.model:Destroy() end end)
		TeammateChamReg[plr] = nil
	end
end

local secEntities = mkSection(Pages.Visuals, _1ii1lIli1("\168\216\229\225\243\255\173\217\238\242",92), 1)
mkToggle(secEntities, _1ii1lIli1("\189\230\236\248\0\248\12\193\237\2\6\221\236\12\64\64\76\76\96\36\67\116\120\138\151\83\89\96\103\105",105), _1ii1lIli1("\194\242\255\251\13\25\236\1\5",118), 1)
mkToggle(secEntities, _1ii1lIli1("\225\242\4\11\198\241\43\32\46\53\53\73\254\42\63\67",131), _1ii1lIli1("\238\255\17\24\247\49\38\52\59\59\79\41\62\66",144), 2)
mkToggle(secEntities, _1ii1lIli1("\233\36\23\31\37\58\66\54\80\76\89\95\24\51\43\94\136\143\146\155\150\170\99\143\164\168",157), _1ii1lIli1("\246\49\36\44\50\71\79\39\60\64",170), 3)
mkToggle(secEntities, _1ii1lIli1("\17\54\65\60\62\69\84\84\22\71\92\96",183), _1ii1lIli1("\30\67\78\73\75\82\97\102\77\98\102",196), 4)
mkToggle(secEntities, _1ii1lIli1("\27\64\88\91\85\116\112\125\131\60\104\125\129\88\103\185\193\181\205\199\205\223\238\236\165\241\1\14\10\28\40\223",209), _1ii1lIli1("\40\77\101\104\103\129\125\138\144\110\131\135",222), 5)
mkToggle(secEntities, _1ii1lIli1("\58\90\127\109\133\126\65\109\130\134\93\108\159\196\194\208\222\215\231\225\178\222\6\10\17\11\33\221",235), _1ii1lIli1("\76\108\140\122\146\139\115\136\140",248), 6)

local secDoors = mkSection(Pages.Visuals, _1ii1lIli1("\85\135\142\152\160\84\97\98\152\178\193\195\200\224\220\240\230\251\175\219\240\244",10), 2)
mkToggle(secDoors, _1ii1lIli1("\98\148\155\165\90\134\155\159\118\133\210\208\234\237\160\182\174\246\255\6\15\36\43\223\245\237\64\74\69\84\85\91\44",23), _1ii1lIli1("\111\161\168\178\140\161\165",36), 1)
mkToggle(secDoors, _1ii1lIli1("\132\174\169\184\185\205\130\174\195\199\158\173\242\255\251\8\27\207\44\44\45\47\242\69\79\74\89\90\115\123\47\136\130\136\84",49), _1ii1lIli1("\145\187\182\197\198\218\180\201\205",62), 2)
mkToggle(secDoors, _1ii1lIli1("\150\203\193\222\211\231\156\178\170\212\249\1\15\27\25\47\226\14\35\39",75), _1ii1lIli1("\163\216\206\235\224\244\206\227\231",88), 3)
mkToggle(secDoors, _1ii1lIli1("\187\213\228\230\235\3\255\19\9\203\247\12\16\231\246\60\65\81\79\99\89\120\122\132\57\79\71\164\150\168\185\175\113\135\127\201\220\226\239\244\248\252\10\199",101), _1ii1lIli1("\200\226\241\243\248\16\12\32\22\253\18\22",114), 4)

local secItems = mkSection(Pages.Visuals, _1ii1lIli1("\210\252\3\15\194\238\3\7",127), 3)
mkToggle(secItems, _1ii1lIli1("\220\14\6\21\207\251\16\20\235\250\27\65\91\98\90\115\129\62\98\134\139\147\166\104\131\185\175\201\193\140",140), _1ii1lIli1("\233\27\19\34\1\22\26",153), 1)
mkToggle(secItems, _1ii1lIli1("\248\38\42\48\46\66\247\35\56\60\19\34\73\130\134\141\135\151\147\176\103",166), _1ii1lIli1("\5\51\55\61\59\79\41\62\66",179), 2)
mkToggle(secItems, _1ii1lIli1("\23\64\62\75\85\83\101\113\36\86\119\146\131\136\160\153\92\114\106\148\199\195\203\141\182\237\231\234\243\255\3\23\204\248\13\17",192), _1ii1lIli1("\31\64\91\76\81\105\103\79\100\104",205), 3)

local secPlayers = mkSection(Pages.Visuals, _1ii1lIli1("\49\84\80\111\103\123\48\92\113\117",218), 4)
	mkToggle(secPlayers, _1ii1lIli1("\60\86\110\109\47\106\126\139\158",231), _1ii1lIli1("\78\104\123\122\97\118\122",244), 1)
	mkToggle(secPlayers, _1ii1lIli1("\79\131\147\66\110\131\135",6), _1ii1lIli1("\92\144\160\116\137\141",19), 2)
	mkToggle(secPlayers, _1ii1lIli1("\111\147\150\168\183\178",32), _1ii1lIli1("\124\160\163\181\196\191\163\184\188",45), 3)
	mkToggle(secPlayers, _1ii1lIli1("\149\186\176\185\194\214\222",58), _1ii1lIli1("\162\199\189\198\207\227\189\210\214",71), 4)
	mkToggle(secPlayers, _1ii1lIli1("\175\199\202\221\228\223\249\241\179\221\9\9\28\41",84), _1ii1lIli1("\184\219\215\246\233\253\213\1\1\20\33",97), 5)

local secEnv = mkSection(Pages.Visuals, _1ii1lIli1("\186\234\249\243\3\7\13\19\18\34\47\226\239\240\35\71\76\84\103\99\116\116",110), 5)

	mkToggle(secEnv, _1ii1lIli1("\200\254\252\3\0\23\21\26\34\53",123), _1ii1lIli1("\213\11\9\16\237\36\34\39\47\66",136), 1)
	mkToggle(secEnv, _1ii1lIli1("\234\18\202\247\39\38",149), _1ii1lIli1("\247\31\253\45\44",162), 2)
	mkToggle(secEnv, _1ii1lIli1("\2\44\59\248\30\66\71\79\98\21\87\113\130\127\140\146",175), _1ii1lIli1("\15\57\72\36\72\77\85\104\86\112\129\126\139\145",188), 3, refreshVisionEffects)
	mkToggle(secEnv, _1ii1lIli1("\19\67\67\70\90\19\77\105\127\121\128\144\73\117\157\164\170\175\199\205\129\144\209\226\242\246\171\193\185\6\19\15\40\36\236",201), _1ii1lIli1("\32\80\80\83\103\88\111\133\127\134\150\116\156\163\169\174\198\204",214), 4, refreshVisionEffects)
	mkSlider(secEnv, _1ii1lIli1("\48\102\100\112\109\132\130\135\143\162\85\126\181\179\184\192\211\212\210\231\238",227), 1, 10, _1ii1lIli1("\57\117\115\120\128\147\148\146\167\174",240), 5)
	mkSlider(secEnv, _1ii1lIli1("\96\127\137\138\137\76\118\169\175\188\193\183\208\216",2), 0, 100, _1ii1lIli1("\108\134\151\160\147\165\131\182\188\201\206\196\221\229",15), 6, refreshVisionEffects)
	mkSlider(secEnv, _1ii1lIli1("\122\153\163\164\163\102\160\181\207\215\219\209\235\231\244\250",28), 0, 200, _1ii1lIli1("\134\160\177\186\173\191\173\194\220\228\232\222\248\244\1\7",41), 7, refreshVisionEffects)
	mkToggle(secEnv, _1ii1lIli1("\128\185\190\198\200\205\135\180\196\210",54), _1ii1lIli1("\141\178\197\165\181\195\185\233\227\235\252\252\2",67), 8, function(v) if not v and cam() then pcall(function() cam().FieldOfView = 70 end) end end)

mkSlider(secEnv, _1ii1lIli1("\157\173\187",80), 55, 85, _1ii1lIli1("\167\204\223\191\207\221",93), 9)

local secVisualHUD = mkSection(Pages.Visuals, _1ii1lIli1("\199\225\242\251\238\0\187\234\254\244\215\228\229\30\52\72\72\77",106), 6)
	mkToggle(secVisualHUD, _1ii1lIli1("\205\235\242\192\237\4\26\20\27\43\228\31\58\75\69\72\98\21\83\105\115\119\143",119), _1ii1lIli1("\223\250\11\5\8\34\7\29\39\43\67",132), 1)
	mkToggle(secVisualHUD, _1ii1lIli1("\235\19\7\33\41\46\226\17\37\27\254\13\94\98\105\115\45\67\59\145\161\169\158\163\179\108\130\122\201\205\208\226\241\236\180",145), _1ii1lIli1("\248\32\20\46\54\59\23\43\33",158), 2)

	if not MOBILE then mkToggle(secVisualHUD, _1ii1lIli1("\253\30\57\41\55\67\64\3\50\70\60\36\51\115\124\148\144\164\154\92\169\175\178\204\212\216\210\231\164",171), _1ii1lIli1("\10\43\70\54\68\80\77\56\76\71",184), 3) end
	mkToggle(secVisualHUD, _1ii1lIli1("\16\76\72\66\85\88\89\34\82\131\131\127\147\144\83\98\144\122\111\133\125\212\212\224\224\160\182\174\251\12\22\202\224\216\51\47\58\57\4",197), _1ii1lIli1("\29\89\85\79\98\106\107\88\137\137\133\153\150",210), 4)
	mkToggle(secVisualHUD, _1ii1lIli1("\52\82\108\116\39\82\132\139\149\74\136\153\184\182\188\189\201\214",223), _1ii1lIli1("\65\95\126\129\88\138\145\155\132\169\159\168\177\197",236), 5)
	mkSlider(secVisualHUD, _1ii1lIli1("\74\95\99\58\110\137\167\86\129\173\190\198\186\206\202\211",249), 250, 2500, _1ii1lIli1("\87\108\112\116\143\173\128\172\189\197",11), 5)

local secDef = mkSection(Pages.Combat, _1ii1lIli1("\96\146\146\166\175\181\105\118\119\162\202\210\216\232\244\237",24), 1)
mkToggle(secDef, _1ii1lIli1("\113\161\174\170\188\200\118\180\197\221\224\226\238\238\174\215\253\17\24\22\42",37), _1ii1lIli1("\126\174\187\183\201\213\186\203\227\230\232\244\244",50), 1)
mkToggle(secDef, _1ii1lIli1("\135\194\184\196\209\137\195\224\240\234\250\179\241\2\26\29\31\43\43",63), _1ii1lIli1("\170\187\211\214\216\228\228\215\250\7\7\4",76), 2)
mkToggle(secDef, _1ii1lIli1("\162\214\225\232\156\200\248\244\7\20\20\33\25\45\226\10\60\60\80\89\95\19\34\74\124\142\128\148\88\116\166\173\178\174\197\195\207\207\212\232\166",89), _1ii1lIli1("\175\227\238\245\202\252\252\16\25\31",102), 3)
mkToggle(secDef, _1ii1lIli1("\187\246\252\254\182\229\13\15\23\217\41\53\238\33\75\70\85\86\106",115), _1ii1lIli1("\200\3\9\11\235\19\21\29\8\52\25\67\62\77\78\98",128), 4)
mkButton(secDef, _1ii1lIli1("\220\4\6\14\208\32\44\229\24\66\61\76\77\97\22\80\88\103",141), function() hideInLockerNow(true) end, 5)

local secCounters = mkSection(Pages.Combat, _1ii1lIli1("\238\23\29\41\49\41\61\242\28\79\92\92\105\102\122\130",154), 2)
mkToggle(secCounters, _1ii1lIli1("\239\35\48\44\247\22\81\68\76\82\103\116\104\130\126\139\145\74\89\132\174\181\184\116\156\217\202\233\160",167), _1ii1lIli1("\252\48\61\57\28\87\74\82\88\109\122",180), 1)
mkToggle(secCounters, _1ii1lIli1("\9\68\74\76\4\47\97\115\106\126\51\109\149\141\144\162\177\172\107\122\188\210\214\227\216\228\163\250\250\6\6\207",193), _1ii1lIli1("\22\81\87\89\53\103\126\112\132\108\148\140\143\161\176\171",206), 2)
mkToggle(secCounters, _1ii1lIli1("\35\94\100\102\35\93\121\121\138\139\77\131\161\168\105\160\184\208\198\223\220\238\230\251",219), _1ii1lIli1("\48\107\118\120\99\127\127\144\145\131\155\179\169\194\191\209\201",232), 3)
mkToggle(secCounters, _1ii1lIli1("\83\109\124\133\147\137\75\116\165\169\187\200\117\166\216\215\225\235\226\231\255\249",245), _1ii1lIli1("\96\122\137\146\160\150\130\180\179\189\199\190\195\219\213\234",7), 4)

local secMovement = mkSection(Pages.Motion, _1ii1lIli1("\110\146\142\149\155\94\107\108\153\198\202\207\215\234",20), 1)
mkToggle(secMovement, _1ii1lIli1("\107\164\169\177\179\184\114\176\193\211\217\200\236\232\239\245",33), _1ii1lIli1("\136\172\168\175\181\157\205\199\207\224\224\230",46), 1, function() refreshGameSpeed() end)
mkSlider(secMovement, _1ii1lIli1("\153\170\188\194\177\213\209\216\222",59), 8, 120, _1ii1lIli1("\146\203\208\216\218\223\208\225\243\249\232\12\8\15\21",72), 2, function() refreshGameSpeed() end)
mkSlider(secMovement, _1ii1lIli1("\159\213\217\230\219\231\166\224\4\0\7\13",85), 4, 60, _1ii1lIli1("\172\226\230\243\232\244\230\10\6\13\19",98), 3, function(v)
	S._tunedFields = S._tunedFields or {}; S._tunedFields.CrouchSpeed = true
	local m = getMain(); if m and type(m.CameraModule) == _1ii1lIli1("\234\222\230\247\247",111) then setGameField(m.CameraModule, _1ii1lIli1("\198\252\0\13\2\14\4\21\39\45\28\64\60\67\73",124), v) end
end)
mkSlider(secMovement, _1ii1lIli1("\227\7\16\14\26\39\218\14\55\51\63\67\77\80\100",137), 0, 150, _1ii1lIli1("\240\20\29\27\39\52\20\61\57",150), 4, function(v)
	S._tunedFields = S._tunedFields or {}; S._tunedFields.SprintMod = true
	local m = getMain()
	if m then
		if type(m.CameraModule) == _1ii1lIli1("\30\18\26\43\43",163) then setGameField(m.CameraModule, _1ii1lIli1("\10\46\55\53\65\78\46\87\83\95\104\114\117\137",176), v) end
	end
end)
mkToggle(secMovement, _1ii1lIli1("\7\64\69\77\79\84\14\63\118\117\127\102\140\155\144\164",189), _1ii1lIli1("\27\77\76\86\50\98\97\105\122\122\128",202), 5, function(v)
	if not v then restoreJumpPower() end
end)
mkSlider(secMovement, _1ii1lIli1("\40\90\89\99\74\117\132\121\141",215), 50, 250, _1ii1lIli1("\46\103\108\121\123\128\100\150\149\159\134\172\187\176\196",228), 6)
mkToggle(secMovement, _1ii1lIli1("\62\112\132",241), _1ii1lIli1("\80\125\145",3), 7, function(v)
	if not v then
		pcall(function() if S._flyBV then S._flyBV:Destroy(); S._flyBV = nil end end)
		if not S.NoClip then restoreNoClip() end
	end
end)
mkSlider(secMovement, _1ii1lIli1("\93\138\158\76\134\170\166\173\179",16), 10, 200, _1ii1lIli1("\106\151\171\140\176\172\179\185",29), 8)
mkToggle(secMovement, _1ii1lIli1("\127\167\162\178\182\196",42), _1ii1lIli1("\140\180\143\191\195\209",55), 9, function(v)
	if not v and not S.Fly then restoreNoClip() end
end)
mkToggle(secMovement, _1ii1lIli1("\148\192\191\201\213\215\233\225\163\212\6\5\15",68), _1ii1lIli1("\161\205\204\214\226\228\246\238\218\12\11\21",81), 10)
mkToggle(secMovement, _1ii1lIli1("\184\220\220\232\227\247\3",94), _1ii1lIli1("\197\233\233\245\240\4\16",107), 11)
mkSlider(secMovement, _1ii1lIli1("\210\246\246\2\187\245\25\21\28\34",120), 2, 50, _1ii1lIli1("\223\3\3\15\251\31\27\34\40",133), 12)

local secPhysics = mkSection(Pages.Motion, _1ii1lIli1("\236\23\16\27\34\37\49\49\241\254\255\53\101\109\103\108\124",146), 2)
mkToggle(secPhysics, _1ii1lIli1("\236\14\39\47\226\28\71\64\75",159), _1ii1lIli1("\249\27\52\60\34\77\70\81",172), 1, function(v)
	local m = getMain(); local sw = m and m.Swimming
	if type(sw) ~= _1ii1lIli1("\52\40\48\65\65",185) then return end
	if v then
		saveSwimDefaults(sw)
		sw.SwimmingSpeed = math.clamp(tonumber(S.SwimSpeed) or 32, 18, 65)
	else

		restoreSwimDefaults(sw, false)
	end
end)
mkSlider(secPhysics, _1ii1lIli1("\32\75\68\79\9\67\103\104\111\117",198), 18, 65, _1ii1lIli1("\45\88\81\92\73\114\110\117\123",211), 2, function(v)
	local m = getMain(); local sw = m and m.Swimming
	if S.FastSwim and type(sw) == _1ii1lIli1("\91\79\87\109\109",224) then
		saveSwimDefaults(sw)
		sw.SwimmingSpeed = v
	end
end)
mkSlider(secPhysics, _1ii1lIli1("\59\108\112\114\122\142\67\125\161\157\164\170",237), 60, 140, _1ii1lIli1("\77\121\125\127\135\155\131\167\163\170\176",250), 3, function(v)
	S._tunedFields = S._tunedFields or {}; S._tunedFields.GliderSpeed = true
	local m = getMain(); if m and type(m.Swimming) == _1ii1lIli1("\135\123\131\148\148",12) then setGameField(m.Swimming, _1ii1lIli1("\103\147\151\153\161\181\157\193\189\196\202",25), v) end
end)
mkToggle(secPhysics, _1ii1lIli1("\118\162\161\171\183\185\203\195\133\187\235\243\232\237\253",38), _1ii1lIli1("\131\175\174\184\196\198\216\208\193\241\249\238\243\3",51), 4)

local secChar = mkSection(Pages.Player, _1ii1lIli1("\138\182\182\206\196\205\229\221\241",64), 1)
mkButton(secChar, _1ii1lIli1("\149\207\214\206\221\231\242\165\222\248\13\17\9\38\36",77), function() attemptRespawn() end, 1)
mkToggle(secChar, _1ii1lIli1("\162\214\227\223\170\197\209\221\185\228\16\33\24\43\49\56\54\59\83",90), _1ii1lIli1("\175\227\240\236\203\215\227",103), 2)

local secMouse = mkSection(Pages.Player, _1ii1lIli1("\200\241\254\3\252",116), 2)
do
	local note = Instance.new(_1ii1lIli1("\220\244\14\17\240\12\20\30\44",129))
	note.Parent = secMouse; note.LayoutOrder = 1; note.BackgroundTransparency = 1
	note.Size = UDim2.new(1, 0, 0, 30); note.Font = F; note.TextSize = 12
	note.TextColor3 = T.Tx3; note.TextWrapped = true; note.TextXAlignment = Enum.TextXAlignment.Left
	note.Text = _1ii1lIli1("\226\11\24\29\22\216\52\52\57\67\62\77\92\16\88\120\126\128\133\128\154\150\151\156\174\181\201\119\213\205\213\223\223\161\252\247\255\16\196\24\23\39\53\231\55\72\252\82\90\86\102\48\43\115\135\132\71\154\164\159\174\189\113\186\192\201\216\148\239\234\238\176\4\13\18\17\33\46\225\65\62\75\253\71\87\97\108\106\44\124\142\79",142)
end

local secAuto = mkSection(Pages.Auto, _1ii1lIli1("\227\30\36\38\43\38\64\60\73\79",155), 1)
mkToggle(secAuto, _1ii1lIli1("\240\43\49\51\235\33\73\69\85\14\57\112\119\129\137",168), _1ii1lIli1("\253\56\62\64\39\79\75\91\56\111\118\128\136",181), 1)
mkToggle(secAuto, _1ii1lIli1("\10\69\75\77\5\47\98\102\114\114\119\143\66\116\162\166\172\170\190\115\128\129\177\227\219\234\247",194), _1ii1lIli1("\23\82\88\90\53\104\113\120\120\125\149\113\163\155\170\183",207), 2)
mkToggle(secAuto, _1ii1lIli1("\36\95\101\103\36\94\119\122\146\138\150\85\128\181\171\200\189\209\217",220), _1ii1lIli1("\49\108\119\121\100\125\128\152\144\156\127\180\170\199\188\208\216",233), 3)
mkToggle(secAuto, _1ii1lIli1("\67\126\132\134\62\104\155\159\166\166\171\195\118\168\201\228\229\153\166\167\209\4\0\8\202\243\42\36\39\48\60\64\84\92",246), _1ii1lIli1("\80\139\145\147\110\161\165\172\172\177\201\167\200\227\228",8), 4)
mkToggle(secAuto, _1ii1lIli1("\93\152\158\160\88\129\187\198\116\157\195\221\228\220\240\238\241\6\186\201\27\31\27\43\40\62\242\43\69\90\83\86\115\107\119\63",21), _1ii1lIli1("\106\165\171\173\151\177\185\195\205\212\177\215\241\248\240\4\2\5\26",34), 5)
mkToggle(secAuto, _1ii1lIli1("\119\178\184\186\114\173\213\217\220\149\210\228\246\7\253\18",47), _1ii1lIli1("\132\191\197\199\179\219\223\226\209\227\245\6\252\17",60), 6)
mkToggle(secAuto, _1ii1lIli1("\145\204\210\212\140\197\223\241\233\248\8\189\235\16\32\30\50\40\66\68\78\86",73), _1ii1lIli1("\158\217\223\225\203\229\247\239\254\14\234\15\31\29\49\39\65\67\77\85",86), 7)
mkToggle(secAuto, _1ii1lIli1("\171\230\236\238\166\209\253\14\3\27\29\215\10\38\58\55\71\74\86\84\105",99), _1ii1lIli1("\184\243\249\251\215\3\20\9\33\35\9\37\57\54\70\73\85\83\104",112), 8)
mkToggle(secAuto, _1ii1lIli1("\214\250\1\6\192\251\32\22\31\46\47\67\248\7\84\92\104\105\109\135\53\142\146\153\158\88\98\111",125), _1ii1lIli1("\227\7\14\19\1\38\28\37\52\53\73",138), 9)

local secInteract = mkSection(Pages.Auto, _1ii1lIli1("\231\19\32\24\44\34\43\67\63\76\82\11\70\112\106\109\126\141",151), 2)
mkToggle(secInteract, _1ii1lIli1("\244\32\44\52\40\60\73\252\44\88\101\93\118\108\117\141\64\79\156\164\92\171\185\189\188\136",164), _1ii1lIli1("\1\45\57\65\53\73\86\50\94\107\104\124\114\123\147",177), 1)
mkToggle(secInteract, _1ii1lIli1("\10\68\71\63\79\76\84\90\34\89\130\134\139\149\160\83\140\166\169\178\190\125\140\227\165\162",190), _1ii1lIli1("\34\75\79\84\94\105\83\109\112\121\133",203), 2)

local secTP = mkSection(Pages.Misc, _1ii1lIli1("\51\75\89\89\112\118\128\137\143",216), 1)
mkButton(secTP, _1ii1lIli1("\64\88\102\107\125\131\141\150\73\164\166\94\147\177\180\204\198\219\227\150\193\243\250\4",229), function()
	local hrp = getHRP(); if not hrp then return end
	local best, bestD = nil, math.huge
	for _, e in ipairs(PromptCache) do
		if e.kind == _1ii1lIli1("\93\116\123\133",242) and e.part.Parent and not isDeadEndDoor(e.model) and not PassedDoors[e.model] then
			local d = (e.part.Position - hrp.Position).Magnitude
			if d < bestD then best, bestD = e.part, d end
		end
	end
	if best then hrp.CFrame = best.CFrame * CFrame.new(0, 0, 3); Notify(_1ii1lIli1("\95\119\133\133\151\157\167\176",4), _1ii1lIli1("\108\132\146\146\164\170\180\189\181\187\126\217\219\147\232\230\233\1\251\16\24\203\22\40\47\57",17), 2, _1ii1lIli1("\152\161\150\157\166\187\194",30))
	else Notify(_1ii1lIli1("\134\158\172\172\190\196\206\215",43), _1ii1lIli1("\141\181\109\184\202\209\219\144\221\237\250\250\247",56), 2, _1ii1lIli1("\195\180\204\207",69)) end
end, 1)
mkButton(secTP, _1ii1lIli1("\173\197\211\211\229\235\245\254\177\12\14\198\251\25\28\52\46\67\75\254\49\91\86\101\107\127",82), function()
	local hrp = getHRP(); if not hrp then return end
	local best, bestD = nil, math.huge
	for _, e in ipairs(PromptCache) do
		if e.kind == _1ii1lIli1("\210\220\215\230\231\251",95) and e.part.Parent then
			local d = (e.part.Position - hrp.Position).Magnitude
			if d < bestD then best, bestD = e.part, d end
		end
	end
	if best then hrp.CFrame = best.CFrame + best.CFrame.LookVector * 2; Notify(_1ii1lIli1("\199\223\237\237\255\5\15\24",108), _1ii1lIli1("\212\236\250\250\12\18\28\37\29\35\230\65\67\251\80\78\81\105\104\125\133\56\139\149\144\159\160\180",121), 2, _1ii1lIli1("\0\9\254\5\14\35\42",134))
	else Notify(_1ii1lIli1("\238\6\20\20\38\44\54\63",147), _1ii1lIli1("\245\29\213\40\50\45\60\61\81\6\83\99\117\117\114",160), 2, _1ii1lIli1("\43\28\52\55",173)) end
end, 2)

local secCfg = mkSection(Pages.Config, _1ii1lIli1("\4\55\61\60\70\75\96\100\90\121\117\130\136",186), 1)

S._readConfigData = function(name)
	if not readfile then return false, nil, _1ii1lIli1("\64\58\61\71\80\90\100\105\43\135\135\129\157\143\158\168\164\172\189\189",199) end
	local base = _1ii1lIli1("\43\84\78\99\106\120\124\118\119\98\149\155\154\164\169\188\127",212) .. name .. _1ii1lIli1("\22\89\105\113\119",225)
	local function readCandidate(path)
		if isfile and not isfile(path) then return false, nil, _1ii1lIli1("\98\106\123\130\127\139\139",238) end
		local ok, raw = pcall(readfile, path)
		if not ok or type(raw) ~= _1ii1lIli1("\122\130\135\133\145\145",0) then return false, nil, _1ii1lIli1("\129\132\149\156\153\165\165",13) end
		local parsedOk, data = pcall(function() return HttpService:JSONDecode(raw) end)
		if not parsedOk or type(data) ~= _1ii1lIli1("\149\137\145\162\162",26) then return false, nil, _1ii1lIli1("\151\163\178\164\182\186\188\127\208\224\227\233",39) end
		return true, data
	end
	local ok, data, reason = readCandidate(base)
	if ok then return true, data end
	local backupOk, backupData = readCandidate(base .. _1ii1lIli1("\105\182\182\192",52))
	if backupOk then return true, backupData, _1ii1lIli1("\186\180\185\204\218\208\228\222\228",65) end
	return false, nil, reason
end

S._applyConfigData = function(data)
	if type(data) ~= _1ii1lIli1("\201\189\197\214\214",78) then return end
	if type(data._ui) == _1ii1lIli1("\214\202\210\227\227",91) then
		if data._ui.Theme then pcall(function() UIStyle:ApplyTheme(data._ui.Theme) end) end
		if data._ui.TextScale then pcall(function() UIStyle:ApplyTextScale(data._ui.TextScale) end) end
		if data._ui.HUDScale then pcall(function() UIStyle:ApplyHUDScale(data._ui.HUDScale) end) end
		if data._ui.NotificationPosition then pcall(function() UIStyle:PlaceNotifications(data._ui.NotificationPosition) end) end
	end

	for key, value in pairs(data) do
		if CfgBind[key] and type(S[key]) ~= _1ii1lIli1("\209\229\236\240\240\243\7",104) then pcall(CfgBind[key], value) end
	end
	for key, value in pairs(data) do
		if CfgBind[key] and type(S[key]) == _1ii1lIli1("\222\242\249\253\253\0\20",117) then pcall(CfgBind[key], value) end
	end
	S._applyKeybindMap(type(data._keybinds) == _1ii1lIli1("\253\241\249\10\10",130) and data._keybinds or {})

	if MOBILE and S._floatApplyMap then
		pcall(S._floatApplyMap, type(data._floats) == _1ii1lIli1("\10\254\6\23\23",143) and data._floats or {})
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
	if not writefile then Notify(_1ii1lIli1("\230\25\31\30\40\45",156), _1ii1lIli1("\245\47\35\40\65\71\73\83\8\87\87\117\41\126\134\62\156\158\156\174\166\174\184\194\194",169), 2, _1ii1lIli1("\52\37\61\64",182)) return end
	local ok, err = pcall(function()
		if makefolder and (not isfolder or not isfolder(_1ii1lIli1("\26\67\61\82\89\98\102\101\102\81\132\138\137\147\152\171",195))) then

			pcall(makefolder, _1ii1lIli1("\39\80\74\95\102\111\120\114\115\94\145\151\150\160\165\184",208))
		end
		local data = {}
		for key in pairs(CfgBind) do data[key] = S[key] end
		data._keybinds = S.Keybinds
		data._floats = S.FloatButtons
		data._ui = { Theme = S.UITheme, TextScale = S.UITextScale, HUDScale = S.HUDScale, NotificationPosition = S.NotificationPosition }
		data._schema = 3
		local path = _1ii1lIli1("\52\93\87\108\120\129\133\127\128\107\158\164\163\173\178\197\136",221) .. name .. _1ii1lIli1("\31\98\119\122\128",234)
		local encoded = HttpService:JSONEncode(data)

		writefile(path .. _1ii1lIli1("\49\126\126\136",247), encoded)
		writefile(path, encoded)
		if readfile then
			local verify = readfile(path)
			assert(type(verify) == _1ii1lIli1("\131\139\144\142\154\154",9) and type(HttpService:JSONDecode(verify)) == _1ii1lIli1("\145\133\141\158\158",22), _1ii1lIli1("\141\160\166\165\175\180\116\209\199\219\217\221\231\232\237\7\3\16\22\207\28\30\45\55\55\61",35))
		end
		if delfile and (not isfile or isfile(path .. _1ii1lIli1("\101\178\178\188",48))) then pcall(delfile, path .. _1ii1lIli1("\114\191\191\201",61)) end
	end)
	Notify(_1ii1lIli1("\148\199\205\204\214\219",74), ok and (_1ii1lIli1("\177\198\226\216\222\161\175",87) .. name .. _1ii1lIli1("\146",100)) or (_1ii1lIli1("\203\224\252\242\180\1\3\18\28\28\34\255\236",113) .. tostring(err)), 2, ok and _1ii1lIli1("\248\1\246\253\6\27\34",126) or _1ii1lIli1("\246\250\14\14\19\39",139))
	return ok, err
end
LoadConfigFile = function(name, silent)
	local ok, data, reason = S._readConfigData(name)
	if not ok then
		if not silent then Notify(_1ii1lIli1("\226\21\27\26\36\41",152), reason == _1ii1lIli1("\25\28\45\52\49\61\61",165) and _1ii1lIli1("\7\47\231\65\54\82\72\78\17\91\115\121\120\130\135\71\148\164\177\177\174",178) or (_1ii1lIli1("\18\60\53\63\2\79\81\96\111\111\117\82\63",191) .. tostring(reason)), 2, _1ii1lIli1("\74\59\83\86",204)) end
		return false, reason
	end
	local applied, err = xpcall(function() S._applyConfigData(data) end, debug.traceback)
	if not applied then
		if not silent then Notify(_1ii1lIli1("\35\86\92\91\106\111",217), _1ii1lIli1("\57\99\97\107\46\123\125\140\150\150\156\121\102",230) .. tostring(err), 2, _1ii1lIli1("\94\103\123\123\128\148",243)) end
		return false, err
	end
	if not silent then Notify(_1ii1lIli1("\79\130\136\135\145\150",5), _1ii1lIli1("\101\143\136\146\154\160\99\113",18) .. name .. _1ii1lIli1("\77",31) .. (reason == _1ii1lIli1("\165\159\164\183\197\187\207\201\207",44) and _1ii1lIli1("\96\111\192\186\191\210\224\214\234\228\234\182",57) or ""), 2, _1ii1lIli1("\192\201\190\197\206\227\234",70)) end
	return true, reason
end
mkButton(secCfg, _1ii1lIli1("\173\194\222\212\150\193\233\241\243\14\12\27\206\248\43\49\48\58\63",83), function() SaveConfigFile(_1ii1lIli1("\198\207\234\240\242\246\0\249\3",96)) end, 1)
mkButton(secCfg, _1ii1lIli1("\192\234\227\237\176\219\3\11\13\40\38\53\232\18\69\75\74\84\89",109), function() LoadConfigFile(_1ii1lIli1("\224\233\4\10\12\16\26\19\29",122)) end, 2)

if MOBILE then
	mkButton(secCfg, _1ii1lIli1("\224\250\9\18\32\22\216\0\50\57\244\33\78\88\81\107\108\120\120\56\97\155\161\168\170\176\188",135), function()
		if S._floatClearAll then S._floatClearAll() end
		Notify(_1ii1lIli1("\221\23\29\36\38\44\56",148), _1ii1lIli1("\233\27\34\221\42\55\65\58\84\80\92\92\33\106\132\138\145\147\153\165\89\178\172\187\196\210\200\206",161), 2, _1ii1lIli1("\30\42\41\57",174))
	end, 3)
else
	mkButton(secCfg, _1ii1lIli1("\5\53\53\56\80\5\45\95\102\38\88\121\148\132\146\158\155\177",187), function() S._clearAllKeybinds() end, 3)
end

do
	local scheduled = false
	RequestAutoSave = function()
		if scheduled or not writefile then return end
		scheduled = true
		task.delay(1, function() scheduled = false; SaveConfigFile(_1ii1lIli1("\46\55\82\88\90\94\104\102\112",200)) end)
	end
end
do
	local note = Instance.new(_1ii1lIli1("\48\72\98\101\68\101\109\119\133",213))
	note.Parent = secCfg; note.LayoutOrder = 4; note.BackgroundTransparency = 1
	note.Size = UDim2.new(1, 0, 0, MOBILE and 36 or 18); note.Font = F; note.TextSize = 12
	note.TextColor3 = T.Tx3; note.TextXAlignment = Enum.TextXAlignment.Left
	note.TextWrapped = MOBILE
	note.Text = MOBILE
		and _1ii1lIli1("\185\138\199\192\218\207\232\222\246\231\4\235\98\139\164\165\126\54\237\67\57\82\8\95\70\109\86\123\98\217\144\133\159\87\252\180\110\194\123\212\200\226\211\241\173\254\237\12\251\106\33\10\48\241\61\49\75\64\90\17\103\86\118\46\211\138\118\153\96\246\173\161\187\162\25\214\153\227\212\242\168\255\230\13\1\121\114\41\242\56\239\69\49\163\90\73\104\86\118\105\132\112\146\134\160\140\174\162\188\171\203\149\45\229\156\242\231\1\188\15\197\28\3\42\30\57\254\71\11\85\13\99\26\113\54\206\133\108\147\124\162\90\175\164\189\176\208\183\223\151\236\219\251\184\8\244\23\206\36\21\50\33\158",226)
		or _1ii1lIli1("\198\161\217\170\231\186\69\252\242\10\255\104\32\218\46\231\59\47\73\58\88\20\101\84\115\98\209\154\63\90\237\164\152\178\153\192\174\211\199\225\200\240\173\253\236\12\196\26\220\119\46\22\60\43\74\62\88\67\196\189\116\61\131\58\144\124\238\165\148\179\161\193\180\212\192\226\214\240\220\254\242\12\251\27\224\120\48\231\61\50\76\7\90\16\103\78\117\105\132\73\146\86\160\88\174\101\188\129\25\213\188\227\204\242\170\255\244\13\0\27\2\42\226\55\38\70\3\83\63\98\25\111\96\125\108\233",239)
end

if MOBILE and Pages.Buttons then

	local function mkPill(parent, text, x)
		local pill = Instance.new(_1ii1lIli1("\92\116\142\145\102\160\166\173\175\181",1))
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
		local row = Instance.new(_1ii1lIli1("\91\142\132\151\150",14))
		row.Name = _1ii1lIli1("\104\149\159\152\178\164",27) .. item.id
		row.Parent = secFloat
		row.LayoutOrder = index + 1
		row.Size = UDim2.new(1, 0, 0, M.rowH)
		row.BackgroundTransparency = 1

		local label = Instance.new(_1ii1lIli1("\131\155\181\184\151\179\187\197\211",40))
		label.Parent = row; label.BackgroundTransparency = 1
		label.Position = UDim2.new(0, 4, 0, 0); label.Size = UDim2.new(1, -168, 1, 0)
		label.Font = F; label.TextSize = M.rowFont; label.TextColor3 = T.Tx2
		label.TextXAlignment = Enum.TextXAlignment.Left; label.TextTruncate = Enum.TextTruncate.AtEnd
		label.Text = item.label

		local enable, enableStroke = mkPill(row, _1ii1lIli1("\129\145\139\147\164\164",53), -82)
		local remove, removeStroke = mkPill(row, _1ii1lIli1("\155\149\164\173\187\177",66), -4)

		local locked = item.id == _1ii1lIli1("\203\198\158\216\215\231\245",79)
		local function paint()
			local on = S._floatIsOn(item.id)
			enable.BackgroundColor3 = on and T.ActiveBg or T.Elev
			enable.TextColor3 = on and T.White or T.Tx2
			enable.Text = on and _1ii1lIli1("\178\184\145\203\194\216\210\217\233",92) or _1ii1lIli1("\181\197\191\199\216\216",105)
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

	S._floatSet(_1ii1lIli1("\242\237\197\255\254\14\28",118), true)
end

attemptRespawn = function()
	task.spawn(function()
		local r = findRemote(_1ii1lIli1("\220\246\11\15\7\36\34",131))
		if r and r:IsA(_1ii1lIli1("\233\3\18\27\39\31\7\61\61\57\81\77\90\96",144)) then
			local ok, res = pcall(function() return r:InvokeServer() end)
			Notify(_1ii1lIli1("\246\16\37\41\33\62\60",157), ok and (_1ii1lIli1("\3\29\48\59\50\71\79\71\77\16\31",170) .. tostring(res) .. _1ii1lIli1("\231",183)) or _1ii1lIli1("\29\55\76\80\72\101\99\33\122\116\124\146\151\144\150",196), 2, ok and _1ii1lIli1("\75\84\73\80\89\115\122",209) or _1ii1lIli1("\92\77\101\104",222))
		else
			Notify(_1ii1lIli1("\68\94\120\124\116\145\143",235), _1ii1lIli1("\86\112\133\137\129\158\156\85\174\168\183\192\204\196\134\219\227\239\162\239\255\12\12\9",248), 2, _1ii1lIli1("\136\121\145\148",10))
		end
	end)
end

local lastHideAt = 0
hideInLockerNow = function(manual)
	local now = os.clock()
	if not manual and now - lastHideAt < 12 then return end
	lastHideAt = now
	task.spawn(function()
		local chk = findRemote(_1ii1lIli1("\97\141\145\150\165\141\183\178\193\194\214\190\230\218\244\252\1",23))
		if chk and chk:IsA(_1ii1lIli1("\125\151\166\175\187\179\155\209\209\205\229\225\238\244",36)) then
			local ok, inLocker = pcall(function() return chk:InvokeServer() end)
			if ok and inLocker == true then return end
		end
		local hrp = getHRP(); if not hrp then return end
		local best, bestD, bestPrompt = nil, math.huge, nil

		for _, e in ipairs(PromptCache) do
			if e.kind == _1ii1lIli1("\164\174\169\184\185\205",49) and e.part.Parent then
				local d = (e.part.Position - hrp.Position).Magnitude
				if d < bestD then best, bestD, bestPrompt = e.part, d, e.prompt end
			end
		end
		if not best then
			if manual then Notify(_1ii1lIli1("\141\181\183\191",62), _1ii1lIli1("\160\200\128\218\207\219\225\163\246\0\251\10\11\31\212\33\49\62\62\59",75), 2, _1ii1lIli1("\214\199\223\226",88)) end
			return
		end
		hrp.CFrame = best.CFrame + best.CFrame.LookVector * 2
		task.wait(0.1)
		if fireproximityprompt and bestPrompt.Parent then pcall(fireproximityprompt, bestPrompt) end
		Notify(_1ii1lIli1("\180\220\222\230",101), _1ii1lIli1("\193\233\235\247\3\3\195\19\31\216\43\53\48\63\64\84",114), 2, _1ii1lIli1("\249\2\247\254\7\28\35",127))
	end)
end

tc(LP.Idled:Connect(function()
	if S.AntiAFK then
		local VirtualUser = game:GetService(_1ii1lIli1("\233\3\19\28\36\23\41\25\62\55\75",140))
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
	local hrp = c and c:FindFirstChild(_1ii1lIli1("\232\28\27\22\42\50\51\53\42\78\85\97\68\97\121\130",153))
	local hum = c and c:FindFirstChildOfClass(_1ii1lIli1("\245\41\40\35\55\63\64\66",166))

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
			bv = Instance.new(_1ii1lIli1("\252\48\44\72\44\66\80\90\85\98\121\133",179))
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
				if p:IsA(_1ii1lIli1("\9\47\72\65\51\75\99\108",192)) then
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
				if type(ox) == _1ii1lIli1("\72\60\68\85\85",205) and ox.TankValue then ox.TankValue.Value = 100 end
			end)
		end
		if S.FastSwim then
			pcall(function()
				local m = getMain(); local sw = m and m.Swimming
				if type(sw) == _1ii1lIli1("\85\73\81\98\103",218) then
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
			local r = findRemote(_1ii1lIli1("\62\86\115\105\130\127\145\137\126\154\154\171\172\157\187\194",231))
			if r and r.FireServer then pcall(function() r:FireServer() end) end
		end
		task.wait(0.5)
	end
end)
task.spawn(function()
	while not S.Destroyed do
		if S.AutoDozerStealth then

			local r = findRemote(_1ii1lIli1("\68\118\136\122\142\102\156\160\173\162\174\182\194\194\165\209\213\218\233",244))
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
		local code = LP:GetAttribute(_1ii1lIli1("\80\131\127\135",6))
		if code and tostring(code) ~= "" then
			local rn = LP:GetAttribute(_1ii1lIli1("\108\144\151\156\132\178\177",19))
			Notify(_1ii1lIli1("\114\147\174\172\164\174\113\155\206\202\210",32), tostring(code) .. (rn and (_1ii1lIli1("\84\91\106\187\191\198\203\133",45) .. tostring(rn) .. _1ii1lIli1("\106",58)) or ""), 6, _1ii1lIli1("\197\182\206\209",71))
		end
	end
	tc(LP:GetAttributeChangedSignal(_1ii1lIli1("\158\209\205\213",84)):Connect(announceCode))
	task.spawn(announceCode)
end

local EntityCache = {}
task.spawn(function()
	while not S.Destroyed do
		local found = {}
		local gf = getGF()
		local monstersFolder = gf and gf:FindFirstChild(_1ii1lIli1("\181\222\228\240\248\240\4\12",97))
		local function scan(container)
			if not container then return end
			for _, obj in ipairs(container:GetChildren()) do
				if obj:IsA(_1ii1lIli1("\194\235\231\239\253",110)) or obj:IsA(_1ii1lIli1("\196\234\3\252\238\6\30\39",123)) then
					local kind = monsterKind(obj.Name:lower())
					if kind then found[#found + 1] = { obj = obj, kind = kind } end
				end
			end
		end
		pcall(scan, monstersFolder)
		pcall(scan, Workspace)
		EntityCache = found
		for _, e in ipairs(found) do
			if e.kind == _1ii1lIli1("\252\5\11\23\31\23\43",136) or e.kind == _1ii1lIli1("\0\26\15\29\36\36\56",149) then
				ShowEntityWarning(e.obj.Name)
				if S.AutoHideInLocker and e.kind == _1ii1lIli1("\22\31\37\49\57\49\69",162) then hideInLockerNow(false) end
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
		local check = findRemote(_1ii1lIli1("\249\37\41\46\61\37\79\74\89\90\115\91\131\119\145\153\158",175))
		if check and check:IsA(_1ii1lIli1("\21\47\62\71\83\75\51\105\110\106\130\126\139\145",188)) then
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
					if e.kind == _1ii1lIli1("\53\80\67\75\81\102\110",201) and e.obj.Parent then
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
			local mf = gf and gf:FindFirstChild(_1ii1lIli1("\42\83\89\101\109\106\126\134",214))
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
	if not adornee:IsA(_1ii1lIli1("\55\96\92\105\119",227)) then return Vector3.new(0, 0, 0) end
	local ok, boxCF = pcall(function() return (adornee:GetBoundingBox()) end)
	if not ok or not boxCF then return Vector3.new(0, 0, 0) end
	local ok2, pivot = pcall(function() return adornee:GetPivot() end)
	if not ok2 or not pivot then return Vector3.new(0, 0, 0) end
	return boxCF.Position - pivot.Position
end
local function mkEspTag(adornee, title, color, strong, style)
	local priority = style == _1ii1lIli1("\98\104\131\116\121\145\138",240) or style == _1ii1lIli1("\116\117\144\129\134\158\151\158\176\183\193",2)
	local bb = Instance.new(_1ii1lIli1("\88\134\144\151\148\168\161\185\178\156\209\204",15))
	bb.Name = _1ii1lIli1("\115\156\150\171\178\187\191\185\160\213\217\196\216\229",28)
	bb.Adornee = adornee; bb.AlwaysOnTop = true; bb.LightInfluence = 0
	bb.Size = UDim2.fromOffset(priority and 172 or 134, priority and 42 or 38)
	bb.StudsOffset = Vector3.new(0, 1.8, 0)
	bb.StudsOffsetWorldSpace = centerOffsetFor(adornee)
	bb.MaxDistance = S.ESPMaxDist or 1500
	bb.Parent = adornee

	local card = Instance.new(_1ii1lIli1("\118\169\159\178\177",41))
	card.Parent = bb; card.BackgroundColor3 = Color3.fromRGB(9, 9, 10); card.BackgroundTransparency = 0.22
	card.BorderSizePixel = 0; card.Size = UDim2.new(1, 0, 1, 0)
	Corner(card, 9); Stroke(card, color, 1.2, 0.25); Grad(card, Color3.fromRGB(26, 26, 28), Color3.fromRGB(9, 9, 10), 90)

	local dot = Instance.new(_1ii1lIli1("\131\182\172\191\190",54))
	dot.Parent = card; dot.AnchorPoint = Vector2.new(0, 0.5)
	dot.Position = UDim2.new(0, 8, 0.3, 0); dot.Size = UDim2.new(0, priority and 8 or 6, 0, priority and 8 or 6); dot.BackgroundColor3 = color
	Corner(dot, priority and 4 or 3)

	local tl = Instance.new(_1ii1lIli1("\158\182\208\211\178\206\214\224\238",67))
	tl.Parent = card; tl.BackgroundTransparency = 1
	tl.Position = UDim2.new(0, 18, 0, 2); tl.Size = UDim2.new(1, priority and -72 or -22, 0, 16)
	tl.Font = FM; tl.Text = title; tl.TextColor3 = T.White; tl.TextSize = 13
	tl.TextXAlignment = Enum.TextXAlignment.Left; tl.TextTruncate = Enum.TextTruncate.AtEnd
	if priority then
		local badge = Instance.new(_1ii1lIli1("\171\195\221\224\191\219\227\237\251",80))
		badge.Parent = card; badge.AnchorPoint = Vector2.new(1, 0)
		badge.Position = UDim2.new(1, -7, 0, 6); badge.Size = UDim2.fromOffset(48, 13)
		badge.BackgroundColor3 = color; badge.BackgroundTransparency = 0.72
		badge.BorderSizePixel = 0; badge.Font = FB; badge.TextSize = 8; badge.TextColor3 = color
		badge.Text = style == _1ii1lIli1("\207\208\235\220\225\249\242",93) and _1ii1lIli1("\193\193\194\209\173\233\235",106) or _1ii1lIli1("\191\200\207\216\237\244",119)
		Corner(badge, 4); Stroke(badge, color, 1, 0.25)
	end

	local distLbl = Instance.new(_1ii1lIli1("\223\247\17\20\243\15\23\33\47",132))
	distLbl.Parent = card; distLbl.BackgroundTransparency = 1
	distLbl.Position = UDim2.new(0, 18, 0, 19); distLbl.Size = UDim2.new(1, -22, 0, 14)
	distLbl.Font = F; distLbl.Text = ""; distLbl.TextColor3 = T.Tx2; distLbl.TextSize = 11
	distLbl.TextXAlignment = Enum.TextXAlignment.Left

	local sc = Instance.new(_1ii1lIli1("\237\232\249\16\21\39\39",145)); sc.Scale = 0.6; sc.Parent = card
	Tween(sc, 0.25, { Scale = 1 }, Enum.EasingStyle.Back):Play()

	local hl = Instance.new(_1ii1lIli1("\237\21\26\34\45\49\54\62\81",158))
	hl.Name = _1ii1lIli1("\2\43\37\58\65\74\78\72\47\100\104\76\87",171); hl.Adornee = adornee; hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
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

				local completedRepair = e.kind == _1ii1lIli1("\49\43\61\53\68\84",184) and isRepairComplete(e)
				if e.part.Parent and promptKindOn[e.kind] and not completedRepair and not (e.kind == _1ii1lIli1("\48\66\73\83",197) and isDeadEndDoor(e.model)) then
					local displayKind = e.kind
					if e.kind == _1ii1lIli1("\61\79\86\96",210) and isKeycardDoor(e) then displayKind = _1ii1lIli1("\81\82\109\99\104\128\121\128\146\153\163",223) end
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
						if c.e.kind == _1ii1lIli1("\87\105\117\127",236) and doorPassed(c.e.model, objPos(c.e.model) or c.e.part.Position, myPos) then

						else
							local displayKind = c.displayKind
							if c.e.kind == _1ii1lIli1("\105\123\130\140",249) and c.e.model:GetAttribute(_1ii1lIli1("\98\139\143\142\160\154\175\182\142\192\199\209",11)) then displayKind = _1ii1lIli1("\141\139\165\168\159\177\184\194",24) end
							local priority = displayKind == _1ii1lIli1("\151\152\179\164\169\193\186",37) or displayKind == _1ii1lIli1("\164\165\192\177\182\206\199\206\224\231\241",50)
								or displayKind == _1ii1lIli1("\180\178\204\207\198\216\223\233",63) or displayKind == _1ii1lIli1("\197\191\209\201\216\232",76) or displayKind == _1ii1lIli1("\214\200\218\235\225",89)
							wants[c.e.model] = {
								title = tagTitleFor(c.e), color = ESP_COLORS[displayKind] or ESP_COLORS[c.e.kind],
								strong = priority or c.e.kind == _1ii1lIli1("\213\213\245\227\251\244",102) or c.e.kind == _1ii1lIli1("\240\240\241\243\2\12\7\22\23\43",115),
								style = displayKind, d = c.d,
							}
						end
					end
				end
			end

			if S.DoorESP then
				local gf2 = getGF()
				local rooms = gf2 and gf2:FindFirstChild(_1ii1lIli1("\217\253\4\9\22",128))
				if rooms then
					for _, room in ipairs(rooms:GetChildren()) do
						for _, ch in ipairs(room:GetChildren()) do
							if ch:IsA(_1ii1lIli1("\225\10\6\14\28",141)) then
								local isNext = ch:GetAttribute(_1ii1lIli1("\241\26\30\29\47\41\62\69\29\79\86\96",154)) == true
								if isNext and not isDeadEndDoor(ch) then
									local p = objPos(ch)
									if p and not doorPassed(ch, p, myPos) then
										local d = (myPos and p) and (p - myPos).Magnitude or 0
										if d <= 500 then
											wants[ch] = { title = _1ii1lIli1("\252\250\20\23\234\35\39\46\51\13\50\62",167), color = ESP_COLORS.nextdoor, strong = true, style = _1ii1lIli1("\41\39\65\68\59\77\84\94",180), d = d }
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
					if p then e.distLbl.Text = math.floor((p - myPos).Magnitude + 0.5) .. _1ii1lIli1("\53",193) end
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
						if S.AutoOpenDoors and e.kind == _1ii1lIli1("\57\75\82\92",206) and not isDeadEndDoor(e.model) and d <= 12 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoCollectItems and (e.kind == _1ii1lIli1("\69\94\98\105\104\120\116\145",219) or e.kind == _1ii1lIli1("\88\106\103\118",232)) and d <= 18 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoSearchDrawers and e.kind == _1ii1lIli1("\101\122\112\141\130\150",245) and d <= 10 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoCollectKeys and e.kind == _1ii1lIli1("\121\122\149\134\139\163\156",7) and d <= 18 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoRefillBatteries and e.kind == _1ii1lIli1("\141\135\143\153\163\170",20) and d <= 7 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoTurnValves and e.kind == _1ii1lIli1("\158\144\162\179\169",33) and d <= 5 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoDisarmLandmines and e.interactionType == _1ii1lIli1("\129\157\177\174\190\193\205\203",46) and d <= 5.5 then pcall(fireproximityprompt, e.prompt)
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
				if e.kind == _1ii1lIli1("\180\174\192\184\199\215",59) and e.interactionRoot and e.interactionRoot.Parent and e.part.Parent then
					local fixed = e.interactionRoot:FindFirstChild(_1ii1lIli1("\149\191\213\201\207",72))
					if fixed and tonumber(fixed.Value) and fixed.Value < 100 and (e.part.Position - myPos).Magnitude <= 5.25 then
						target = e
						break
					end
				end
			end
			if not target then return end

			local root = target.interactionRoot
			local remoteFunction = root:FindFirstChild(_1ii1lIli1("\174\200\215\224\236\228\204\2\2\254\22\18\31\37",85))
			local remoteEvent = root:FindFirstChild(_1ii1lIli1("\187\213\228\237\249\241\216\16\6\22\35",98))
			if not (remoteFunction and remoteFunction:IsA(_1ii1lIli1("\200\226\241\250\6\254\230\28\28\24\48\44\57\63",111)) and remoteEvent and remoteEvent:IsA(_1ii1lIli1("\213\239\254\7\19\11\242\42\32\48\61",124))) then return end
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

local ESPGui = Instance.new(_1ii1lIli1("\227\250\16\10\17\33\1\54\49",137))
ESPGui.Name = _1ii1lIli1("\237\22\16\37\44\53\57\51\26\47\51",150); ESPGui.ResetOnSpawn = false; ESPGui.IgnoreGuiInset = true; ESPGui.DisplayOrder = 950
pcall(function() ESPGui.Parent = uiP end)
table.insert(UIStyle.Roots, ESPGui)
SG.Destroying:Connect(function() pcall(function() ESPGui:Destroy() end) end)

local KeycardTracer = Instance.new(_1ii1lIli1("\240\35\25\44\43",163))
KeycardTracer.BorderSizePixel = 0
KeycardTracer.AnchorPoint = Vector2.new(0.5, 0.5)
KeycardTracer.Size = UDim2.new(0, 2, 0, 0)
KeycardTracer.BackgroundColor3 = ESP_COLORS.keycard
KeycardTracer.BackgroundTransparency = 0.03
KeycardTracer.Visible = false
KeycardTracer.Parent = ESPGui
Corner(KeycardTracer, 1)

local KeycardBeacon = Instance.new(_1ii1lIli1("\11\35\61\64\31\59\67\77\91",176))
KeycardBeacon.Name = _1ii1lIli1("\20\61\55\76\83\92\96\90\76\109\136\121\126\150\143\116\158\161\170\189\195",189)
KeycardBeacon.AnchorPoint = Vector2.new(0.5, 1)
KeycardBeacon.Size = UDim2.fromOffset(138, 24)
KeycardBeacon.BackgroundColor3 = Color3.fromRGB(24, 19, 7)
KeycardBeacon.BackgroundTransparency = 0.12
KeycardBeacon.BorderSizePixel = 0
KeycardBeacon.Font = FB
KeycardBeacon.TextSize = 11
KeycardBeacon.TextColor3 = ESP_COLORS.keycard
KeycardBeacon.Text = _1ii1lIli1("\28\29\56\41\46\70\68",202)
KeycardBeacon.Visible = false
KeycardBeacon.Parent = ESPGui
Corner(KeycardBeacon, 7)
Stroke(KeycardBeacon, ESP_COLORS.keycard, 1, 0.15)

local NextDoorTracer = Instance.new(_1ii1lIli1("\36\87\77\96\95",215))
NextDoorTracer.Name = _1ii1lIli1("\59\100\94\120\127\136\140\134\118\148\174\177\136\186\193\203\183\200\231\229\235\236\248\5",228)
NextDoorTracer.BorderSizePixel = 0
NextDoorTracer.AnchorPoint = Vector2.new(0.5, 0.5)
NextDoorTracer.Size = UDim2.new(0, 2, 0, 0)
NextDoorTracer.BackgroundColor3 = ESP_COLORS.nextdoor
NextDoorTracer.BackgroundTransparency = 0.05
NextDoorTracer.Visible = false
NextDoorTracer.Parent = ESPGui
Corner(NextDoorTracer, 1)

local StatusHUD = Instance.new(_1ii1lIli1("\62\118\108\127\126",241))
StatusHUD.Name = _1ii1lIli1("\90\131\125\146\153\162\166\160\149\189\177\203\211\216\180\200\190",3)
StatusHUD:SetAttribute(_1ii1lIli1("\106\129\134\152\148\156\173\173\151\171\161",16), true)
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
statusSurface.Name = _1ii1lIli1("\108\128\118\140\181\185\180\182\191\200\177\227\217\227\239\242\2\15",29)
local statusTop = Instance.new(_1ii1lIli1("\119\170\160\179\178",42))
statusTop.Parent = StatusHUD; statusTop.Size = UDim2.new(1, 0, 0, 28)
statusTop.BackgroundColor3 = T.Elev; statusTop.BackgroundTransparency = 0.025; statusTop.BorderSizePixel = 0
Corner(statusTop, 10)
local statusHeaderGradient = Grad(statusTop, T.White:Lerp(T.Accent, 0.14), T.White:Lerp(T.Card, 0.06), 0)
statusHeaderGradient.Name = _1ii1lIli1("\134\154\144\155\191\194\204\212\232\196\246\236\246\2\5\21\34",55)
local statusTopLine = Instance.new(_1ii1lIli1("\145\196\186\205\204",68))
statusTopLine.Parent = statusTop; statusTopLine.AnchorPoint = Vector2.new(0, 1)
statusTopLine.Position = UDim2.new(0, 0, 1, 0); statusTopLine.Size = UDim2.new(1, 0, 0, 1)
statusTopLine.BackgroundColor3 = T.Bd; statusTopLine.BackgroundTransparency = 0.2; statusTopLine.BorderSizePixel = 0
local statusTick = Instance.new(_1ii1lIli1("\158\209\199\218\217",81))
statusTick.Parent = statusTop; statusTick.Position = UDim2.new(0, 8, 0.5, -6); statusTick.Size = UDim2.fromOffset(2, 12)
statusTick.BackgroundColor3 = T.Accent; statusTick.BorderSizePixel = 0; Corner(statusTick, 2)

local statusHeader = Instance.new(_1ii1lIli1("\185\209\235\238\205\233\241\251\9",94))
statusHeader.Parent = statusTop; statusHeader.BackgroundTransparency = 1
statusHeader.Position = UDim2.fromOffset(16, 0); statusHeader.Size = UDim2.new(1, -24, 1, 0)
statusHeader.Font = FB; statusHeader.TextSize = 11; statusHeader.TextColor3 = T.Tx
statusHeader.TextXAlignment = Enum.TextXAlignment.Left; statusHeader.Text = _1ii1lIli1("\186\186\196\200\218\181\203\210\202\7\1\19\7\25\39",107)
end

local statusRoom = Instance.new(_1ii1lIli1("\211\235\5\8\231\3\11\21\35",120))
statusRoom.Parent = StatusHUD; statusRoom.BackgroundTransparency = 1
statusRoom.Position = UDim2.fromOffset(12, 31); statusRoom.Size = UDim2.new(1, -24, 0, 16)
statusRoom.Font = FM; statusRoom.TextSize = 12; statusRoom.TextColor3 = T.White
statusRoom.TextXAlignment = Enum.TextXAlignment.Left; statusRoom.Text = _1ii1lIli1("\222\226\233\238\200\145\54\81",133)

local function mkVitalRow(parent, label, y)
	local text = Instance.new(_1ii1lIli1("\237\5\31\34\1\29\37\47\61",146))
	text.Parent = parent; text.BackgroundTransparency = 1
	text.Position = UDim2.fromOffset(12, y); text.Size = UDim2.new(1, -24, 0, 14)
	text.Font = F; text.TextSize = 11; text.TextColor3 = T.Tx2; text.TextXAlignment = Enum.TextXAlignment.Left
	local back = Instance.new(_1ii1lIli1("\236\31\21\40\39",159))
	back.Parent = parent; back.Position = UDim2.fromOffset(12, y + 16); back.Size = UDim2.new(1, -24, 0, 4)
	back.BackgroundColor3 = T.Bd2; back.BorderSizePixel = 0; Corner(back, 2)
	local fill = Instance.new(_1ii1lIli1("\249\44\34\53\52",172))
	fill.Parent = back; fill.Size = UDim2.new(1, 0, 1, 0); fill.BackgroundColor3 = T.Tx
	fill.BorderSizePixel = 0; Corner(fill, 2)
	return text, fill
end
local oxygenText, oxygenFill = mkVitalRow(StatusHUD, "", 49)
local healthText, healthFill = mkVitalRow(StatusHUD, "", 73)

local KeybindHUD = Instance.new(_1ii1lIli1("\6\57\47\66\65",185))
KeybindHUD.Name = _1ii1lIli1("\29\70\64\85\92\101\105\104\85\118\145\129\143\155\152\131\151\141",198)
KeybindHUD:SetAttribute(_1ii1lIli1("\45\68\73\91\87\100\117\117\95\115\105",211), true)
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
keybindSurface.Name = _1ii1lIli1("\47\67\57\84\125\129\124\126\135\144\121\171\161\171\183\186\202\215",224)
local keybindTop = Instance.new(_1ii1lIli1("\58\114\104\123\122",237))
keybindTop.Parent = KeybindHUD; keybindTop.Size = UDim2.new(1, 0, 0, 28)
keybindTop.BackgroundColor3 = T.Elev; keybindTop.BackgroundTransparency = 0.025; keybindTop.BorderSizePixel = 0
Corner(keybindTop, 10)
local keybindHeaderGradient = Grad(keybindTop, T.White:Lerp(T.Accent, 0.14), T.White:Lerp(T.Card, 0.06), 0)
keybindHeaderGradient.Name = _1ii1lIli1("\78\98\88\99\135\138\148\156\176\140\190\180\190\202\205\221\234",250)
local keybindTopLine = Instance.new(_1ii1lIli1("\89\140\130\149\148",12))
keybindTopLine.Parent = keybindTop; keybindTopLine.AnchorPoint = Vector2.new(0, 1)
keybindTopLine.Position = UDim2.new(0, 0, 1, 0); keybindTopLine.Size = UDim2.new(1, 0, 0, 1)
keybindTopLine.BackgroundColor3 = T.Bd; keybindTopLine.BackgroundTransparency = 0.2; keybindTopLine.BorderSizePixel = 0
local keybindTick = Instance.new(_1ii1lIli1("\102\153\143\162\161",25))
keybindTick.Parent = keybindTop; keybindTick.Position = UDim2.new(0, 8, 0.5, -6); keybindTick.Size = UDim2.fromOffset(2, 12)
keybindTick.BackgroundColor3 = T.Accent; keybindTick.BorderSizePixel = 0; Corner(keybindTick, 2)

local keybindTitle = Instance.new(_1ii1lIli1("\129\153\179\182\149\177\185\195\209",38))
keybindTitle.Parent = keybindTop; keybindTitle.BackgroundTransparency = 1
keybindTitle.Position = UDim2.fromOffset(16, 0); keybindTitle.Size = UDim2.new(1, -24, 1, 0)
keybindTitle.Font = FB; keybindTitle.TextSize = 11; keybindTitle.TextColor3 = T.Tx
keybindTitle.TextXAlignment = Enum.TextXAlignment.Left; keybindTitle.Text = _1ii1lIli1("\133\134\161\145\159\171\168\190",51)
end

local KeybindRows = {}
local function getKeybindRow(index)
	local row = KeybindRows[index]
	if row then return row end
	row = Instance.new(_1ii1lIli1("\141\192\182\201\200",64))
	row.Name = _1ii1lIli1("\150\196\208\205\194\230\245",77); row.Parent = KeybindHUD
	row.BackgroundColor3 = T.Elev; row.BackgroundTransparency = 0.38
	row.BorderSizePixel = 0; row.Size = UDim2.new(1, -16, 0, 18)
	Corner(row, 5)
	local label = Instance.new(_1ii1lIli1("\181\205\231\234\201\229\237\247\5",90))
	label.Name = _1ii1lIli1("\186\214\222\232\246",103); label.Parent = row; label.BackgroundTransparency = 1
	label.Position = UDim2.fromOffset(7, 0); label.Size = UDim2.new(1, -66, 1, 0)
	label.Font = F; label.TextSize = 11; label.TextColor3 = T.Tx2
	label.TextXAlignment = Enum.TextXAlignment.Left; label.TextTruncate = Enum.TextTruncate.AtEnd
	local key = Instance.new(_1ii1lIli1("\207\231\1\4\227\255\7\17\31",116))
	key.Name = _1ii1lIli1("\211\244\15",129); key.Parent = row; key.BackgroundTransparency = 1
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
			local show = entry.kind ~= _1ii1lIli1("\9\11\10\17\29\29",142)
			if entry.kind == _1ii1lIli1("\22\24\23\30\42\42",155) and entry.isActive then
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
		row.Label.TextColor3 = data.entry.kind == _1ii1lIli1("\35\37\36\43\55\55",168) and T.White or T.Tx2
		row.Key.TextColor3 = data.entry.kind == _1ii1lIli1("\48\50\49\56\68\68",181) and T.Accent or T.Tx
	end
	for i = #entries + 1, #KeybindRows do KeybindRows[i].Visible = false end
end
UIStyle:ApplyHUDScale(S.HUDScale)
S._markKeybindHUDDirty()

do
	local island = Instance.new(_1ii1lIli1("\15\66\56\75\74",194))
	island.Name = _1ii1lIli1("\38\79\73\94\101\110\119\113\87\147\143\137\156\159\160\141\190\190\186\206\203",207)
	island:SetAttribute(_1ii1lIli1("\54\77\82\100\101\109\126\126\104\124\114",220), true)
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
	islandGrad.Name = _1ii1lIli1("\52\112\113\107\126\129\130\111\160\160\156\176\173\151\201\191\201\213\216\232\245",233)
	local islandScale = Instance.new(_1ii1lIli1("\87\82\99\122\127\145\145",246))
	islandScale.Name = _1ii1lIli1("\87\107\97\121\158\151\171\147\170\175\193\193",8); islandScale.Scale = S.HUDScale; islandScale.Parent = island
	local iDot = Instance.new(_1ii1lIli1("\98\149\139\158\157",21))
	iDot.Parent = island
	iDot.AnchorPoint = Vector2.new(0, 0.5)
	iDot.Position = UDim2.new(0, 13, 0.5, 0)
	iDot.Size = UDim2.fromOffset(6, 6)
	iDot.BackgroundColor3 = T.Accent
	iDot.BackgroundTransparency = 0.05
	iDot.BorderSizePixel = 0
	Corner(iDot, 4)
	local iBrand = Instance.new(_1ii1lIli1("\125\149\175\178\145\173\181\191\205",34))
	iBrand.Parent = island
	iBrand.Position = UDim2.new(0, 26, 0, 0)
	iBrand.Size = UDim2.new(0, 72, 1, 0)
	iBrand.BackgroundTransparency = 1
	iBrand.Font = FB
	iBrand.TextSize = 12
	iBrand.TextColor3 = T.White
	iBrand.TextYAlignment = Enum.TextYAlignment.Center
	iBrand.TextXAlignment = Enum.TextXAlignment.Left
	iBrand.Text = _1ii1lIli1("\127\139\137\157\166\162\161",47)
	local iDiv = Instance.new(_1ii1lIli1("\137\188\178\197\196",60))
	iDiv.Parent = island
	iDiv.Position = UDim2.new(0, 104, 0.5, -12)
	iDiv.Size = UDim2.fromOffset(1, 24)
	iDiv.BackgroundColor3 = T.Bd2
	iDiv.BackgroundTransparency = 0.28
	iDiv.BorderSizePixel = 0
	local function islandMetric(x, width, caption)
		local key = Instance.new(_1ii1lIli1("\164\188\214\217\184\212\220\230\244",73))
		key.Parent = island
		key.Position = UDim2.fromOffset(x, 6)
		key.Size = UDim2.fromOffset(width, 12)
		key.BackgroundTransparency = 1
		key.Font = FB
		key.TextSize = 10
		key.TextColor3 = T.Tx3
		key.TextXAlignment = Enum.TextXAlignment.Left
		key.Text = caption
		local value = Instance.new(_1ii1lIli1("\177\201\227\230\197\225\233\243\1",86))
		value.Parent = island
		value.Position = UDim2.fromOffset(x, 19)
		value.Size = UDim2.fromOffset(width, 20)
		value.BackgroundTransparency = 1
		value.Font = FM
		value.TextSize = 13
		value.TextColor3 = T.Tx
		value.TextXAlignment = Enum.TextXAlignment.Left
		value.TextTruncate = Enum.TextTruncate.AtEnd
		value.Text = _1ii1lIli1("\76\241\12",99)
		return value
	end
	local iO2 = islandMetric(116, 60, _1ii1lIli1("\198\176",112))
	local iPing = islandMetric(190, 52, _1ii1lIli1("\212\212\224\224",125))
	local iFps = islandMetric(250, 44, _1ii1lIli1("\215\232\242",138))
	local iTime = islandMetric(302, 60, _1ii1lIli1("\242\238\249\248",151))

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
			island:SetAttribute(_1ii1lIli1("\248\33\27\41\51\51\27\69\87",164), math.clamp((vp.X - 32) / 420, 0.40, 0.65))
			islandScale.Scale = S.HUDScale * (tonumber(island:GetAttribute(_1ii1lIli1("\5\46\40\54\64\64\40\82\100",177))) or 1)
		end
		fitIsland()
		tc(cam():GetPropertyChangedSignal(_1ii1lIli1("\27\53\56\81\81\87\97\106\85\114\138\124",190)):Connect(fitIsland))
	end

	S._islandGulp = function(outward)
		if not island.Visible then return end

		local base = S.HUDScale * (tonumber(island:GetAttribute(_1ii1lIli1("\31\72\66\80\90\90\71\113\131",203))) or 1)

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
				local tank = type(ox) == _1ii1lIli1("\83\71\79\96\101",216) and ox.TankValue or nil
				local oxygen = tank and tonumber(tank.Value) or nil
				iO2.Text = oxygen and (tostring(math.floor(oxygen + 0.5)) .. _1ii1lIli1("\17",229)) or _1ii1lIli1("\219\133\160",242)
				local lowO2 = oxygen and oxygen <= 25
				iO2.TextColor3 = lowO2 and Color3.fromRGB(255, 180, 75) or T.Tx
				iDot.BackgroundColor3 = lowO2 and Color3.fromRGB(255, 180, 75) or T.Accent
				local ping = math.floor((LP:GetNetworkPing() or 0) * 1000 + 0.5)
				iPing.Text = ping .. _1ii1lIli1("\120\133",4)
				iFps.Text = tostring(fpsMeter.value)
				local elapsed = os.time() - islandStart
				if elapsed >= 3600 then
					iTime.Text = string.format(_1ii1lIli1("\61\79\88\145\110\96\114\123\180",17), math.floor(elapsed / 3600), math.floor((elapsed % 3600) / 60))
				else
					iTime.Text = string.format(_1ii1lIli1("\74\92\101\158\123\109\127\136\193",30), math.floor(elapsed / 60), elapsed % 60)
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
	local holder = Instance.new(_1ii1lIli1("\120\171\161\180\179",43))
	holder.Name = _1ii1lIli1("\143\184\178\199\206\215\219\213\203\230\247\241\244\14\226\26\33\37\52",56)
	holder.AnchorPoint = Vector2.new(0.5, 0.5)
	holder.Size = UDim2.fromOffset(96, 46)
	holder.BackgroundTransparency = 1
	holder.Visible = false
	holder.Parent = ESPGui
	local arrow = Instance.new(_1ii1lIli1("\160\184\210\213\180\208\216\226\240",69))
	arrow.Parent = holder; arrow.BackgroundTransparency = 1
	arrow.AnchorPoint = Vector2.new(0.5, 0.5); arrow.Position = UDim2.fromOffset(48, 12)
	arrow.Size = UDim2.fromOffset(24, 24); arrow.Font = FB; arrow.TextSize = 20
	arrow.Text = _1ii1lIli1("\59\246\25",82); arrow.TextColor3 = Color3.fromRGB(255, 85, 85)
	local label = Instance.new(_1ii1lIli1("\186\210\236\239\206\234\242\252\10",95))
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
	local legacy = ch and ch:FindFirstChild(_1ii1lIli1("\195\236\230\251\2\11\15\9\251\30\26\57\44\64\24\68\68\87",108))
	if legacy then pcall(function() legacy:Destroy() end) end
end

local function createTeammateCham(plr, ch)
	local proxy = Instance.new(_1ii1lIli1("\205\246\242\250\8",121))
	proxy.Name = _1ii1lIli1("\221\6\0\21\28\37\41\35\25\49\52\71\78\73\99\91\69\113\113\132",134)
	local links = {}
	for _, source in ipairs(ch:GetDescendants()) do
		if source:IsA(_1ii1lIli1("\220\2\27\20\6\30\54\63",147)) and source.Name ~= _1ii1lIli1("\239\35\34\29\49\57\58\60\49\85\92\104\80\104\128\137",160) then
			local ok, copy = pcall(function() return source:Clone() end)
			if ok and copy and copy:IsA(_1ii1lIli1("\246\28\53\46\32\56\80\89",173)) then

				for _, child in ipairs(copy:GetChildren()) do
					if not (child:IsA(_1ii1lIli1("\20\56\52\57\70\69\87\63\94\120\116",186)) or child:IsA(_1ii1lIli1("\18\58\63\68\86",199)) or child:IsA(_1ii1lIli1("\47\71\97\100\108\117\111",212))) then
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
	local hl = Instance.new(_1ii1lIli1("\48\88\93\106\117\121\126\134\153",225))
	hl.Name = _1ii1lIli1("\69\115\109\130\137\146\150\144\130\165\161\192\179\199\159\203\203\222",238); hl.Adornee = proxy; hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
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
		local room = LP:GetAttribute(_1ii1lIli1("\89\125\132\137\113\159\158",0))
		statusRoom.Text = _1ii1lIli1("\102\106\113\118\80",13) .. (room and tostring(room) or _1ii1lIli1("\3\168\195",26))
		local hum = getHum()
		local hp = hum and math.clamp(hum.Health, 0, hum.MaxHealth > 0 and hum.MaxHealth or 100) or 0
		local maxHp = hum and hum.MaxHealth > 0 and hum.MaxHealth or 100
		local hpRatio = math.clamp(hp / maxHp, 0, 1)
		healthText.Text = _1ii1lIli1("\132\126\144\132\150\164\120\127",39) .. tostring(math.floor(hp + 0.5)) .. _1ii1lIli1("\91\113\105",52) .. tostring(math.floor(maxHp + 0.5))
		healthFill.Size = UDim2.new(hpRatio, 0, 1, 0)
		healthFill.BackgroundColor3 = hpRatio <= 0.3 and Color3.fromRGB(255, 82, 82) or T.Tx

		local m = getMain(); local ox = m and m.OxygenTank
		local tank = type(ox) == _1ii1lIli1("\188\176\184\201\201",65) and ox.TankValue or nil
		local oxygen = tank and tonumber(tank.Value) or 100
		local oxyRatio = math.clamp(oxygen / 100, 0, 1)
		oxygenText.Text = _1ii1lIli1("\164\180\188\177\182\198\159\166",78) .. tostring(math.floor(oxygen + 0.5)) .. _1ii1lIli1("\135",91)
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
		if e.obj.Parent and (e.kind == _1ii1lIli1("\220\229\235\247\255\247\11",104) or e.kind == _1ii1lIli1("\224\250\239\253\4\4\24",117) or e.kind == _1ii1lIli1("\238\9\252\4\10\31\39",130) or e.kind == _1ii1lIli1("\9\14\25\20\22\29\44\44",143) or e.kind == _1ii1lIli1("\6\11\35\38\32\58\54\67\73",156)) then
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
			arrow.label.Text = string.upper(candidate.e.obj.Name) .. _1ii1lIli1("\208\215",169) .. tostring(math.floor(candidate.d + 0.5)) .. _1ii1lIli1("\42",182)
			arrow.holder.Visible = true
		else
			arrow.holder.Visible = false
		end
	end
end))

local ESPObjects = {}
local function makeESP(plr)
	local o = {}
	o.box = Instance.new(_1ii1lIli1("\16\67\57\76\75",195))
	o.box.BackgroundTransparency = 1; o.box.BorderSizePixel = 0; o.box.Visible = false; o.box.Parent = ESPGui
	o.boxStroke = Instance.new(_1ii1lIli1("\44\39\56\96\101\105\113\114",208))
	o.boxStroke.Thickness = 1.5; o.boxStroke.Color = Color3.fromRGB(120, 220, 255); o.boxStroke.Parent = o.box
	Corner(o.box, 4)

	o.tracer = Instance.new(_1ii1lIli1("\42\93\83\102\106",221))
	o.tracer.BorderSizePixel = 0; o.tracer.AnchorPoint = Vector2.new(0.5, 0.5)
	o.tracer.Size = UDim2.new(0, 1, 0, 0); o.tracer.BackgroundColor3 = Color3.fromRGB(120, 220, 255)
	o.tracer.BackgroundTransparency = 0.25; o.tracer.Visible = false; o.tracer.Parent = ESPGui
	Corner(o.tracer, 1)

	o.bill = Instance.new(_1ii1lIli1("\51\97\112\119\116\136\129\153\146\124\177\172",234))
	o.bill.Size = UDim2.fromOffset(150, 36); o.bill.AlwaysOnTop = true; o.bill.LightInfluence = 0
	o.bill.StudsOffset = Vector3.new(0, 2.6, 0); o.bill.Enabled = false; o.bill.Parent = ESPGui

	o.card = Instance.new(_1ii1lIli1("\73\124\114\133\132",247))
	o.card.Parent = o.bill; o.card.BackgroundColor3 = Color3.fromRGB(9, 9, 10); o.card.BackgroundTransparency = 0.22
	o.card.BorderSizePixel = 0; o.card.Size = UDim2.new(1, 0, 1, 0)
	Corner(o.card, 8); Stroke(o.card, Color3.fromRGB(120, 220, 255), 1.2, 0.25); Grad(o.card, Color3.fromRGB(26, 26, 28), Color3.fromRGB(9, 9, 10), 90)

	local dot = Instance.new(_1ii1lIli1("\86\137\127\146\145",9))
	dot.Parent = o.card; dot.AnchorPoint = Vector2.new(0, 0.5)
	dot.Position = UDim2.new(0, 8, 0.5, 0); dot.Size = UDim2.new(0, 6, 0, 6); dot.BackgroundColor3 = Color3.fromRGB(120, 220, 255)
	Corner(dot, 3)

	o.txt = Instance.new(_1ii1lIli1("\113\137\163\166\133\161\169\179\193",22))
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
			local hrp = ch and ch:FindFirstChild(_1ii1lIli1("\114\166\165\160\180\188\189\191\180\216\223\235\206\230\254\7",35))
			local head = ch and (ch:FindFirstChild(_1ii1lIli1("\127\163\166\176",48)) or hrp)
			local hum = ch and ch:FindFirstChildOfClass(_1ii1lIli1("\140\192\191\186\206\214\215\217",61))
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
					if S.HealthESP and hum then parts[#parts + 1] = math.floor(hum.Health + 0.5) .. _1ii1lIli1("\113\160\175",74) end
					parts[#parts + 1] = math.floor(dist + 0.5) .. _1ii1lIli1("\203",87)
					o.txt.Text = table.concat(parts, _1ii1lIli1("\139\146\59\55\167\174",100))
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
			if e.kind == _1ii1lIli1("\227\228\255\240\245\13\6",113) and e.part.Parent and hrp then
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
				KeycardBeacon.Text = bestEntry and bestEntry.name == _1ii1lIli1("\200\251\247\255\227\26\20\23\32\44\48\68",126) and _1ii1lIli1("\213\232\228\236\206\247\14\8\11\20\32\36\56",139) or _1ii1lIli1("\234\235\6\247\252\20\13",152)
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
			if e.kind == _1ii1lIli1("\16\34\41\51",165) and e.part.Parent and not isDeadEndDoor(e.model) and e.model:GetAttribute(_1ii1lIli1("\9\50\54\53\71\65\86\93\53\103\115\125",178)) and hrp then
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
		if r and (r:IsA(_1ii1lIli1("\24\50\65\74\86\78\53\109\104\120\133",191)) or r:IsA(_1ii1lIli1("\40\72\83\77\91\95\99\107\124\124\112\138\153\162\174\166\141\197\187\203\216",204))) then
			tc(r.OnClientEvent:Connect(function(...) pcall(fn, ...) end))
		end
	end

	hookEvent(_1ii1lIli1("\35\79\79\104\102",217), function()
		ShowEntityWarning(_1ii1lIli1("\48\60\65\90\83\53\101\113\109\128\133\136\148\148",230), _1ii1lIli1("\76\123\123\52\138\148\73\152\160\162\170\108\188\200\129\201\143\226\236\231\246\247\11",243))
		if S.AutoHideInLocker then hideInLockerNow(false) end
	end)
	hookEvent(_1ii1lIli1("\95\132\143\138\140\147\162\162",5), function() ShowEntityWarning(_1ii1lIli1("\108\113\124\119\121\128\143\143",18), _1ii1lIli1("\121\149\157\169\167\105\201\198\211\215\140\223\227\232\240\3\182\204\196\22\23\30\48\231\50\62\79\87\75\95\91\105",31)) end)
	hookEvent(_1ii1lIli1("\131\155\175\172\180\195\204\210\212\231\230\196\246\253\7\232\18\13\28",44), function() ShowEntityWarning(_1ii1lIli1("\144\136\156\153\161\176\185\191\193\212\211",57), _1ii1lIli1("\145\195\202\212\220\144\216\240\234\172\255\9\4\19\24\36\36",70)) end)
	hookEvent(_1ii1lIli1("\170\198\218\220\215\235\233\249\6\222\25\12\20\26\47\55\43\69\65\78\84",83), function() ShowEntityWarning(_1ii1lIli1("\172\199\186\194\200\221\229\217\243\239\252\2",96), _1ii1lIli1("\184\234\162\247\255\11\190\17\27\34\37\225\41\67\246\70\88",109)) end)
	hookEvent(_1ii1lIli1("\196\233\1\4\254\24\20\33\39\9\53\50\62\63\68\94\96\106",122), function() ShowEntityWarning(_1ii1lIli1("\209\214\238\241\235\5\1\14\20",135), _1ii1lIli1("\238\22\10\34\28\222\46\64\243\62\80\95\93\34\34\109\127\133\69\153\76\159\169\176\179\111\183\212\197\228",148)) end)
	hookEvent(_1ii1lIli1("\236\30\48\34\54\30\53\75\69\76\92\72\105\119\134",161), function() if S.BossAlerts then Notify(_1ii1lIli1("\249\43\61\47\67",174), _1ii1lIli1("\6\56\74\60\80\5\81\97\93\117\130\130\143\135\155\80\152\161\185\181\201\191\129\74\239\10\157\241\250\8\254\192\24\35\30\33\55\54\74",187), 4, _1ii1lIli1("\70\55\79\82",200)) end end)
	hookEvent(_1ii1lIli1("\32\82\89\94\90\118\116\128\128\133\153\130\164\163\170\182\182\171\194\216\210\213\232",213), function() if S.BossAlerts then Notify(_1ii1lIli1("\45\95\102\112\108\131\129\141\141\146\166",226), _1ii1lIli1("\56\113\124\131\55\135\152\76\148\157\181\177\197\187",239), 4, _1ii1lIli1("\108\112\132\132\137\157",1)) end end)

	hookEvent(_1ii1lIli1("\111\139\145\143\116\160\160\180\180\185",14), function(zone)
		local zname = typeof(zone) == _1ii1lIli1("\107\151\163\171\159\179\175\184",27) and zone.Name or tostring(zone)
		if zname and zname ~= _1ii1lIli1("\157\159\169",40) then Notify(_1ii1lIli1("\150\178\184\182",53), _1ii1lIli1("\142\190\203\195\215\209\215\180\161",66) .. zname, 2) end
	end)
	hookEvent(_1ii1lIli1("\162\204\199\204\222\189\225\244\239\252\1",79), function(amount)
		if type(amount) == _1ii1lIli1("\209\223\222\218\228\248",92) then Notify(_1ii1lIli1("\180\216\235\230\243\248",105), _1ii1lIli1("\209\243\250\253\185",118) .. tostring(amount) .. _1ii1lIli1("\170\245\249\12\7\20\25",131), 1.5, _1ii1lIli1("\251\255\19\19\24\44",144)) end
	end)
	hookEvent(_1ii1lIli1("\242\16\42\45\18\54\61\66",157), function(n)
		FootMid.Text = _1ii1lIli1("\3\7\14\19\237",170) .. tostring(n)
		if S.RoomTracker then Notify(_1ii1lIli1("\16\52\59\64",183), _1ii1lIli1("\29\65\72\77\33\14",196) .. tostring(n), 2) end
	end)
	hookEvent(_1ii1lIli1("\31\68\84\82\102\97\123\125\135\95\146\159\159\172",209), function(n) Notify(_1ii1lIli1("\44\81\97\95\120\110\136\138\148\156",222), _1ii1lIli1("\57\94\115\113\133\123\149\151\161\169\119\100",235) .. tostring(n), 2.5, _1ii1lIli1("\123\108\132\135",248)) end)
	hookEvent(_1ii1lIli1("\99\125\146\150\142\171\169\150\178\189\188\208",10), function(n) if type(n) == _1ii1lIli1("\140\154\153\149\159\179",23) then Notify(_1ii1lIli1("\125\151\172\176\168\197\195",36), _1ii1lIli1("\138\164\185\189\181\210\208\137\217\229\158",49) .. tostring(n) .. _1ii1lIli1("\184",62), 2) end end)
	hookEvent(_1ii1lIli1("\167\171\179\215\211\216\229\228\246\214\254\5\11\16\40\46",75), function(effectName)
		if type(effectName) ~= _1ii1lIli1("\210\218\223\221\233\233",88) then return end
		if effectName == _1ii1lIli1("\186\216\233\239\206\251\255\0\15\16\36",101) or effectName == _1ii1lIli1("\203\233\235\245\250\226\15\19\20\35\36\56",114) or effectName == _1ii1lIli1("\217\242\246\225\14\18\19\34\35\55",127)
			or effectName == _1ii1lIli1("\216\8\21\17\35\47\6\50\47\59\60\65\91\93\103",140) or effectName == _1ii1lIli1("\225\221\222\8\48\36\62\58\59\40\84\81\93\99\104\130\132\142",153)
			or effectName == _1ii1lIli1("\238\234\235\21\61\49\75\71\72\53\97\94\111\112\117\143\145\155\132\169\159\168\183",166) or effectName == _1ii1lIli1("\10\34\54\51\59\74\83\89\91\110\114\79\116\135\134\154\144\137\165\165\182\183",179) then
			ShowEntityWarning(effectName:gsub(_1ii1lIli1("\10\47\66\65\85\75\68\96\101\118\119",192), ""):gsub(_1ii1lIli1("\26\71\75\76\91\92\117",205), _1ii1lIli1("\1\46\59\63\69\84\85\105",218)))
			if S.AutoHideInLocker then hideInLockerNow(false) end
		end
	end)

	local roomFn = ev:FindFirstChild(_1ii1lIli1("\49\106\115\122\116\132\145\118\154\161\166\142\188\187\183\193\213",231))
	if roomFn and roomFn:IsA(_1ii1lIli1("\82\108\123\132\144\136\112\166\166\162\186\182\195\201",244)) then
		task.spawn(function()
			local ok, n = pcall(function() return roomFn:InvokeServer() end)
			if ok and n then FootMid.Text = _1ii1lIli1("\95\99\106\111\73",6) .. tostring(n) end
		end)
	end
end)

task.spawn(function()
	local loaded, reason = false, _1ii1lIli1("\135\138\155\162\159\171\171",19)
	for attempt = 1, 3 do
		task.wait(attempt == 1 and 1 or 1.5)
		if S.Destroyed then return end
		loaded, reason = LoadConfigFile(_1ii1lIli1("\134\143\170\176\178\182\192\185\195",32), true)
		if loaded or reason == _1ii1lIli1("\161\164\181\188\185\197\197",45) or reason == _1ii1lIli1("\179\173\176\186\195\205\215\215\153\245\245\239\11\253\12\22\18\26\43\43",58) then break end
	end
	S._autoConfigLoaded, S._autoConfigReason = loaded, reason
	local openHint = MOBILE and _1ii1lIli1("\30\15\44\32\58\47\72\62\86\71\100\75\194\246\245\5\19\229\156\144\170\145\8\192\131\210\195\225\151\238\213\252\240\10\246",71) or _1ii1lIli1("\164\208\220\213\233\242\165\251\3\255\15\27\207\42\37\41\235\63\62\78\92",84)
	if loaded then
		Notify(_1ii1lIli1("\184\225\219\240\247\0\4\254\192\239\35\23",97), _1ii1lIli1("\184\235\241\240\250\255\191\24\18\39\47\49\59\53\59\254\199\108\135\26",110) .. openHint, 3, _1ii1lIli1("\245\254\243\250\3\24\31",123))
	elseif reason ~= _1ii1lIli1("\252\255\16\23\20\32\32",136) and reason ~= _1ii1lIli1("\14\8\11\21\30\40\50\50\244\80\80\74\102\88\108\118\114\122\139\139",149) then
		Notify(_1ii1lIli1("\236\31\37\36\46\51",162), _1ii1lIli1("\247\50\56\58\62\72\65\75\14\104\108\113\127\134\130\136\101\82",175) .. tostring(reason), 3, _1ii1lIli1("\58\43\67\70",188))
	else
		Notify(_1ii1lIli1("\32\73\67\88\95\104\108\107\45\92\144\132",201), _1ii1lIli1("\41\83\76\86\94\105\44\245\154\181\72",214) .. openHint, 3, _1ii1lIli1("\83\95\94\115",227))
	end
	print(_1ii1lIli1("\82\83\124\118\139\146\155\159\153\131\183\171\173\119\170\212\205\215\223\229\168\222\225",240))
end)
