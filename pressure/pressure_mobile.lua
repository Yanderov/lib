local _1ii1lIli1 do local c=string.char local b=string.byte _1ii1lIli1=function(s,k) local o={} for i=1,#s do o[i]=c(((b(s,i)-((k+i*7)%251))%256)) end return table.concat(o) end end
_G.INERTIA_MOBILE = true
local _lIillIIIl do local c=string.char local b=string.byte _lIillIIIl=function(s,k) local o={} for i=1,#s do o[i]=c(((b(s,i)-((k+i*7)%251))%256)) end return table.concat(o) end end
if _G.Pressure_Script then
	pcall(function() _G.Pressure_Script:Destroy() end)
	_G.Pressure_Script = nil
end

do
	local Players2 = game:GetService(_lIillIIIl(_1ii1lIli1("\239\25\28\66\60\87\102",93),52))
	local parents = {}
	local CoreGui2
	pcall(function() CoreGui2 = game:GetService(_lIillIIIl(_1ii1lIli1("\252\54\71\72\56\116\118",106),65)) end)
	if CoreGui2 then
		table.insert(parents, CoreGui2)
		local robloxGui = CoreGui2:FindFirstChild(_lIillIIIl(_1ii1lIli1("\37\80\81\105\122\145\110\170\172",119),78))
		if robloxGui then table.insert(parents, robloxGui) end
	end
	local playerGui = Players2.LocalPlayer:FindFirstChild(_lIillIIIl(_1ii1lIli1("\61\103\106\144\138\165\136\196\198",132),91))
	if playerGui then table.insert(parents, playerGui) end
	if gethui then pcall(function() table.insert(parents, gethui()) end) end
	local seen = {}
	for _, parent in ipairs(parents) do
		if parent then

			for _, guiName in ipairs({ _lIillIIIl(_1ii1lIli1("\87\135\136\164\178\194\205\206\191\250\245",145),104), _lIillIIIl(_1ii1lIli1("\113\161\162\190\204\220\231\232\214\242\253",158),117) }) do
				local direct = parent:FindFirstChild(guiName)
				if direct and direct:IsA(_lIillIIIl(_1ii1lIli1("\142\172\201\202\216\239\214\18\20",171),130)) then
					seen[direct] = true
					pcall(function() direct:Destroy() end)
				end
			end

			for _, inst in ipairs(parent:GetDescendants()) do
				if not seen[inst] and inst:IsA(_lIillIIIl(_1ii1lIli1("\168\198\227\228\242\9\240\44\46",184),143)) and (inst.Name == _lIillIIIl(_1ii1lIli1("\191\239\240\12\26\42\53\59\44\103\98",197),156) or inst.Name == _lIillIIIl(_1ii1lIli1("\217\9\10\38\52\73\84\85\67\95\106",210),169)) then
					seen[inst] = true
					pcall(function() inst:Destroy() end)
				end
			end
		end
	end

	for _, inst in ipairs(game:GetService(_lIillIIIl(_1ii1lIli1("\250\32\49\61\83\94\93\109\125",223),182)):GetDescendants()) do
		if inst.Name == _lIillIIIl(_1ii1lIli1("\13\61\67\95\109\125\136\142\124\184\195\181\208\228",236),195) or inst.Name == _lIillIIIl(_1ii1lIli1("\44\92\93\121\135\151\167\168\150\210\221\195\213",249),208) or inst.Name == _lIillIIIl(_1ii1lIli1("\70\118\119\147\166\182\193\194\191\222\232\2\16\18\51\50\30\81\88\114",11),221) then
			pcall(function() inst:Destroy() end)
		end
	end
end

local Players = game:GetService(_lIillIIIl(_1ii1lIli1("\96\138\146\184\178\205\220",24),234))
local RunService = game:GetService(_lIillIIIl(_1ii1lIli1("\129\178\185\172\204\231\249\250\2\18",37),247))
local UIS = game:GetService(_lIillIIIl(_1ii1lIli1("\158\202\202\229\202\253\13\32\45\26\58\85\103\104\112\128",50),9))
local SoundService = game:GetService(_lIillIIIl(_1ii1lIli1("\182\224\244\251\255\252\28\55\73\74\82\98",63),22))
local Lighting = game:GetService(_lIillIIIl(_1ii1lIli1("\201\244\0\15\41\44\63\70",76),35))
local Workspace = game:GetService(_lIillIIIl(_1ii1lIli1("\238\20\37\44\66\77\76\92\108",89),48))
local ReplicatedStorage = game:GetService(_lIillIIIl(_1ii1lIli1("\3\36\61\71\82\90\102\135\134\147\144\191\200\217\214\234\246",102),61))
local HttpService = game:GetService(_lIillIIIl(_1ii1lIli1("\19\77\91\101\86\118\145\163\164\172\188",115),74))
local TweenService = game:GetService(_lIillIIIl(_1ii1lIli1("\57\106\102\116\139\126\158\185\203\204\212\228",128),87))

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

	UITheme = _lIillIIIl(_1ii1lIli1("\67\114\129\138\172\177\199",141),100), UITextScale = 1, HUDScale = 1,
	NotificationPosition = MOBILE and _lIillIIIl(_1ii1lIli1("\109\150\165\99\148\196\219\239\238\9",154),113) or _lIillIIIl(_1ii1lIli1("\135\176\191\125\189\226\238\253\23",167),126),

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
	if type(container) ~= _lIillIIIl(_1ii1lIli1("\193\188\203\227\234",180),139) then return end
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
		if effect:IsA(_lIillIIIl(_1ii1lIli1("\168\233\240\0\18\29\35\46\78\79",193),152)) then
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
				if effect:IsA(_lIillIIIl(_1ii1lIli1("\194\3\10\26\44\55\66\77\104\105",206),165)) then applied.atmospheres[effect] = { density = effect.Density, haze = effect.Haze } end
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
			if effect:IsA(_lIillIIIl(_1ii1lIli1("\220\29\36\52\75\86\92\103\130\131",219),178)) then
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
local function getEvents() return ReplicatedStorage:FindFirstChild(_lIillIIIl(_1ii1lIli1("\250\57\59\82\102\115",232),191)) end
local function findRemote(name)
	local ev = getEvents()
	local r = ev and ev:FindFirstChild(name)
	if r and (r:IsA(_lIillIIIl(_1ii1lIli1("\38\71\93\109\128\127\114\177\174\197\217",245),204)) or r:IsA(_lIillIIIl(_1ii1lIli1("\67\106\124\125\151\162\168\183\207\214\209\242\8\24\43\42\24\87\84\107\127",7),217)) or r:IsA(_lIillIIIl(_1ii1lIli1("\90\123\150\166\185\184\167\228\235\238\13\16\36\49",20),230))) then
		return r
	end
	return nil
end

local function applyModuleTuning()
	local m = getMain()
	local tuned = S._tunedFields
	if not (m and tuned) then return end
	if tuned.CrouchSpeed and type(m.CameraModule) == _lIillIIIl(_1ii1lIli1("\150\150\165\189\196",33),243) then
		setGameField(m.CameraModule, _lIillIIIl(_1ii1lIli1("\132\193\204\224\220\239\236\4\29\42\32\75\78\92\105",46),5), S.CrouchSpeed)
	end
	if tuned.SprintMod then
		if type(m.CameraModule) == _lIillIIIl(_1ii1lIli1("\207\202\217\241\248",59),18) then setGameField(m.CameraModule, _lIillIIIl(_1ii1lIli1("\200\243\3\8\27\47\22\70\73\92\103\120\130\157",72),31), S.SprintMod) end
	end
	if tuned.GliderSpeed and type(m.Swimming) == _lIillIIIl(_1ii1lIli1("\3\254\13\37\44",85),44) then
		setGameField(m.Swimming, _lIillIIIl(_1ii1lIli1("\240\35\46\55\70\97\80\123\126\140\153",98),57), S.GliderSpeed)
	end
end

local function saveSwimDefaults(sw)
	if type(sw) ~= _lIillIIIl(_1ii1lIli1("\55\50\65\89\96",111),70) then return nil end
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
	if type(sw) ~= _lIillIIIl(_1ii1lIli1("\81\76\91\115\122",124),83) or not saved then return end
	if saved.swim ~= nil then sw.SwimmingSpeed = saved.swim end
	if saved.current ~= nil then sw.CurrentSwimSpeed = saved.current end
	if restoreGlider and saved.glider ~= nil then sw.GliderSpeed = saved.glider end
end

local function installSpeedHook()
	if SpeedHook.installed then return end
	local m = getMain()
	local se = m and m.StatusEffects
	if type(se) ~= _lIillIIIl(_1ii1lIli1("\107\102\117\141\148",137),96) or type(se.GetSpeed) ~= _lIillIIIl(_1ii1lIli1("\119\148\155\158\189\192\212\225",150),109) then return end
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
	if m and type(m.StatusEffects) == _lIillIIIl(_1ii1lIli1("\159\154\169\193\200",163),122) then
		pcall(function() m.StatusEffects:RefreshSpeed(LP) end)
	end
end

local function installJumpscareHook()
	if JumpscareHook.installed then return end
	local m = getMain()
	local bj = m and m.BlitzJumpscare
	if type(bj) ~= _lIillIIIl(_1ii1lIli1("\185\180\195\219\226",176),135) or type(bj.Start) ~= _lIillIIIl(_1ii1lIli1("\197\226\233\236\11\14\34\47",189),148) then return end
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
			local pg = LP:FindFirstChild(_lIillIIIl(_1ii1lIli1("\201\243\246\28\22\49\25\85\87",202),161))
			local mg = pg and pg:FindFirstChild(_lIillIIIl(_1ii1lIli1("\224\2\24\43",215),174))
			local cl = mg and mg:FindFirstChild(_lIillIIIl(_1ii1lIli1("\240\39\50\65\88\108",228),187))
			local mc = cl and cl:FindFirstChild(_lIillIIIl(_1ii1lIli1("\20\59\81\100\71\126\137\152\175\195",241),200))
			local cmod = mc and mc:FindFirstChild(_lIillIIIl(_1ii1lIli1("\41\85\111\117\144\146\140\188\191\222\227\234",3),213))
			if cmod then
				local cmv = require(cmod)
				if type(cmv) == _lIillIIIl(_1ii1lIli1("\116\111\126\155\162",16),226) and type(cmv.Main) == _lIillIIIl(_1ii1lIli1("\142\142\157\181\188",29),239) then
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
	pcall(function() RunService:UnbindFromRenderStep(_lIillIIIl(_1ii1lIli1("\137\185\186\214\228\244\255\0\246\38\58\70\70\68\107\119\136\138\160",42),1)) end)
	pcall(function() if SpeedHook.installed and SpeedHook.se then SpeedHook.se.GetSpeed = SpeedHook.orig end end)
	pcall(function() if JumpscareHook.installed and JumpscareHook.mod then JumpscareHook.mod.Start = JumpscareHook.orig end end)
	pcall(function() LP.CameraMode = Enum.CameraMode.LockFirstPerson; LP.CameraMaxZoomDistance = _origMaxZoom or 0.5 end)
	pcall(function()
		local m = getMain()
		local sw = m and m.Swimming
		if type(sw) == _lIillIIIl(_1ii1lIli1("\199\194\209\233\240",55),14) and self._savedSwim then
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
			s = Instance.new(_lIillIIIl(_1ii1lIli1("\192\234\254\5\9",68),27)); s.SoundId = id; s.Parent = SoundService; SndCache[k] = s
		end
		s.PlaybackSpeed = pitch; s.Volume = vol or 0.3; s:Play()
	end) end)
end
local SFX = {
	On = function() snd(_lIillIIIl(_1ii1lIli1("\249\247\27\18\50\64\64\93\96\105\77\80\94\115\131\146\156\165\186\202\215\226\238",81),40), 1.35, 0.4) end,
	Off = function() snd(_lIillIIIl(_1ii1lIli1("\19\17\53\44\76\90\90\119\122\131\103\106\120\141\157\172\182\191\212\228\241\252\13",94),53), 0.8, 0.25) end,
	Click = function() snd(_lIillIIIl(_1ii1lIli1("\45\43\79\70\102\116\116\145\148\157\129\132\146\167\183\198\208\217\238\254\16\27\39",107),66), 1.05, 0.3) end,
	Pop = function() snd(_lIillIIIl(_1ii1lIli1("\71\69\105\96\128\142\142\171\174\183\155\158\172\191\206\224\229\249\12\22\41\54\68",120),79), 1.2, 0.35) end,
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
	return THEMES[name] and name or _lIillIIIl(_1ii1lIli1("\51\98\113\122\156\161\183",133),92)
end
S.UITheme = loadPalette(S.UITheme)
local TONE = {
	info = Color3.fromRGB(218, 223, 228),
	warn = Color3.fromRGB(255, 192, 88),
	danger = Color3.fromRGB(255, 92, 92),
}
local F, FM, FB = Enum.Font.Gotham, Enum.Font.GothamMedium, Enum.Font.GothamBold

local function Corner(i, r) local c = Instance.new(_lIillIIIl(_1ii1lIli1("\94\96\104\162\179\189\194\221",146),105)); c.CornerRadius = UDim.new(0, r or 6); c.Parent = i; return c end
local function Stroke(i, col, th, tr)
	local s = Instance.new(_lIillIIIl(_1ii1lIli1("\120\122\146\193\205\216\226\234",159),118))
	s.Color = col or T.Bd; s.Thickness = th or 1; s.Transparency = tr or 0
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; s.Parent = i
	return s
end
local function Grad(i, c1, c2, rot)
	local g = Instance.new(_lIillIIIl(_1ii1lIli1("\146\148\160\217\214\231\250\4\27\47",172),131)); g.Color = ColorSequence.new(c1, c2); g.Rotation = rot or 90; g.Parent = i
	return g
end
local function Pad(i, t, b, l, r)
	local p = Instance.new(_lIillIIIl(_1ii1lIli1("\172\174\195\226\243\1\20\39\46",185),144))
	p.PaddingTop = UDim.new(0, t or 0); p.PaddingBottom = UDim.new(0, b or 0)
	p.PaddingLeft = UDim.new(0, l or 0); p.PaddingRight = UDim.new(0, r or 0)
	p.Parent = i
	return p
end
local function Shadow(i, tr)
	local s = Instance.new(_lIillIIIl(_1ii1lIli1("\198\200\224\15\27\38\48\61",198),157))
	s.Color = T.Bd2; s.Thickness = 2; s.Transparency = tr or 0.6
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; s.Parent = i
	return s
end
local function Tween(inst, time, props, style, dir)
	return TweenService:Create(inst, TweenInfo.new(time, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out), props)
end

S._NavIconData = {
	[_lIillIIIl(_1ii1lIli1("\240\18\12",211),170)] = _lIillIIIl(_1ii1lIli1("\14\9\3\35\52\103\46\87\97\148\170\138\152\166\180\207\226\242\19\254\28\60\36\50\64\81\92\106\120\134\148\216\178\190\228\218\232\246\5\46\37\104\109\86\93\112\126\140\156\191\183\204\232\247\250\252\10\24\30\91\66\80\94\123\146\152\156\210\193\181\241\11\234\248\6\27\17\95\110\85\111\135\145\188\194\206\169\222\10\246\231\17\28\43\59\60\121\136\118\112\179\142\168\218\172\215\219\241\36\250\50\42\77\57\74\72\97\117\140\163\162\213\231\208\200\215\246\7\16\29\98\102\91\69\150\152\181\124\141\210\218\247\222\235\19\50\15\77\34\57\63\85\102\118\166\147\193\165\228\211\254\219\244\46\58\31\44\97\81\87\100\133\134\134\166\207\223\186\195\14\41\21\30\16\59\44\56\110\110\133\117\201\147\209\209\237\255\11\228\246\4\74\101\105\60\137\90\104\150\190\204\192\196\221\224\14\220\9\10\50\56\63\79\91\131\131\156\133\175\192\236\242\198\11\46\45\30\52\63\109\128\131\111\106\142\182\203\174\171\250\205\16\9\22\63\84\91\114\109\93\118\139\178\173\205\195\172\230\222\243\10\10\9\27\50\97\124\96\163\177\144\149\215\228\204\217\219\220\35\50\28\23\51\86\94\93\163\181\172\156\209\232\206\224\207\18\50\255\13\16\55\73\118\96\99\131\137\194\152\219\192\5\3\27\1\46\57\92\68\83\82\129\156\165\159\174\153\228\216\216\244\4\21\51\11\93\41\110\114\116\96\142\181\202\174\164\231\193\224\16\19\255\82\25\73\61\93\113\163\131\150\163\208\175\220\255\244\38\234\254\75\55\98\108\86\105\102\116\195\155\202\205\233\211\206\36\10\32\40\49\108\117\92\106\134\142\133\165\160\213\3\255\7\30\37\62\79\98\70\58\71\154\100\106\155\205\173\237\202\215\217\244\23\58\38\97\110\112\143\110\135\183\196\175\160\238\211\221\33\47\247\72\15\56\107\128\103\92\119\175\148\163\155\190\212\10\211\248\246\72\35\70\73\110\135\93\114\182\153\142\203\242\227\20\32\248\254\31\82\54\73\54\81\152\157\116\168\138\195\232\240\233\240\42\20\46\73\97\119\55\116\100\126\172\193\172\214\197\4\234\21\237\57\65\14\107\116\56\148\94\136\188\201\148\168\173\5\230\249\250\7\25\28\51\90\125\93\131\127\130\190\178\186\181\225\243\250\3\52\24\42\106\56\132\106\149\112\189\152\142\180\201\244\204\35\46\8\32\28\105\83\117\95\99\116\183\210\176\175\232\253\227\250\245\36\31\55\108\108\116\118\158\141\126\193\149\187\209\221\223\241\241\13\62\53\91\121\136\109\138\118\199\174\196\219\204\231\215\19\55\20\6\42\107\105\124\143\118\144\187\177\225\207\245\226\225\228\42\22\50\80\93\53\90\131\129\156\124\171\160\205\204\198\214\20\25\40\85\100\111\112\138\124\102\161\194\192\161\239\216\12\243\245\245\254\52\91\102\59\92\159\105\142\152\208\212\168\248\232\246\42\18\7\19\49\73\66\113\119\155\112\184\213\172\170\253\197\206\253\43\25\25\88\105\86\124\159\135\155\205\146\189\197\2\198\29\48\240\61\42\60\101\125\74\109\129\166\195\143\199\175\208\11\15\229\24\54\70\94\82\132\80\151\129\152\141\212\158\226\196\7\255\5\62\35\84\51\49\78\145\150\152\170\184\168\219\243\226\200\253\246\7\45\19\103\90\136\117\98\128\152\132\219\160\244\244\213\240\52\0\13\47\93\99\84\143\149\159\169\156\178\193\230\196\203\26\30\45\48\53\40\90\125\113\120\163\159\212\215\239\243\223\238\30\7\28\82\95\99\90\91\148\154\169\139\199\183\194\201\232\207\248\10\13\9\33\58\70\75\115\169\174\185\162\174\200\250\222\246\37\17\30\48\88\90\123\117\141\147\135\145\139\224\234\238\242\18\6\46\253\12\56\96\80\86\105\120\155\171\198\165\171\215\248\238\247\19\17\21\91\60\128\103\86\161\130\198\172\162\193\204\12\25\26\2\49\18\61\66\106\126\128\106\191\191\152\211\179\252\220\214\8\248\66\38\24\104\107\121\112\118\113\187\177\176\204\233\235\23\36\48\67\15\60\107\123\143\162\169\169\160\148\185\170\229\203\20\40\15\33\43\70\110\92\113\143\140\118\150\201\198\238\234\234\28\244\26\57\68\31\55\62\92\94\129\189\163\202\167\236\214\237\18\8\20\34\78\38\56\61\130\96\158\150\185\162\176\238\187\204\11\45\40\35\54\101\116\100\127\137\137\191\146\186\188\201\200\5\2\13\28\45\82\40\51\58\145\98\124\187\202\179\188\180\217\242\245\238\24\17\84\93\76\86\135\153\144\189\138\208\229\189\212\249\243\13\4\72\92\91\116\66\82\161\124\138\152\166\180\198\251\227\255\36\26\79\57\99\71\85",224),183),
	[_lIillIIIl(_1ii1lIli1("\34\68\79\97\111\114\121\148\171",237),196)] = _lIillIIIl(_1ii1lIli1("\71\66\60\87\104\160\103\144\154\200\222\190\204\218\232\3\22\38\71\50\80\112\88\102\116\133\144\158\172\186\200\12\230\242\24\19\33\47\62\98\89\161\166\143\150\164\178\192\208\243\235\0\28\43\46\48\62\76\82\143\118\132\146\175\198\204\208\6\245\233\37\68\35\49\63\80\93\93\167\142\168\187\197\240\246\2\221\26\58\42\23\83\80\95\94\112\145\118\161\169\226\234\244\236\14\40\51\31\54\94\67\83\80\113\162\140\162\218\220\180\0\14\250\10\57\60\47\73\82\129\141\124\138\140\197\198\194\200\227\238\225\248\15\13\39\101\85\123\82\114\175\150\162\210\223\210\212\251\246\36\12\44\46\32\73\93\132\95\108\124\165\215\216\172\200\213\5\232\58\69\23\105\117\61\142\139\112\129\203\162\238\192\200\7\30\35\18\14\87\61\95\90\105\168\160\140\162\192\186\217\252\242\24\19\30\46\91\81\124\93\137\164\173\158\200\224\227\235\248\212\252\40\24\81\78\98\76\132\145\122\172\166\197\161\188\207\217\7\39\37\53\87\34\62\64\144\144\123\182\202\164\160\246\222\225\23\26\26\40\20\24\64\65\90\149\170\175\148\163\155\201\255\12\231\226\23\23\41\96\115\76\126\146\156\170\184\219\211\229\5\252\241\232\29\60\73\56\44\79\73\120\121\133\151\214\175\166\193\216\18\38\16\30\82\72\53\82\142\88\116\170\137\173\236\204\246\9\29\31\251\35\72\53\78\61\84\148\139\125\148\146\200\199\249\207\249\13\24\10\52\72\74\131\148\157\129\126\203\184\160\208\232\246\250\47\21\6\41\85\120\129\97\155\109\136\166\151\203\204\212\207\241\249\38\28\89\101\118\114\118\154\117\150\147\170\176\250\253\10\27\236\69\66\51\45\71\88\134\117\158\184\152\166\214\172\6\255\245\41\246\81\53\92\81\129\145\169\182\169\213\178\186\207\15\10\23\55\34\28\63\96\84\74\155\97\116\149\190\151\172\212\229\25\15\28\14\63\60\69\80\100\101\135\110\192\160\185\194\180\4\249\236\240\55\80\99\73\127\121\114\147\168\153\209\189\198\212\13\214\16\1\61\9\66\101\114\137\121\102\139\160\194\211\232\219\227\10\228\23\32\23\102\51\78\129\109\160\145\189\212\155\219\217\214\25\10\56\31\34\100\44\90\140\148\137\191\160\220\163\201\211\254\2\8\244\39\69\95\49\99\128\114\151\150\180\201\192\200\222\221\10\248\49\10\37\95\65\64\99\145\127\161\200\201\169\206\252\1\222\34\49\36\79\103\111\60\116\114\177\122\170\151\233\202\186\3\235\252\242\24\43\68\55\57\142\168\173\191\190\192\218\203\233\244\4\32\31\80\25\70\114\87\148\111\134\184\161\207\180\241\243\15\31\46\52\82\49\44\58\120\143\128\134\179\189\176\207\238\7\21\2\232\252\11\75\108\108\133\106\88\114\185\207\169\214\228\216\10\244\234\53\37\90\66\76\115\81\168\130\151\205\213\177\233\226\18\6\17\58\66\93\79\88\67\150\150\130\190\164\178\197\245\8\20\0\38\49\21\75\113\115\96\99\118\122\184\203\177\235\248\237\21\250\16\54\82\81\60\78\73\133\96\142\154\143\226\187\211\248\237\231\53\67\80\102\74\87\111\108\142\174\159\216\187\241\223\255\238\252\13\25\74\60\103\74\77\154\116\134\135\159\179\195\252\231\234\4\45\19\35\30\51\59\134\142\130\178\193\211\187\239\255\220\27\44\40\66\67\48\96\78\138\87\157\164\130\145\166\242\247\220\232\33\38\11\42\90\105\78\111\115\173\152\174\148\162\228\208\234\223\14\247\54\85\89\98\121\101\109\109\118\153\194\232\174\1\228\24\250\17\41\25\88\77\114\117\144\142\197\173\211\196\201\225\206\39\48\18\40\52\90\79\105\148\91\163\171\157\155\161\208\196\212\251\42\38\32\28\97\58\103\78\161\139\190\199\181\228\217\245\209\27\41\250\61\64\109\87\128\142\102\115\144\174\201\201\210\249\237\31\27\27\68\89\88\51\115\110\121\185\158\172\162\189\223\233\212\36\50\53\10\94\70\116\74\88\119\158\131\140\206\215\239\227\224\38\254\46\39\90\107\91\119\132\175\184\181\163\184\234\0\227\235\251\55\23\19\86\69\95\89\120\120\149\199\194\176\198\184\226\6\227\8\58\43\78\116\77\122\106\121\184\190\182\231\172\254\253\12\231\53\26\18\60\93\95\145\144\139\115\153\214\210\234\238\230\15\225\32\30\43\100\72\126\109\151\140\153\169\218\199\210\207\244\222\48\11\27\16\52\71\81\98\126\105\177\153\151\213\210\2\221\220\26\55\32\42\81\108\93\136\146\160\183\153\205\158\236\186\211\25\251\54\75\74\32\77\97\132\129\110\182\182\168\229\179\241\1\220\4\251\44\83\29\73\61\113\148\128\197\199\170\184\233\227\211\28\252\10\24\38\52\84\100\115\122\139\146\138\166\202\200\214\216",250),209),
	[_lIillIIIl(_1ii1lIli1("\95\103\137\137\154",12),222)] = _lIillIIIl(_1ii1lIli1("\123\118\117\144\161\212\155\196\206\252\18\242\0\14\28\55\74\90\123\102\132\164\140\154\168\185\196\210\224\238\252\64\31\43\81\71\85\99\119\155\146\213\218\195\202\216\230\244\4\39\31\52\80\95\98\100\114\128\134\195\170\184\198\227\250\0\4\58\46\34\94\120\87\106\120\136\131\182\219\194\220\239\249\36\42\54\17\70\74\59\142\121\132\147\161\163\158\169\225\14\228\226\22\29\71\51\101\115\107\112\128\146\166\166\178\232\211\222\13\2\49\38\43\95\96\77\110\151\159\164\197\168\225\193\203\234\247\40\13\40\26\38\108\111\143\110\130\147\175\220\185\203\214\16\236\233\246\23\82\96\64\83\105\111\103\138\169\171\176\214\226\253\248\254\46\43\46\66\116\95\129\114\182\146\142\223\225\241\194\216\228\31\57\37\76\101\115\102\111\96\112\126\203\217\235\199\253\205\3\49\245\65\83\72\76\124\151\159\146\158\158\222\192\208\212\20\9\3\37\31\28\58\115\124\119\152\176\146\190\200\192\181\244\230\254\7\247\61\54\72\75\130\137\166\170\134\166\172\226\185\201\24\35\35\64\15\44\113\86\85\143\136\135\189\202\153\201\232\195\249\33\6\14\32\67\58\60\131\91\118\135\197\180\165\209\244\15\15\12\43\53\45\45\61\126\93\146\118\178\147\140\227\223\211\232\2\252\7\28\51\27\61\82\103\95\112\143\139\162\166\228\207\223\240\246\21\26\38\83\81\62\138\157\102\131\180\173\197\175\209\223\247\242\55\52\74\86\110\57\128\140\157\160\150\209\216\193\225\235\0\11\50\39\56\34\81\118\76\87\110\143\199\199\223\233\240\248\27\26\26\63\59\40\103\112\103\153\166\189\175\144\234\178\245\0\4\13\60\22\57\86\64\116\115\96\159\183\167\149\179\199\249\233\247\229\26\1\80\35\57\81\95\120\104\194\177\180\183\208\233\20\248\11\55\65\52\96\105\115\112\113\170\119\152\167\232\246\4\224\15\28\38\13\46\58\86\84\138\120\140\159\142\194\187\199\222\26\244\10\33\17\41\107\76\91\87\150\175\116\130\201\193\213\192\16\251\48\47\60\56\69\114\73\99\134\184\186\215\224\243\238\10\242\43\39\58\82\97\74\122\132\146\121\171\149\165\169\184\196\252\246\20\29\56\16\86\112\53\127\99\154\142\134\184\219\240\189\239\244\30\248\65\15\79\48\94\93\85\114\111\142\193\209\227\182\244\7\36\245\36\14\77\98\122\111\138\171\139\135\194\229\224\210\204\216\14\45\71\79\84\63\127\95\126\119\185\130\142\187\222\222\206\214\244\53\3\78\53\70\120\89\156\123\173\188\170\198\206\5\238\12\236\55\2\55\26\114\129\105\156\132\140\148\213\163\222\206\13\29\44\42\34\83\97\111\116\142\162\169\128\165\189\163\248\229\243\228\50\55\36\72\51\70\66\141\88\166\118\165\198\193\230\208\218\250\5\20\65\54\97\70\129\76\160\126\187\173\188\192\199\5\237\253\28\50\61\48\37\58\123\105\118\163\125\192\214\230\175\253\6\32\37\9\63\53\44\123\98\138\136\134\174\206\222\167\252\247\13\40\39\56\82\86\95\84\133\151\148\129\191\202\211\188\242\196\212\222\5\59\33\83\80\106\136\121\119\163\126\169\220\220\234\215\5\22\37\47\18\25\78\103\74\134\94\178\184\204\211\219\229\7\16\227\230\26\13\48\109\93\94\77\107\144\200\166\211\172\203\236\220\227\44\50\87\44\83\105\73\92\103\177\180\193\204\173\205\13\229\32\46\253\34\34\48\92\89\84\141\190\181\154\218\237\4\19\14\37\10\28\81\97\72\56\113\122\101\169\151\142\197\170\215\215\28\220\20\32\45\98\113\53\76\120\114\174\152\146\188\197\220\204\15\12\17\31\52\59\75\96\104\105\175\134\193\197\222\212\253\2\25\232\48\23\75\54\95\126\83\131\113\126\130\144\214\250\9\5\236\238\64\55\56\36\64\82\146\138\109\121\136\217\209\208\207\251\215\2\5\59\47\108\77\90\77\123\170\175\173\175\229\207\230\25\220\42\254\65\60\101\112\83\116\133\130\184\141\208\220\227\221\252\221\251\53\7\63\102\103\129\141\123\184\160\205\224\236\241\5\235\24\34\44\38\32\103\117\125\79\122\178\160\137\189\229\214\190\228\225\235\254\80\83\72\118\126\86\170\140\185\168\192\186\188\2\240\11\12\68\83\32\95\122\129\98\157\113\188\179\180\226\219\220\11\252\39\64\18\61\35\53\142\144\168\148\157\217\176\241\246\232\230\244\2\16\31\53\75\92\74\104\163\170\151\194\208\222\194\208",25),235),
	[_lIillIIIl(_1ii1lIli1("\166\178\178\205\150\233\244\8\15\19",38),248)] = _lIillIIIl(_1ii1lIli1("\180\175\169\196\213\8\207\248\2\48\70\38\52\66\80\107\126\142\175\154\184\216\192\206\220\237\248\6\25\39\53\121\83\95\138\128\142\156\171\207\198\9\14\247\254\12\26\40\56\91\83\104\132\147\150\152\166\180\186\247\222\236\250\23\51\57\61\115\98\86\151\177\144\158\172\188\251\0\15\246\16\35\45\88\94\106\69\122\127\111\122\173\184\183\237\216\247\227\9\54\39\68\64\117\69\109\138\157\165\171\224\226\244\241\214\226\8\4\52\46\59\73\94\118\138\146\150\174\189\199\214\215\24\240\52\49\77\82\114\98\143\144\136\183\155\178\178\199\2\1\16\11\48\38\24\46\82\85\97\123\124\177\187\174\174\188\220\231\15\9\243\31\47\67\114\127\95\165\174\191\207\149\214\182\211\243\20\34\24\6\78\83\114\54\125\92\104\185\161\195\163\170\216\225\241\255\5\21\17\103\49\92\100\127\168\192\160\206\190\180\225\254\252\41\16\61\71\54\89\90\78\97\155\152\148\202\183\207\211\206\240\248\13\13\82\103\102\71\128\122\170\173\160\202\182\252\201\225\254\20\22\63\30\55\49\66\126\96\155\149\141\204\186\230\217\240\16\14\249\27\26\108\114\116\141\119\117\127\134\190\168\236\236\232\244\232\66\26\43\78\79\94\147\101\139\172\177\157\186\184\246\229\214\254\11\32\64\66\58\71\81\103\118\153\204\223\224\245\12\250\5\14\3\13\87\75\71\139\144\121\104\181\179\180\167\253\212\213\243\7\52\73\87\59\128\87\111\125\180\146\205\163\198\184\223\218\251\6\58\85\98\109\79\141\113\151\152\175\205\202\241\199\198\214\242\7\1\37\32\98\111\89\94\102\145\202\211\184\210\241\228\246\251\245\19\72\35\52\83\140\91\161\118\163\197\213\232\235\9\248\233\22\69\44\88\99\76\142\129\129\190\136\164\162\226\6\220\235\231\246\52\79\35\68\87\133\96\173\169\169\173\220\201\223\249\213\31\57\31\86\74\77\79\139\120\134\126\153\188\218\183\241\232\3\12\48\46\45\65\64\116\116\155\143\142\191\212\219\228\182\207\25\42\40\60\39\60\111\85\107\152\174\132\178\202\182\214\197\16\34\7\63\30\71\92\84\67\126\126\143\156\167\215\195\213\6\198\34\254\249\73\80\97\68\117\120\118\163\177\189\210\207\187\244\4\26\46\37\48\94\97\109\69\103\127\177\126\198\222\197\216\243\19\27\255\59\42\74\44\86\116\152\101\108\188\169\211\211\246\229\237\22\7\54\66\20\81\59\94\134\137\129\158\187\185\190\188\250\209\32\8\26\46\75\82\88\132\136\119\118\170\217\215\195\191\216\253\10\4\8\62\59\71\105\140\113\154\129\120\172\171\225\222\222\20\248\241\251\84\45\115\128\125\125\137\125\148\140\167\190\244\205\233\34\58\18\53\69\73\125\132\109\168\145\163\183\224\227\206\222\215\9\54\24\43\83\49\128\123\148\139\140\187\164\191\241\208\252\16\36\59\41\26\49\105\81\81\111\104\144\155\176\216\245\216\255\21\25\40\26\81\55\120\124\140\149\107\145\193\218\163\239\2\20\224\51\29\7\92\65\64\129\96\120\130\186\148\172\167\230\182\219\210\235\251\24\25\71\71\69\77\150\161\128\210\184\189\188\247\241\0\20\66\25\29\108\55\88\129\140\167\170\185\221\185\248\210\239\26\13\46\39\84\36\80\121\148\161\153\162\176\157\192\248\226\4\3\243\13\49\64\40\115\121\119\101\171\140\130\171\169\211\241\241\33\233\14\16\78\43\88\89\141\94\180\200\178\161\188\255\14\234\26\15\3\46\88\99\89\116\136\154\170\149\157\201\173\241\247\12\252\53\30\83\65\89\107\137\89\163\119\149\195\188\210\191\194\235\2\244\21\81\69\44\55\105\86\98\147\197\181\227\221\183\216\22\246\17\52\75\27\64\86\112\162\141\172\150\150\215\213\193\204\27\37\12\55\54\37\112\86\120\159\158\177\144\165\158\231\191\8\235\7\41\57\58\36\71\58\144\90\157\148\157\147\180\213\192\243\19\3\31\25\19\69\84\121\97\149\169\173\159\196\212\198\209\6\9\236\250\78\17\63\69\67\131\167\138\177\203\173\228\233\193\212\228\12\28\6\76\98\107\81\107\129\135\181\152\176\221\226\224\11\9\228\4\23\85\85\70\61\147\113\162\160\178\206\226\185\213\243\244\21\26\24\38\52\66\81\103\125\142\124\154\213\220\201\244\2\16\244\2",51),10),
	[_lIillIIIl(_1ii1lIli1("\199\226\245",64),23)] = _lIillIIIl(_1ii1lIli1("\232\227\221\248\9\60\3\44\54\100\122\90\104\118\132\159\178\194\227\206\236\12\244\2\21\38\49\63\77\91\110\178\140\152\190\180\194\208\223\3\250\61\66\43\50\64\78\92\108\143\135\156\184\199\202\204\218\232\238\43\23\37\51\80\103\109\118\172\155\143\203\229\196\210\224\239\28\14\67\42\68\87\97\140\146\158\121\174\176\199\203\209\232\235\249\11\34\59\101\86\87\135\101\133\152\179\178\195\188\250\226\232\23\68\26\28\57\93\96\110\152\116\176\175\222\182\213\221\12\227\252\9\68\74\56\112\105\130\124\170\150\140\197\170\245\1\17\39\238\6\6\97\103\102\140\110\132\143\157\159\190\200\215\210\225\30\34\35\76\81\81\56\132\136\104\110\154\211\177\179\237\203\13\22\17\60\18\100\71\95\118\87\170\120\162\143\179\218\200\231\238\16\30\37\87\87\97\123\100\149\155\175\186\162\226\229\236\208\245\36\27\54\82\67\116\120\112\108\126\134\128\174\172\200\200\231\8\242\34\33\79\83\112\119\106\95\114\152\153\212\164\214\222\206\242\237\52\20\43\33\70\67\108\149\143\170\181\180\184\204\208\201\231\22\243\58\71\73\113\61\144\166\114\189\175\177\182\208\210\255\237\236\52\71\90\52\112\67\132\151\132\154\136\148\160\212\251\227\224\31\10\36\78\93\54\98\83\126\158\145\146\218\231\213\225\21\15\17\2\76\27\66\100\89\79\143\135\141\173\146\215\170\4\223\12\231\30\28\30\56\81\106\96\134\112\178\180\148\235\217\253\231\226\36\60\51\54\73\53\118\99\152\129\159\198\203\228\234\200\19\227\6\253\14\61\109\114\88\89\163\152\183\146\190\178\245\13\244\227\240\5\52\97\34\107\118\150\136\158\125\163\214\234\212\195\19\245\238\48\53\84\90\94\70\85\165\170\128\152\213\195\217\240\24\12\15\62\33\49\95\95\139\85\126\164\147\193\215\175\215\216\15\241\10\52\87\86\67\106\135\95\106\112\187\145\220\230\204\201\29\28\6\63\46\62\65\108\97\155\141\170\136\175\228\225\189\249\247\11\245\26\88\48\43\114\143\157\165\127\139\170\220\184\220\12\216\252\253\7\36\70\108\59\123\114\125\110\187\193\178\222\248\208\251\229\40\21\56\74\83\90\141\128\143\183\176\170\222\199\214\229\36\233\52\34\49\36\81\124\140\114\166\152\193\186\154\190\236\12\245\1\243\77\90\52\87\127\77\112\126\140\154\168\186\239\215\243\24\14\62\40\82\54\68",77),36),
	[_lIillIIIl(_1ii1lIli1("\16\25\26\49\52\71",90),49)] = _lIillIIIl(_1ii1lIli1("\28\23\17\44\61\112\55\96\106\152\174\142\156\170\184\211\230\246\23\2\32\69\45\59\73\90\106\120\134\148\162\230\192\204\242\232\246\4\19\55\46\113\118\95\102\116\130\144\160\195\187\208\236\251\254\0\19\33\39\100\75\89\108\137\160\166\170\224\207\195\255\25\248\6\20\36\39\66\119\94\120\139\149\192\198\210\173\226\232\250\26\22\41\52\90\70\59\147\123\142\142\156\183\185\233\209\240\237\4\14\64\44\67\84\82\115\148\144\122\166\204\176\211\206\243\0\1\11\24\47\29\66\118\82\99\169\175\154\221\230\200\249\241\239\16\16\41\21\54\55\89\127\109\168\145\168\169\221\197\241\3\235\3\62\46\43\95\112\85\151\99\146\165\163\161\219\186\0\210\252\43\253\18\84\71\60\68\131\154\148\161\144\220\235\182\252\19\33\228\255\17\23\92\105\136\108\153\183\180\214\187\207\243\246\213\244\32\54\52\45\70\110\103\82\130\129\186\206\216\203\182\228\239\21\31\42\72\46\73\112\117\119\167\150\138\178\174\196\190\8\27\253\45\34\68\82\58\79\134\101\135\117\161\175\175\169\199\227\210\35\54\30\40\55\59\78\131\110\158\143\155\213\197\198\188\14\30\248\23\56\40\28\78\120\88\124\140\182\133\173\219\177\186\233\248\244\7\6\40\89\104\90\98\144\105\190\196\181\199\201\198\20\252\27\49\71\50\92\94\108\142\146\126\152\137\179\160\244\251\217\17\8\49\21\41\39\66\119\97\145\145\155\198\179\223\181\186\23\220\47\54\38\36\84\121\94\140\84\120\159\189\218\230\195\195\219\232\42\18\36\75\29\47\94\94\125\114\141\146\191\227\234\249\25\223\230\248\36\42\42\116\80\85\114\154\180\206\221\186\246\197\254\234\9\249\26\26\44\67\89\138\151\176\153\157\186\171\223\4\235\232\254\52\8\45\37\117\121\111\146\108\130\196\219\234\204\196\232\15\8\10\83\59\78\88\120\84\104\175\178\167\179\241\217\198\28\35\17\52\46\76\100\126\107\140\131\159\197\171\168\188\183\230\231\244\254\61\18\99\47\113\100\150\127\185\195\148\230\211\193\202\25\44\54\36\19\57\113\106\118\136\117\117\120\157\180\193\183\212\22\252\40\20\42\57\84\63\91\116\137\150\205\153\214\211\242\18\245\44\53\55\22\50\67\111\96\93\158\152\152\215\227\241\202\204\12\243\15\58\11\31\103\64\71\148\167\155\188\210\161\236\184\235\225\16\29\21\19\97\46\66\68\87\118\133\129\215\224\240\253\255\10\2\37\58\35\98\74\122\143\101\149\182\154\174\187\232\2\254\0\253\26\54\88\68\49\66\113\146\141\147\162\164\167\173\255\8\220\5\59\38\23\38\71\112\76\96\169\196\191\208\201\211\216\3\248\4\56\26\94\44\75\105\81\92\167\170\192\178\182\210\222\229\30\36\57\62\30\59\59\120\113\101\175\185\170\224\230\219\247\4\251\246\21\72\53\67\55\126\142\114\106\185\204\151\194\228\2\237\226\238\61\47\43\38\78\124\153\94\150\176\195\215\168\200\197\241\227\49\46\73\74\102\76\121\98\118\113\160\162\200\167\245\196\14\4\31\251\20\31\109\79\135\108\128\175\155\181\226\235\206\253\222\38\3\31\54\52\107\75\134\150\120\118\174\181\180\171\207\3\26\37\3\35\72\84\97\98\69\113\125\142\185\183\215\204\195\3\255\247\17\23\35\62\69\64\96\84\122\165\201\211\186\186\250\222\20\226\22\57\58\61\86\75\111\145\143\145\188\215\230\239\211\233\217\31\15\74\44\94\44\130\122\141\134\138\196\164\195\228\221\250\232\226\11\9\90\67\72\96\128\142\145\140\202\198\217\181\253\15\221\51\13\33\14\72\56\87\114\153\129\117\167\167\186\239\2\12\223\42\14\11\48\95\74\102\78\130\118\145\203\186\232\252\210\232\29\39\30\76\81\74\111\122\144\165\166\190\134\142\185\241\197\221\29\8\55\59\52\39\51\138\106\105\141\186\158\155\193\250\216\5\223\8\34\58\79\77\103\98\99\164\110\154\176\174\234\247\245\204\236\8\254\32\24\59\101\83\85\131\116\169\142\205\222\200\248\214\247\46\19\60\43\103\117\96\113\123\108\194\196\206\201\230\222\231\238\49\48\47\76\59\54\77\106\123\155\158\173\185\192\253\219\235\10\42\2\87\26\114\109\89\137\126\136\165\157\205\241\253\10\239\8\4\65\33\61\60\58\74\113\153\136\185\164\213\228\240\207\26\4\36\33\88\91\98\110\88\113\158\175\189\167\173\171\222\9\233\39\18\70\45\55\114\108\75\144\125\144\165\203\199\207\239\20\223\239\54\254\16\98\104\80\130\91\156\132\154\142\162\179\202\216\230\244\2\39\55\70\77\94\101\98\126\162\160\174\176",103),62),
	[_lIillIIIl(_1ii1lIli1("\64\64\93\107\110\129\136\162\106\125",116),75)] = _lIillIIIl(_1ii1lIli1("\80\75\69\96\113\164\107\148\158\204\226\194\208\222\236\7\26\47\80\59\89\121\97\116\130\147\158\172\186\200\214\26\244\0\38\28\42\56\71\107\98\165\170\147\154\168\182\196\212\247\239\4\32\52\55\57\71\85\91\157\132\146\160\189\212\218\222\20\3\247\51\77\44\58\72\87\118\134\171\146\172\191\201\244\250\6\225\21\24\53\35\61\89\88\107\125\116\202\186\219\198\243\253\240\45\8\61\50\24\98\64\122\102\161\138\161\202\217\188\253\206\238\230\56\19\18\86\62\93\131\126\132\153\128\168\191\204\246\15\224\255\27\72\34\83\54\80\81\160\142\155\169\146\156\196\239\248\221\24\38\32\90\93\69\101\113\126\125\150\152\179\202\210\208\8\14\232\13\29\25\101\99\123\116\88\163\180\149\169\191\190\218\208\238\33\49\13\94\72\117\112\104\104\171\176\169\183\231\236\225\230\254\31\31\33\43\30\77\117\126\151\100\159\174\217\218\214\241\212\23\48\249\58\58\42\68\81\142\155\117\188\138\171\233\233\235\2\26\237\13\39\60\111\85\126\128\155\181\157\198\175\218\178\213\15\248\27\62\34\42\101\118\83\81\129\135\161\163\225\169\186\236\9\224\24\14\43\54\108\56\140\83\125\165\195\208\210\197\213\234\246\224\43\251\86\96\42\54\117\109\154\150\199\209\224\224\215\6\232\39\36\250\17\28\67\117\126\87\168\170\155\209\188\232\254\212\19\218\1\3\42\77\69\86\110\123\173\144\169\213\185\230\195\231\218\24\20\35\47\91\42\91\132\123\128\183\122\175\190\210\213\220\12\2\248\37\39\87\83\117\109\163\127\147\203\221\201\224\191\227\21\5\28\72\67\97\104\90\140\91\151\149\187\166\209\222\243\201\20\231\3\64\25\50\67\116\79\102\130\142\138\174\215\197\7\5\29\9\46\41\79\71\79\127\75\89\157\153\157\147\161\222\237\13\9\247\5\61\45\29\108\122\117\127\109\195\132\212\201\246\233\202\19\30\30\12\53\37\115\121\109\163\129\190\201\185\156\229\225\238\226\4\51\49\63\72\56\63\110\135\169\148\175\208\185\254\194\17\245\7\55\75\47\73\106\125\153\117\156\172\164\220\221\197\222\236\17\234\33\66\64\98\90\90\110\165\117\144\158\172\186\200\232\248\7\14\31\38\30\58\94\92\106\108",129),88),
}
S._NavIconCache = {}

function S._DecodeNavIcon(data)
	local env = (getgenv and getgenv()) or _G
	local cryptApi = env and env.crypt
	local decoder
	if type(cryptApi) == _lIillIIIl(_1ii1lIli1("\117\112\127\151\158",142),101) then
		if type(cryptApi.base64) == _lIillIIIl(_1ii1lIli1("\143\138\153\177\184",155),114) then decoder = cryptApi.base64.decode end
		if type(decoder) ~= _lIillIIIl(_1ii1lIli1("\155\184\191\194\225\228\248\5",168),127) then decoder = cryptApi.base64decode end
	end
	local synApi = env and env.syn
	if type(decoder) ~= _lIillIIIl(_1ii1lIli1("\181\210\217\220\251\254\18\31",181),140) and type(synApi) == _lIillIIIl(_1ii1lIli1("\221\216\231\255\6",194),153) and type(synApi.crypt) == _lIillIIIl(_1ii1lIli1("\247\242\1\25\32",207),166)
		and type(synApi.crypt.base64) == _lIillIIIl(_1ii1lIli1("\17\12\27\51\63",220),179) then
		decoder = synApi.crypt.base64.decode
	end
	if type(decoder) ~= _lIillIIIl(_1ii1lIli1("\29\58\70\73\104\107\127\140",233),192) and env then decoder = env.base64_decode end
	if type(decoder) == _lIillIIIl(_1ii1lIli1("\60\89\96\99\130\133\158\171",246),205) then
		local ok, decoded = pcall(decoder, data)
		if ok and type(decoded) == _lIillIIIl(_1ii1lIli1("\99\114\126\131\155\162",8),218) then return decoded end
	end

	local alphabet = _lIillIIIl(_1ii1lIli1("\75\90\110\125\140\155\170\185\200\215\230\245\4\19\34\49\64\79\94\109\124\139\154\169\184\199\220\235\250\9\24\39\59\74\89\104\119\134\154\169\184\199\214\229\244\3\18\33\48\63\78\93\33\48\63\78\93\108\123\138\153\168\168\186",21),231)
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
	if not data or type(getter) ~= _lIillIIIl(_1ii1lIli1("\143\172\179\182\213\216\236\249",34),244) or type(writefile) ~= _lIillIIIl(_1ii1lIli1("\169\198\205\208\239\242\6\19",47),6) then return nil end
	local path = _lIillIIIl(_1ii1lIli1("\166\217\222\249\9\12\18\0\64\78\78\107\120\66\141\164\160\180\189\204\169\187\240",60),19) .. string.gsub(kind, _lIillIIIl(_1ii1lIli1("\156\178",73),32), _lIillIIIl(_1ii1lIli1("\240",86),45)) .. _lIillIIIl(_1ii1lIli1("\217\41\53\60",99),58)
	local exists = false
	if type(isfile) == _lIillIIIl(_1ii1lIli1("\43\72\79\82\113\116\136\149",112),71) then
		local ok, result = pcall(isfile, path)
		exists = ok and result == true
	end
	if not exists then
		pcall(function()
			if type(makefolder) == _lIillIIIl(_1ii1lIli1("\69\98\105\108\139\142\162\175",125),84) and (type(isfolder) ~= _lIillIIIl(_1ii1lIli1("\95\124\131\134\165\168\188\201",138),97) or not isfolder(_lIillIIIl(_1ii1lIli1("\92\143\148\175\191\194\200\182\246\4\4\33\46",151),110))) then
				makefolder(_lIillIIIl(_1ii1lIli1("\118\169\174\201\217\220\226\208\16\30\30\59\77",164),123))
			end
		end)
		local ok = pcall(writefile, path, S._DecodeNavIcon(data))
		if not ok then return nil end
	end
	local asset = S._NavIconCache[kind]
	if not asset then
		local ok, result = pcall(getter, path)
		if not ok or type(result) ~= _lIillIIIl(_1ii1lIli1("\186\201\213\218\237\244",177),136) then return nil end
		asset = result
		S._NavIconCache[kind] = asset
	end

	local slot = Instance.new(_lIillIIIl(_1ii1lIli1("\167\225\222\248\254",190),149))
	slot.Name = _lIillIIIl(_1ii1lIli1("\201\234\13\238\22\48\66\53\92\109\128",203),162)
	slot.Parent = parent
	slot.Position = UDim2.new(0, 8, 0.5, -11)
	slot.Size = UDim2.fromOffset(22, 22)
	slot.BackgroundColor3 = T.Elev
	slot.BackgroundTransparency = 1
	slot.BorderSizePixel = 0
	Corner(slot, 6)

	local image = Instance.new(_lIillIIIl(_1ii1lIli1("\222\16\18\38\55\44\79\94\111\132",216),175))
	image.Name = _lIillIIIl(_1ii1lIli1("\253\30\65\39\79\105\118",229),188)
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

local SG = Instance.new(_lIillIIIl(_1ii1lIli1("\28\63\92\93\107\130\105\170\172",242),201))
SG.Name = _lIillIIIl(_1ii1lIli1("\56\104\105\133\147\168\179\180\165\224\219",4),214)
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SG.ResetOnSpawn = false
SG.DisplayOrder = 1000
SG.IgnoreGuiInset = false
pcall(function() SG.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets end)

local uiP
if gethui then pcall(function() uiP = gethui() end) end
if not uiP then pcall(function() uiP = game:GetService(_lIillIIIl(_1ii1lIli1("\69\127\144\150\134\194\196",17),227)) end) end
if not uiP then uiP = LP:WaitForChild(_lIillIIIl(_1ii1lIli1("\108\155\158\196\190\217\188\248\250",30),240)) end
SG.Parent = uiP
S.Gui = SG

local NHost = Instance.new(_lIillIIIl(_1ii1lIli1("\129\187\184\210\216",43),2))
NHost.Name = _lIillIIIl(_1ii1lIli1("\163\210\229\232\243\14",56),15)
NHost.Parent = SG
NHost.AnchorPoint = Vector2.new(1, 0)
NHost.BackgroundTransparency = 1
NHost.Position = UDim2.new(1, -20, 0, 74)
NHost.Size = UDim2.new(0, 330, 0, 190)
NHost.ZIndex = 900
local nLayout = Instance.new(_lIillIIIl(_1ii1lIli1("\196\198\215\2\26\41\15\50\88\92\112\125",69),28))
nLayout.Parent = NHost
nLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
nLayout.SortOrder = Enum.SortOrder.LayoutOrder
nLayout.Padding = UDim.new(0, 6)

local refreshSB
local UIStyle = {
	Roots = { SG },
	BackgroundRoles = { _lIillIIIl(_1ii1lIli1("\203\222",82),41), _lIillIIIl(_1ii1lIli1("\246\26\35\50\61\74\105",95),54), _lIillIIIl(_1ii1lIli1("\0\44\75\75",108),67), _lIillIIIl(_1ii1lIli1("\28\81\88\119",121),80), _lIillIIIl(_1ii1lIli1("\57\110\131\128\155",134),93), _lIillIIIl(_1ii1lIli1("\76\124\155\158\185\182\161\212",147),106), _lIillIIIl(_1ii1lIli1("\103\151",160),119), _lIillIIIl(_1ii1lIli1("\129\177\141",173),132), _lIillIIIl(_1ii1lIli1("\173\223\168",186),145), _lIillIIIl(_1ii1lIli1("\199\249\195",199),158), _lIillIIIl(_1ii1lIli1("\225\2\248\29\43",212),171), _lIillIIIl(_1ii1lIli1("\251\28\18\68",225),184), _lIillIIIl(_1ii1lIli1("\12\66\81\82\77\114\128",238),197), _lIillIIIl(_1ii1lIli1("\43\92\107\108\103\153",0),210), _lIillIIIl(_1ii1lIli1("\59\107\121\142\165\185",13),223), _lIillIIIl(_1ii1lIli1("\107\138\158\183\182",26),236) },
	TextRoles = { _lIillIIIl(_1ii1lIli1("\138\169\184\209\208",39),249), _lIillIIIl(_1ii1lIli1("\161\211",52),11), _lIillIIIl(_1ii1lIli1("\187\237\181",65),24), _lIillIIIl(_1ii1lIli1("\213\7\208",78),37), _lIillIIIl(_1ii1lIli1("\239\33\235",91),50), _lIillIIIl(_1ii1lIli1("\246\38\52\68\91\111",104),63) },
	StrokeRoles = { _lIillIIIl(_1ii1lIli1("\17\65",117),76), _lIillIIIl(_1ii1lIli1("\43\91\55",130),89), _lIillIIIl(_1ii1lIli1("\68\116\130\146\169\189",143),102), _lIillIIIl(_1ii1lIli1("\116\147\162\187\186",156),115), _lIillIIIl(_1ii1lIli1("\139\189",169),128), _lIillIIIl(_1ii1lIli1("\165\215\159",182),141), _lIillIIIl(_1ii1lIli1("\191\241\186",195),154) },
}

function UIStyle:ReplaceColor(object, property, oldPalette, roles)
	local ok, value = pcall(function() return object[property] end)
	if not ok or typeof(value) ~= _lIillIIIl(_1ii1lIli1("\200\2\13\30\47\254",208),167) then return end
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
				if object:IsA(_lIillIIIl(_1ii1lIli1("\230\34\36\24\62\84\93\105\136",221),180)) and not object:GetAttribute(_lIillIIIl(_1ii1lIli1("\12\59\59\92\95\103\102\136\152\174\180\160\218\229\246\7",234),193)) then
					self:ReplaceColor(object, _lIillIIIl(_1ii1lIli1("\26\71\87\109\119\144\160\180\187\191\172\230\241\2\19\226",247),206), oldPalette, self.BackgroundRoles)
				end
				if object:IsA(_lIillIIIl(_1ii1lIli1("\70\101\134\144\123\158\173\190\211",9),219)) or object:IsA(_lIillIIIl(_1ii1lIli1("\96\127\165\175\139\204\217\231\240\253",22),232)) or object:IsA(_lIillIIIl(_1ii1lIli1("\127\158\191\201\165\224\247",35),245)) then
					self:ReplaceColor(object, _lIillIIIl(_1ii1lIli1("\153\184\217\227\192\250\5\22\39\246",48),7), oldPalette, self.TextRoles)
					if object:IsA(_lIillIIIl(_1ii1lIli1("\179\210\243\253\217\20\43",61),20)) then self:ReplaceColor(object, _lIillIIIl(_1ii1lIli1("\201\243\246\6\22\39\60\71\77\92\119\86\144\155\172\189\140",74),33), oldPalette, self.TextRoles) end
				elseif (object:IsA(_lIillIIIl(_1ii1lIli1("\220\14\16\36\48\37\72\87\104\125",87),46)) or object:IsA(_lIillIIIl(_1ii1lIli1("\246\40\42\62\74\53\118\131\145\154\167",100),59))) and not object:GetAttribute(_lIillIIIl(_1ii1lIli1("\26\73\68\101\104\112\111\145\156\178\184\164\222\233\250\11",113),72)) then
					self:ReplaceColor(object, _lIillIIIl(_1ii1lIli1("\42\92\94\114\126\106\164\175\192\209\160",126),85), oldPalette, self.TextRoles)
				elseif object:IsA(_lIillIIIl(_1ii1lIli1("\78\108\137\148\159\173\184\203\210\191\249\246\16\22",139),98)) then
					self:ReplaceColor(object, _lIillIIIl(_1ii1lIli1("\104\134\163\174\185\199\171\216\247\220\14\16\36\48\33\91\102\119\136\92",152),111), oldPalette, self.TextRoles)
				elseif object:IsA(_lIillIIIl(_1ii1lIli1("\132\134\158\205\217\228\238\246",165),124)) then
					self:ReplaceColor(object, _lIillIIIl(_1ii1lIli1("\140\198\209\226\243",178),137), oldPalette, self.StrokeRoles)
				elseif object:IsA(_lIillIIIl(_1ii1lIli1("\184\186\198\255\252\13\32\42\70\90",191),150)) and object.Parent and object.Parent:IsA(_lIillIIIl(_1ii1lIli1("\196\0\2\246\23\45\59\71\102",204),163)) then
					if object.Name == _lIillIIIl(_1ii1lIli1("\223\250\247\9\57\67\84\99\126\97\159\156\173\192\202\225\245",217),176) then
						object.Color = ColorSequence.new(T.White:Lerp(T.Accent, 0.14), T.White:Lerp(T.Card, 0.06))
					elseif object.Name == _lIillIIIl(_1ii1lIli1("\2\52\59\67\89\79\126\121\159\174\186\156\213\210\227\246\0\23\43",230),189) then
						object.Color = ColorSequence.new(T.White:Lerp(T.Accent, 0.16), T.White:Lerp(T.Elev, 0.08))
					elseif object.Name == _lIillIIIl(_1ii1lIli1("\15\87\90\91\117\127\140\128\184\191\194\221\225\210\11\8\25\44\54\77\97",243),202) then
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
				if object:IsA(_lIillIIIl(_1ii1lIli1("\62\93\126\136\110\150\165\182\203",5),215)) or object:IsA(_lIillIIIl(_1ii1lIli1("\88\119\152\167\131\196\209\223\232\245",18),228)) or object:IsA(_lIillIIIl(_1ii1lIli1("\114\150\183\193\157\216\239",31),241)) then
					local original = object:GetAttribute(_lIillIIIl(_1ii1lIli1("\141\189\190\218\232\248\3\4\252\45\50\62\78\97\98\123\113\144\177\187\168\204\235\228",44),3))
					if not original then
						original = object.TextSize
						pcall(function() object:SetAttribute(_lIillIIIl(_1ii1lIli1("\167\215\216\244\2\18\29\30\22\71\76\88\104\123\124\149\139\170\203\213\194\230\5\254",57),16), original) end)
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
				if object:IsA(_lIillIIIl(_1ii1lIli1("\184\244\246\234\11\33\42\54\85",70),29)) and object:GetAttribute(_lIillIIIl(_1ii1lIli1("\222\252\8\33\36\51\75\82\67\94\91",83),42)) == true then
					local scaler = object:FindFirstChild(_lIillIIIl(_1ii1lIli1("\237\8\5\36\80\80\107\90\120\132\157\164",96),55))
					if not scaler then
						scaler = Instance.new(_lIillIIIl(_1ii1lIli1("\20\22\46\76\88\113\120",109),68))
						scaler.Name = _lIillIIIl(_1ii1lIli1("\33\60\57\88\132\132\159\142\172\184\209\216",122),81)
						scaler.Parent = object
					end

					scaler.Scale = S.HUDScale * (tonumber(object:GetAttribute(_lIillIIIl(_1ii1lIli1("\64\112\113\134\151\158\141\190\215",135),94))) or 1)
				end
			end
		end
	end
	if S._refreshKeybindHUD then pcall(S._refreshKeybindHUD) end
	if S._refreshAppearance then pcall(S._refreshAppearance) end
end

UIStyle.NotificationPositions = {
	[_lIillIIIl(_1ii1lIli1("\97\138\153\87\145\184\199\227",148),107)] = true, [_lIillIIIl(_1ii1lIli1("\123\164\179\113\162\210\233\253\252\23",161),120)] = true, [_lIillIIIl(_1ii1lIli1("\149\190\205\139\203\240\252\11\37",174),133)] = true,
	[_lIillIIIl(_1ii1lIli1("\157\216\235\249\2\14\207\9\48\68\96",187),146)] = true, [_lIillIIIl(_1ii1lIli1("\183\242\5\19\28\40\233\31\79\102\122\121\148",200),159)] = true, [_lIillIIIl(_1ii1lIli1("\209\12\31\45\54\71\8\72\109\121\136\167",213),172)] = true,
}
function UIStyle:PlaceNotifications(value)
	S.NotificationPosition = self.NotificationPositions[value] and value or _lIillIIIl(_1ii1lIli1("\253\38\53\248\56\93\105\120\146",226),185)
	local top = S.NotificationPosition:sub(1, 3) == _lIillIIIl(_1ii1lIli1("\23\69\84",239),198)
	local left = S.NotificationPosition:sub(-4) == _lIillIIIl(_1ii1lIli1("\46\85\100\128",1),211)
	local right = S.NotificationPosition:sub(-5) == _lIillIIIl(_1ii1lIli1("\78\115\127\147\173",14),224)
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
	local toneKey = tone == _lIillIIIl(_1ii1lIli1("\122\138\165\172\184\211",27),237) and _lIillIIIl(_1ii1lIli1("\153\164\191\198\210\237",40),250) or tone == _lIillIIIl(_1ii1lIli1("\198\190\221\231",53),12) and _lIillIIIl(_1ii1lIli1("\224\216\247\1",66),25) or _lIillIIIl(_1ii1lIli1("\236\255\5\28",79),38)
	local key = toneKey .. _lIillIIIl(_1ii1lIli1("\157",92),51) .. tostring(title or "") .. _lIillIIIl(_1ii1lIli1("\183",105),64) .. tostring(msg or "")
	local now = os.clock()
	if RecentNotifs[key] and now - RecentNotifs[key] < 1.1 then return end
	RecentNotifs[key] = now
	NOrder += 1
	dur = dur or 2.8
	local accent = toneKey == _lIillIIIl(_1ii1lIli1("\58\77\83\106",118),77) and T.Accent or TONE[toneKey]
	SFX.Pop()

	local toast = Instance.new(_lIillIIIl(_1ii1lIli1("\49\107\104\130\136",131),90))
	toast.Name = _lIillIIIl(_1ii1lIli1("\83",144),103)
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

	local bar = Instance.new(_lIillIIIl(_1ii1lIli1("\101\159\156\182\188",157),116))
	bar.Parent = toast
	bar.BackgroundColor3 = accent
	bar.BorderSizePixel = 0
	bar.Size = UDim2.new(0, 2, 1, 0)
	bar.ZIndex = 902
	Corner(bar, 2)

	local sc = Instance.new(_lIillIIIl(_1ii1lIli1("\142\144\168\198\210\235\242",170),129)); sc.Scale = 0.9; sc.Parent = toast

	local tt = Instance.new(_lIillIIIl(_1ii1lIli1("\167\198\231\241\215\250\9\26\47",183),142))
	tt.Parent = toast; tt.BackgroundTransparency = 1; tt.Font = FB
	tt.Position = UDim2.new(0, MOBILE and 12 or 16, 0, MOBILE and 4 or 8); tt.Size = UDim2.new(1, -28, 0, MOBILE and 15 or 17)
	tt.Text = string.upper(tostring(title or "")); tt.TextColor3 = T.White; tt.TextSize = MOBILE and 10 or 12
	tt.TextXAlignment = Enum.TextXAlignment.Left; tt.TextTruncate = Enum.TextTruncate.AtEnd; tt.ZIndex = 902

	local bt = Instance.new(_lIillIIIl(_1ii1lIli1("\193\224\1\11\241\20\35\57\78",196),155))
	bt.Parent = toast; bt.BackgroundTransparency = 1; bt.Font = F
	bt.Position = UDim2.new(0, MOBILE and 12 or 16, 0, MOBILE and 19 or 25); bt.Size = UDim2.new(1, -28, 0, MOBILE and 16 or 17)
	bt.Text = tostring(msg or ""); bt.TextColor3 = T.Tx2; bt.TextSize = MOBILE and 10 or 11
	bt.TextXAlignment = Enum.TextXAlignment.Left; bt.TextTruncate = Enum.TextTruncate.AtEnd; bt.ZIndex = 902

	local timer = Instance.new(_lIillIIIl(_1ii1lIli1("\205\7\4\30\36",209),168))
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

local WarnFrame = Instance.new(_lIillIIIl(_1ii1lIli1("\231\33\30\56\67",222),181))
WarnFrame.Name = _lIillIIIl(_1ii1lIli1("\0\55\80\83\108\127\85\142\154\181\197",235),194)
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

local warnBar = Instance.new(_lIillIIIl(_1ii1lIli1("\32\90\87\113\119",248),207))
warnBar.Parent = WarnFrame
warnBar.BackgroundColor3 = Color3.fromRGB(255, 88, 88)
warnBar.BorderSizePixel = 0
warnBar.Size = UDim2.new(0, 3, 1, 0)
warnBar.ZIndex = 891
Corner(warnBar, 2)

local warnScale = Instance.new(_lIillIIIl(_1ii1lIli1("\73\75\99\129\146\171\178",10),220)); warnScale.Parent = WarnFrame

local WarnTxt = Instance.new(_lIillIIIl(_1ii1lIli1("\98\129\167\177\151\186\201\218\239",23),233))
WarnTxt.Parent = WarnFrame; WarnTxt.BackgroundTransparency = 1
WarnTxt.Position = UDim2.new(0, 17, 0, 8); WarnTxt.Size = UDim2.new(1, -95, 0, 18)
WarnTxt.Font = FB; WarnTxt.TextColor3 = Color3.fromRGB(255, 238, 238); WarnTxt.TextSize = 15
WarnTxt.TextXAlignment = Enum.TextXAlignment.Left; WarnTxt.Text = _lIillIIIl(_1ii1lIli1("\114\137\157\160\185\204\161\216\235\238\8\20\30\49\56",36),246); WarnTxt.TextTruncate = Enum.TextTruncate.AtEnd; WarnTxt.ZIndex = 891

local warnPill = Instance.new(_lIillIIIl(_1ii1lIli1("\155\186\219\229\203\238\253\14\35",49),8))
warnPill.Parent = WarnFrame; warnPill.AnchorPoint = Vector2.new(1, 0)
warnPill.Position = UDim2.new(1, -10, 0, 9); warnPill.Size = UDim2.fromOffset(66, 15)
warnPill.BackgroundColor3 = Color3.fromRGB(255, 88, 88); warnPill.BackgroundTransparency = 0.78
warnPill.BorderSizePixel = 0; warnPill.Font = FB; warnPill.TextSize = 8; warnPill.TextColor3 = Color3.fromRGB(255, 150, 150)
warnPill.Text = _lIillIIIl(_1ii1lIli1("\181\183\207\208\218\251",62),21); warnPill.ZIndex = 891
Corner(warnPill, 5)

local WarnSub = Instance.new(_lIillIIIl(_1ii1lIli1("\207\238\15\25\255\34\49\66\87",75),34))
WarnSub.Parent = WarnFrame; WarnSub.BackgroundTransparency = 1
WarnSub.Position = UDim2.new(0, 17, 0, 30); WarnSub.Size = UDim2.new(1, -30, 0, 16)
WarnSub.Font = F; WarnSub.TextColor3 = Color3.fromRGB(220, 177, 179); WarnSub.TextSize = 11
WarnSub.TextXAlignment = Enum.TextXAlignment.Left; WarnSub.Text = _lIillIIIl(_1ii1lIli1("\220\8\37\223\65\74\9\90\116\137\134\161",88),47); WarnSub.ZIndex = 891

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
	WarnSub.Text = _lIillIIIl(_1ii1lIli1("\3\5\29\30\40\73\35\64\78\77",101),60) .. (subText or _lIillIIIl(_1ii1lIli1("\16\60\89\19\117\126\61\142\168\189\186\213\145\174\173\3\18\27\42",114),73))
	WarnFrame.Visible = true
	warnScale.Scale = 0.85
	Tween(warnScale, 0.25, { Scale = 1 }, Enum.EasingStyle.Back):Play()
	if S.WarningSound then snd(_lIillIIIl(_1ii1lIli1("\85\83\119\110\142\156\156\185\188\197\169\172\186\210\216\230\247\8\22\37\49\69\83",127),86), 1, 0.6) end
	task.delay(3.5, function() if warnToken == my then WarnFrame.Visible = false end end)
end

local WW, WH = 920, 590

local Main = Instance.new(_lIillIIIl(_1ii1lIli1("\67\125\122\148\154",140),99))
Main.Name = _lIillIIIl(_1ii1lIli1("\100\134\156\175",153),112)
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
local mainScale = Instance.new(_lIillIIIl(_1ii1lIli1("\134\136\160\190\202\227\234",166),125)); mainScale.Parent = Main
mainScale.Scale = 0.9
if MOBILE then

	local limit = Instance.new(_lIillIIIl(_1ii1lIli1("\160\162\186\222\253\246\226\28\41\60\80\92\89\111\130\150",179),138))
	limit.MaxSize = Vector2.new(540, 430)
	limit.MinSize = Vector2.new(300, 260)
	limit.Parent = Main
end

local TBar = Instance.new(_lIillIIIl(_1ii1lIli1("\171\229\226\252\2",192),151))
TBar.Name = _lIillIIIl(_1ii1lIli1("\211\207\252\27",205),164)
TBar.Parent = Main
TBar.BackgroundTransparency = 1
TBar.Size = UDim2.new(1, 0, 0, M.titleH - 1)
TBar.Position = UDim2.new(0, 0, 0, 1)
TBar.Active = true

local TTitle = Instance.new(_lIillIIIl(_1ii1lIli1("\237\12\45\55\34\69\84\101\122",218),177))
TTitle.Parent = TBar; TTitle.BackgroundTransparency = 1
TTitle.Position = UDim2.new(0, MOBILE and 16 or 18, 0, MOBILE and 12 or 7)
TTitle.Size = UDim2.new(0, 180, 0, MOBILE and 22 or 20)
TTitle.Font = FB; TTitle.Text = _lIillIIIl(_1ii1lIli1("\3\19\25\53\67\83\94\95",231),190); TTitle.TextColor3 = T.White; TTitle.TextSize = 17
TTitle.TextXAlignment = Enum.TextXAlignment.Left

local TSub = Instance.new(_lIillIIIl(_1ii1lIli1("\38\69\102\112\86\121\141\158\179",244),203))
TSub.Parent = TBar; TSub.BackgroundTransparency = 1
TSub.Position = UDim2.new(0, MOBILE and 16 or 18, 0, MOBILE and 31 or 27)
TSub.Size = UDim2.new(0, 180, 0, 15)
TSub.Font = F; TSub.Text = _lIillIIIl(_1ii1lIli1("\52\59\76\87\117\87\135\159\162\178\200\222\226\251\250",6),216); TSub.TextColor3 = T.Tx3; TSub.TextSize = MOBILE and 11 or 12
TSub.TextXAlignment = Enum.TextXAlignment.Left

local UIRegistry = {}
local SearchEmpty
local SearchBox = Instance.new(_lIillIIIl(_1ii1lIli1("\90\121\154\169\133\192\215",19),229))
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
SearchBox.PlaceholderText = _lIillIIIl(_1ii1lIli1("\115\152\162\193\192\211\167\181\195",32),242)
SearchBox.PlaceholderColor3 = T.Tx3
SearchBox.Text = ""
SearchBox.ClearTextOnFocus = false
SearchBox.TextXAlignment = Enum.TextXAlignment.Left
Corner(SearchBox, MOBILE and 10 or 6)
Stroke(SearchBox, T.Bd2, 1, 0.4)
Pad(SearchBox, 0, 0, MOBILE and 14 or 8, MOBILE and 34 or 20)

local ClearSearchBtn = Instance.new(_lIillIIIl(_1ii1lIli1("\147\178\211\221\185\250\7\21\30\43",45),4))
ClearSearchBtn.Parent = SearchBox
ClearSearchBtn.AnchorPoint = Vector2.new(1, 0.5)
ClearSearchBtn.Position = UDim2.new(1, MOBILE and -8 or -3, 0.5, 0)
ClearSearchBtn.Size = UDim2.new(0, MOBILE and 22 or 16, 0, MOBILE and 22 or 16)
ClearSearchBtn.BackgroundTransparency = 1
ClearSearchBtn.Font = FB; ClearSearchBtn.Text = _lIillIIIl(_1ii1lIli1("\209",58),17); ClearSearchBtn.TextColor3 = T.Tx3; ClearSearchBtn.TextSize = 12
ClearSearchBtn.Visible = false
ClearSearchBtn.MouseButton1Click:Connect(function() SearchBox.Text = "" end)

local Pages, activePage = {}, nil
local function applySearch()
	local q = string.lower(SearchBox.Text):gsub(_lIillIIIl(_1ii1lIli1("\209\166\2\200",71),30), ""):gsub(_lIillIIIl(_1ii1lIli1("\178\14\212\219",84),43), "")
	local tokens = {}
	for w in string.gmatch(q, _lIillIIIl(_1ii1lIli1("\204\8\238",97),56)) do table.insert(tokens, w) end
	ClearSearchBtn.Visible = (#tokens > 0)
	local cardVis = {}
	local matches = 0
	for _, e in ipairs(UIRegistry) do
		if e.row and e.row.Parent then
			local vis = true
			if #tokens > 0 then
				local hay = e.label .. _lIillIIIl(_1ii1lIli1("\225",110),69) .. string.lower(e.card and e.card.Name or "")
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
SearchBox:GetPropertyChangedSignal(_lIillIIIl(_1ii1lIli1("\47\78\111\121",123),82)):Connect(applySearch)

local function mkWinBtn(txt, xOff)
	local b = Instance.new(_lIillIIIl(_1ii1lIli1("\73\104\137\147\111\176\189\203\212\225",136),95))
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
local btnClose = mkWinBtn(_lIillIIIl(_1ii1lIli1("\103",149),108), MOBILE and -14 or -16)

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
	RunService:BindToRenderStep(_lIillIIIl(_1ii1lIli1("\121\169\170\198\212\228\239\240\230\22\42\54\59\57\96\108\125\127\154",162),121), Enum.RenderPriority.Last.Value, function()
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

local Body = Instance.new(_lIillIIIl(_1ii1lIli1("\137\195\192\218\224",175),134))
Body.Name = _lIillIIIl(_1ii1lIli1("\159\218\221\0",188),147)
Body.Parent = Main
Body.BackgroundTransparency = 1
Body.Position = UDim2.new(0, 0, 0, M.titleH)

Body.Size = UDim2.new(1, 0, 1, -(M.titleH + (MOBILE and 8 or 32)))

local Sidebar = Instance.new(MOBILE and _lIillIIIl(_1ii1lIli1("\202\232\5\16\27\41\52\76\83\64\122\119\150\156",201),160) or _lIillIIIl(_1ii1lIli1("\215\17\14\40\46",214),173))
Sidebar.Name = _lIillIIIl(_1ii1lIli1("\254\34\43\63\74\87\118",227),186)
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
local SBLayout = Instance.new(_lIillIIIl(_1ii1lIli1("\26\33\50\93\117\132\106\146\184\188\208\221",240),199))
SBLayout.Parent = Sidebar
SBLayout.SortOrder = Enum.SortOrder.LayoutOrder
SBLayout.FillDirection = Enum.FillDirection.Vertical

SBLayout.VerticalAlignment = Enum.VerticalAlignment.Top
SBLayout.HorizontalAlignment = MOBILE and Enum.HorizontalAlignment.Center or Enum.HorizontalAlignment.Left
SBLayout.Padding = UDim.new(0, MOBILE and 6 or 4)

local openAppearance

if not MOBILE then
local ProfileButton = Instance.new(_lIillIIIl(_1ii1lIli1("\56\87\120\130\94\164\177\191\200\213",2),212))
ProfileButton.Name = _lIillIIIl(_1ii1lIli1("\78\126\137\147\164\181\188",15),225)
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
local ProfileAvatar = Instance.new(_lIillIIIl(_1ii1lIli1("\97\152\154\174\186\175\210\225\242\7",28),238))
ProfileAvatar.Name = _lIillIIIl(_1ii1lIli1("\120\187\180\213\208\239",41),0)
ProfileAvatar.Parent = ProfileButton
ProfileAvatar.Position = UDim2.new(0, 8, 0.5, -17)
ProfileAvatar.Size = UDim2.fromOffset(34, 34)
ProfileAvatar.BackgroundTransparency = 1
ProfileAvatar.BorderSizePixel = 0
ProfileAvatar.Image = _lIillIIIl(_1ii1lIli1("\195\193\229\220\252\10\10\39\251\254\12\95\94\127\137\152\163\164\192\138\222\224\180\218\22\24\33\48\82\91\105\116\69\121\163\166\204\198\225\198\238\8\21\227\51\63\70",54),13)
ProfileAvatar.ImageColor3 = Color3.fromRGB(254, 254, 254)
ProfileAvatar.ScaleType = Enum.ScaleType.Crop
ProfileAvatar:SetAttribute(_lIillIIIl(_1ii1lIli1("\190\237\232\9\12\20\19\53\64\86\92\72\130\141\158\175",67),26), true)
Corner(ProfileAvatar, 9999)
Stroke(ProfileAvatar, T.Bd2, 1, 0.4)
task.spawn(function()
	local ok, image = pcall(function()
		return Players:GetUserThumbnailAsync(LP.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
	end)
	if ok and type(image) == _lIillIIIl(_1ii1lIli1("\248\7\19\24\43\50",80),39) and image ~= "" and ProfileAvatar.Parent then
		ProfileAvatar.Image = image
	end
end)
local ProfileTitle = Instance.new(_lIillIIIl(_1ii1lIli1("\243\18\51\61\35\70\85\102\123",93),52))
ProfileTitle.Parent = ProfileButton; ProfileTitle.BackgroundTransparency = 1
ProfileTitle.Position = UDim2.new(0, 49, 0.5, -13); ProfileTitle.Size = UDim2.new(1, -56, 0, 15)
ProfileTitle.Font = FM; ProfileTitle.TextSize = 12; ProfileTitle.TextColor3 = T.Tx
ProfileTitle.TextXAlignment = Enum.TextXAlignment.Left; ProfileTitle.TextTruncate = Enum.TextTruncate.AtEnd
ProfileTitle.Text = LP.DisplayName
local ProfileSub = Instance.new(_lIillIIIl(_1ii1lIli1("\13\44\77\87\61\96\111\128\149",106),65))
ProfileSub.Parent = ProfileButton; ProfileSub.BackgroundTransparency = 1
ProfileSub.Position = UDim2.new(0, 49, 0.5, 2); ProfileSub.Size = UDim2.new(1, -56, 0, 11)
ProfileSub.Font = F; ProfileSub.TextSize = 10; ProfileSub.TextColor3 = T.Tx3
ProfileSub.TextXAlignment = Enum.TextXAlignment.Left; ProfileSub.TextTruncate = Enum.TextTruncate.AtEnd
ProfileSub.Text = _lIillIIIl(_1ii1lIli1("\19",119),78) .. tostring(LP.Name)
ProfileButton.MouseEnter:Connect(function() Tween(ProfileButton, 0.14, { BackgroundColor3 = T.Hover }):Play() end)
ProfileButton.MouseLeave:Connect(function() Tween(ProfileButton, 0.14, { BackgroundColor3 = T.Card }):Play() end)
ProfileButton.MouseButton1Click:Connect(function() if openAppearance then openAppearance() end end)
end

local SBLine = Instance.new(_lIillIIIl(_1ii1lIli1("\51\109\106\132\138",132),91))
SBLine.Name = _lIillIIIl(_1ii1lIli1("\90\87\111\154\173\178",145),104)
SBLine.Parent = Body
SBLine.BackgroundColor3 = T.Bd
SBLine.BorderSizePixel = 0
SBLine.Position = UDim2.new(0, 157, 0, 8)
SBLine.Size = UDim2.new(0, 1, 1, -24)
SBLine.Visible = not MOBILE
Corner(SBLine, 1)

local ContentArea = Instance.new(_lIillIIIl(_1ii1lIli1("\116\146\175\186\197\211\222\241\248\229\31\28\54\65",158),117))
ContentArea.Name = _lIillIIIl(_1ii1lIli1("\126\184\197\217\216\239\3",171),130)
ContentArea.Parent = Body
ContentArea.BackgroundTransparency = 1
ContentArea.BorderSizePixel = 0

ContentArea.Position = MOBILE and UDim2.new(0, M.railW + 12, 0, 0) or UDim2.new(0, 164, 0, 0)
ContentArea.Size = MOBILE and UDim2.new(1, -(M.railW + 18), 1, 0) or UDim2.new(1, -172, 1, 0)
ContentArea.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentArea.AutomaticCanvasSize = Enum.AutomaticSize.Y
ContentArea.ScrollBarThickness = MOBILE and 0 or 3
ContentArea.ScrollBarImageColor3 = T.Tx3

SearchEmpty = Instance.new(_lIillIIIl(_1ii1lIli1("\169\200\233\243\217\252\11\28\49",184),143))
SearchEmpty.Name = _lIillIIIl(_1ii1lIli1("\194\226\236\11\10\29\8\67\84\102\121",197),156)
SearchEmpty.Parent = Main
SearchEmpty.BackgroundTransparency = 1
SearchEmpty.Position = UDim2.new(0, MOBILE and (M.railW + 12) or 164, 0, M.titleH)
SearchEmpty.Size = MOBILE and UDim2.new(1, -(M.railW + 18), 1, -(M.titleH + 8)) or UDim2.new(1, -172, 1, -83)
SearchEmpty.Font = FM; SearchEmpty.TextSize = 14; SearchEmpty.TextColor3 = T.Tx3
SearchEmpty.TextXAlignment = Enum.TextXAlignment.Center; SearchEmpty.TextYAlignment = Enum.TextYAlignment.Center
SearchEmpty.Text = _lIillIIIl(_1ii1lIli1("\215\6\197\32\34\72\69\88\103\122\129\77\161\190\197\200\231\234\254\11\30",210),169)
SearchEmpty.Visible = false
SearchEmpty.ZIndex = 20

local Footer = Instance.new(_lIillIIIl(_1ii1lIli1("\233\35\32\63\69",223),182))
Footer.Parent = Main
Footer.BackgroundColor3 = T.Sidebar
Footer.BorderSizePixel = 0
Footer.AnchorPoint = Vector2.new(0, 1)
Footer.Position = UDim2.new(0, 0, 1, 0)
Footer.Size = UDim2.new(1, 0, 0, 32)
Footer.Visible = not MOBILE
Corner(Footer, 14)

local FootLeft = Instance.new(_lIillIIIl(_1ii1lIli1("\17\48\86\96\70\105\120\142\163",236),195))
FootLeft.Parent = Footer; FootLeft.BackgroundTransparency = 1
FootLeft.Position = UDim2.new(0, 16, 0, 0); FootLeft.Size = UDim2.new(0, 200, 1, 0)
FootLeft.Font = FM; FootLeft.Text = _lIillIIIl(_1ii1lIli1("\44\60\61\89\103\119\135\136\113\167\194\189",249),208); FootLeft.TextColor3 = T.Tx3; FootLeft.TextSize = 12
FootLeft.TextXAlignment = Enum.TextXAlignment.Left

local FootMid = Instance.new(_lIillIIIl(_1ii1lIli1("\74\105\138\148\127\162\177\194\215",11),221))
FootMid.Parent = Footer; FootMid.BackgroundTransparency = 1
FootMid.AnchorPoint = Vector2.new(0.5, 0); FootMid.Position = UDim2.new(0.5, 0, 0, 0)
FootMid.Size = UDim2.new(0, 280, 1, 0)
FootMid.Font = FM; FootMid.Text = ""; FootMid.TextColor3 = T.Tx2; FootMid.TextSize = 12

local FootRight = Instance.new(_lIillIIIl(_1ii1lIli1("\100\131\169\179\153\188\203\220\241",24),234))
FootRight.Parent = Footer; FootRight.BackgroundTransparency = 1
FootRight.AnchorPoint = Vector2.new(1, 0); FootRight.Position = UDim2.new(1, -16, 0, 0)
FootRight.Size = UDim2.new(0, 220, 1, 0)
FootRight.Font = F; FootRight.Text = _lIillIIIl(_1ii1lIli1("\120\171\190\190\217\233\163\115\31\65\219\54\60\83\104",37),247); FootRight.TextColor3 = T.Tx3; FootRight.TextSize = 12
FootRight.TextXAlignment = Enum.TextXAlignment.Right

local isMinimized = false

local function mkPage(name)
    local sf = Instance.new(_lIillIIIl(_1ii1lIli1("\143\201\198\224\230",50),9))
    sf.Name = name
    sf.Parent = ContentArea
    sf.BackgroundTransparency = 1
    sf.BorderSizePixel = 0
    sf.Position = UDim2.new(0, 0, 0, 0)
    sf.Size = UDim2.new(1, 0, 1, 0)
    sf.AutomaticSize = Enum.AutomaticSize.None
    sf.Visible = false

    local hdr = Instance.new(_lIillIIIl(_1ii1lIli1("\183\214\247\1\231\10\25\42\63",63),22))
    hdr.Name = _lIillIIIl(_1ii1lIli1("\208\240\250\25\24\43\25\67\95",76),35)
    hdr.Parent = sf
    hdr.LayoutOrder = -1
    hdr.BackgroundColor3 = T.Elev; pcall(function() hdr:SetAttribute(_lIillIIIl(_1ii1lIli1("\235\13\24\46\52\32\90\101\118\135\117\160\171\178\186\171\216\232\254\8\33\44\64\76\80\61\119\130\152\169\120",89),48), _lIillIIIl(_1ii1lIli1("\246\43\50\81",102),61)) end)
    hdr.BackgroundTransparency = 0.25
    hdr.BorderSizePixel = 0
    hdr.Size = UDim2.new(1, 0, 0, 24)
    hdr.Font = FB
    hdr.TextSize = 12
    hdr.TextColor3 = T.Tx2; pcall(function() hdr:SetAttribute(_lIillIIIl(_1ii1lIli1("\31\65\76\98\104\84\142\153\170\187\169\212\223\230\238\241\16\49\59\29\87\98\115\132\83",115),74), _lIillIIIl(_1ii1lIli1("\57\107\51",128),87)) end)
    hdr.TextXAlignment = Enum.TextXAlignment.Left
    hdr.Text = string.upper(name)
    hdr.Visible = false
    Corner(hdr, 6)
    Pad(hdr, 0, 0, 10, 10)
    Pages[name] = sf
    return sf
end

local TAB_DEFS = {
	{ name = _lIillIIIl(_1ii1lIli1("\85\118\142\158\152\177\198",141),100), icon = _lIillIIIl(_1ii1lIli1("\126\160\154",154),113) },
	{ name = _lIillIIIl(_1ii1lIli1("\118\176\188\191\204\237",167),126), icon = _lIillIIIl(_1ii1lIli1("\176\205\216\234\248\251\2\24\47",180),139) },
	{ name = _lIillIIIl(_1ii1lIli1("\180\228\247\250\14\27",193),152), icon = _lIillIIIl(_1ii1lIli1("\232\240\18\18\30",206),165) },
	{ name = _lIillIIIl(_1ii1lIli1("\235\21\24\62\61\88",219),178), icon = _lIillIIIl(_1ii1lIli1("\42\54\59\86\31\114\125\145\157\161",232),191) },
	{ name = _lIillIIIl(_1ii1lIli1("\21\87\100\109",245),204), icon = _lIillIIIl(_1ii1lIli1("\80\107\126",7),217) },
	{ name = _lIillIIIl(_1ii1lIli1("\85\127\156\154",20),230), icon = _lIillIIIl(_1ii1lIli1("\153\167\168\191\194\213",33),243) },
	{ name = _lIillIIIl(_1ii1lIli1("\132\190\203\209\226\238",46),5), icon = _lIillIIIl(_1ii1lIli1("\206\206\235\249\252\15\22\48\248\11",59),18) },
}

if MOBILE then table.insert(TAB_DEFS, { name = _lIillIIIl(_1ii1lIli1("\183\248\5\19\28\41\60",72),31), icon = _lIillIIIl(_1ii1lIli1("\2\2\31\45\48\67\74\100\44\63",85),44) }) end

local SBItems = {}

local function mkSBItem(name, iconKind, page, order)
	local btn = Instance.new(_lIillIIIl(_1ii1lIli1("\253\28\61\71\35\100\113\127\136\149",98),57))
	btn.Name = _lIillIIIl(_1ii1lIli1("\23\50\65\76",111),70) .. name
	btn.Parent = Sidebar
	btn.LayoutOrder = order

	btn.Size = MOBILE and UDim2.new(0, M.railW - 12, 0, M.railItemH) or UDim2.new(1, 0, 0, 34)
	btn.AutoButtonColor = false
	btn.BackgroundTransparency = 1
	btn.BorderSizePixel = 0
	btn.Text = ""
	Corner(btn, MOBILE and 12 or 8)

	local barInd = Instance.new(_lIillIIIl(_1ii1lIli1("\35\93\90\116\122",124),83))
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
	local label = Instance.new(_lIillIIIl(_1ii1lIli1("\75\106\139\149\123\158\173\190\211",137),96))
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
	local card = Instance.new(_lIillIIIl(_1ii1lIli1("\87\145\142\168\174",150),109))
	card.Name = _lIillIIIl(_1ii1lIli1("\124\174\176\184\206\196\243\238\15\30\42",163),122); card.Parent = Sidebar; card.LayoutOrder = 100
	card.Size = UDim2.new(1, 0, 0, 94); card.BackgroundColor3 = T.Card; card.BorderSizePixel = 0
	Corner(card, 9); Stroke(card, T.Bd2, 1, 0.28)
	local quickGradient = Grad(card, T.White:Lerp(T.Accent, 0.16), T.White:Lerp(T.Elev, 0.08), 90)
	quickGradient.Name = _lIillIIIl(_1ii1lIli1("\150\200\202\210\232\222\13\8\41\56\73\43\100\97\114\133\148\171\191",176),135)
	local headMark = Instance.new(_lIillIIIl(_1ii1lIli1("\165\223\220\246\252",189),148))
	headMark.Parent = card; headMark.Position = UDim2.fromOffset(9, 7); headMark.Size = UDim2.fromOffset(2, 11)
	headMark.BackgroundColor3 = T.Accent; headMark.BorderSizePixel = 0; Corner(headMark, 2)
	local heading = Instance.new(_lIillIIIl(_1ii1lIli1("\205\236\13\23\253\32\52\69\90",202),161))
	heading.Parent = card; heading.BackgroundTransparency = 1
	heading.Position = UDim2.fromOffset(17, 4); heading.Size = UDim2.new(1, -35, 0, 18)
	heading.Font = FB; heading.TextSize = 10; heading.TextColor3 = T.Tx2
	heading.TextXAlignment = Enum.TextXAlignment.Left; heading.Text = _lIillIIIl(_1ii1lIli1("\228\246\248\0\22\254\63\78\73\106\126\138",215),174)
	local stateDot = Instance.new(_lIillIIIl(_1ii1lIli1("\243\45\42\73\79",228),187))
	stateDot.Parent = card; stateDot.AnchorPoint = Vector2.new(1, 0.5)
	stateDot.Position = UDim2.new(1, -9, 0, 13); stateDot.Size = UDim2.fromOffset(5, 5)
	stateDot.BackgroundColor3 = T.Accent; stateDot.BorderSizePixel = 0; Corner(stateDot, 5)
	local divider = Instance.new(_lIillIIIl(_1ii1lIli1("\13\76\73\99\105",241),200))
	divider.Parent = card; divider.Position = UDim2.fromOffset(9, 25); divider.Size = UDim2.new(1, -18, 0, 1)
	divider.BackgroundColor3 = T.Bd; divider.BackgroundTransparency = 0.48; divider.BorderSizePixel = 0
	local body = Instance.new(_lIillIIIl(_1ii1lIli1("\44\102\99\125\131",3),213))
	body.Parent = card; body.BackgroundTransparency = 1
	body.Position = UDim2.fromOffset(0, 27); body.Size = UDim2.new(1, 0, 1, -29)
	local function statusRow(keyText, index)
		local row = Instance.new(_lIillIIIl(_1ii1lIli1("\70\128\125\156\162",16),226))
		row.Parent = body; row.BackgroundTransparency = 1
		row.Position = UDim2.new(0, 9, 0, (index - 1) * 21); row.Size = UDim2.new(1, -18, 0, 21)
		if index > 1 then
			local line = Instance.new(_lIillIIIl(_1ii1lIli1("\96\159\156\182\188",29),239))
			line.Parent = row; line.Size = UDim2.new(1, 0, 0, 1)
			line.BackgroundColor3 = T.Bd; line.BackgroundTransparency = 0.62; line.BorderSizePixel = 0
		end
		local key = Instance.new(_lIillIIIl(_1ii1lIli1("\141\172\205\215\189\224\239\0\21",42),1))
		key.Parent = row; key.BackgroundTransparency = 1; key.Size = UDim2.new(0, 48, 1, 0)
		key.Font = F; key.TextSize = 9; key.TextColor3 = T.Tx4; key.TextXAlignment = Enum.TextXAlignment.Left; key.Text = keyText
		local value = Instance.new(_lIillIIIl(_1ii1lIli1("\167\198\231\241\215\250\9\26\47",55),14))
		value.Parent = row; value.BackgroundTransparency = 1; value.Position = UDim2.fromOffset(48, 0)
		value.Size = UDim2.new(1, -48, 1, 0); value.Font = FM; value.TextSize = 10; value.TextColor3 = T.Tx
		value.TextXAlignment = Enum.TextXAlignment.Right; value.TextTruncate = Enum.TextTruncate.AtEnd; value.Text = _lIillIIIl(_1ii1lIli1("\154\168",68),27)
		return value
	end
	local roomValue = statusRow(_lIillIIIl(_1ii1lIli1("\217\228\242\254",81),40), 1)
	local stateValue = statusRow(_lIillIIIl(_1ii1lIli1("\244\3\254\31\30",94),53), 2)
	local networkValue = statusRow(_lIillIIIl(_1ii1lIli1("\11\18\37\44",107),66), 3)
	task.spawn(function()
		while not S.Destroyed and card.Parent do
			local room = LP:GetAttribute(_lIillIIIl(_1ii1lIli1("\39\82\96\108\91\144\150",120),79)) or LP:GetAttribute(_lIillIIIl(_1ii1lIli1("\50\114\125\139\140\163\183\163\206\220\232",133),92)) or _lIillIIIl(_1ii1lIli1("\54\68",146),105)
			local ping = math.floor((LP:GetNetworkPing() or 0) * 1000 + 0.5)
			local active = S.Ready ~= false
			roomValue.Text = tostring(room)
			stateValue.Text = active and _lIillIIIl(_1ii1lIli1("\100\116\147\150\177\174",159),118) or _lIillIIIl(_1ii1lIli1("\148\140\162\187\190\209\216",172),131)
			stateValue.TextColor3 = active and T.Accent or T.Tx3
			stateDot.BackgroundColor3 = active and T.Accent or T.Tx4
			stateDot.BackgroundTransparency = active and 0 or 0.45
			networkValue.Text = tostring(ping) .. _lIillIIIl(_1ii1lIli1("\119\210\230",185),144)
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
	local panel = Instance.new(_lIillIIIl(_1ii1lIli1("\183\241\238\8\14",198),157))
	panel.Name = _lIillIIIl(_1ii1lIli1("\204\9\23\26\36\72\69\96\99\115\111\148\177\191\194\213\220\246",211),170)
	panel.Parent = SG
	panel.AnchorPoint = Vector2.new(0.5, 0.5)
	panel.Position = UDim2.fromScale(0.5, 0.5)

	panel.Size = MOBILE and UDim2.fromScale(0.9, 0.78) or UDim2.fromOffset(320, 456)
	if MOBILE then
		local limit = Instance.new(_lIillIIIl(_1ii1lIli1("\250\252\20\61\92\85\65\123\136\160\175\187\184\206\225\245",224),183))
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
	local scale = Instance.new(_lIillIIIl(_1ii1lIli1("\20\27\51\81\93\118\125",237),196)); scale.Parent = panel

	local title = Instance.new(_lIillIIIl(_1ii1lIli1("\50\81\114\124\98\138\153\170\191",250),209))
	title.Parent = panel; title.BackgroundTransparency = 1
	title.Position = UDim2.fromOffset(16, 12); title.Size = UDim2.new(1, -58, 0, 24)
	title.Font = FB; title.TextSize = 15; title.TextColor3 = T.White
	title.TextXAlignment = Enum.TextXAlignment.Left; title.Text = _lIillIIIl(_1ii1lIli1("\65\84\104\103\135\137\146\162\178",12),222)
	local subtitle = Instance.new(_lIillIIIl(_1ii1lIli1("\102\133\171\181\155\190\205\222\243",25),235))
	subtitle.Parent = panel; subtitle.BackgroundTransparency = 1
	subtitle.Position = UDim2.fromOffset(16, 34); subtitle.Size = UDim2.new(1, -32, 0, 18)
	subtitle.Font = F; subtitle.TextSize = 10; subtitle.TextColor3 = T.Tx3
	subtitle.TextXAlignment = Enum.TextXAlignment.Left; subtitle.Text = _lIillIIIl(_1ii1lIli1("\133\167\178\200\206\163\165\219\246\243\221\62\60\72\97\104\61\63\159\160\170\187\198\213\234\251\6\31\50\231\59\86\90\36\128\143\167\170\181\198\206\218\251\254\18\31\50",38),248)

	local close = Instance.new(_lIillIIIl(_1ii1lIli1("\159\190\223\233\197\6\19\33\42\55",51),10))
	close.Parent = panel; close.AnchorPoint = Vector2.new(1, 0)
	close.Position = UDim2.new(1, -12, 0, 12); close.Size = UDim2.fromOffset(MOBILE and 36 or 26, MOBILE and 36 or 26)
	close.BackgroundColor3 = T.Elev; close.BorderSizePixel = 0; close.AutoButtonColor = false
	close.Font = FM; close.TextSize = MOBILE and 22 or 18; close.TextColor3 = T.Tx2; close.Text = _lIillIIIl(_1ii1lIli1("\40\10",64),23); close.ZIndex = 1502
	Corner(close, MOBILE and 10 or 7); Stroke(close, T.Bd2, 1, 0.4)

	local body = Instance.new(_lIillIIIl(_1ii1lIli1("\210\240\13\24\35\49\60\79\86\67\125\122\148\154",77),36))
	body.Parent = panel; body.BackgroundTransparency = 1; body.BorderSizePixel = 0
	body.Position = UDim2.fromOffset(14, 62); body.Size = UDim2.new(1, -28, 1, -76)
	body.CanvasSize = UDim2.new()
	body.AutomaticCanvasSize = Enum.AutomaticSize.Y
	body.ScrollBarThickness = MOBILE and 0 or 3
	body.ScrollBarImageColor3 = T.Tx3
	local layout = Instance.new(_lIillIIIl(_1ii1lIli1("\238\240\1\44\68\83\57\92\130\134\154\167",90),49))
	layout.Parent = body; layout.SortOrder = Enum.SortOrder.LayoutOrder; layout.Padding = UDim.new(0, MOBILE and 10 or 8)
	local choiceRefreshers = {}

	local function makeChoice(labelText, values, getValue, onValue, order, display)
		local row = Instance.new(_lIillIIIl(_1ii1lIli1("\249\51\48\74\80",103),62))
		row.Parent = body; row.LayoutOrder = order; row.Size = UDim2.new(1, 0, 0, MOBILE and 68 or 52)
		row.BackgroundColor3 = T.BG; row.BorderSizePixel = 0
		Corner(row, 9); Stroke(row, T.Bd2, 1, 0.42)
		local label = Instance.new(_lIillIIIl(_1ii1lIli1("\33\64\97\107\81\116\131\148\169",116),75))
		label.Parent = row; label.BackgroundTransparency = 1
		label.Position = UDim2.fromOffset(10, MOBILE and 7 or 5); label.Size = UDim2.new(1, -20, 0, 17)
		label.Font = F; label.TextSize = MOBILE and 11 or 10; label.TextColor3 = T.Tx3
		label.TextXAlignment = Enum.TextXAlignment.Left; label.Text = labelText
		local button = Instance.new(_lIillIIIl(_1ii1lIli1("\59\90\123\133\97\162\175\189\198\211",129),88))
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
	makeChoice(_lIillIIIl(_1ii1lIli1("\85\84\117\127\89\154\158\189\182",142),101), textValues, function() return S.UITextScale end, function(value)
		UIStyle:ApplyTextScale(value)
	end, 1, function(value) return value == 0.88 and _lIillIIIl(_1ii1lIli1("\110\150\152\177\191",155),114) or (value == 1.18 and _lIillIIIl(_1ii1lIli1("\129\164\195\198\210",168),127) or _lIillIIIl(_1ii1lIli1("\157\204\221\230\232\1",181),140)) end)
	makeChoice(_lIillIIIl(_1ii1lIli1("\177\204\201\179\244\248\23\16",194),153), { 0.8, 0.9, 1, 1.15, 1.3 }, function()
		return S.HUDScale
	end, function(value)
		UIStyle:ApplyHUDScale(value)
	end, 2, function(value) return tostring(math.floor(value * 100 + 0.5)) .. _lIillIIIl(_1ii1lIli1("\168",207),166) end)
	makeChoice(_lIillIIIl(_1ii1lIli1("\235\250\13\16\32\49\57\69\102\105\130\143\111\173\186\204\208\233\236\0\13",220),179), { _lIillIIIl(_1ii1lIli1("\11\52\72\6\70\107\119\134\165",233),192), _lIillIIIl(_1ii1lIli1("\24\83\102\116\125\137\79\143\180\192\207\233",246),205), _lIillIIIl(_1ii1lIli1("\50\109\128\142\156\168\105\154\202\225\245\244\15",8),218), _lIillIIIl(_1ii1lIli1("\76\135\159\173\182\194\131\189\228\243\15",21),231), _lIillIIIl(_1ii1lIli1("\125\166\181\115\173\212\227\255",34),244), _lIillIIIl(_1ii1lIli1("\151\192\207\141\190\238\5\25\24\51",47),6) }, function()
		return S.NotificationPosition
	end, function(value)
		UIStyle:PlaceNotifications(value)
	end, 3)
	local themeCard = Instance.new(_lIillIIIl(_1ii1lIli1("\163\221\218\244\250",60),19))
	themeCard.Parent = body; themeCard.LayoutOrder = 4; themeCard.Size = UDim2.new(1, 0, 0, MOBILE and 216 or 150)
	themeCard.BackgroundColor3 = T.BG; themeCard.BorderSizePixel = 0
	Corner(themeCard, 9); Stroke(themeCard, T.Bd2, 1, 0.42)
	local themeTitle = Instance.new(_lIillIIIl(_1ii1lIli1("\203\234\11\21\251\30\45\62\83",73),32))
	themeTitle.Parent = themeCard; themeTitle.BackgroundTransparency = 1
	themeTitle.Position = UDim2.fromOffset(10, 5); themeTitle.Size = UDim2.new(1, -20, 0, 17)
	themeTitle.Font = F; themeTitle.TextSize = 10; themeTitle.TextColor3 = T.Tx3
	themeTitle.TextXAlignment = Enum.TextXAlignment.Left; themeTitle.Text = _lIillIIIl(_1ii1lIli1("\229\231\242\8\14",86),45)
	local gridHost = Instance.new(_lIillIIIl(_1ii1lIli1("\241\43\40\66\72",99),58))
	gridHost.Parent = themeCard; gridHost.BackgroundTransparency = 1
	gridHost.Position = UDim2.fromOffset(8, 26); gridHost.Size = UDim2.new(1, -16, 1, -34)
	local grid = Instance.new(_lIillIIIl(_1ii1lIli1("\26\28\40\97\102\111\101\136\174\178\198\211",112),71))
	grid.Parent = gridHost; grid.CellSize = UDim2.new(0.5, -3, 0, MOBILE and 34 or 20); grid.CellPadding = UDim2.fromOffset(6, MOBILE and 6 or 4)
	grid.FillDirectionMaxCells = 2; grid.SortOrder = Enum.SortOrder.LayoutOrder
	local themeButtons = {}
	local themeNames = { _lIillIIIl(_1ii1lIli1("\35\82\97\106\140\145\167",125),84), _lIillIIIl(_1ii1lIli1("\64\121\118\147\153\168\193\192",138),97), _lIillIIIl(_1ii1lIli1("\98\132\148\158\185",151),110), _lIillIIIl(_1ii1lIli1("\115\170\187\188\216\231",164),123), _lIillIIIl(_1ii1lIli1("\158\190\209\214",177),136), _lIillIIIl(_1ii1lIli1("\183\216\236\247\254\27",190),149), _lIillIIIl(_1ii1lIli1("\192\246\249\10\37",203),162), _lIillIIIl(_1ii1lIli1("\214\16\19\36\68",216),175), _lIillIIIl(_1ii1lIli1("\1\44\62\67",229),188) }
	local function refreshThemes()
		for name, button in pairs(themeButtons) do
			local selected = name == S.UITheme
			button.BackgroundColor3 = selected and T.ActiveBg or T.Elev
			button.TextColor3 = selected and T.White or T.Tx2
		end
	end
	for index, name in ipairs(themeNames) do
		local button = Instance.new(_lIillIIIl(_1ii1lIli1("\29\65\98\108\72\137\150\169\178\191",242),201))
		button.Parent = gridHost; button.LayoutOrder = index; button.AutoButtonColor = false
		button.BackgroundColor3 = T.Elev; button.BorderSizePixel = 0
		button.Font = FM; button.TextSize = MOBILE and 13 or 10; button.TextColor3 = T.Tx2; button.Text = name
		Corner(button, MOBILE and 9 or 6); Stroke(button, T.Bd2, 1, 0.48)
		local dot = Instance.new(_lIillIIIl(_1ii1lIli1("\46\104\101\127\133",4),214))
		dot.Parent = button; dot.AnchorPoint = Vector2.new(1, 0.5); dot.Position = UDim2.new(1, -7, 0.5, 0)
		dot.Size = UDim2.fromOffset(7, 7); dot.BackgroundColor3 = THEMES[name].Accent; dot.BorderSizePixel = 0; Corner(dot, 99)
		dot:SetAttribute(_lIillIIIl(_1ii1lIli1("\85\132\127\165\168\176\175\209\220\242\248\228\30\41\58\75",17),227), true)
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

	local executor = Instance.new(_lIillIIIl(_1ii1lIli1("\112\148\181\191\165\200\215\232\253",30),240))
	executor.Parent = body; executor.LayoutOrder = 5; executor.Size = UDim2.new(1, 0, 0, 28)
	executor.BackgroundColor3 = T.BG; executor.BorderSizePixel = 0
	executor.Font = F; executor.TextSize = 10; executor.TextColor3 = T.Tx2
	executor.TextXAlignment = Enum.TextXAlignment.Left
	local executorName = _lIillIIIl(_1ii1lIli1("\144\183\194\211\226\248\253\189\16\49\44\56\88\101\110\127",43),2)
	pcall(function() if identifyexecutor then executorName = tostring(identifyexecutor()) end end)
	executor.Text = _lIillIIIl(_1ii1lIli1("\117\131\145\196\229\224\236\12\25\34\51\15\29\43",56),15) .. executorName
	Corner(executor, 8); Stroke(executor, T.Bd2, 1, 0.44)
	for _, object in ipairs(panel:GetDescendants()) do if object:IsA(_lIillIIIl(_1ii1lIli1("\182\242\244\232\9\31\40\52\83",69),28)) then object.ZIndex = math.max(object.ZIndex, 1501) end end

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

local BindPrompt = Instance.new(_lIillIIIl(_1ii1lIli1("\207\9\6\32\38",82),41))
BindPrompt.Name = _lIillIIIl(_1ii1lIli1("\243\35\36\64\78\94\105\106\85\138\157\161\142\186\215\233\248\3\4",95),54)
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

local BindPromptTitle = Instance.new(_lIillIIIl(_1ii1lIli1("\17\48\81\91\65\100\115\132\153",108),67))
BindPromptTitle.Parent = BindPrompt; BindPromptTitle.BackgroundTransparency = 1
BindPromptTitle.Position = UDim2.fromOffset(12, 7); BindPromptTitle.Size = UDim2.new(1, -24, 0, 15)
BindPromptTitle.Font = FB; BindPromptTitle.TextSize = 11; BindPromptTitle.TextColor3 = T.White
BindPromptTitle.TextXAlignment = Enum.TextXAlignment.Left; BindPromptTitle.ZIndex = 981

local BindPromptSub = Instance.new(_lIillIIIl(_1ii1lIli1("\43\74\107\117\91\126\141\158\179",121),80))
BindPromptSub.Parent = BindPrompt; BindPromptSub.BackgroundTransparency = 1
BindPromptSub.Position = UDim2.fromOffset(12, 24); BindPromptSub.Size = UDim2.new(1, -24, 0, 15)
BindPromptSub.Font = F; BindPromptSub.TextSize = 11; BindPromptSub.TextColor3 = T.Tx2
BindPromptSub.TextXAlignment = Enum.TextXAlignment.Left; BindPromptSub.Text = _lIillIIIl(_1ii1lIli1("\65\113\114\142\156\87\166\115\204\212\246\171\8\25\213\48\69\89\101\101\46\126\164\177\191\200\213\149\101\17\51\205\0\60\58\5\86\109\116\126\157\172",134),93)
BindPromptSub.ZIndex = 981

local function bindTokenFromInput(input)
	if input.KeyCode and input.KeyCode ~= Enum.KeyCode.Unknown then
		if input.KeyCode == S.MenuKeybind then return nil end
		return _lIillIIIl(_1ii1lIli1("\118\126\160\111",147),106) .. input.KeyCode.Name
	end
	local kind = input.UserInputType
	if kind == Enum.UserInputType.MouseButton1 or kind == Enum.UserInputType.MouseButton2
		or kind == Enum.UserInputType.MouseButton3 then
		return _lIillIIIl(_1ii1lIli1("\146\162\182\194\194\165",160),119) .. kind.Name
	end
	return nil
end

local function bindTokenTitle(token)
	if type(token) ~= _lIillIIIl(_1ii1lIli1("\178\193\205\210\229\236",173),132) then return _lIillIIIl(_1ii1lIli1("\59\231\9",186),145) end
	local kind, value = token:match(_lIillIIIl(_1ii1lIli1("\209\169\180\254\214\226\1\2\22\33\45\54",199),158))
	if not kind or not value then return _lIillIIIl(_1ii1lIli1("\111\27\61",212),171) end
	local pretty = {
		LeftControl = _lIillIIIl(_1ii1lIli1("\243\248\23\40\48",225),184), RightControl = _lIillIIIl(_1ii1lIli1("\19\23\54\66\74",238),197), LeftShift = _lIillIIIl(_1ii1lIli1("\44\65\68\83\94\127",0),210), RightShift = _lIillIIIl(_1ii1lIli1("\76\91\94\114\125\153",13),223),
		LeftAlt = _lIillIIIl(_1ii1lIli1("\96\99\129\151",26),236), RightAlt = _lIillIIIl(_1ii1lIli1("\133\130\155\177",39),249), MouseButton1 = _lIillIIIl(_1ii1lIli1("\154\140",52),11), MouseButton2 = _lIillIIIl(_1ii1lIli1("\180\167",65),24), MouseButton3 = _lIillIIIl(_1ii1lIli1("\206\194",78),37),
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
	S.Keybinds = type(S.Keybinds) == _lIillIIIl(_1ii1lIli1("\15\10\25\49\56",91),50) and S.Keybinds or {}
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
	if type(map) == _lIillIIIl(_1ii1lIli1("\41\36\51\75\82",104),63) then
		for id, token in pairs(map) do
			if BindRegistry[id] and type(token) == _lIillIIIl(_1ii1lIli1("\66\81\93\98\117\124",117),76) then S.Keybinds[id] = token end
		end
	end
	for id in pairs(BindRegistry) do refreshBindChips(id) end
	markKeybindHUDDirty()
end
S._applyKeybindMap = applyKeybindMap

local function clearAllKeybinds()
	applyKeybindMap({})
	if RequestAutoSave then RequestAutoSave() end
	Notify(_lIillIIIl(_1ii1lIli1("\52\92\126\117\138\157\161\190",130),89), _lIillIIIl(_1ii1lIli1("\68\125\139\77\157\178\197\201\230\161\242\9\16\26\57\63\76",143),102), 1.8, _lIillIIIl(_1ii1lIli1("\134\153\159\182",156),115))
end
S._clearAllKeybinds = clearAllKeybinds

local function startBindCapture(id)
	local entry = BindRegistry[id]
	if not entry then return end
	BindCapture.target = id

	BindCapture.readyAt = os.clock() + 0.12
	BindPromptTitle.Text = _lIillIIIl(_1ii1lIli1("\121\142\161\165\143\172\186\185",169),128) .. string.upper(entry.label)
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
		Notify(_lIillIIIl(_1ii1lIli1("\156\196\230\221\242\5\9",182),141), entry.label .. _lIillIIIl(_1ii1lIli1("\139\91\13\39\195",195),154) .. bindTokenTitle(token), 1.8, _lIillIIIl(_1ii1lIli1("\248\8\4\18\34\62\81",208),167))
	else
		Notify(_lIillIIIl(_1ii1lIli1("\234\18\52\43\69\88\92",221),180), entry.label .. _lIillIIIl(_1ii1lIli1("\217\42\70\77\87\118\119\132",234),193), 1.6, _lIillIIIl(_1ii1lIli1("\65\84\90\113",247),206))
	end
end

local function registerBindable(id, label, trigger, isActive, kind)
	BindRegistry[id] = { label = label, trigger = trigger, isActive = isActive, kind = kind, chips = {} }
	return id
end
S._registerBindable = registerBindable

local function requestBindFromRightClick(target, id)
	target.Active = true
	target:SetAttribute(_lIillIIIl(_1ii1lIli1("\66\114\115\143\162\178\189\190\169\222\241\245\232\17",9),219), id)
end
S._requestBindFromRightClick = requestBindFromRightClick

local function bindTargetAt(position)
	local ok, hits = pcall(function()
		local root = SG.Parent
		if root and type(root.GetGuiObjectsAtPosition) == _lIillIIIl(_1ii1lIli1("\114\143\155\158\189\192\212\225",22),232) then
			return root:GetGuiObjectsAtPosition(position.X, position.Y)
		end
		local pg = LP:FindFirstChildOfClass(_lIillIIIl(_1ii1lIli1("\123\165\168\206\200\227\198\2\4",35),245))
		return pg and pg:GetGuiObjectsAtPosition(position.X, position.Y) or {}
	end)
	if not ok or type(hits) ~= _lIillIIIl(_1ii1lIli1("\185\180\195\219\226",48),7) then return nil end
	for _, hit in ipairs(hits) do
		local node = hit
		while node and node ~= SG do
			local id = node:GetAttribute(_lIillIIIl(_1ii1lIli1("\175\223\224\252\10\26\37\38\17\70\89\93\80\121",61),20))
			if id and BindRegistry[id] then return id end
			node = node.Parent
		end
	end
	return nil
end

local function addBindChip(parent, id, rightOffset)
	local chip = Instance.new(_lIillIIIl(_1ii1lIli1("\205\236\13\23\243\52\65\79\88\101",74),33))
	chip.Name = (MOBILE and _lIillIIIl(_1ii1lIli1("\217\13\30\30\63\56",87),46) or _lIillIIIl(_1ii1lIli1("\239\36\55\59\68",100),59)) .. id
	chip.Parent = parent
	chip.AnchorPoint = Vector2.new(1, 0.5)
	chip.Position = UDim2.new(1, rightOffset or -52, 0.5, 0)
	chip.Size = UDim2.fromOffset(MOBILE and 42 or 48, MOBILE and 26 or 20)
	chip.BackgroundColor3 = T.Elev
	chip.BorderSizePixel = 0
	chip.AutoButtonColor = false
	chip.Font = FM; chip.TextSize = 10; chip.TextColor3 = T.Tx2
	chip.Text = MOBILE and _lIillIIIl(_1ii1lIli1("\9\41\49",113),72) or bindTokenTitle(S.Keybinds[id])
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
	local FloatHost = Instance.new(_lIillIIIl(_1ii1lIli1("\39\97\94\120\126",126),85))
	FloatHost.Name = _lIillIIIl(_1ii1lIli1("\65\117\134\134\167\170\189\196\173\238\251\9\18\31\50",139),98)
	FloatHost.Parent = SG
	FloatHost.BackgroundTransparency = 1
	FloatHost.Size = UDim2.fromScale(1, 1)

	FloatHost.ZIndex = 0
	FloatHost.Visible = MOBILE
	S._floatHost = FloatHost

	local Buttons = {}
	local spawnIndex = 0

	local FLOAT_ICON_RULES = {
		{ _lIillIIIl(_1ii1lIli1("\130\136\159\180",152),111), _lIillIIIl(_1ii1lIli1("\162\162\191\205\208\227\234\4\204\223",165),124) },
		{ _lIillIIIl(_1ii1lIli1("\174\202\213",178),137), _lIillIIIl(_1ii1lIli1("\200\234\228",191),150) },
		{ _lIillIIIl(_1ii1lIli1("\224\243\250\20",204),163), _lIillIIIl(_1ii1lIli1("\252\30\24",217),176) },
		{ _lIillIIIl(_1ii1lIli1("\39\40\69\85\79\104",230),189), _lIillIIIl(_1ii1lIli1("\48\87\81",243),202) },
		{ _lIillIIIl(_1ii1lIli1("\94\106\103\119\135\167",5),215), _lIillIIIl(_1ii1lIli1("\105\139\133",18),228) },
		{ _lIillIIIl(_1ii1lIli1("\144\146\163\174\205",31),241), _lIillIIIl(_1ii1lIli1("\162\196\190",44),3) },
		{ _lIillIIIl(_1ii1lIli1("\184\206\224",57),16), _lIillIIIl(_1ii1lIli1("\212\241\252\14\28\31\38\60\83",70),29) },
		{ _lIillIIIl(_1ii1lIli1("\246\2\19\33",83),42), _lIillIIIl(_1ii1lIli1("\8\37\48\66\80\83\90\112\135",96),55) },
		{ _lIillIIIl(_1ii1lIli1("\54\46\77\87",109),68), _lIillIIIl(_1ii1lIli1("\60\89\100\118\132\135\142\164\187",122),81) },
		{ _lIillIIIl(_1ii1lIli1("\88\111\131\134\159\178",135),94), _lIillIIIl(_1ii1lIli1("\112\141\152\170\184\187\194\216\239",148),107) },
		{ _lIillIIIl(_1ii1lIli1("\141\161\188",161),120), _lIillIIIl(_1ii1lIli1("\168\176\210\210\222",174),133) },
		{ _lIillIIIl(_1ii1lIli1("\206\217\220\234\247",187),146), _lIillIIIl(_1ii1lIli1("\220\228\6\6\18",200),159) },
		{ _lIillIIIl(_1ii1lIli1("\249\18\24\41",213),172), _lIillIIIl(_1ii1lIli1("\16\24\58\63\75",226),185) },
		{ _lIillIIIl(_1ii1lIli1("\58\55\80\93",239),198), _lIillIIIl(_1ii1lIli1("\73\81\115\115\127",1),211) },
		{ _lIillIIIl(_1ii1lIli1("\106\121\123\151\162\183",14),224), _lIillIIIl(_1ii1lIli1("\125\138\172\172\184",27),237) },
		{ _lIillIIIl(_1ii1lIli1("\168\186\186\204",40),250), _lIillIIIl(_1ii1lIli1("\182\190\224\224\236",53),12) },
		{ _lIillIIIl(_1ii1lIli1("\220\231\247\252\15\35",66),25), _lIillIIIl(_1ii1lIli1("\234\242\20\20\32",79),38) },
		{ _lIillIIIl(_1ii1lIli1("\254\32\45\54",92),51), _lIillIIIl(_1ii1lIli1("\25\52\71",105),64) },
		{ _lIillIIIl(_1ii1lIli1("\55\64\95\104",118),77), _lIillIIIl(_1ii1lIli1("\77\104\123",131),90) },
		{ _lIillIIIl(_1ii1lIli1("\104\130\141\155\162\174\205",144),103), _lIillIIIl(_1ii1lIli1("\129\156\175",157),116) },
		{ _lIillIIIl(_1ii1lIli1("\157\182\196\213",170),129), _lIillIIIl(_1ii1lIli1("\181\208\227",183),142) },
		{ _lIillIIIl(_1ii1lIli1("\221\231\234\16\10\37",196),155), _lIillIIIl(_1ii1lIli1("\252\8\8\35\236\68\79\99\106\110",209),168) },
		{ _lIillIIIl(_1ii1lIli1("\16\39\54\50\67\90",222),181), _lIillIIIl(_1ii1lIli1("\48\60\65\92\37\120\131\151\163\167",235),194) },
		{ _lIillIIIl(_1ii1lIli1("\66\77\87\112",248),207), _lIillIIIl(_1ii1lIli1("\105\117\117\144\94\177\188\208\215\219",10),220) },
		{ _lIillIIIl(_1ii1lIli1("\113\139\157\163\180\192",23),233), _lIillIIIl(_1ii1lIli1("\160\160\189\203\206\225\232\2\202\221",36),246) },
		{ _lIillIIIl(_1ii1lIli1("\186\186\215\229\232\251\2",49),8), _lIillIIIl(_1ii1lIli1("\212\212\241\255\2\21\28\54\254\17",62),21) },
		{ _lIillIIIl(_1ii1lIli1("\228\247\11\10\37\39\48\64\80",75),34), _lIillIIIl(_1ii1lIli1("\8\8\37\51\54\73\80\106\50\69",88),47) },
	}
	local function floatIconKind(id, label)
		local hay = string.lower(tostring(id) .. _lIillIIIl(_1ii1lIli1("\207",101),60) .. tostring(label or ""))
		for _, rule in ipairs(FLOAT_ICON_RULES) do
			if string.find(hay, rule[1], 1, true) then return rule[2] end
		end
		return _lIillIIIl(_1ii1lIli1("\64\73\74\97\100\119",114),73)
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
		if type(saved) ~= _lIillIIIl(_1ii1lIli1("\87\82\97\121\128",127),86) or type(saved.x) ~= _lIillIIIl(_1ii1lIli1("\107\128\134\137\154\181",140),99) or type(saved.y) ~= _lIillIIIl(_1ii1lIli1("\133\154\160\163\180\207",153),112) then

			spawnIndex += 1
			saved = { x = 0.08, y = math.min(0.22 + (spawnIndex - 1) * 0.12, 0.9) }
			S.FloatButtons[id] = saved
		end

		local frame = Instance.new(_lIillIIIl(_1ii1lIli1("\133\164\197\207\171\236\249\7\16\29",166),125))
		frame.Name = _lIillIIIl(_1ii1lIli1("\145\197\214\214\247\240",179),138) .. id
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

		local dot = Instance.new(_lIillIIIl(_1ii1lIli1("\171\229\226\252\2",192),151))
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

		local label = Instance.new(_lIillIIIl(_1ii1lIli1("\211\242\19\29\3\38\58\75\96",205),164))
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

		local scale = Instance.new(_lIillIIIl(_1ii1lIli1("\238\240\8\38\55\80\87",218),177))
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

		if id == _lIillIIIl(_1ii1lIli1("\40\42\14\79\85\108\129",231),190) and not on then return end
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

		local keepMenu = S.FloatButtons[_lIillIIIl(_1ii1lIli1("\71\73\40\105\111\134\160",244),203)]
		for id in pairs(Buttons) do destroyButton(id) end
		S.FloatButtons = {}
		if type(map) == _lIillIIIl(_1ii1lIli1("\96\91\106\130\142",6),216) then
			for id, pos in pairs(map) do
				if type(pos) == _lIillIIIl(_1ii1lIli1("\122\117\132\161\168",19),229) and entryFor(id) then
					S.FloatButtons[id] = { x = tonumber(pos.x) or 0.08, y = tonumber(pos.y) or 0.3 }
					createButton(id)
				end
			end
		end

		createButton(_lIillIIIl(_1ii1lIli1("\149\156\123\188\194\217\238",32),242))
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

		tc(cam():GetPropertyChangedSignal(_lIillIIIl(_1ii1lIli1("\149\182\192\224\231\244\5\21\2\38\69\62",45),4)):Connect(function()
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
	tc(cam():GetPropertyChangedSignal(_lIillIIIl(_1ii1lIli1("\175\208\218\250\1\14\31\47\28\64\95\88",58),17)):Connect(relayout))

	tc(Workspace:GetPropertyChangedSignal(_lIillIIIl(_1ii1lIli1("\182\246\1\15\16\39\59\24\68\94\100\127\124",71),30)):Connect(function()
		if cam() then
			relayout()
			tc(cam():GetPropertyChangedSignal(_lIillIIIl(_1ii1lIli1("\227\4\14\46\53\66\83\99\80\116\147\140",84),43)):Connect(relayout))
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
    local header = page:FindFirstChild(_lIillIIIl(_1ii1lIli1("\250\26\36\67\66\85\67\109\137",97),56))
    local subBar = page:FindFirstChild(_lIillIIIl(_1ii1lIli1("\20\68\63\63\90\105\87\132\163",110),69)) or page:FindFirstChild(_lIillIIIl(_1ii1lIli1("\49\82\106\122\116\141\162\144\192\187\187\214\229\211\0\31",123),82))

    if header and header.Visible then
        header.Position = UDim2.fromOffset(inset, top)
        header.Size = UDim2.new(1, -(inset * 2), 0, 24)
        top = top + 24 + gap
    end
    if subBar and subBar.Visible then
        local subBarHeight = tonumber(subBar:GetAttribute(_lIillIIIl(_1ii1lIli1("\65\100\138\142\162\175\145\188\206\218\233\3",136),95))) or 30
        subBar.Position = UDim2.fromOffset(inset, top)
        subBar.Size = UDim2.new(1, -(inset * 2), 0, subBarHeight)
        top = top + subBarHeight + gap
    end

    local cards = {}
    for _, child in ipairs(page:GetChildren()) do
        if child:IsA(_lIillIIIl(_1ii1lIli1("\85\143\140\166\172",149),108)) and child.Visible and child ~= subBar and (child:FindFirstChild(_lIillIIIl(_1ii1lIli1("\114\165\179\184\211",162),121)) or child:FindFirstChildOfClass(_lIillIIIl(_1ii1lIli1("\152\154\171\214\238\253\227\6\44\48\73\86",175),134))) then
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
    if not child:IsA(_lIillIIIl(_1ii1lIli1("\164\224\226\214\247\13\22\34\70",188),147)) then return end
    tc(child:GetPropertyChangedSignal(_lIillIIIl(_1ii1lIli1("\205\238\6\10\17\41\48",201),160)):Connect(queuePageLayout))
    tc(child:GetPropertyChangedSignal(_lIillIIIl(_1ii1lIli1("\210\1\32\42\53\81\94\93\89\125\156\154",214),173)):Connect(queuePageLayout))
end
for _, page in pairs(Pages) do
    tc(page:GetPropertyChangedSignal(_lIillIIIl(_1ii1lIli1("\1\34\58\67\74\98\105",227),186)):Connect(function()
        if page.Visible then queuePageLayout() end
    end))
    for _, child in ipairs(page:GetChildren()) do watchPageChild(child) end
    tc(page.ChildAdded:Connect(function(child)
        watchPageChild(child)
        queuePageLayout()
    end))
end
tc(ContentArea:GetPropertyChangedSignal(_lIillIIIl(_1ii1lIli1("\6\58\89\99\110\133\146\150\146\182\213\206",240),199)):Connect(queuePageLayout))
S._RefreshPageLayout = function(searching)
    pageLayoutSearchMode = searching == true
    ContentArea.CanvasPosition = Vector2.zero
    queuePageLayout()
end
queuePageLayout()
end

local function mkSection(parent, title, order)
	local card = Instance.new(_lIillIIIl(_1ii1lIli1("\42\100\97\123\129",2),212))
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

	local layout = Instance.new(_lIillIIIl(_1ii1lIli1("\83\85\102\150\174\189\163\198\236\240\4\17",15),225))
	layout.Parent = card; layout.SortOrder = Enum.SortOrder.LayoutOrder; layout.Padding = UDim.new(0, M.rowGap)

	local hdrRow = Instance.new(_lIillIIIl(_1ii1lIli1("\94\157\154\180\186",28),238))
	hdrRow.Parent = card; hdrRow.LayoutOrder = 0; hdrRow.BackgroundTransparency = 1
	hdrRow.Size = UDim2.new(1, 0, 0, 24)

	local tick = Instance.new(_lIillIIIl(_1ii1lIli1("\125\183\180\206\212",41),0))
	tick.Parent = hdrRow; tick.BackgroundColor3 = T.Accent; tick.BorderSizePixel = 0
	tick.Position = UDim2.new(0, 0, 0.5, -6); tick.Size = UDim2.new(0, 3, 0, 13)
	Corner(tick, 2)
	local hdr = Instance.new(_lIillIIIl(_1ii1lIli1("\165\196\229\239\213\248\7\24\45",54),13))
	hdr.Parent = hdrRow; hdr.BackgroundTransparency = 1
	hdr.Position = UDim2.new(0, 13, 0, 0); hdr.Size = UDim2.new(1, -13, 1, 0)
	hdr.Font = FB; hdr.TextSize = 13; hdr.TextColor3 = T.Tx2
	hdr.TextXAlignment = Enum.TextXAlignment.Left; hdr.Text = string.upper(title)

	return card
end

local function mkToggle(parent, label, key, order, callback)
	local knobInset = math.floor((M.trackH - M.knob) / 2)
	local row = Instance.new(_lIillIIIl(_1ii1lIli1("\177\235\232\2\8",67),26))
	row.Name = label; row.Parent = parent; row.LayoutOrder = order
	row.Size = UDim2.new(1, 0, 0, M.rowH); row.BackgroundTransparency = 1

	local lbl = Instance.new(_lIillIIIl(_1ii1lIli1("\217\248\25\35\9\44\59\76\97",80),39))
	lbl.Parent = row; lbl.BackgroundTransparency = 1
	lbl.Position = UDim2.new(0, 4, 0, 0)

	lbl.Size = UDim2.new(1, -(M.trackW + (MOBILE and 70 or 78)), 1, 0)
	lbl.Font = F; lbl.TextSize = M.rowFont; lbl.TextColor3 = T.Tx2
	lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.TextTruncate = Enum.TextTruncate.AtEnd; lbl.Text = label

	local track = Instance.new(_lIillIIIl(_1ii1lIli1("\243\18\51\61\25\90\103\117\126\139",93),52))
	track.Parent = row
	track.AnchorPoint = Vector2.new(1, 0.5)
	track.Position = UDim2.new(1, -4, 0.5, 0)
	track.Size = UDim2.new(0, M.trackW, 0, M.trackH)
	track.BackgroundColor3 = T.TgOff
	track.AutoButtonColor = false
	track.Text = ""
	Corner(track, math.floor(M.trackH / 2))
	local trackStroke = Stroke(track, T.Bd2, 1, 0.5)

	local knob = Instance.new(_lIillIIIl(_1ii1lIli1("\255\57\54\80\86",106),65))
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

	local bindId = S._registerBindable(_lIillIIIl(_1ii1lIli1("\71\80\86\100\119\126\97",119),78) .. key, label, function()
		update(not S[key])
		SFX.Click()
		if RequestAutoSave then RequestAutoSave() end
	end, function() return S[key] == true end, _lIillIIIl(_1ii1lIli1("\97\106\112\126\145\152",132),91))
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
	local card = Instance.new(_lIillIIIl(_1ii1lIli1("\77\135\132\158\164",145),104))
	card.Name = label; card.Parent = parent; card.LayoutOrder = order
	card.Size = UDim2.new(1, 0, 0, M.sliderH); card.BackgroundTransparency = 1

	local lbl = Instance.new(_lIillIIIl(_1ii1lIli1("\117\148\181\191\165\200\215\232\253",158),117))
	lbl.Parent = card; lbl.BackgroundTransparency = 1
	lbl.Position = UDim2.new(0, 4, 0, 2); lbl.Size = UDim2.new(0.6, 0, 0, 18)
	lbl.Font = F; lbl.TextSize = M.rowFont; lbl.TextColor3 = T.Tx2
	lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.TextTruncate = Enum.TextTruncate.AtEnd; lbl.Text = label

	local pill = Instance.new(_lIillIIIl(_1ii1lIli1("\129\187\184\210\216",171),130))
	pill.Parent = card; pill.AnchorPoint = Vector2.new(1, 0)
	pill.Position = UDim2.new(1, -4, 0, 0); pill.Size = UDim2.new(0, MOBILE and 54 or 50, 0, MOBILE and 22 or 20)
	pill.BackgroundColor3 = T.Elev
	Corner(pill, 7); Stroke(pill, T.Bd, 1, 0.5)
	local valLbl = Instance.new(_lIillIIIl(_1ii1lIli1("\169\200\233\243\207\10\33",184),143))
	valLbl.ClearTextOnFocus = false
	valLbl.Parent = pill; valLbl.BackgroundTransparency = 1; valLbl.Size = UDim2.new(1, 0, 1, 0)
	valLbl.Font = FM; valLbl.TextSize = MOBILE and 12 or 13; valLbl.TextColor3 = T.White; valLbl.Text = tostring(S[key] or minVal)

	local bar = Instance.new(_lIillIIIl(_1ii1lIli1("\181\239\236\6\12",197),156))
	bar.Parent = card
	bar.Position = UDim2.new(0, 4, 0, MOBILE and 34 or 30); bar.Size = UDim2.new(1, -8, 0, M.barH)
	bar.BackgroundColor3 = T.Elev; bar.Active = true
	Corner(bar, math.floor(M.barH / 2))
	local fill = Instance.new(_lIillIIIl(_1ii1lIli1("\207\9\6\32\38",210),169))
	fill.Parent = bar
	fill.Size = UDim2.new(math.clamp(((S[key] or minVal) - minVal) / (maxVal - minVal), 0, 1), 0, 1, 0)
	fill.BackgroundColor3 = T.Accent
	Corner(fill, math.floor(M.barH / 2))
	local grab = Instance.new(_lIillIIIl(_1ii1lIli1("\233\35\32\63\69",223),182))
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
	local btn = Instance.new(_lIillIIIl(_1ii1lIli1("\17\48\86\96\60\125\138\157\166\179",236),195))
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
	local bindId = S._registerBindable(_lIillIIIl(_1ii1lIli1("\62\95\108\122\131\144\111",249),208) .. label:gsub(_lIillIIIl(_1ii1lIli1("\81\98\55\151\144",11),221), _lIillIIIl(_1ii1lIli1("\111",24),234)), label, function()
		pcall(callback)
		SFX.Click()
	end, nil, _lIillIIIl(_1ii1lIli1("\145\178\191\205\214\227",37),247))
	S._addBindChip(btn, bindId, MOBILE and -8 or -6)
	S._requestBindFromRightClick(btn, bindId)
	btn.MouseButton1Click:Connect(function() pcall(callback); SFX.Click() end)
	table.insert(UIRegistry, { card = parent, row = btn, label = string.lower(label) })
	return btn
end

local function getGF() return Workspace:FindFirstChild(_lIillIIIl(_1ii1lIli1("\144\184\210\216\241\251\254\36\255\54\65\71\86\113",50),9)) end
local function getHRP() local c = LP.Character; return c and c:FindFirstChild(_lIillIIIl(_1ii1lIli1("\171\230\236\238\9\24\32\41\37\80\94\113\91\122\153\169",63),22)) end
local function getHum() local c = LP.Character; return c and c:FindFirstChildOfClass(_lIillIIIl(_1ii1lIli1("\197\0\6\8\35\50\58\67",76),35)) end
local function objPos(obj)
	if obj:IsA(_lIillIIIl(_1ii1lIli1("\217\6\38\38\31\62\93\109",89),48)) then return obj.Position end
	if obj:IsA(_lIillIIIl(_1ii1lIli1("\254\46\49\64\85",102),61)) then
		local ok, piv = pcall(function() return obj:GetPivot() end)
		if ok and piv then return piv.Position end
		local p = obj:FindFirstChildWhichIsA(_lIillIIIl(_1ii1lIli1("\13\58\90\90\83\114\145\161",115),74), true)
		return p and p.Position
	end
	return nil
end

local MONSTER_NAMES = {
	_lIillIIIl(_1ii1lIli1("\70\97\104\123\130\157",128),87), _lIillIIIl(_1ii1lIli1("\97\121\132\157\177",141),100), _lIillIIIl(_1ii1lIli1("\137\144\163\174\186\196",154),113), _lIillIIIl(_1ii1lIli1("\153\179\190\196\208\235",167),126), _lIillIIIl(_1ii1lIli1("\189\188\215\219\234\0\16\29\38\64\75",180),139), _lIillIIIl(_1ii1lIli1("\202\221\228\250\13\32\40\56\71\79\106",193),152),
	_lIillIIIl(_1ii1lIli1("\226\197\205",206),165), _lIillIIIl(_1ii1lIli1("\253\24\43\57\71\83\90\103\117\130\150\177",219),178), _lIillIIIl(_1ii1lIli1("\23\50\75\82\85\101\128",232),191), _lIillIIIl(_1ii1lIli1("\55\67\94\98\120\127\143\160\170\201\202\229",245),204), _lIillIIIl(_1ii1lIli1("\83\117\111\126\144\172\187\182\215\218\238\251",7),217), _lIillIIIl(_1ii1lIli1("\123\135\158\160\169\183\205\212",20),230),
	_lIillIIIl(_1ii1lIli1("\131\151\178\190\200\219\220\253\0\20\33",33),243), _lIillIIIl(_1ii1lIli1("\181\193\194\217\220\239\247\15\22\36\49\64\91",46),5), _lIillIIIl(_1ii1lIli1("\203\210\231\248\4\22\20\30\54",59),18), _lIillIIIl(_1ii1lIli1("\218\231\6\2\14\47\56\73",72),31), _lIillIIIl(_1ii1lIli1("\3\15\20\28\50\72\87\86\113",85),44),
	_lIillIIIl(_1ii1lIli1("\17\38\57\67\80\99\94\127\136",98),57), _lIillIIIl(_1ii1lIli1("\47\64\79\82\96",111),70), _lIillIIIl(_1ii1lIli1("\65\90\115\108\135",124),83), _lIillIIIl(_1ii1lIli1("\106\106\116\147\146\165\183\194\206\221\247",137),96), _lIillIIIl(_1ii1lIli1("\136\128\153\167\173\206\202\223\237\244\15",150),109), _lIillIIIl(_1ii1lIli1("\147\154\185\183\204\223\230\242\13",163),122),
	_lIillIIIl(_1ii1lIli1("\168\180\211\221\222\255\2\22\35",176),135), _lIillIIIl(_1ii1lIli1("\195\220\235\249\252\17",189),148), _lIillIIIl(_1ii1lIli1("\235\232\11\8\42\32\68\68",202),161),
}
local function monsterKind(nameLower)
	if nameLower:find(_lIillIIIl(_1ii1lIli1("\247\24\20\41\55\67\94",215),174)) then return _lIillIIIl(_1ii1lIli1("\17\50\46\72\86\93\120",228),187) end
	if nameLower:find(_lIillIIIl(_1ii1lIli1("\44\83\77\92\105\133\148",241),200)) or nameLower:find(_lIillIIIl(_1ii1lIli1("\82\99\113\123\139\146\173",3),213)) then return _lIillIIIl(_1ii1lIli1("\101\135\129\149\162\190\205",16),226) end
	if nameLower:find(_lIillIIIl(_1ii1lIli1("\141\158\176\178\187\201\223\230",29),239)) then return _lIillIIIl(_1ii1lIli1("\172\184\202\204\213\227\249\0",42),1) end
	if nameLower:find(_lIillIIIl(_1ii1lIli1("\182\194\225\235\236\13\16\36\49",55),14)) then return _lIillIIIl(_1ii1lIli1("\208\220\251\5\6\39\42\62\75",68),27) end
	for _, m in ipairs(MONSTER_NAMES) do
		if nameLower:find(m, 1, true) then return _lIillIIIl(_1ii1lIli1("\244\4\17\36\51\50\77",81),40) end
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
	BoardPuzzle = _lIillIIIl(_1ii1lIli1("\241\254\20\16\43\7\55\82\82\113\113\91\120\134\133\180\205\216\228\249",94),53), BridgeControl = _lIillIIIl(_1ii1lIli1("\253\27\32\41\58\70\47\96\122\135\155\167\178\189",107),66),
	Button = _lIillIIIl(_1ii1lIli1("\36\37\59\68\80\111\114\141\138\115\163\196\209\223\232\245",120),79), Lever = _lIillIIIl(_1ii1lIli1("\62\63\85\94\106\137\140\167\164\141\199\206\237\234\5",133),92),
	TreadmillPanel = _lIillIIIl(_1ii1lIli1("\93\105\106\116\133\156\166\183\197\167\216\242\255\19\36\47\58",146),105), Tram = _lIillIIIl(_1ii1lIli1("\119\131\128\154\123\172\198\211\231\243\254\9",159),118),
	TurretControls = _lIillIIIl(_1ii1lIli1("\145\160\171\185\186\215\177\226\252\9\29\46\57\68",172),131),
}
local PromptCache = {}

local PassedDoors = {}

local function getInteractionType(prompt)
	local node = prompt.Parent
	while node and node ~= Workspace do
		local interactionType = node:GetAttribute(_lIillIIIl(_1ii1lIli1("\160\211\231\230\1\254\14\45\48\73\86\74\125\130\133",185),144))
		if type(interactionType) == _lIillIIIl(_1ii1lIli1("\228\243\255\4\23\30",198),157) and interactionType ~= "" then
			return interactionType, node
		end
		node = node.Parent
	end
	return nil, nil
end
local function classifyPrompt(prompt)
	local parent = prompt.Parent
	local part
	if parent and parent:IsA(_lIillIIIl(_1ii1lIli1("\205\250\26\26\19\55\86\102",211),170)) then
		part = parent
	elseif parent and parent:IsA(_lIillIIIl(_1ii1lIli1("\230\39\53\53\69\88\107\113\136\161",224),183)) then
		part = parent.Parent
	end
	if not (part and part:IsA(_lIillIIIl(_1ii1lIli1("\1\51\83\83\76\107\138\159",237),196))) then
		part = parent and parent:FindFirstAncestorWhichIsA(_lIillIIIl(_1ii1lIli1("\32\77\109\109\102\138\169\185",250),209))
	end
	if not part then return nil end
	local model = part:FindFirstAncestorOfClass(_lIillIIIl(_1ii1lIli1("\69\117\120\135\161",12),222))
	local mname = model and model.Name or part.Name
	local mnameLower = mname:lower()
	local interactionType, interactionRoot = getInteractionType(prompt)
	local kind
	if mname:match(_lIillIIIl(_1ii1lIli1("\112\99\168\179\193\194\217\220\0",25),235)) or interactionType == _lIillIIIl(_1ii1lIli1("\116\180\191\205\206\229\232\12\227\16\48\48",38),248) then kind = _lIillIIIl(_1ii1lIli1("\174\206\217\231\232\255\2\38",51),10)
	elseif mname == _lIillIIIl(_1ii1lIli1("\168\226\229\244\223\29\30\40\56\75\86\113",64),23) or KEY_INTERACTIONS[interactionType] or mnameLower:find(_lIillIIIl(_1ii1lIli1("\234\242\20\12\24\55\55",77),36), 1, true) then kind = _lIillIIIl(_1ii1lIli1("\4\12\46\38\50\81\81",90),49)
	elseif ITEM_MODELS[mname] or ITEM_INTERACTIONS[interactionType] then kind = _lIillIIIl(_1ii1lIli1("\28\53\52\74",103),62)
	elseif DOOR_INTERACTIONS[interactionType] or (mnameLower:find(_lIillIIIl(_1ii1lIli1("\49\74\88\105",116),75), 1, true) and part.Name == _lIillIIIl(_1ii1lIli1("\57\100\114\133",129),88)) then kind = _lIillIIIl(_1ii1lIli1("\101\126\140\157",142),101)
	elseif mname == _lIillIIIl(_1ii1lIli1("\103\152\154\176\184\211",155),114) then
		if model and (model:GetAttribute(_lIillIIIl(_1ii1lIli1("\126\177\197\196\223\220\236\11\14\34\47\40\91\96\99",168),127)) == _lIillIIIl(_1ii1lIli1("\156\204\217\236\251\250\21\253\46\53\75\83\110",181),140) or model:FindFirstChild(_lIillIIIl(_1ii1lIli1("\209\224\236\251\13\24\36\51\82",194),153))) then
			kind = _lIillIIIl(_1ii1lIli1("\249\0\8\17\39\56\63\85\93\120",207),166)
		else
			kind = _lIillIIIl(_1ii1lIli1("\9\26\28\50\63\90",220),179)
		end
	elseif DRAWER_INTERACTIONS[interactionType] or mnameLower:find(_lIillIIIl(_1ii1lIli1("\27\55\57\93\89\116",233),192), 1, true) or mnameLower:find(_lIillIIIl(_1ii1lIli1("\57\69\84\105\124\129\163",246),205), 1, true) then kind = _lIillIIIl(_1ii1lIli1("\84\112\109\145\146\173",8),218)
	elseif HAZARD_INTERACTIONS[interactionType] or mnameLower:find(_lIillIIIl(_1ii1lIli1("\126\138\148\169\190\190\213\214",21),231), 1, true) or mnameLower:find(_lIillIIIl(_1ii1lIli1("\157\172\183\197\198\227",34),244), 1, true) or mnameLower:find(_lIillIIIl(_1ii1lIli1("\176\186\205\210",47),6), 1, true) then kind = _lIillIIIl(_1ii1lIli1("\197\204\243\232\7\7",60),19)
	elseif interactionType == _lIillIIIl(_1ii1lIli1("\201\234\249\10\27\41\13\58\91\105\104\131\136\146\174",73),32) then kind = _lIillIIIl(_1ii1lIli1("\3\4\19\36\53\67",86),45)
	elseif interactionType == _lIillIIIl(_1ii1lIli1("\1\26\51\75\72",99),58) then kind = _lIillIIIl(_1ii1lIli1("\59\52\77\101\98",112),71)
	elseif interactionType == _lIillIIIl(_1ii1lIli1("\49\82\107\106\128\151\134\186\194\209\208\230",125),84) then kind = _lIillIIIl(_1ii1lIli1("\107\108\133\132\154\177",138),97)
	elseif OBJECTIVE_INTERACTIONS[interactionType] then kind = _lIillIIIl(_1ii1lIli1("\130\131\153\162\174\205\208\235\232",151),110)
	else kind = _lIillIIIl(_1ii1lIli1("\156\175\177\188\215",164),123) end
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
		or model:GetAttribute(_lIillIIIl(_1ii1lIli1("\153\196\210\222\211\6\11\14",177),136)) == _lIillIIIl(_1ii1lIli1("\165\212\222\239\222\21\25\54",190),149)
		or model:GetAttribute(_lIillIIIl(_1ii1lIli1("\191\238\248\9\248\47\56",203),162)) == true
end

local function textMentionsKeycard(value)
	if type(value) ~= _lIillIIIl(_1ii1lIli1("\8\23\35\40\64\71",216),175) then return false end
	local text = value:lower()
	return text:find(_lIillIIIl(_1ii1lIli1("\26\34\68\65\77\108\108",229),188), 1, true) ~= nil
		or text:find(_lIillIIIl(_1ii1lIli1("\52\65\99\24\105\117\148\153",242),201), 1, true) ~= nil
		or text:find(_lIillIIIl(_1ii1lIli1("\75\87\118\118\64\165\166\176\193\208\235",4),214), 1, true) ~= nil
end

local function isKeycardDoor(e)
	if not (e and e.kind == _lIillIIIl(_1ii1lIli1("\102\127\141\163",17),227) and e.model) then return false end
	local model = e.model
	for _, attrName in ipairs({ _lIillIIIl(_1ii1lIli1("\110\148\174\192\194\217\218\246\220\4\38\30\42\73\73",30),240), _lIillIIIl(_1ii1lIli1("\134\174\208\200\212\243\243\239\16\42\60\62\85\86\99",43),2), _lIillIIIl(_1ii1lIli1("\160\200\234\194\238\13\13\9\42\68\86\88\111\112\125",56),15), _lIillIIIl(_1ii1lIli1("\178\222\253\253\249\26\52\70\72\95\96\109",69),28), _lIillIIIl(_1ii1lIli1("\219\252\22\40\42\65\66\94\60\104\135\135",82),41), _lIillIIIl(_1ii1lIli1("\228\20\34\50\78\92\67\106\137\134\155",95),54), _lIillIIIl(_1ii1lIli1("\15\48\74\92\94\117\118\131\110\158\172\188\216\230",108),67), _lIillIIIl(_1ii1lIli1("\35\84\86\108\99\150\155\158",121),80) }) do
		local value = model:GetAttribute(attrName)
		if value == true or (type(value) == _lIillIIIl(_1ii1lIli1("\95\116\122\125\142\169",134),93) and value > 0) or textMentionsKeycard(value) then return true end
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
					if d:IsA(_lIillIIIl(_1ii1lIli1("\91\139\150\173\172\190\200\225\244\217\9\20\32\49\72",147),106)) then
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
	DropBattery = _lIillIIIl(_1ii1lIli1("\103\148\181\195\194\221\242",160),119), Flashlight = _lIillIIIl(_1ii1lIli1("\133\185\188\220\223\241\252\8\23\49",173),132), Lantern = _lIillIIIl(_1ii1lIli1("\165\200\227\247\246\17\27",186),145),
	FlashBeacon = _lIillIIIl(_1ii1lIli1("\185\237\240\16\19\217\9\63\73\89\115\128",199),158), Glider = _lIillIIIl(_1ii1lIli1("\212\7\18\27\42\74",212),171), HealthCrate = _lIillIIIl(_1ii1lIli1("\239\26\36\66\88\90\32\81\142\144\177\176",225),184),
	OxygenTank = _lIillIIIl(_1ii1lIli1("\16\76\91\87\99\122\58\129\156\183\194",238),197), Medkit = _lIillIIIl(_1ii1lIli1("\45\83\96\117\129\159",0),210), SPRINT = _lIillIIIl(_1ii1lIli1("\77\88\104\86\128\147\167",13),223),
	HealthBoost = _lIillIIIl(_1ii1lIli1("\92\135\150\175\197\199\141\189\248\6\24\39",26),236), SmallLantern = _lIillIIIl(_1ii1lIli1("\134\174\176\201\215\153\211\246\17\37\36\63\73",39),249), WindupLight = _lIillIIIl(_1ii1lIli1("\164\196\215\219\250\3\193\251\38\50\65\91",52),11),
}
local function tagTitleFor(e)
	if e.kind == _lIillIIIl(_1ii1lIli1("\202\234\245\3\4\27\30\66",65),24) then
		local amt = e.name:match(_lIillIIIl(_1ii1lIli1("\223\210\18\29\43\44\67\70\106\39\50\127\84\96",78),37))
		return amt and (amt .. _lIillIIIl(_1ii1lIli1("\187\244\41\52\65\70\97",91),50)) or _lIillIIIl(_1ii1lIli1("\0\53\64\77\82\109",104),63)
	elseif e.kind == _lIillIIIl(_1ii1lIli1("\56\81\80\102",117),76) then return ITEM_LABEL[e.name] or e.name
	elseif e.kind == _lIillIIIl(_1ii1lIli1("\84\92\126\118\130\161\161",130),89) then
		if e.name == _lIillIIIl(_1ii1lIli1("\70\128\131\146\125\187\188\198\214\233\244\15",143),102) then return _lIillIIIl(_1ii1lIli1("\96\122\125\140\117\165\195\196\206\222\241\252\23\248\21\35\34\96\103\116\138\109\176\185",156),115) end
		if e.interactionType == _lIillIIIl(_1ii1lIli1("\124\177\184\215\208\241\250\11\242\26\60",169),128) then return _lIillIIIl(_1ii1lIli1("\150\171\178\209\202\235\244\5\225\31\39\73\30\59\73\77\139\146\154\176\147\214\223",182),141) end
		if e.interactionType == _lIillIIIl(_1ii1lIli1("\187\218\250\8\26\32\49\54\48\79\108\111\138",195),154) then return _lIillIIIl(_1ii1lIli1("\198\214\228\244\16\30\254\47\73\76\91\73\102\116\115\177\184\192\214\185\252\5",208),167) end
		return _lIillIIIl(_1ii1lIli1("\234\242\20\12\29\60\60\38\67\81\85\147\154\162\184\155\222\231",221),180)
	elseif e.kind == _lIillIIIl(_1ii1lIli1("\29\54\73\90",234),193) then
		local m = e.model
		if m:GetAttribute(_lIillIIIl(_1ii1lIli1("\40\88\99\105\130\131\164\178\145\202\216\233",247),206)) then return _lIillIIIl(_1ii1lIli1("\64\69\102\112\79\143\154\168\180\149\193\207",9),219) end
		if isKeycardDoor(e) then return _lIillIIIl(_1ii1lIli1("\87\95\134\126\138\169\169\147\194\210\224\240\12\26\245\18\32\31\89\106\108\130\138\151",22),232) end
		if m:GetAttribute(_lIillIIIl(_1ii1lIli1("\119\168\170\192\200\213",35),245)) then
			local code = LP:GetAttribute(_lIillIIIl(_1ii1lIli1("\136\194\197\212",48),7))
			return code and (_lIillIIIl(_1ii1lIli1("\170\178\212\217\216\233\211\240\254\253",61),20) .. tostring(code)) or _lIillIIIl(_1ii1lIli1("\196\204\238\243\242\3\237\10\24\23\81\98\100\122\130\143",74),33)
		end
		return _lIillIIIl(_1ii1lIli1("\215\16\30\47",87),46)
	elseif e.kind == _lIillIIIl(_1ii1lIli1("\25\42\44\66\74\101",100),59) then return _lIillIIIl(_1ii1lIli1("\19\68\70\92\100\127\59\81\170\166\185\198\152",113),72)
	elseif e.kind == _lIillIIIl(_1ii1lIli1("\87\94\102\111\133\150\152\174\182\209",126),85) then return _lIillIIIl(_1ii1lIli1("\81\88\96\105\83\141\158\160\182\190\217\181\208\209\3\33\0\60\75\94\56\115\130\139\154",139),98)
	elseif e.kind == _lIillIIIl(_1ii1lIli1("\121\149\146\182\178\205",152),111) then return _lIillIIIl(_1ii1lIli1("\115\175\172\208\204\231",165),124)
	elseif e.kind == _lIillIIIl(_1ii1lIli1("\177\184\223\212\243\243",178),137) then
		if e.interactionType == _lIillIIIl(_1ii1lIli1("\175\210\237\241\8\18\37\42",191),150) or e.interactionType == _lIillIIIl(_1ii1lIli1("\193\253\250\30\26\53\34\69\96\100\123\133\157\162",204),163) then return _lIillIIIl(_1ii1lIli1("\227\230\1\5\33\43\62\67\44\73\92\91\141\160\184\180\211\220",217),176) end
		if e.interactionType == _lIillIIIl(_1ii1lIli1("\5\49\59\80\101\101\124\125",230),189) then return _lIillIIIl(_1ii1lIli1("\31\48\53\74\95\95\123\124\101\130\144\143\193\204\231\238\250\21",243),202) end
		if e.interactionType == _lIillIIIl(_1ii1lIli1("\62\109\120\134\135\169",5),215) or e.interactionType == _lIillIIIl(_1ii1lIli1("\71\135\147\167\176\188\177\224\235\249\250\23",18),228) then return _lIillIIIl(_1ii1lIli1("\114\134\145\159\160\189\151\180\194\193\243\254\25\32\44\71",31),241) end
		if e.interactionType == _lIillIIIl(_1ii1lIli1("\144\176\186\180\222\241\246\18",44),3) then return _lIillIIIl(_1ii1lIli1("\170\170\180\161\220\230\249\254\231\4\18\17\67\78\105\112\124\151",57),16) end
		return e.name
	elseif e.kind == _lIillIIIl(_1ii1lIli1("\227\228\243\4\21\35",70),29) then return _lIillIIIl(_1ii1lIli1("\205\218\251\9\8\35\56\13\77\78\93\110\127\141",83),42)
	elseif e.kind == _lIillIIIl(_1ii1lIli1("\27\20\45\69\66",96),55) then return _lIillIIIl(_1ii1lIli1("\21\14\39\63\60\37\66\80\79\143\154\173\168\201\200",109),68)
	elseif e.kind == _lIillIIIl(_1ii1lIli1("\75\76\101\100\122\145",122),81) then
		local fixed = e.interactionRoot and e.interactionRoot:FindFirstChild(_lIillIIIl(_1ii1lIli1("\57\106\135\130\143",135),94))
		local progress = fixed and tonumber(fixed.Value)
		return progress and (_lIillIIIl(_1ii1lIli1("\84\96\119\124\151\148\181\190\207\171\200\214\213",148),107) .. math.floor(progress + 0.5) .. _lIillIIIl(_1ii1lIli1("\76",161),120)) or _lIillIIIl(_1ii1lIli1("\136\148\171\176\203\200\233\242\3\223\1\15\14\78\79\104\108\130\153",174),133)
	elseif e.kind == _lIillIIIl(_1ii1lIli1("\202\203\225\234\246\21\24\51\48",187),146) then return OBJECTIVE_LABELS[e.interactionType] or _lIillIIIl(_1ii1lIli1("\196\197\219\228\240\15\18\50\47",200),159)
	end
	return e.name
end

local function isRepairComplete(e)
	if not (e and e.kind == _lIillIIIl(_1ii1lIli1("\1\2\27\26\48\76",213),172) and e.interactionRoot) then return false end
	local fixed = e.interactionRoot:FindFirstChild(_lIillIIIl(_1ii1lIli1("\239\32\61\61\74",226),185))
	return fixed ~= nil and tonumber(fixed.Value) ~= nil and fixed.Value >= 100
end

local hideInLockerNow, attemptRespawn
local SaveConfigFile, LoadConfigFile
local refreshVisionEffects

local suppressedPostEffects = {}

local TeammateChamReg = {}
local function getVisionGrade()
	local grade = Lighting:FindFirstChild(_lIillIIIl(_1ii1lIli1("\19\72\73\101\115\131\142\148\133\192\187\189\222\246\250\14\27\2\59\56\73\88",239),198))
	if not grade then
		grade = Instance.new(_lIillIIIl(_1ii1lIli1("\37\95\106\123\140\112\170\187\201\202\214\245\248\12\25\254\45\59\72\84\115",1),211))
		grade.Name = _lIillIIIl(_1ii1lIli1("\76\124\125\158\172\188\199\200\185\244\239\241\18\42\46\66\79\54\111\108\125\140",14),224)
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
					local removable = effect:IsA(_lIillIIIl(_1ii1lIli1("\88\149\172\183\152\199\213\226\238\13",27),237)) or effect:IsA(_lIillIIIl(_1ii1lIli1("\119\175\192\206\218\192\239\253\10\22\53",40),250)) or effect:IsA(_lIillIIIl(_1ii1lIli1("\146\204\215\232\249\216\18\35\49\50\62\93\96\116\129\102\149\163\176\188\219",53),12))
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
		local grade = Lighting:FindFirstChild(_lIillIIIl(_1ii1lIli1("\185\233\234\6\20\36\47\48\33\92\87\89\122\146\150\170\183\158\215\212\229\244",66),25))
		if grade then grade:Destroy() end
	end)
	for _, plr in ipairs(Players:GetPlayers()) do
		local ch = plr.Character
		local hl = ch and ch:FindFirstChild(_lIillIIIl(_1ii1lIli1("\211\3\4\32\46\62\73\74\67\109\112\150\144\171\138\189\196\222",79),38))
		if hl then pcall(function() hl:Destroy() end) end
	end
	for plr, entry in pairs(TeammateChamReg) do
		pcall(function() if entry.model then entry.model:Destroy() end end)
		TeammateChamReg[plr] = nil
	end
end

local secEntities = mkSection(Pages.Visuals, _lIillIIIl(_1ii1lIli1("\226\25\45\48\73\92\17\68\96\107",92),51), 1)
mkToggle(secEntities, _lIillIIIl(_1ii1lIli1("\4\52\65\84\99\98\125\57\108\136\147\113\135\174\233\240\3\10\37\240\22\78\89\114\134\73\91\105\119\128",105),64), _lIillIIIl(_1ii1lIli1("\22\77\97\100\125\144\106\134\145",118),77), 1)
mkToggle(secEntities, _lIillIIIl(_1ii1lIli1("\66\90\115\129\67\117\182\178\199\213\220\247\179\230\2\13",131),90), _lIillIIIl(_1ii1lIli1("\92\116\141\155\129\194\190\211\225\232\3\228\0\11",144),103), 2)
mkToggle(secEntities, _lIillIIIl(_1ii1lIli1("\100\166\160\175\188\216\231\226\3\6\26\39\231\9\8\66\115\129\139\160\162\189\125\176\204\215",157),116), _lIillIIIl(_1ii1lIli1("\126\192\186\201\214\242\1\224\252\7",170),129), 3)
mkToggle(secEntities, _lIillIIIl(_1ii1lIli1("\166\210\228\230\239\253\19\26\227\27\55\66",183),142), _lIillIIIl(_1ii1lIli1("\192\236\254\0\9\23\45\57\39\67\78",196),155), 4)
mkToggle(secEntities, _lIillIIIl(_1ii1lIli1("\202\246\21\31\32\70\73\93\106\42\93\126\137\103\125\214\229\224\255\0\13\38\60\65\1\84\107\127\130\155\174\108",209),168), _lIillIIIl(_1ii1lIli1("\228\16\47\57\63\96\99\119\132\110\138\149",222),181), 5)
mkToggle(secEntities, _lIillIIIl(_1ii1lIli1("\3\42\86\75\106\106\52\103\136\147\113\135\193\237\242\7\28\28\51\52\12\63\110\121\135\136\165\104",235),194), _lIillIIIl(_1ii1lIli1("\34\73\112\101\132\132\120\148\159",248),207), 6)

local secDoors = mkSection(Pages.Visuals, _lIillIIIl(_1ii1lIli1("\56\113\127\144\164\95\115\123\184\217\239\248\4\35\38\65\62\90\21\72\100\111",10),220), 2)
mkToggle(secDoors, _lIillIIIl(_1ii1lIli1("\82\139\158\175\107\158\186\197\163\185\13\18\51\61\247\20\19\98\114\128\144\172\186\117\146\145\235\252\254\20\28\41\1",23),233), _lIillIIIl(_1ii1lIli1("\113\170\184\201\170\198\209",36),246), 1)
mkToggle(secDoors, _lIillIIIl(_1ii1lIli1("\147\196\198\220\228\255\187\238\10\21\243\9\85\105\108\128\154\85\185\192\200\209\155\245\6\8\30\38\70\85\16\112\113\126\86",49),8), _lIillIIIl(_1ii1lIli1("\173\222\224\246\254\25\250\22\33",62),21), 2)
mkToggle(secDoors, _lIillIIIl(_1ii1lIli1("\191\251\248\28\24\51\239\12\11\60\104\119\140\159\164\193\123\174\202\213",75),34), _lIillIIIl(_1ii1lIli1("\217\21\18\54\50\77\46\74\85",88),47), 3)
mkToggle(secDoors, _lIillIIIl(_1ii1lIli1("\254\31\53\62\74\105\108\135\132\77\128\156\167\133\155\232\244\11\16\43\40\78\87\104\36\65\64\169\162\187\211\208\153\182\181\6\32\45\65\77\88\99\120\60",101),60), _lIillIIIl(_1ii1lIli1("\24\57\79\88\100\131\134\161\158\140\168\179",114),73), 4)

local secItems = mkSection(Pages.Visuals, _lIillIIIl(_1ii1lIli1("\47\96\110\129\59\110\138\149",127),86), 3)
mkToggle(secItems, _lIillIIIl(_1ii1lIli1("\70\127\126\148\85\136\164\175\141\163\203\248\25\39\38\70\91\31\74\117\129\149\175\120\154\215\212\245\244\198",140),99), _lIillIIIl(_1ii1lIli1("\96\153\152\174\148\176\187",153),112), 1)
mkToggle(secItems, _lIillIIIl(_1ii1lIli1("\124\177\188\201\206\233\165\216\244\255\221\243\33\97\108\122\123\151\154\190\124",166),125), _lIillIIIl(_1ii1lIli1("\150\203\214\227\232\3\228\0\11",179),138), 2)
mkToggle(secItems, _lIillIIIl(_1ii1lIli1("\181\229\234\254\15\20\45\64\250\51\91\125\117\129\165\165\111\140\139\188\246\249\8\209\1\63\64\74\90\109\120\147\79\130\158\169",192),151), _lIillIIIl(_1ii1lIli1("\202\242\20\12\24\55\60\43\71\82",205),164), 3)

local secPlayers = mkSection(Pages.Visuals, _lIillIIIl(_1ii1lIli1("\233\19\22\60\59\86\18\69\97\108",218),177), 4)
	mkToggle(secPlayers, _lIillIIIl(_1ii1lIli1("\1\34\65\71\16\82\109\129\160",231),190), _lIillIIIl(_1ii1lIli1("\32\65\91\97\79\107\123",244),203), 1)
	mkToggle(secPlayers, _lIillIIIl(_1ii1lIli1("\46\105\128\54\110\138\149",6),216), _lIillIIIl(_1ii1lIli1("\72\131\154\122\150\161",19),229), 2)
	mkToggle(secPlayers, _lIillIIIl(_1ii1lIli1("\104\152\162\187\209\211",32),242), _lIillIIIl(_1ii1lIli1("\135\178\188\213\235\237\216\244\255",45),4), 3)
	mkToggle(secPlayers, _lIillIIIl(_1ii1lIli1("\173\217\214\230\246\17\32",58),17), _lIillIIIl(_1ii1lIli1("\199\243\240\0\16\43\12\40\51",71),30), 4)
	mkToggle(secPlayers, _lIillIIIl(_1ii1lIli1("\225\0\10\36\50\52\85\84\29\78\129\136\162\182",84),43), _lIillIIIl(_1ii1lIli1("\247\33\36\74\68\95\62\113\120\146\166",97),56), 5)

local secEnv = mkSection(Pages.Visuals, _lIillIIIl(_1ii1lIli1("\6\61\83\84\107\118\131\144\150\173\193\123\143\151\209\252\8\23\49\52\76\83",110),69), 5)

	mkToggle(secEnv, _lIillIIIl(_1ii1lIli1("\33\94\99\113\117\147\152\164\179\205",123),82), _lIillIIIl(_1ii1lIli1("\59\120\125\139\111\173\178\190\205\231",136),95), 1)
	mkToggle(secEnv, _lIillIIIl(_1ii1lIli1("\93\140\75\127\182\188",149),108), _lIillIIIl(_1ii1lIli1("\119\166\139\194\200",162),121), 2)
	mkToggle(secEnv, _lIillIIIl(_1ii1lIli1("\143\192\214\154\199\242\254\13\39\225\42\75\99\103\123\136",175),134), _lIillIIIl(_1ii1lIli1("\169\218\240\211\254\10\25\51\40\73\97\101\121\134",188),147), 3, refreshVisionEffects)
	mkToggle(secEnv, _lIillIIIl(_1ii1lIli1("\186\241\248\2\29\221\30\65\94\95\109\132\73\124\171\185\198\210\241\254\185\207\23\47\70\81\13\42\41\125\145\148\180\183\134",201),160), _lIillIIIl(_1ii1lIli1("\212\11\18\28\55\47\77\106\107\121\144\122\169\183\196\208\239\252",214),173), 4, refreshVisionEffects)
	mkSlider(secEnv, _lIillIIIl(_1ii1lIli1("\241\46\51\70\74\104\109\121\136\167\97\145\207\212\224\239\9\17\22\50\64",227),186), 1, 10, _lIillIIIl(_1ii1lIli1("\7\74\79\91\106\132\140\150\178\192",240),199), 5)
	mkSlider(secEnv, _lIillIIIl(_1ii1lIli1("\59\97\114\122\128\79\128\186\199\219\231\228\4\19",2),212), 0, 100, _lIillIIIl(_1ii1lIli1("\84\117\141\162\156\181\154\212\225\245\1\254\30\45",15),225), 6, refreshVisionEffects)
	mkSlider(secEnv, _lIillIIIl(_1ii1lIli1("\111\154\171\179\185\131\196\224\1\16\27\24\57\60\80\93",28),238), 0, 200, _lIillIIIl(_1ii1lIli1("\141\174\198\214\208\233\222\250\27\42\53\50\83\86\106\119",41),0), 7, refreshVisionEffects)
	mkToggle(secEnv, _lIillIIIl(_1ii1lIli1("\148\212\224\239\248\4\197\249\16\37",54),13), _lIillIIIl(_1ii1lIli1("\174\218\244\219\242\7\4\59\60\75\99\106\119",67),26), 8, function(v) if not v and cam() then pcall(function() cam().FieldOfView = 70 end) end end)

mkSlider(secEnv, _lIillIIIl(_1ii1lIli1("\203\226\247",80),39), 55, 85, _lIillIIIl(_1ii1lIli1("\226\14\40\15\38\59",93),52), 9)

local secVisualHUD = mkSection(Pages.Visuals, _lIillIIIl(_1ii1lIli1("\15\48\72\88\82\107\45\99\126\123\101\121\129\193\222\249\0\12",106),65), 6)
	mkToggle(secVisualHUD, _lIillIIIl(_1ii1lIli1("\34\71\85\42\94\124\153\154\168\191\127\193\227\251\252\6\39\225\38\67\84\95\126",119),78), _lIillIIIl(_1ii1lIli1("\65\99\123\124\134\167\147\176\193\204\235",132),91), 1)
	mkToggle(secVisualHUD, _lIillIIIl(_1ii1lIli1("\90\137\132\165\180\192\123\177\204\201\179\201\33\44\58\75\12\41\40\133\161\176\172\184\207\143\172\171\1\12\22\47\69\71\22",145),104), _lIillIIIl(_1ii1lIli1("\116\163\158\191\206\218\189\216\213",158),117), 2)

	if not MOBILE then mkToggle(secVisualHUD, _lIillIIIl(_1ii1lIli1("\134\174\208\199\220\239\243\189\243\14\11\250\16\87\103\134\137\169\166\111\195\208\218\251\10\21\22\50\246",171),130), _lIillIIIl(_1ii1lIli1("\160\200\234\225\246\9\13\255\26\28",184),143), 3) end
	mkToggle(secVisualHUD, _lIillIIIl(_1ii1lIli1("\179\246\249\250\20\30\38\246\45\101\108\111\138\147\93\115\168\153\149\178\177\15\22\41\48\247\20\19\103\127\144\75\104\103\201\204\222\228\182",197),156), _lIillIIIl(_1ii1lIli1("\205\16\19\20\46\61\69\57\113\120\123\155\159",210),169), 4)
	mkToggle(secVisualHUD, _lIillIIIl(_1ii1lIli1("\241\22\55\70\0\50\107\121\138\75\144\168\206\211\224\232\251\15",223),182), _lIillIIIl(_1ii1lIli1("\11\48\86\96\62\119\133\155\139\183\180\196\212\239",236),195), 5)
	mkSlider(secVisualHUD, _lIillIIIl(_1ii1lIli1("\33\61\72\38\97\131\173\99\149\200\224\239\234\5\8\24",249),208), 250, 2500, _lIillIIIl(_1ii1lIli1("\59\87\98\109\148\185\147\198\222\237",11),221), 5)

local secDef = mkSection(Pages.Combat, _lIillIIIl(_1ii1lIli1("\81\138\150\177\193\206\137\157\165\215\6\21\34\57\76\76",24),234), 1)
mkToggle(secDef, _lIillIIIl(_1ii1lIli1("\116\171\191\194\219\238\163\232\0\31\41\50\69\76\19\67\112\139\153\158\185",37),247), _lIillIIIl(_1ii1lIli1("\142\197\217\220\245\8\244\12\43\53\62\81\88",50),9), 1)
mkToggle(secDef, _lIillIIIl(_1ii1lIli1("\164\230\227\246\10\201\10\46\69\70\93\29\98\122\153\163\172\191\198",63),22), _lIillIIIl(_1ii1lIli1("\212\236\11\21\30\49\56\50\92\112\119\123",76),35), 2)
mkToggle(secDef, _lIillIIIl(_1ii1lIli1("\217\20\38\52\239\34\89\92\118\138\145\165\164\191\123\170\227\234\5\21\34\221\243\34\91\116\109\136\88\123\180\194\206\209\239\244\7\14\26\53\250",89),48), _lIillIIIl(_1ii1lIli1("\243\46\64\78\42\99\106\133\149\162",102),61), 3)
mkToggle(secDef, _lIillIIIl(_1ii1lIli1("\12\78\91\100\35\89\136\145\160\105\192\211\147\205\254\0\22\30\57",115),74), _lIillIIIl(_1ii1lIli1("\38\104\117\126\101\148\157\172\158\209\189\238\240\6\14\41",128),87), 4)
mkButton(secDef, _lIillIIIl(_1ii1lIli1("\71\118\127\142\87\174\193\129\187\236\238\4\12\39\227\36\51\73",141),100), function() hideInLockerNow(true) end, 5)

local secCounters = mkSection(Pages.Combat, _lIillIIIl(_1ii1lIli1("\102\150\163\182\197\196\223\155\204\6\26\33\53\57\84\99",154),113), 2)
mkToggle(secCounters, _lIillIIIl(_1ii1lIli1("\116\175\195\198\152\190\0\250\9\22\50\70\65\98\101\121\134\75\97\147\196\210\220\159\206\18\10\48\238",167),126), _lIillIIIl(_1ii1lIli1("\142\201\221\224\202\12\6\21\34\62\82",180),139), 1)
mkToggle(secCounters, _lIillIIIl(_1ii1lIli1("\168\234\247\0\191\241\42\67\65\92\24\89\136\135\150\175\197\199\141\163\236\9\20\40\36\55\253\91\98\117\124\76",193),152), _lIillIIIl(_1ii1lIli1("\194\4\17\26\253\54\84\77\104\87\134\133\148\173\195\197",206),165), 2)
mkToggle(secCounters, _lIillIIIl(_1ii1lIli1("\220\30\43\52\248\57\92\99\123\131\81\142\179\193\137\199\230\5\2\34\38\63\62\90",219),178), _lIillIIIl(_1ii1lIli1("\246\56\74\83\69\104\111\135\148\141\172\203\200\232\236\5\4",232),191), 3)
mkToggle(secCounters, _lIillIIIl(_1ii1lIli1("\38\71\93\109\130\127\77\125\181\192\217\237\161\217\18\24\41\58\56\68\99\100",245),204), _lIillIIIl(_1ii1lIli1("\64\97\119\135\161\158\145\202\208\225\242\240\252\27\28\56",7),217), 4)

local secMovement = mkSection(Pages.Motion, _lIillIIIl(_1ii1lIli1("\91\134\142\156\169\115\135\143\195\247\2\14\29\55",20),230), 1)
mkToggle(secMovement, _lIillIIIl(_1ii1lIli1("\101\170\182\197\206\218\155\224\248\17\30\20\63\66\80\93",33),243), _lIillIIIl(_1ii1lIli1("\148\191\194\208\221\204\3\4\19\43\50\63",46),5), 1, function() refreshGameSpeed() end)
mkSlider(secMovement, _lIillIIIl(_1ii1lIli1("\178\202\227\240\230\17\20\34\47",59),18), 8, 120, _lIillIIIl(_1ii1lIli1("\184\248\4\19\28\40\32\56\81\94\84\127\130\144\157",72),31), 2, function() refreshGameSpeed() end)
mkSlider(secMovement, _lIillIIIl(_1ii1lIli1("\210\15\26\46\42\61\3\68\111\114\128\141",85),44), 4, 60, _lIillIIIl(_1ii1lIli1("\236\41\52\72\68\87\80\123\126\140\153",98),57), 3, function(v)
	S._tunedFields = S._tunedFields or {}; S._tunedFields.CrouchSpeed = true
	local m = getMain(); if m and type(m.CameraModule) == _lIillIIIl(_1ii1lIli1("\55\50\65\89\96",111),70) then setGameField(m.CameraModule, _lIillIIIl(_1ii1lIli1("\32\93\104\124\120\139\136\160\185\198\188\231\234\248\5",124),83), v) end
end)
mkSlider(secMovement, _lIillIIIl(_1ii1lIli1("\74\117\133\138\157\177\107\166\214\217\236\247\8\18\45",137),96), 0, 150, _lIillIIIl(_1ii1lIli1("\100\143\159\164\183\203\178\226\229",150),109), 4, function(v)
	S._tunedFields = S._tunedFields or {}; S._tunedFields.SprintMod = true
	local m = getMain()
	if m then
		if type(m.CameraModule) == _lIillIIIl(_1ii1lIli1("\159\154\169\193\200",163),122) then setGameField(m.CameraModule, _lIillIIIl(_1ii1lIli1("\152\195\211\216\235\255\230\22\25\44\60\77\87\114",176),135), v) end
	end
end)
mkToggle(secMovement, _lIillIIIl(_1ii1lIli1("\162\226\238\253\6\18\211\11\73\79\96\78\123\145\146\173",189),148), _lIillIIIl(_1ii1lIli1("\195\252\2\19\246\45\51\66\90\97\110",202),161), 5, function(v)
	if not v then restoreJumpPower() end
end)
mkSlider(secMovement, _lIillIIIl(_1ii1lIli1("\221\22\28\45\27\77\99\95\122",215),174), 50, 250, _lIillIIIl(_1ii1lIli1("\240\48\60\80\89\101\80\137\143\165\147\192\214\210\237",228),187), 6)
mkToggle(secMovement, _lIillIIIl(_1ii1lIli1("\13\70\97",241),200), _lIillIIIl(_1ii1lIli1("\44\96\123",3),213), 7, function(v)
	if not v then
		pcall(function() if S._flyBV then S._flyBV:Destroy(); S._flyBV = nil end end)
		if not S.NoClip then restoreNoClip() end
	end
end)
mkSlider(secMovement, _lIillIIIl(_1ii1lIli1("\70\122\149\79\144\187\190\204\217",16),226), 10, 200, _lIillIIIl(_1ii1lIli1("\96\153\180\156\199\202\216\229",29),239), 8)
mkToggle(secMovement, _lIillIIIl(_1ii1lIli1("\135\182\184\207\218\239",42),1), _lIillIIIl(_1ii1lIli1("\161\208\178\233\244\9",55),14), 9, function(v)
	if not v and not S.Fly then restoreNoClip() end
end)
mkToggle(secMovement, _lIillIIIl(_1ii1lIli1("\182\233\239\0\19\28\53\52\253\53\110\116\133",68),27), _lIillIIIl(_1ii1lIli1("\208\3\9\26\45\54\79\78\65\122\128\145",81),40), 10)
mkToggle(secMovement, _lIillIIIl(_1ii1lIli1("\244\31\38\57\59\86\105",94),53), _lIillIIIl(_1ii1lIli1("\14\57\64\83\85\112\131",107),66), 11)
mkSlider(secMovement, _lIillIIIl(_1ii1lIli1("\40\83\90\109\45\110\153\156\170\183",120),79), 2, 50, _lIillIIIl(_1ii1lIli1("\66\109\116\135\122\165\168\182\195",133),92), 12)

local secPhysics = mkSection(Pages.Motion, _lIillIIIl(_1ii1lIli1("\92\142\142\160\174\184\203\210\153\173\181\242\41\56\57\69\92",146),105), 2)
mkToggle(secPhysics, _lIillIIIl(_1ii1lIli1("\105\146\178\193\123\188\238\238\0",159),118), _lIillIIIl(_1ii1lIli1("\131\172\204\219\200\250\250\12",172),131), 1, function(v)
	local m = getMain(); local sw = m and m.Swimming
	if type(sw) ~= _lIillIIIl(_1ii1lIli1("\203\198\213\237\244",185),144) then return end
	if v then
		saveSwimDefaults(sw)
		sw.SwimmingSpeed = math.clamp(tonumber(S.SwimSpeed) or 32, 18, 65)
	else

		restoreSwimDefaults(sw, false)
	end
end)
mkSlider(secPhysics, _lIillIIIl(_1ii1lIli1("\196\246\246\8\201\10\53\61\75\88",198),157), 18, 65, _lIillIIIl(_1ii1lIli1("\222\16\16\34\22\70\73\87\100",211),170), 2, function(v)
	local m = getMain(); local sw = m and m.Swimming
	if S.FastSwim and type(sw) == _lIillIIIl(_1ii1lIli1("\25\20\35\64\71",224),183) then
		saveSwimDefaults(sw)
		sw.SwimmingSpeed = v
	end
end)
mkSlider(secPhysics, _lIillIIIl(_1ii1lIli1("\6\62\73\82\97\124\56\126\169\172\186\199",237),196), 60, 140, _lIillIIIl(_1ii1lIli1("\37\88\99\108\123\155\138\181\184\198\211",250),209), 3, function(v)
	S._tunedFields = S._tunedFields or {}; S._tunedFields.GliderSpeed = true
	local m = getMain(); if m and type(m.Swimming) == _lIillIIIl(_1ii1lIli1("\108\103\118\142\154",12),222) then setGameField(m.Swimming, _lIillIIIl(_1ii1lIli1("\89\140\156\165\180\207\190\233\236\250\7",25),235), v) end
end)
mkToggle(secPhysics, _lIillIIIl(_1ii1lIli1("\122\173\179\196\215\224\249\248\193\254\53\68\64\76\99",38),248), _lIillIIIl(_1ii1lIli1("\148\199\205\222\241\250\19\18\10\65\80\76\88\111",51),10), 4)

local secChar = mkSection(Pages.Player, _lIillIIIl(_1ii1lIli1("\168\219\226\1\254\14\45\44\71",64),23), 1)
mkButton(secChar, _lIillIIIl(_1ii1lIli1("\192\1\15\14\36\53\71\1\65\98\126\137\136\172\177",77),36), function() attemptRespawn() end, 1)
mkToggle(secChar, _lIillIIIl(_1ii1lIli1("\218\21\41\44\254\32\51\70\41\91\142\166\164\190\203\217\222\234\9",90),49), _lIillIIIl(_1ii1lIli1("\244\47\67\70\44\63\82",103),62), 2)

local secMouse = mkSection(Pages.Player, _lIillIIIl(_1ii1lIli1("\26\74\94\106\106",116),75), 2)
do
	local note = Instance.new(_lIillIIIl(_1ii1lIli1("\59\90\123\133\107\142\157\174\195",129),88))
	note.Parent = secMouse; note.LayoutOrder = 1; note.BackgroundTransparency = 1
	note.Size = UDim2.new(1, 0, 0, 30); note.Font = F; note.TextSize = 12
	note.TextColor3 = T.Tx3; note.TextWrapped = true; note.TextXAlignment = Enum.TextXAlignment.Left
	note.Text = _lIillIIIl(_1ii1lIli1("\78\126\146\158\158\103\202\209\221\238\240\6\28\215\38\77\90\99\111\113\146\154\162\174\199\213\240\165\10\9\24\41\48\249\91\93\108\132\63\154\160\183\204\133\220\244\175\12\27\30\53\6\8\87\114\118\64\159\176\178\200\222\153\233\246\6\28\223\65\67\78\23\114\130\142\148\171\191\121\224\228\248\177\2\25\42\60\65\10\97\122\66",142),101)
end

local secAuto = mkSection(Pages.Auto, _lIillIIIl(_1ii1lIli1("\92\158\171\180\192\194\227\230\250\7",155),114), 1)
mkToggle(secAuto, _lIillIIIl(_1ii1lIli1("\118\184\197\206\141\202\249\252\19\211\5\67\81\98\113",168),127), _lIillIIIl(_1ii1lIli1("\144\210\223\232\214\5\8\31\3\65\79\96\111",181),140), 1)
mkToggle(secAuto, _lIillIIIl(_1ii1lIli1("\170\236\249\2\193\242\44\55\74\81\93\124\54\116\169\180\193\198\225\157\177\185\240\41\40\62\82",194),153), _lIillIIIl(_1ii1lIli1("\196\6\19\28\254\56\72\86\93\105\136\107\169\168\190\210",207),166), 2)
mkToggle(secAuto, _lIillIIIl(_1ii1lIli1("\222\32\45\54\250\59\91\101\132\131\155\97\147\207\204\240\236\7\22",220),179), _lIillIIIl(_1ii1lIli1("\248\58\76\85\71\103\113\144\148\167\145\205\202\238\234\5\20",233),192), 3)
mkToggle(secAuto, _lIillIIIl(_1ii1lIli1("\23\89\102\111\46\95\158\169\183\190\202\233\163\220\4\38\46\233\253\5\54\112\115\130\75\123\185\186\196\212\231\242\13\28",246),205), _lIillIIIl(_1ii1lIli1("\49\115\128\137\112\170\181\195\202\214\245\218\2\36\44",8),218), 4)
mkToggle(secAuto, _lIillIIIl(_1ii1lIli1("\75\141\159\168\103\151\216\234\159\207\252\29\43\42\69\74\84\112\43\65\154\165\168\191\195\224\155\219\252\24\24\34\70\69\88\39",21),231), _lIillIIIl(_1ii1lIli1("\106\172\185\194\179\212\227\244\5\19\247\36\69\83\82\109\114\124\152",34),244), 5)
mkToggle(secAuto, _lIillIIIl(_1ii1lIli1("\132\198\211\220\155\221\12\23\33\225\37\62\87\111\108\136",47),6), _lIillIIIl(_1ii1lIli1("\158\224\237\246\233\24\35\45\35\60\85\109\106\134",60),19), 6)
mkToggle(secAuto, _lIillIIIl(_1ii1lIli1("\184\250\7\16\207\15\48\73\72\94\117\49\102\146\169\174\201\198\231\240\1\16",73),32), _lIillIIIl(_1ii1lIli1("\210\20\33\42\27\60\85\84\106\129\100\144\167\172\199\196\229\238\255\14",86),45), 7)
mkToggle(secAuto, _lIillIIIl(_1ii1lIli1("\236\46\59\68\3\53\104\128\124\155\164\101\159\194\221\225\248\2\21\26\54",99),58), _lIillIIIl(_1ii1lIli1("\6\72\85\94\65\116\140\136\167\176\157\192\219\223\246\0\19\24\52",112),71), 8)
mkToggle(secAuto, _lIillIIIl(_1ii1lIli1("\49\92\106\118\55\121\165\162\178\200\208\235\167\189\17\32\51\59\70\103\28\124\135\154\166\103\120\140",125),84), _lIillIIIl(_1ii1lIli1("\75\118\132\144\133\177\174\190\212\220\247",138),97), 9)

local secInteract = mkSection(Pages.Auto, _lIillIIIl(_1ii1lIli1("\92\143\163\162\189\186\202\233\236\0\13\205\15\64\65\75\99\121",151),110), 2)
mkToggle(secInteract, _lIillIIIl(_1ii1lIli1("\118\169\188\203\198\225\245\175\230\25\45\44\76\73\89\120\50\72\161\176\111\197\218\229\235\190",164),123), _lIillIIIl(_1ii1lIli1("\144\195\214\229\224\251\15\242\37\57\61\88\85\101\132",177),136), 1)
mkToggle(secInteract, _lIillIIIl(_1ii1lIli1("\166\231\241\240\7\11\26\39\246\52\100\111\123\140\163\93\157\190\200\216\235\177\199\37\238\242",190),149), _lIillIIIl(_1ii1lIli1("\203\251\6\18\35\53\38\71\81\97\116",203),162), 2)

local secTP = mkSection(Pages.Misc, _lIillIIIl(_1ii1lIli1("\233\8\29\36\66\79\96\112\125",216),175), 1)
mkButton(secTP, _lIillIIIl(_1ii1lIli1("\3\34\55\67\92\105\122\138\73\171\180\115\175\212\222\253\254\26\41\227\21\78\92\109",229),188), function()
	local hrp = getHRP(); if not hrp then return end
	local best, bestD = nil, math.huge
	for _, e in ipairs(PromptCache) do
		if e.kind == _lIillIIIl(_1ii1lIli1("\45\75\89\106",242),201) and e.part.Parent and not isDeadEndDoor(e.model) and not PassedDoors[e.model] then
			local d = (e.part.Position - hrp.Position).Magnitude
			if d < bestD then best, bestD = e.part, d end
		end
	end
	if best then hrp.CFrame = best.CFrame * CFrame.new(0, 0, 3); Notify(_lIillIIIl(_1ii1lIli1("\60\91\112\119\144\162\179\195",4),214), _lIillIIIl(_1ii1lIli1("\86\117\138\150\175\188\205\221\220\233\179\21\30\221\57\62\72\103\104\132\147\77\159\184\198\215",17),227), 2, _lIillIIIl(_1ii1lIli1("\143\164\160\174\190\218\232",30),240))
	else Notify(_lIillIIIl(_1ii1lIli1("\143\174\195\202\227\240\1\17",43),2), _lIillIIIl(_1ii1lIli1("\163\210\145\227\252\10\27\215\43\66\86\93\97",56),15), 2, _lIillIIIl(_1ii1lIli1("\230\222\253\7",69),28)) end
end, 1)
mkButton(secTP, _lIillIIIl(_1ii1lIli1("\221\252\17\24\49\62\79\95\25\123\132\67\127\164\174\205\206\234\249\179\237\30\32\54\67\94",82),41), function()
	local hrp = getHRP(); if not hrp then return end
	local best, bestD = nil, math.huge
	for _, e in ipairs(PromptCache) do
		if e.kind == _lIillIIIl(_1ii1lIli1("\15\32\34\56\64\91",95),54) and e.part.Parent then
			local d = (e.part.Position - hrp.Position).Magnitude
			if d < bestD then best, bestD = e.part, d end
		end
	end
	if best then hrp.CFrame = best.CFrame + best.CFrame.LookVector * 2; Notify(_lIillIIIl(_1ii1lIli1("\17\48\69\76\101\114\131\147",108),67), _lIillIIIl(_1ii1lIli1("\43\74\95\102\127\140\157\173\172\185\131\229\238\173\9\14\24\55\61\89\104\34\124\141\148\170\178\205",121),80), 2, _lIillIIIl(_1ii1lIli1("\100\116\112\126\142\170\184",134),93))
	else Notify(_lIillIIIl(_1ii1lIli1("\95\126\147\154\179\192\209\225",147),106), _lIillIIIl(_1ii1lIli1("\115\162\97\187\204\206\228\236\7\195\23\46\71\78\82",160),119), 2, _lIillIIIl(_1ii1lIli1("\182\174\205\215",173),132)) end
end, 2)

local secCfg = mkSection(Pages.Config, _lIillIIIl(_1ii1lIli1("\156\214\227\233\250\6\34\45\42\80\83\103\116",186),145), 1)

S._readConfigData = function(name)
	if not readfile then return false, nil, _lIillIIIl(_1ii1lIli1("\229\230\240\1\17\34\51\63\8\107\114\115\150\148\170\187\190\205\229\236",199),158) end
	local base = _lIillIIIl(_1ii1lIli1("\221\13\14\42\56\77\88\89\97\83\141\159\165\182\194\220\166",212),171) .. name .. _lIillIIIl(_1ii1lIli1("\213\31\54\69\82",225),184)
	local function readCandidate(path)
		if isfile and not isfile(path) then return false, nil, _lIillIIIl(_1ii1lIli1("\46\61\85\99\103\122\129",238),197) end
		local ok, raw = pcall(readfile, path)
		if not ok or type(raw) ~= _lIillIIIl(_1ii1lIli1("\83\98\110\115\134\146",0),210) then return false, nil, _lIillIIIl(_1ii1lIli1("\103\113\137\156\160\179\186",13),223) end
		local parsedOk, data = pcall(function() return HttpService:JSONDecode(raw) end)
		if not parsedOk or type(data) ~= _lIillIIIl(_1ii1lIli1("\136\131\151\175\182",26),236) then return false, nil, _lIillIIIl(_1ii1lIli1("\156\175\197\190\215\226\235\181\13\36\46\59",39),249) end
		return true, data
	end
	local ok, data, reason = readCandidate(base)
	if ok then return true, data end
	local backupOk, backupData = readCandidate(base .. _lIillIIIl(_1ii1lIli1("\123\207\214\231",52),11))
	if backupOk then return true, backupData, _lIillIIIl(_1ii1lIli1("\217\218\230\0\21\18\45\46\59",65),24) end
	return false, nil, reason
end

S._applyConfigData = function(data)
	if type(data) ~= _lIillIIIl(_1ii1lIli1("\245\240\255\23\30",78),37) then return end
	if type(data._ui) == _lIillIIIl(_1ii1lIli1("\15\10\25\49\56",91),50) then
		if data._ui.Theme then pcall(function() UIStyle:ApplyTheme(data._ui.Theme) end) end
		if data._ui.TextScale then pcall(function() UIStyle:ApplyTextScale(data._ui.TextScale) end) end
		if data._ui.HUDScale then pcall(function() UIStyle:ApplyHUDScale(data._ui.HUDScale) end) end
		if data._ui.NotificationPosition then pcall(function() UIStyle:PlaceNotifications(data._ui.NotificationPosition) end) end
	end

	for key, value in pairs(data) do
		if CfgBind[key] and type(S[key]) ~= _lIillIIIl(_1ii1lIli1("\23\50\64\75\82\92\119",104),63) then pcall(CfgBind[key], value) end
	end
	for key, value in pairs(data) do
		if CfgBind[key] and type(S[key]) == _lIillIIIl(_1ii1lIli1("\49\76\90\101\108\118\145",117),76) then pcall(CfgBind[key], value) end
	end
	S._applyKeybindMap(type(data._keybinds) == _lIillIIIl(_1ii1lIli1("\93\88\103\127\134",130),89) and data._keybinds or {})

	if MOBILE and S._floatApplyMap then
		pcall(S._floatApplyMap, type(data._floats) == _lIillIIIl(_1ii1lIli1("\119\114\129\153\160",143),102) and data._floats or {})
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
	if not writefile then Notify(_lIillIIIl(_1ii1lIli1("\96\154\167\173\190\202",156),115), _lIillIIIl(_1ii1lIli1("\124\189\184\196\228\241\250\11\199\29\36\73\4\96\111\46\147\161\166\191\190\205\222\239\246",169),128), 2, _lIillIIIl(_1ii1lIli1("\200\192\223\233",182),141)) return end
	local ok, err = pcall(function()
		if makefolder and (not isfolder or not isfolder(_lIillIIIl(_1ii1lIli1("\187\235\236\8\22\38\49\55\63\49\107\120\126\148\160\186",195),154))) then

			pcall(makefolder, _lIillIIIl(_1ii1lIli1("\213\5\6\34\48\64\80\81\89\75\133\151\157\174\186\212",208),167))
		end
		local data = {}
		for key in pairs(CfgBind) do data[key] = S[key] end
		data._keybinds = S.Keybinds
		data._floats = S.FloatButtons
		data._ui = { Theme = S.UITheme, TextScale = S.UITextScale, HUDScale = S.HUDScale, NotificationPosition = S.NotificationPosition }
		data._schema = 3
		local path = _lIillIIIl(_1ii1lIli1("\239\31\32\60\79\95\106\107\115\101\164\177\183\200\212\238\184",221),180) .. name .. _lIillIIIl(_1ii1lIli1("\231\49\77\87\100",234),193)
		local encoded = HttpService:JSONEncode(data)

		writefile(path .. _lIillIIIl(_1ii1lIli1("\6\90\97\114",247),206), encoded)
		writefile(path, encoded)
		if readfile then
			local verify = readfile(path)
			assert(type(verify) == _lIillIIIl(_1ii1lIli1("\101\116\128\133\157\164",9),219) and type(HttpService:JSONDecode(verify)) == _lIillIIIl(_1ii1lIli1("\128\123\143\167\174",22),232), _lIillIIIl(_1ii1lIli1("\142\168\181\187\204\216\159\3\0\27\32\43\60\68\80\113\116\136\149\85\169\178\200\217\224\237",35),245))
		end
		if delfile and (not isfile or isfile(path .. _lIillIIIl(_1ii1lIli1("\115\199\206\223",48),7))) then pcall(delfile, path .. _lIillIIIl(_1ii1lIli1("\141\225\232\249",61),20)) end
	end)
	Notify(_lIillIIIl(_1ii1lIli1("\188\246\3\9\26\38",74),33), ok and (_lIillIIIl(_1ii1lIli1("\230\2\37\34\47\249\14",87),46) .. name .. _lIillIIIl(_1ii1lIli1("\212",100),59)) or (_lIillIIIl(_1ii1lIli1("\26\54\89\86\31\115\124\146\163\170\183\155\143",113),72) .. tostring(err)), 2, ok and _lIillIIIl(_1ii1lIli1("\84\100\96\110\126\154\168",126),85) or _lIillIIIl(_1ii1lIli1("\95\106\133\140\152\179",139),98))
	return ok, err
end
LoadConfigFile = function(name, silent)
	local ok, data, reason = S._readConfigData(name)
	if not ok then
		if not silent then Notify(_lIillIIIl(_1ii1lIli1("\88\146\159\165\182\194",152),111), reason == _lIillIIIl(_1ii1lIli1("\156\166\190\204\208\227\234",165),124) and _lIillIIIl(_1ii1lIli1("\151\198\133\230\226\5\2\15\217\42\73\86\92\109\121\64\153\176\196\203\207",178),137) or (_lIillIIIl(_1ii1lIli1("\175\224\224\241\187\15\24\46\68\75\88\60\48",191),150) .. tostring(reason)), 2, _lIillIIIl(_1ii1lIli1("\244\236\11\21",204),163)) end
		return false, reason
	end
	local applied, err = xpcall(function() S._applyConfigData(data) end, debug.traceback)
	if not applied then
		if not silent then Notify(_lIillIIIl(_1ii1lIli1("\218\20\33\39\61\73",217),176), _lIillIIIl(_1ii1lIli1("\253\46\51\68\14\98\107\129\151\158\171\143\131",230),189) .. tostring(err), 2, _lIillIIIl(_1ii1lIli1("\47\63\90\97\109\136",243),202)) end
		return false, err
	end
	if not silent then Notify(_lIillIIIl(_1ii1lIli1("\45\103\116\122\139\156",5),215), _lIillIIIl(_1ii1lIli1("\80\129\129\151\166\179\125\146",18),228) .. name .. _lIillIIIl(_1ii1lIli1("\69",31),241) .. (reason == _lIillIIIl(_1ii1lIli1("\175\176\188\214\235\232\3\4\17",44),3) and _lIillIIIl(_1ii1lIli1("\119\141\229\230\242\12\33\30\57\58\71\26",57),16) or ""), 2, _lIillIIIl(_1ii1lIli1("\228\244\240\254\14\42\56",70),29)) end
	return true, reason
end
mkButton(secCfg, _lIillIIIl(_1ii1lIli1("\222\250\29\26\227\21\68\83\92\126\131\153\83\132\190\203\209\226\238",83),42), function() SaveConfigFile(_lIillIIIl(_1ii1lIli1("\4\20\54\67\76\87\104\104\121",96),55)) end, 1)
mkButton(secCfg, _lIillIIIl(_1ii1lIli1("\11\60\60\77\23\73\120\135\144\178\183\205\135\184\242\255\5\22\34",109),68), function() LoadConfigFile(_lIillIIIl(_1ii1lIli1("\56\72\106\119\128\139\156\156\173",122),81)) end, 2)

if MOBILE then
	mkButton(secCfg, _lIillIIIl(_1ii1lIli1("\69\102\124\140\161\158\103\150\207\221\159\211\7\24\24\57\65\84\91\34\82\147\165\179\188\201\220",135),94), function()
		if S._floatClearAll then S._floatClearAll() end
		Notify(_lIillIIIl(_1ii1lIli1("\79\144\157\171\180\193\212",148),107), _lIillIIIl(_1ii1lIli1("\104\161\175\113\197\217\234\234\11\14\33\40\244\68\101\114\128\137\155\174\105\201\202\224\240\5\2\15",161),120), 2, _lIillIIIl(_1ii1lIli1("\170\189\195\218",174),133))
	end, 3)
else
	mkButton(secCfg, _lIillIIIl(_1ii1lIli1("\158\213\220\230\5\193\240\41\55\254\55\95\129\120\146\165\169\198",187),146), function() S._clearAllKeybinds() end, 3)
end

do
	local scheduled = false
	RequestAutoSave = function()
		if scheduled or not writefile then return end
		scheduled = true
		task.delay(1, function() scheduled = false; SaveConfigFile(_lIillIIIl(_1ii1lIli1("\212\228\6\19\28\39\56\61\78",200),159)) end)
	end
end
do
	local note = Instance.new(_lIillIIIl(_1ii1lIli1("\227\2\35\45\19\59\74\91\112",213),172))
	note.Parent = secCfg; note.LayoutOrder = 4; note.BackgroundTransparency = 1
	note.Size = UDim2.new(1, 0, 0, MOBILE and 36 or 18); note.Font = F; note.TextSize = 12
	note.TextColor3 = T.Tx3; note.TextXAlignment = Enum.TextXAlignment.Left
	note.TextWrapped = MOBILE
	note.Text = MOBILE
		and _lIillIIIl(_1ii1lIli1("\121\81\149\149\182\178\210\207\238\235\15\253\123\171\203\211\179\114\48\141\138\170\103\197\179\225\209\253\235\105\39\35\68\3\175\110\47\138\74\170\165\198\190\227\166\3\249\31\21\139\73\57\102\46\129\124\157\153\186\120\213\203\242\177\93\27\14\56\6\163\97\92\125\107\233\173\119\200\192\229\162\5\243\33\28\155\155\89\41\118\52\145\132\253\187\177\215\204\243\237\15\2\43\38\71\58\99\94\127\117\156\109\12\203\137\230\231\8\202\36\225\63\45\91\86\120\68\148\95\176\111\204\138\232\180\83\17\255\45\29\74\9\101\97\129\123\162\144\191\126\218\208\252\192\23\10\52\242\79\71\107\97\229",226),185)
		or _lIillIIIl(_1ii1lIli1("\147\117\180\140\208\170\60\255\252\27\23\135\70\7\98\34\125\120\153\145\182\121\209\199\237\227\89\41\213\247\145\79\74\107\89\135\124\168\163\196\178\225\165\1\247\30\221\58\3\165\99\82\127\117\155\150\183\169\49\49\239\191\12\202\39\26\147\81\71\109\98\137\131\170\157\198\193\226\213\3\254\31\21\60\8\167\102\36\129\125\158\96\186\119\213\195\241\236\14\218\42\245\70\5\98\32\126\74\233\172\154\200\184\229\164\5\1\33\27\61\43\90\25\117\107\146\86\173\160\202\136\229\221\1\247\123",239),198)
end

if MOBILE and Pages.Buttons then

	local function mkPill(parent, text, x)
		local pill = Instance.new(_lIillIIIl(_1ii1lIli1("\54\85\118\128\92\162\175\189\198\211",1),211))
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
		local row = Instance.new(_lIillIIIl(_1ii1lIli1("\66\124\121\152\158",14),224))
		row.Name = _lIillIIIl(_1ii1lIli1("\92\149\166\166\199\192",27),237) .. item.id
		row.Parent = secFloat
		row.LayoutOrder = index + 1
		row.Size = UDim2.new(1, 0, 0, M.rowH)
		row.BackgroundTransparency = 1

		local label = Instance.new(_lIillIIIl(_1ii1lIli1("\137\168\201\211\185\220\235\252\17",40),250))
		label.Parent = row; label.BackgroundTransparency = 1
		label.Position = UDim2.new(0, 4, 0, 0); label.Size = UDim2.new(1, -168, 1, 0)
		label.Font = F; label.TextSize = M.rowFont; label.TextColor3 = T.Tx2
		label.TextXAlignment = Enum.TextXAlignment.Left; label.TextTruncate = Enum.TextTruncate.AtEnd
		label.Text = item.label

		local enable, enableStroke = mkPill(row, _lIillIIIl(_1ii1lIli1("\148\171\172\187\211\218",53),12), -82)
		local remove, removeStroke = mkPill(row, _lIillIIIl(_1ii1lIli1("\187\188\210\226\247\244",66),25), -4)

		local locked = item.id == _lIillIIIl(_1ii1lIli1("\248\250\217\26\32\55\76",79),38)
		local function paint()
			local on = S._floatIsOn(item.id)
			enable.BackgroundColor3 = on and T.ActiveBg or T.Elev
			enable.TextColor3 = on and T.White or T.Tx2
			enable.Text = on and _lIillIIIl(_1ii1lIli1("\236\249\217\26\24\53\54\68\91",92),51) or _lIillIIIl(_1ii1lIli1("\252\19\20\35\59\66",105),64)
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

	S._floatSet(_lIillIIIl(_1ii1lIli1("\70\72\39\104\110\133\154",118),77), true)
end

attemptRespawn = function()
	task.spawn(function()
		local r = findRemote(_lIillIIIl(_1ii1lIli1("\61\94\122\133\132\168\173",131),90))
		if r and r:IsA(_lIillIIIl(_1ii1lIli1("\87\120\142\158\177\176\159\220\227\230\5\8\28\41",144),103)) then
			local ok, res = pcall(function() return r:InvokeServer() end)
			Notify(_lIillIIIl(_1ii1lIli1("\113\146\174\185\184\220\225",157),116), ok and (_lIillIIIl(_1ii1lIli1("\139\172\198\216\214\242\1\0\13\215\237",170),129) .. tostring(res) .. _lIillIIIl(_1ii1lIli1("\124",183),142)) or _lIillIIIl(_1ii1lIli1("\191\224\252\7\6\42\47\244\84\85\100\129\141\146\159",196),155), 2, ok and _lIillIIIl(_1ii1lIli1("\250\10\6\20\36\69\83",209),168) or _lIillIIIl(_1ii1lIli1("\24\16\47\57",222),181))
		else
			Notify(_lIillIIIl(_1ii1lIli1("\13\46\79\90\89\125\130",235),194), _lIillIIIl(_1ii1lIli1("\44\77\105\116\115\151\161\97\193\194\216\232\251\250\195\31\46\65\251\79\102\122\129\133",248),207), 2, _lIillIIIl(_1ii1lIli1("\107\99\130\140",10),220))
		end
	end)
end

local lastHideAt = 0
hideInLockerNow = function(manual)
	local now = os.clock()
	if not manual and now - lastHideAt < 12 then return end
	lastHideAt = now
	task.spawn(function()
		local chk = findRemote(_lIillIIIl(_1ii1lIli1("\81\132\148\160\182\165\214\216\238\246\17\0\47\42\75\90\102",23),233))
		if chk and chk:IsA(_lIillIIIl(_1ii1lIli1("\127\160\182\198\217\216\199\4\11\14\45\48\68\81",36),246)) then
			local ok, inLocker = pcall(function() return chk:InvokeServer() end)
			if ok and inLocker == true then return end
		end
		local hrp = getHRP(); if not hrp then return end
		local best, bestD, bestPrompt = nil, math.huge, nil

		for _, e in ipairs(PromptCache) do
			if e.kind == _lIillIIIl(_1ii1lIli1("\179\196\198\220\228\255",49),8) and e.part.Parent then
				local d = (e.part.Position - hrp.Position).Magnitude
				if d < bestD then best, bestD, bestPrompt = e.part, d, e.prompt end
			end
		end
		if not best then
			if manual then Notify(_lIillIIIl(_1ii1lIli1("\169\216\225\240",62),21), _lIillIIIl(_1ii1lIli1("\201\248\183\24\20\39\52\253\87\104\106\128\136\163\95\179\202\222\229\233",75),34), 2, _lIillIIIl(_1ii1lIli1("\12\4\35\45",88),47)) end
			return
		end
		hrp.CFrame = best.CFrame + best.CFrame.LookVector * 2
		task.wait(0.1)
		if fireproximityprompt and bestPrompt.Parent then pcall(fireproximityprompt, bestPrompt) end
		Notify(_lIillIIIl(_1ii1lIli1("\247\38\47\62",101),60), _lIillIIIl(_1ii1lIli1("\17\64\73\92\111\118\61\148\167\103\193\210\212\234\242\13",114),73), 2, _lIillIIIl(_1ii1lIli1("\86\102\98\112\128\156\170",127),86))
	end)
end

tc(LP.Idled:Connect(function()
	if S.AntiAFK then
		local VirtualUser = game:GetService(_lIillIIIl(_1ii1lIli1("\83\116\139\155\170\164\189\180\224\224\251",140),99))
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
	local hrp = c and c:FindFirstChild(_lIillIIIl(_1ii1lIli1("\95\154\160\162\189\204\212\221\217\4\18\37\15\51\82\98",153),112))
	local hum = c and c:FindFirstChildOfClass(_lIillIIIl(_1ii1lIli1("\121\180\186\188\215\230\238\247",166),125))

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
			bv = Instance.new(_lIillIIIl(_1ii1lIli1("\141\200\203\238\217\246\11\28\30\50\80\99",179),138))
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
				if p:IsA(_lIillIIIl(_1ii1lIli1("\167\212\244\244\237\12\43\59",192),151)) then
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
				if type(ox) == _lIillIIIl(_1ii1lIli1("\243\238\253\21\28",205),164) and ox.TankValue then ox.TankValue.Value = 100 end
			end)
		end
		if S.FastSwim then
			pcall(function()
				local m = getMain(); local sw = m and m.Swimming
				if type(sw) == _lIillIIIl(_1ii1lIli1("\13\8\23\47\59",218),177) then
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
			local r = findRemote(_lIillIIIl(_1ii1lIli1("\3\34\70\67\99\103\128\127\128\163\170\194\202\194\231\245",231),190))
			if r and r.FireServer then pcall(function() r:FireServer() end) end
		end
		task.wait(0.5)
	end
end)
task.spawn(function()
	while not S.Destroyed do
		if S.AutoDozerStealth then

			local r = findRemote(_lIillIIIl(_1ii1lIli1("\22\79\104\97\124\91\157\168\188\184\203\218\237\244\222\17\28\40\62",244),203))
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
		local code = LP:GetAttribute(_lIillIIIl(_1ii1lIli1("\47\105\108\123",6),216))
		if code and tostring(code) ~= "" then
			local rn = LP:GetAttribute(_lIillIIIl(_1ii1lIli1("\88\131\145\162\145\198\204",19),229))
			Notify(_lIillIIIl(_1ii1lIli1("\107\152\186\191\190\207\153\202\4\7\22",32),242), tostring(code) .. (rn and (_lIillIIIl(_1ii1lIli1("\95\109\131\219\230\244\0\193",45),4) .. tostring(rn) .. _lIillIIIl(_1ii1lIli1("\130",58),17)) or ""), 6, _lIillIIIl(_1ii1lIli1("\234\226\1\11",71),30))
		end
	end
	tc(LP:GetAttributeChangedSignal(_lIillIIIl(_1ii1lIli1("\208\10\13\28",84),43)):Connect(announceCode))
	task.spawn(announceCode)
end

local EntityCache = {}
task.spawn(function()
	while not S.Destroyed do
		local found = {}
		local gf = getGF()
		local monstersFolder = gf and gf:FindFirstChild(_lIillIIIl(_1ii1lIli1("\244\36\49\68\83\82\109\124",97),56))
		local function scan(container)
			if not container then return end
			for _, obj in ipairs(container:GetChildren()) do
				if obj:IsA(_lIillIIIl(_1ii1lIli1("\14\62\65\80\101",110),69)) or obj:IsA(_lIillIIIl(_1ii1lIli1("\29\74\106\106\99\130\161\177",123),82)) then
					local kind = monsterKind(obj.Name:lower())
					if kind then found[#found + 1] = { obj = obj, kind = kind } end
				end
			end
		end
		pcall(scan, monstersFolder)
		pcall(scan, Workspace)
		EntityCache = found
		for _, e in ipairs(found) do
			if e.kind == _lIillIIIl(_1ii1lIli1("\98\114\127\146\161\160\187",136),95) or e.kind == _lIillIIIl(_1ii1lIli1("\115\148\144\165\179\186\213",149),108) then
				ShowEntityWarning(e.obj.Name)
				if S.AutoHideInLocker and e.kind == _lIillIIIl(_1ii1lIli1("\150\166\179\198\213\212\239",162),121) then hideInLockerNow(false) end
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
		local check = findRemote(_lIillIIIl(_1ii1lIli1("\134\185\196\208\230\213\6\8\30\38\70\53\100\95\128\143\160",175),134))
		if check and check:IsA(_lIillIIIl(_1ii1lIli1("\175\208\230\246\9\8\247\52\64\67\98\101\121\134",188),147)) then
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
					if e.kind == _lIillIIIl(_1ii1lIli1("\220\254\248\7\20\48\63",201),160) and e.obj.Parent then
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
			local mf = gf and gf:FindFirstChild(_lIillIIIl(_1ii1lIli1("\222\14\27\46\61\65\92\107",214),173))
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
	if not adornee:IsA(_lIillIIIl(_1ii1lIli1("\248\40\43\63\84",227),186)) then return Vector3.new(0, 0, 0) end
	local ok, boxCF = pcall(function() return (adornee:GetBoundingBox()) end)
	if not ok or not boxCF then return Vector3.new(0, 0, 0) end
	local ok2, pivot = pcall(function() return adornee:GetPivot() end)
	if not ok2 or not pivot then return Vector3.new(0, 0, 0) end
	return boxCF.Position - pivot.Position
end
local function mkEspTag(adornee, title, color, strong, style)
	local priority = style == _lIillIIIl(_1ii1lIli1("\48\61\95\87\99\130\130",240),199) or style == _lIillIIIl(_1ii1lIli1("\79\87\121\113\125\161\161\175\200\214\231",2),212)
	local bb = Instance.new(_lIillIIIl(_1ii1lIli1("\64\117\134\153\157\184\184\215\215\200\4\6",15),225))
	bb.Name = _lIillIIIl(_1ii1lIli1("\104\157\158\186\200\216\227\228\210\14\25\11\38\58",28),238)
	bb.Adornee = adornee; bb.AlwaysOnTop = true; bb.LightInfluence = 0
	bb.Size = UDim2.fromOffset(priority and 172 or 134, priority and 42 or 38)
	bb.StudsOffset = Vector3.new(0, 1.8, 0)
	bb.StudsOffsetWorldSpace = centerOffsetFor(adornee)
	bb.MaxDistance = S.ESPMaxDist or 1500
	bb.Parent = adornee

	local card = Instance.new(_lIillIIIl(_1ii1lIli1("\125\183\180\206\212",41),0))
	card.Parent = bb; card.BackgroundColor3 = Color3.fromRGB(9, 9, 10); card.BackgroundTransparency = 0.22
	card.BorderSizePixel = 0; card.Size = UDim2.new(1, 0, 1, 0)
	Corner(card, 9); Stroke(card, color, 1.2, 0.25); Grad(card, Color3.fromRGB(26, 26, 28), Color3.fromRGB(9, 9, 10), 90)

	local dot = Instance.new(_lIillIIIl(_1ii1lIli1("\151\209\206\232\238",54),13))
	dot.Parent = card; dot.AnchorPoint = Vector2.new(0, 0.5)
	dot.Position = UDim2.new(0, 8, 0.3, 0); dot.Size = UDim2.new(0, priority and 8 or 6, 0, priority and 8 or 6); dot.BackgroundColor3 = color
	Corner(dot, priority and 4 or 3)

	local tl = Instance.new(_lIillIIIl(_1ii1lIli1("\191\222\255\9\239\18\33\50\71",67),26))
	tl.Parent = card; tl.BackgroundTransparency = 1
	tl.Position = UDim2.new(0, 18, 0, 2); tl.Size = UDim2.new(1, priority and -72 or -22, 0, 16)
	tl.Font = FM; tl.Text = title; tl.TextColor3 = T.White; tl.TextSize = 13
	tl.TextXAlignment = Enum.TextXAlignment.Left; tl.TextTruncate = Enum.TextTruncate.AtEnd
	if priority then
		local badge = Instance.new(_lIillIIIl(_1ii1lIli1("\217\248\25\35\9\44\59\76\97",80),39))
		badge.Parent = card; badge.AnchorPoint = Vector2.new(1, 0)
		badge.Position = UDim2.new(1, -7, 0, 6); badge.Size = UDim2.fromOffset(48, 13)
		badge.BackgroundColor3 = color; badge.BackgroundTransparency = 0.72
		badge.BorderSizePixel = 0; badge.Font = FB; badge.TextSize = 8; badge.TextColor3 = color
		badge.Text = style == _lIillIIIl(_1ii1lIli1("\10\18\52\44\56\87\87",93),52) and _lIillIIIl(_1ii1lIli1("\9\16\24\46\17\84\93",106),65) or _lIillIIIl(_1ii1lIli1("\20\36\50\66\94\108",119),78)
		Corner(badge, 4); Stroke(badge, color, 1, 0.25)
	end

	local distLbl = Instance.new(_lIillIIIl(_1ii1lIli1("\65\96\129\139\113\148\163\180\201",132),91))
	distLbl.Parent = card; distLbl.BackgroundTransparency = 1
	distLbl.Position = UDim2.new(0, 18, 0, 19); distLbl.Size = UDim2.new(1, -22, 0, 14)
	distLbl.Font = F; distLbl.Text = ""; distLbl.TextColor3 = T.Tx2; distLbl.TextSize = 11
	distLbl.TextXAlignment = Enum.TextXAlignment.Left

	local sc = Instance.new(_lIillIIIl(_1ii1lIli1("\92\94\118\148\160\185\192",145),104)); sc.Scale = 0.6; sc.Parent = card
	Tween(sc, 0.25, { Scale = 1 }, Enum.EasingStyle.Back):Play()

	local hl = Instance.new(_lIillIIIl(_1ii1lIli1("\105\152\164\179\197\208\220\235\5",158),117))
	hl.Name = _lIillIIIl(_1ii1lIli1("\139\187\188\216\230\246\1\2\240\44\55\34\52",171),130); hl.Adornee = adornee; hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
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

				local completedRepair = e.kind == _lIillIIIl(_1ii1lIli1("\199\200\225\224\246\13",184),143) and isRepairComplete(e)
				if e.part.Parent and promptKindOn[e.kind] and not completedRepair and not (e.kind == _lIillIIIl(_1ii1lIli1("\211\236\250\11",197),156) and isDeadEndDoor(e.model)) then
					local displayKind = e.kind
					if e.kind == _lIillIIIl(_1ii1lIli1("\237\6\20\37",210),169) and isKeycardDoor(e) then displayKind = _lIillIIIl(_1ii1lIli1("\14\22\56\53\65\96\96\110\135\154\171",223),182) end
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
						if c.e.kind == _lIillIIIl(_1ii1lIli1("\33\58\77\94",236),195) and doorPassed(c.e.model, objPos(c.e.model) or c.e.part.Position, myPos) then

						else
							local displayKind = c.displayKind
							if c.e.kind == _lIillIIIl(_1ii1lIli1("\64\89\103\120",249),208) and c.e.model:GetAttribute(_lIillIIIl(_1ii1lIli1("\70\118\129\135\165\166\194\208\175\232\246\7",11),221)) then displayKind = _lIillIIIl(_1ii1lIli1("\126\131\169\179\177\202\216\233",24),234) end
							local priority = displayKind == _lIillIIIl(_1ii1lIli1("\154\162\196\188\200\231\231",37),247) or displayKind == _lIillIIIl(_1ii1lIli1("\180\188\222\214\226\1\1\15\40\54\71",50),9)
								or displayKind == _lIillIIIl(_1ii1lIli1("\209\214\247\1\255\24\38\55",63),22) or displayKind == _lIillIIIl(_1ii1lIli1("\239\240\9\8\30\53",76),35) or displayKind == _lIillIIIl(_1ii1lIli1("\13\6\31\55\52",89),48)
							wants[c.e.model] = {
								title = tagTitleFor(c.e), color = ESP_COLORS[displayKind] or ESP_COLORS[c.e.kind],
								strong = priority or c.e.kind == _lIillIIIl(_1ii1lIli1("\25\32\71\60\91\91",102),61) or c.e.kind == _lIillIIIl(_1ii1lIli1("\65\72\80\89\111\128\130\152\160\187",115),74),
								style = displayKind, d = c.d,
							}
						end
					end
				end
			end

			if S.DoorESP then
				local gf2 = getGF()
				local rooms = gf2 and gf2:FindFirstChild(_lIillIIIl(_1ii1lIli1("\55\98\112\124\144",128),87))
				if rooms then
					for _, room in ipairs(rooms:GetChildren()) do
						for _, ch in ipairs(room:GetChildren()) do
							if ch:IsA(_lIillIIIl(_1ii1lIli1("\76\124\127\142\163",141),100)) then
								local isNext = ch:GetAttribute(_lIillIIIl(_1ii1lIli1("\105\153\164\170\195\196\224\238\205\6\20\37",154),113)) == true
								if isNext and not isDeadEndDoor(ch) then
									local p = objPos(ch)
									if p and not doorPassed(ch, p, myPos) then
										local d = (myPos and p) and (p - myPos).Magnitude or 0
										if d <= 500 then
											wants[ch] = { title = _lIillIIIl(_1ii1lIli1("\129\134\167\177\139\203\214\228\240\209\253\16",167),126), color = ESP_COLORS.nextdoor, strong = true, style = _lIillIIIl(_1ii1lIli1("\187\192\225\235\233\2\16\33",180),139), d = d }
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
					if p then e.distLbl.Text = math.floor((p - myPos).Magnitude + 0.5) .. _lIillIIIl(_1ii1lIli1("\212",193),152) end
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
						if S.AutoOpenDoors and e.kind == _lIillIIIl(_1ii1lIli1("\229\254\12\29",206),165) and not isDeadEndDoor(e.model) and d <= 12 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoCollectItems and (e.kind == _lIillIIIl(_1ii1lIli1("\254\30\41\55\61\84\87\123",219),178) or e.kind == _lIillIIIl(_1ii1lIli1("\30\55\59\81",232),191)) and d <= 18 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoSearchDrawers and e.kind == _lIillIIIl(_1ii1lIli1("\56\84\81\117\113\140",245),204) and d <= 10 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoCollectKeys and e.kind == _lIillIIIl(_1ii1lIli1("\89\97\131\123\140\171\171",7),217) and d <= 18 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoRefillBatteries and e.kind == _lIillIIIl(_1ii1lIli1("\122\123\143\160\177\191",20),230) and d <= 7 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoTurnValves and e.kind == _lIillIIIl(_1ii1lIli1("\152\150\175\199\196",33),243) and d <= 5 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoDisarmLandmines and e.interactionType == _lIillIIIl(_1ii1lIli1("\141\176\203\207\230\240\3\8",46),5) and d <= 5.5 then pcall(fireproximityprompt, e.prompt)
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
				if e.kind == _lIillIIIl(_1ii1lIli1("\205\206\231\230\252\19",59),18) and e.interactionRoot and e.interactionRoot.Parent and e.part.Parent then
					local fixed = e.interactionRoot:FindFirstChild(_lIillIIIl(_1ii1lIli1("\187\236\9\4\17",72),31))
					if fixed and tonumber(fixed.Value) and fixed.Value < 100 and (e.part.Position - myPos).Magnitude <= 5.25 then
						target = e
						break
					end
				end
			end
			if not target then return end

			local root = target.interactionRoot
			local remoteFunction = root:FindFirstChild(_lIillIIIl(_1ii1lIli1("\225\2\24\40\59\58\41\102\109\112\143\146\166\179",85),44))
			local remoteEvent = root:FindFirstChild(_lIillIIIl(_1ii1lIli1("\251\28\50\66\85\84\66\129\126\149\169",98),57))
			if not (remoteFunction and remoteFunction:IsA(_lIillIIIl(_1ii1lIli1("\21\54\76\92\111\110\93\154\161\164\195\198\218\231",111),70)) and remoteEvent and remoteEvent:IsA(_lIillIIIl(_1ii1lIli1("\47\80\102\118\137\136\118\181\178\201\221",124),83))) then return end
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

local ESPGui = Instance.new(_lIillIIIl(_1ii1lIli1("\74\104\133\134\148\171\146\206\208",137),96))
ESPGui.Name = _lIillIIIl(_1ii1lIli1("\97\145\146\174\188\204\215\216\198\226\237",150),109); ESPGui.ResetOnSpawn = false; ESPGui.IgnoreGuiInset = true; ESPGui.DisplayOrder = 950
pcall(function() ESPGui.Parent = uiP end)
table.insert(UIStyle.Roots, ESPGui)
SG.Destroying:Connect(function() pcall(function() ESPGui:Destroy() end) end)

local KeycardTracer = Instance.new(_lIillIIIl(_1ii1lIli1("\113\171\168\194\200",163),122))
KeycardTracer.BorderSizePixel = 0
KeycardTracer.AnchorPoint = Vector2.new(0.5, 0.5)
KeycardTracer.Size = UDim2.new(0, 2, 0, 0)
KeycardTracer.BackgroundColor3 = ESP_COLORS.keycard
KeycardTracer.BackgroundTransparency = 0.03
KeycardTracer.Visible = false
KeycardTracer.Parent = ESPGui
Corner(KeycardTracer, 1)

local KeycardBeacon = Instance.new(_lIillIIIl(_1ii1lIli1("\153\184\217\227\201\236\251\12\33",176),135))
KeycardBeacon.Name = _lIillIIIl(_1ii1lIli1("\175\223\224\252\10\26\37\38\31\71\105\97\109\140\145\125\174\184\200\226\239",189),148)
KeycardBeacon.AnchorPoint = Vector2.new(0.5, 1)
KeycardBeacon.Size = UDim2.fromOffset(138, 24)
KeycardBeacon.BackgroundColor3 = Color3.fromRGB(24, 19, 7)
KeycardBeacon.BackgroundTransparency = 0.12
KeycardBeacon.BorderSizePixel = 0
KeycardBeacon.Font = FB
KeycardBeacon.TextSize = 11
KeycardBeacon.TextColor3 = ESP_COLORS.keycard
KeycardBeacon.Text = _lIillIIIl(_1ii1lIli1("\196\204\238\230\242\17\22",202),161)
KeycardBeacon.Visible = false
KeycardBeacon.Parent = ESPGui
Corner(KeycardBeacon, 7)
Stroke(KeycardBeacon, ESP_COLORS.keycard, 1, 0.15)

local NextDoorTracer = Instance.new(_lIillIIIl(_1ii1lIli1("\217\19\16\42\48",215),174))
NextDoorTracer.Name = _lIillIIIl(_1ii1lIli1("\253\45\46\79\93\109\120\121\112\154\187\197\163\220\234\251\238\6\44\49\62\70\89\109",228),187)
NextDoorTracer.BorderSizePixel = 0
NextDoorTracer.AnchorPoint = Vector2.new(0.5, 0.5)
NextDoorTracer.Size = UDim2.new(0, 2, 0, 0)
NextDoorTracer.BackgroundColor3 = ESP_COLORS.nextdoor
NextDoorTracer.BackgroundTransparency = 0.05
NextDoorTracer.Visible = false
NextDoorTracer.Parent = ESPGui
Corner(NextDoorTracer, 1)

local StatusHUD = Instance.new(_lIillIIIl(_1ii1lIli1("\13\76\73\99\105",241),200))
StatusHUD.Name = _lIillIIIl(_1ii1lIli1("\54\102\103\131\145\166\177\178\174\221\216\249\8\20\247\18\15",3),213)
StatusHUD:SetAttribute(_lIillIIIl(_1ii1lIli1("\83\113\125\155\158\173\197\204\189\216\213",16),226), true)
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
statusSurface.Name = _lIillIIIl(_1ii1lIli1("\98\130\127\156\204\215\217\226\242\2\242\43\40\57\76\86\109\129",29),239)
local statusTop = Instance.new(_lIillIIIl(_1ii1lIli1("\127\185\182\208\214",42),1))
statusTop.Parent = StatusHUD; statusTop.Size = UDim2.new(1, 0, 0, 28)
statusTop.BackgroundColor3 = T.Elev; statusTop.BackgroundTransparency = 0.025; statusTop.BorderSizePixel = 0
Corner(statusTop, 10)
local statusHeaderGradient = Grad(statusTop, T.White:Lerp(T.Accent, 0.14), T.White:Lerp(T.Card, 0.06), 0)
statusHeaderGradient.Name = _lIillIIIl(_1ii1lIli1("\155\182\179\197\240\250\11\26\53\24\81\78\95\114\124\147\167",55),14)
local statusTopLine = Instance.new(_lIillIIIl(_1ii1lIli1("\179\237\234\4\10",68),27))
statusTopLine.Parent = statusTop; statusTopLine.AnchorPoint = Vector2.new(0, 1)
statusTopLine.Position = UDim2.new(0, 0, 1, 0); statusTopLine.Size = UDim2.new(1, 0, 0, 1)
statusTopLine.BackgroundColor3 = T.Bd; statusTopLine.BackgroundTransparency = 0.2; statusTopLine.BorderSizePixel = 0
local statusTick = Instance.new(_lIillIIIl(_1ii1lIli1("\205\7\4\30\36",81),40))
statusTick.Parent = statusTop; statusTick.Position = UDim2.new(0, 8, 0.5, -6); statusTick.Size = UDim2.fromOffset(2, 12)
statusTick.BackgroundColor3 = T.Accent; statusTick.BorderSizePixel = 0; Corner(statusTick, 2)

local statusHeader = Instance.new(_lIillIIIl(_1ii1lIli1("\245\20\53\63\37\72\87\104\125",94),53))
statusHeader.Parent = statusTop; statusHeader.BackgroundTransparency = 1
statusHeader.Position = UDim2.fromOffset(16, 0); statusHeader.Size = UDim2.new(1, -24, 1, 0)
statusHeader.Font = FB; statusHeader.TextSize = 11; statusHeader.TextColor3 = T.Tx
statusHeader.TextXAlignment = Enum.TextXAlignment.Left; statusHeader.Text = _lIillIIIl(_1ii1lIli1("\3\10\27\38\63\33\62\76\75\143\144\169\164\189\210",107),66)
end

local statusRoom = Instance.new(_lIillIIIl(_1ii1lIli1("\41\72\105\115\89\124\139\156\177",120),79))
statusRoom.Parent = StatusHUD; statusRoom.BackgroundTransparency = 1
statusRoom.Position = UDim2.fromOffset(12, 31); statusRoom.Size = UDim2.new(1, -24, 0, 16)
statusRoom.Font = FM; statusRoom.TextSize = 12; statusRoom.TextColor3 = T.White
statusRoom.TextXAlignment = Enum.TextXAlignment.Left; statusRoom.Text = _lIillIIIl(_1ii1lIli1("\65\76\90\102\71\23\195\229",133),92)

local function mkVitalRow(parent, label, y)
	local text = Instance.new(_lIillIIIl(_1ii1lIli1("\93\124\157\167\141\176\191\208\229",146),105))
	text.Parent = parent; text.BackgroundTransparency = 1
	text.Position = UDim2.fromOffset(12, y); text.Size = UDim2.new(1, -24, 0, 14)
	text.Font = F; text.TextSize = 11; text.TextColor3 = T.Tx2; text.TextXAlignment = Enum.TextXAlignment.Left
	local back = Instance.new(_lIillIIIl(_1ii1lIli1("\105\163\160\186\192",159),118))
	back.Parent = parent; back.Position = UDim2.fromOffset(12, y + 16); back.Size = UDim2.new(1, -24, 0, 4)
	back.BackgroundColor3 = T.Bd2; back.BorderSizePixel = 0; Corner(back, 2)
	local fill = Instance.new(_lIillIIIl(_1ii1lIli1("\131\189\186\212\218",172),131))
	fill.Parent = back; fill.Size = UDim2.new(1, 0, 1, 0); fill.BackgroundColor3 = T.Tx
	fill.BorderSizePixel = 0; Corner(fill, 2)
	return text, fill
end
local oxygenText, oxygenFill = mkVitalRow(StatusHUD, "", 49)
local healthText, healthFill = mkVitalRow(StatusHUD, "", 73)

local KeybindHUD = Instance.new(_lIillIIIl(_1ii1lIli1("\157\215\212\238\244",185),144))
KeybindHUD.Name = _lIillIIIl(_1ii1lIli1("\193\241\242\14\28\44\55\61\49\89\123\114\135\159\163\149\176\173",198),157)
KeybindHUD:SetAttribute(_lIillIIIl(_1ii1lIli1("\222\252\8\33\36\56\80\87\72\99\96",211),170), true)
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
keybindSurface.Name = _lIillIIIl(_1ii1lIli1("\237\8\5\39\87\98\100\109\125\146\130\187\184\201\220\230\253\17",224),183)
local keybindTop = Instance.new(_lIillIIIl(_1ii1lIli1("\5\68\65\91\97",237),196))
keybindTop.Parent = KeybindHUD; keybindTop.Size = UDim2.new(1, 0, 0, 28)
keybindTop.BackgroundColor3 = T.Elev; keybindTop.BackgroundTransparency = 0.025; keybindTop.BorderSizePixel = 0
Corner(keybindTop, 10)
local keybindHeaderGradient = Grad(keybindTop, T.White:Lerp(T.Accent, 0.14), T.White:Lerp(T.Card, 0.06), 0)
keybindHeaderGradient.Name = _lIillIIIl(_1ii1lIli1("\38\65\62\80\123\138\155\170\197\168\225\222\239\2\12\35\55",250),209)
local keybindTopLine = Instance.new(_lIillIIIl(_1ii1lIli1("\62\120\117\143\154",12),222))
keybindTopLine.Parent = keybindTop; keybindTopLine.AnchorPoint = Vector2.new(0, 1)
keybindTopLine.Position = UDim2.new(0, 0, 1, 0); keybindTopLine.Size = UDim2.new(1, 0, 0, 1)
keybindTopLine.BackgroundColor3 = T.Bd; keybindTopLine.BackgroundTransparency = 0.2; keybindTopLine.BorderSizePixel = 0
local keybindTick = Instance.new(_lIillIIIl(_1ii1lIli1("\88\146\148\174\180",25),235))
keybindTick.Parent = keybindTop; keybindTick.Position = UDim2.new(0, 8, 0.5, -6); keybindTick.Size = UDim2.fromOffset(2, 12)
keybindTick.BackgroundColor3 = T.Accent; keybindTick.BorderSizePixel = 0; Corner(keybindTick, 2)

local keybindTitle = Instance.new(_lIillIIIl(_1ii1lIli1("\133\164\197\207\181\216\231\248\13",38),248))
keybindTitle.Parent = keybindTop; keybindTitle.BackgroundTransparency = 1
keybindTitle.Position = UDim2.fromOffset(16, 0); keybindTitle.Size = UDim2.new(1, -24, 1, 0)
keybindTitle.Font = FB; keybindTitle.TextSize = 11; keybindTitle.TextColor3 = T.Tx
keybindTitle.TextXAlignment = Enum.TextXAlignment.Left; keybindTitle.Text = _lIillIIIl(_1ii1lIli1("\150\158\192\183\204\223\227\0",51),10)
end

local KeybindRows = {}
local function getKeybindRow(index)
	local row = KeybindRows[index]
	if row then return row end
	row = Instance.new(_lIillIIIl(_1ii1lIli1("\171\229\226\252\2",64),23))
	row.Name = _lIillIIIl(_1ii1lIli1("\193\246\9\13\9\52\74",77),36); row.Parent = KeybindHUD
	row.BackgroundColor3 = T.Elev; row.BackgroundTransparency = 0.38
	row.BorderSizePixel = 0; row.Size = UDim2.new(1, -16, 0, 18)
	Corner(row, 5)
	local label = Instance.new(_lIillIIIl(_1ii1lIli1("\237\12\45\55\29\64\79\96\117",90),49))
	label.Name = _lIillIIIl(_1ii1lIli1("\255\34\49\66\87",103),62); label.Parent = row; label.BackgroundTransparency = 1
	label.Position = UDim2.fromOffset(7, 0); label.Size = UDim2.new(1, -66, 1, 0)
	label.Font = F; label.TextSize = 11; label.TextColor3 = T.Tx2
	label.TextXAlignment = Enum.TextXAlignment.Left; label.TextTruncate = Enum.TextTruncate.AtEnd
	local key = Instance.new(_lIillIIIl(_1ii1lIli1("\33\64\97\107\81\116\131\148\169",116),75))
	key.Name = _lIillIIIl(_1ii1lIli1("\50\90\124",129),88); key.Parent = row; key.BackgroundTransparency = 1
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
			local show = entry.kind ~= _lIillIIIl(_1ii1lIli1("\117\126\132\146\165\172",142),101)
			if entry.kind == _lIillIIIl(_1ii1lIli1("\143\152\158\172\191\198",155),114) and entry.isActive then
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
		row.Label.TextColor3 = data.entry.kind == _lIillIIIl(_1ii1lIli1("\169\178\184\198\217\224",168),127) and T.White or T.Tx2
		row.Key.TextColor3 = data.entry.kind == _lIillIIIl(_1ii1lIli1("\195\204\210\224\243\250",181),140) and T.Accent or T.Tx
	end
	for i = #entries + 1, #KeybindRows do KeybindRows[i].Visible = false end
end
UIStyle:ApplyHUDScale(S.HUDScale)
S._markKeybindHUDDirty()

do
	local island = Instance.new(_lIillIIIl(_1ii1lIli1("\175\233\230\0\6",194),153))
	island.Name = _lIillIIIl(_1ii1lIli1("\211\3\4\32\46\62\78\79\60\127\130\131\162\172\180\168\224\231\234\5\9",207),166)
	island:SetAttribute(_lIillIIIl(_1ii1lIli1("\240\14\26\51\59\74\98\105\90\117\119",220),179), true)
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
	islandGrad.Name = _lIillIIIl(_1ii1lIli1("\251\62\70\71\97\107\115\103\164\171\174\201\205\190\247\244\5\24\34\57\77",233),192)
	local islandScale = Instance.new(_lIillIIIl(_1ii1lIli1("\43\45\69\99\111\136\148",246),205))
	islandScale.Name = _lIillIIIl(_1ii1lIli1("\56\83\80\111\160\160\187\170\200\212\237\244",8),218); islandScale.Scale = S.HUDScale; islandScale.Parent = island
	local iDot = Instance.new(_lIillIIIl(_1ii1lIli1("\80\138\140\166\172",21),231))
	iDot.Parent = island
	iDot.AnchorPoint = Vector2.new(0, 0.5)
	iDot.Position = UDim2.new(0, 13, 0.5, 0)
	iDot.Size = UDim2.fromOffset(6, 6)
	iDot.BackgroundColor3 = T.Accent
	iDot.BackgroundTransparency = 0.05
	iDot.BorderSizePixel = 0
	Corner(iDot, 4)
	local iBrand = Instance.new(_lIillIIIl(_1ii1lIli1("\125\156\189\199\173\208\223\240\5",34),244))
	iBrand.Parent = island
	iBrand.Position = UDim2.new(0, 26, 0, 0)
	iBrand.Size = UDim2.new(0, 72, 1, 0)
	iBrand.BackgroundTransparency = 1
	iBrand.Font = FB
	iBrand.TextSize = 12
	iBrand.TextColor3 = T.White
	iBrand.TextYAlignment = Enum.TextYAlignment.Center
	iBrand.TextXAlignment = Enum.TextXAlignment.Left
	iBrand.Text = _lIillIIIl(_1ii1lIli1("\140\159\164\191\207\210\216",47),6)
	local iDiv = Instance.new(_lIillIIIl(_1ii1lIli1("\163\221\218\244\250",60),19))
	iDiv.Parent = island
	iDiv.Position = UDim2.new(0, 104, 0.5, -12)
	iDiv.Size = UDim2.fromOffset(1, 24)
	iDiv.BackgroundColor3 = T.Bd2
	iDiv.BackgroundTransparency = 0.28
	iDiv.BorderSizePixel = 0
	local function islandMetric(x, width, caption)
		local key = Instance.new(_lIillIIIl(_1ii1lIli1("\203\234\11\21\251\30\45\62\83",73),32))
		key.Parent = island
		key.Position = UDim2.fromOffset(x, 6)
		key.Size = UDim2.fromOffset(width, 12)
		key.BackgroundTransparency = 1
		key.Font = FB
		key.TextSize = 10
		key.TextColor3 = T.Tx3
		key.TextXAlignment = Enum.TextXAlignment.Left
		key.Text = caption
		local value = Instance.new(_lIillIIIl(_1ii1lIli1("\229\4\37\47\21\56\71\88\109",86),45))
		value.Parent = island
		value.Position = UDim2.fromOffset(x, 19)
		value.Size = UDim2.fromOffset(width, 20)
		value.BackgroundTransparency = 1
		value.Font = FM
		value.TextSize = 13
		value.TextColor3 = T.Tx
		value.TextXAlignment = Enum.TextXAlignment.Left
		value.TextTruncate = Enum.TextTruncate.AtEnd
		value.Text = _lIillIIIl(_1ii1lIli1("\141\57\91",99),58)
		return value
	end
	local iO2 = islandMetric(116, 60, _lIillIIIl(_1ii1lIli1("\20\5",112),71))
	local iPing = islandMetric(190, 52, _lIillIIIl(_1ii1lIli1("\47\54\73\80",125),84))
	local iFps = islandMetric(250, 44, _lIillIIIl(_1ii1lIli1("\63\87\104",138),97))
	local iTime = islandMetric(302, 60, _lIillIIIl(_1ii1lIli1("\103\106\124\130",151),110))

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
			island:SetAttribute(_lIillIIIl(_1ii1lIli1("\122\170\171\192\209\216\199\248\17",164),123), math.clamp((vp.X - 32) / 420, 0.40, 0.65))
			islandScale.Scale = S.HUDScale * (tonumber(island:GetAttribute(_lIillIIIl(_1ii1lIli1("\148\196\197\218\235\242\225\18\43",177),136))) or 1)
		end
		fitIsland()
		tc(cam():GetPropertyChangedSignal(_lIillIIIl(_1ii1lIli1("\183\216\226\2\9\22\39\55\41\77\108\101",190),149)):Connect(fitIsland))
	end

	S._islandGulp = function(outward)
		if not island.Visible then return end

		local base = S.HUDScale * (tonumber(island:GetAttribute(_lIillIIIl(_1ii1lIli1("\200\248\249\14\31\38\26\75\100",203),162))) or 1)

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
				local tank = type(ox) == _lIillIIIl(_1ii1lIli1("\9\4\19\43\55",216),175) and ox.TankValue or nil
				local oxygen = tank and tonumber(tank.Value) or nil
				iO2.Text = oxygen and (tostring(math.floor(oxygen + 0.5)) .. _lIillIIIl(_1ii1lIli1("\212",229),188)) or _lIillIIIl(_1ii1lIli1("\171\92\126",242),201)
				local lowO2 = oxygen and oxygen <= 25
				iO2.TextColor3 = lowO2 and Color3.fromRGB(255, 180, 75) or T.Tx
				iDot.BackgroundColor3 = lowO2 and Color3.fromRGB(255, 180, 75) or T.Accent
				local ping = math.floor((LP:GetNetworkPing() or 0) * 1000 + 0.5)
				iPing.Text = ping .. _lIillIIIl(_1ii1lIli1("\85\105",4),214)
				iFps.Text = tostring(fpsMeter.value)
				local elapsed = os.time() - islandStart
				if elapsed >= 3600 then
					iTime.Text = string.format(_lIillIIIl(_1ii1lIli1("\39\64\80\149\121\114\139\155\219",17),227), math.floor(elapsed / 3600), math.floor((elapsed % 3600) / 60))
				else
					iTime.Text = string.format(_lIillIIIl(_1ii1lIli1("\65\95\111\175\147\140\165\181\245",30),240), math.floor(elapsed / 60), elapsed % 60)
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
	local holder = Instance.new(_lIillIIIl(_1ii1lIli1("\129\187\184\210\216",43),2))
	holder.Name = _lIillIIIl(_1ii1lIli1("\165\213\214\242\0\16\27\28\25\59\83\84\94\127\90\153\167\178\200",56),15)
	holder.AnchorPoint = Vector2.new(0.5, 0.5)
	holder.Size = UDim2.fromOffset(96, 46)
	holder.BackgroundTransparency = 1
	holder.Visible = false
	holder.Parent = ESPGui
	local arrow = Instance.new(_lIillIIIl(_1ii1lIli1("\195\226\3\13\243\22\37\54\75",69),28))
	arrow.Parent = holder; arrow.BackgroundTransparency = 1
	arrow.AnchorPoint = Vector2.new(0.5, 0.5); arrow.Position = UDim2.fromOffset(48, 12)
	arrow.Size = UDim2.fromOffset(24, 24); arrow.Font = FB; arrow.TextSize = 20
	arrow.Text = _lIillIIIl(_1ii1lIli1("\107\45\87",82),41); arrow.TextColor3 = Color3.fromRGB(255, 85, 85)
	local label = Instance.new(_lIillIIIl(_1ii1lIli1("\247\22\55\65\39\74\89\106\127",95),54))
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
	local legacy = ch and ch:FindFirstChild(_lIillIIIl(_1ii1lIli1("\13\61\62\90\104\120\131\132\125\167\170\208\202\229\196\247\254\24",108),67))
	if legacy then pcall(function() legacy:Destroy() end) end
end

local function createTeammateCham(plr, ch)
	local proxy = Instance.new(_lIillIIIl(_1ii1lIli1("\36\84\87\102\123",121),80))
	proxy.Name = _lIillIIIl(_1ii1lIli1("\65\113\114\142\156\172\183\184\181\212\222\248\6\8\41\40\25\76\83\109",134),93)
	local links = {}
	for _, source in ipairs(ch:GetDescendants()) do
		if source:IsA(_lIillIIIl(_1ii1lIli1("\77\122\154\154\147\178\209\225",147),106)) and source.Name ~= _lIillIIIl(_1ii1lIli1("\109\168\174\176\203\218\226\235\231\18\32\51\34\65\96\112",160),119) then
			local ok, copy = pcall(function() return source:Clone() end)
			if ok and copy and copy:IsA(_lIillIIIl(_1ii1lIli1("\129\174\206\206\199\230\5\21",173),132)) then

				for _, child in ipairs(copy:GetChildren()) do
					if not (child:IsA(_lIillIIIl(_1ii1lIli1("\172\215\218\230\250\0\25\8\46\79\82",186),145)) or child:IsA(_lIillIIIl(_1ii1lIli1("\183\230\242\254\23",199),158)) or child:IsA(_lIillIIIl(_1ii1lIli1("\225\0\33\43\58\74\75",212),171))) then
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
	local hl = Instance.new(_lIillIIIl(_1ii1lIli1("\239\30\42\62\80\91\103\118\144",225),184))
	hl.Name = _lIillIIIl(_1ii1lIli1("\17\70\71\99\113\129\140\146\139\181\184\222\216\243\210\5\12\38",238),197); hl.Adornee = proxy; hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
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
		local room = LP:GetAttribute(_lIillIIIl(_1ii1lIli1("\50\93\107\119\102\160\166",0),210))
		statusRoom.Text = _lIillIIIl(_1ii1lIli1("\76\87\101\118\87",13),223) .. (room and tostring(room) or _lIillIIIl(_1ii1lIli1("\246\162\201",26),236))
		local hum = getHum()
		local hp = hum and math.clamp(hum.Health, 0, hum.MaxHealth > 0 and hum.MaxHealth or 100) or 0
		local maxHp = hum and hum.MaxHealth > 0 and hum.MaxHealth or 100
		local hpRatio = math.clamp(hp / maxHp, 0, 1)
		healthText.Text = _lIillIIIl(_1ii1lIli1("\137\138\163\158\183\204\167\181",39),249) .. tostring(math.floor(hp + 0.5)) .. _lIillIIIl(_1ii1lIli1("\109\138\137",52),11) .. tostring(math.floor(maxHp + 0.5))
		healthFill.Size = UDim2.new(hpRatio, 0, 1, 0)
		healthFill.BackgroundColor3 = hpRatio <= 0.3 and Color3.fromRGB(255, 82, 82) or T.Tx

		local m = getMain(); local ox = m and m.OxygenTank
		local tank = type(ox) == _lIillIIIl(_1ii1lIli1("\219\214\229\253\4",65),24) and ox.TankValue or nil
		local oxygen = tank and tonumber(tank.Value) or 100
		local oxyRatio = math.clamp(oxygen / 100, 0, 1)
		oxygenText.Text = _lIillIIIl(_1ii1lIli1("\208\231\246\242\254\21\245\3",78),37) .. tostring(math.floor(oxygen + 0.5)) .. _lIillIIIl(_1ii1lIli1("\192",91),50)
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
		if e.obj.Parent and (e.kind == _lIillIIIl(_1ii1lIli1("\34\50\63\82\97\96\123",104),63) or e.kind == _lIillIIIl(_1ii1lIli1("\51\84\80\101\115\122\149",117),76) or e.kind == _lIillIIIl(_1ii1lIli1("\78\112\106\121\134\162\177",130),89) or e.kind == _lIillIIIl(_1ii1lIli1("\118\130\148\150\159\173\195\202",143),102) or e.kind == _lIillIIIl(_1ii1lIli1("\128\140\171\181\182\215\218\238\251",156),115)) then
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
			arrow.label.Text = string.upper(candidate.e.obj.Name) .. _lIillIIIl(_1ii1lIli1("\87\101",169),128) .. tostring(math.floor(candidate.d + 0.5)) .. _lIillIIIl(_1ii1lIli1("\190",182),141)
			arrow.holder.Visible = true
		else
			arrow.holder.Visible = false
		end
	end
end))

local ESPObjects = {}
local function makeESP(plr)
	local o = {}
	o.box = Instance.new(_lIillIIIl(_1ii1lIli1("\177\235\232\2\8",195),154))
	o.box.BackgroundTransparency = 1; o.box.BorderSizePixel = 0; o.box.Visible = false; o.box.Parent = ESPGui
	o.boxStroke = Instance.new(_lIillIIIl(_1ii1lIli1("\218\220\244\35\47\58\73\81",208),167))
	o.boxStroke.Thickness = 1.5; o.boxStroke.Color = Color3.fromRGB(120, 220, 255); o.boxStroke.Parent = o.box
	Corner(o.box, 4)

	o.tracer = Instance.new(_lIillIIIl(_1ii1lIli1("\229\31\28\54\65",221),180))
	o.tracer.BorderSizePixel = 0; o.tracer.AnchorPoint = Vector2.new(0.5, 0.5)
	o.tracer.Size = UDim2.new(0, 1, 0, 0); o.tracer.BackgroundColor3 = Color3.fromRGB(120, 220, 255)
	o.tracer.BackgroundTransparency = 0.25; o.tracer.Visible = false; o.tracer.Parent = ESPGui
	Corner(o.tracer, 1)

	o.bill = Instance.new(_lIillIIIl(_1ii1lIli1("\251\48\70\84\88\115\115\146\151\136\196\198",234),193))
	o.bill.Size = UDim2.fromOffset(150, 36); o.bill.AlwaysOnTop = true; o.bill.LightInfluence = 0
	o.bill.StudsOffset = Vector3.new(0, 2.6, 0); o.bill.Enabled = false; o.bill.Parent = ESPGui

	o.card = Instance.new(_lIillIIIl(_1ii1lIli1("\30\88\85\111\117",247),206))
	o.card.Parent = o.bill; o.card.BackgroundColor3 = Color3.fromRGB(9, 9, 10); o.card.BackgroundTransparency = 0.22
	o.card.BorderSizePixel = 0; o.card.Size = UDim2.new(1, 0, 1, 0)
	Corner(o.card, 8); Stroke(o.card, Color3.fromRGB(120, 220, 255), 1.2, 0.25); Grad(o.card, Color3.fromRGB(26, 26, 28), Color3.fromRGB(9, 9, 10), 90)

	local dot = Instance.new(_lIillIIIl(_1ii1lIli1("\56\114\111\137\148",9),219))
	dot.Parent = o.card; dot.AnchorPoint = Vector2.new(0, 0.5)
	dot.Position = UDim2.new(0, 8, 0.5, 0); dot.Size = UDim2.new(0, 6, 0, 6); dot.BackgroundColor3 = Color3.fromRGB(120, 220, 255)
	Corner(dot, 3)

	o.txt = Instance.new(_lIillIIIl(_1ii1lIli1("\96\127\165\175\149\184\199\216\237",22),232))
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
			local hrp = ch and ch:FindFirstChild(_lIillIIIl(_1ii1lIli1("\115\174\180\182\209\224\232\241\237\24\38\57\35\66\97\113",35),245))
			local head = ch and (ch:FindFirstChild(_lIillIIIl(_1ii1lIli1("\141\184\194\211",48),7)) or hrp)
			local hum = ch and ch:FindFirstChildOfClass(_lIillIIIl(_1ii1lIli1("\167\226\232\234\5\20\28\37",61),20))
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
					if S.HealthESP and hum then parts[#parts + 1] = math.floor(hum.Health + 0.5) .. _lIillIIIl(_1ii1lIli1("\153\207\229",74),33) end
					parts[#parts + 1] = math.floor(dist + 0.5) .. _lIillIIIl(_1ii1lIli1("\0",87),46)
					o.txt.Text = table.concat(parts, _lIillIIIl(_1ii1lIli1("\205\219\139\142\5\19",100),59))
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
			if e.kind == _lIillIIIl(_1ii1lIli1("\50\58\92\84\96\127\127",113),72) and e.part.Parent and hrp then
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
				KeycardBeacon.Text = bestEntry and bestEntry.name == _lIillIIIl(_1ii1lIli1("\36\94\97\112\91\153\154\164\180\199\210\237",126),85) and _lIillIIIl(_1ii1lIli1("\62\88\91\106\83\131\161\162\172\188\207\218\245",139),98) or _lIillIIIl(_1ii1lIli1("\96\104\138\130\142\173\173",152),111)
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
			if e.kind == _lIillIIIl(_1ii1lIli1("\147\172\186\203",165),124) and e.part.Parent and not isDeadEndDoor(e.model) and e.model:GetAttribute(_lIillIIIl(_1ii1lIli1("\153\201\212\218\243\244\16\30\253\54\73\90",178),137)) and hrp then
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
		if r and (r:IsA(_lIillIIIl(_1ii1lIli1("\181\214\236\252\15\14\252\59\61\84\104",191),150)) or r:IsA(_lIillIIIl(_1ii1lIli1("\210\249\11\12\33\44\55\70\94\101\96\129\156\172\191\190\172\235\232\255\19",204),163))) then
			tc(r.OnClientEvent:Connect(function(...) pcall(fn, ...) end))
		end
	end

	hookEvent(_lIillIIIl(_1ii1lIli1("\218\13\20\52\57",217),176), function()
		ShowEntityWarning(_lIillIIIl(_1ii1lIli1("\244\7\19\51\51\28\83\102\110\136\148\158\177\184",230),189), _lIillIIIl(_1ii1lIli1("\29\83\90\26\119\136\73\159\174\183\198\143\230\249\185\8\213\47\64\66\88\96\123",243),202))
		if S.AutoHideInLocker then hideInLockerNow(false) end
	end)
	hookEvent(_lIillIIIl(_1ii1lIli1("\61\105\123\125\134\153\175\182",5),215), function() ShowEntityWarning(_lIillIIIl(_1ii1lIli1("\87\99\117\124\133\147\169\176",18),228), _lIillIIIl(_1ii1lIli1("\113\153\168\187\192\137\240\244\8\19\207\41\52\64\79\105\35\64\63\152\160\174\199\133\215\234\2\17\12\39\42\63",31),241)) end)
	hookEvent(_lIillIIIl(_1ii1lIli1("\141\172\199\203\218\240\0\13\22\48\54\27\84\98\115\91\140\142\164",44),3), function() ShowEntityWarning(_lIillIIIl(_1ii1lIli1("\167\166\193\197\212\234\250\7\16\42\48",57),16), _lIillIIIl(_1ii1lIli1("\181\238\252\13\28\215\38\69\70\15\105\122\124\146\158\177\184",70),29)) end)
	hookEvent(_lIillIIIl(_1ii1lIli1("\219\254\25\34\36\63\68\91\111\78\144\138\153\166\194\209\204\237\240\4\17",83),42), function() ShowEntityWarning(_lIillIIIl(_1ii1lIli1("\234\12\6\21\34\62\77\72\105\108\128\141",96),55), _lIillIIIl(_1ii1lIli1("\3\60\251\87\102\121\51\141\158\172\182\121\200\233\163\250\19",109),68)) end)
	hookEvent(_lIillIIIl(_1ii1lIli1("\28\72\103\113\114\147\150\170\183\160\211\215\234\242\254\31\40\57",122),81), function() ShowEntityWarning(_lIillIIIl(_1ii1lIli1("\54\66\97\107\108\141\144\164\177",135),94), _lIillIIIl(_1ii1lIli1("\96\143\138\169\170\115\202\227\157\239\8\30\35\239\246\72\97\110\53\144\79\169\186\200\210\149\228\8\0\38",148),107)) end)
	hookEvent(_lIillIIIl(_1ii1lIli1("\107\164\189\182\209\192\222\251\252\10\33\20\60\81\103",161),120), function() if S.BossAlerts then Notify(_lIillIIIl(_1ii1lIli1("\133\190\215\208\235",174),133), _lIillIIIl(_1ii1lIli1("\159\216\241\234\5\193\20\43\46\77\97\104\124\123\155\87\166\182\213\216\243\240\185\137\53\87\241\76\92\113\110\55\150\168\170\180\209\215\242",187),146), 4, _lIillIIIl(_1ii1lIli1("\236\228\3\13",200),159)) end end)
	hookEvent(_lIillIIIl(_1ii1lIli1("\211\12\26\38\41\76\81\100\107\119\146\135\176\182\196\215\222\218\248\21\22\32\58",213),172), function() if S.BossAlerts then Notify(_lIillIIIl(_1ii1lIli1("\237\38\52\69\72\102\107\126\133\150\177",226),185), _lIillIIIl(_1ii1lIli1("\5\69\87\101\32\119\143\79\158\174\205\208\235\232",239),198), 4, _lIillIIIl(_1ii1lIli1("\70\81\108\115\127\159",1),211)) end end)

	hookEvent(_lIillIIIl(_1ii1lIli1("\86\121\134\144\124\175\182\209\216\228",14),224), function(zone)
		local zname = typeof(zone) == _lIillIIIl(_1ii1lIli1("\95\151\170\185\180\207\210\226",27),237) and zone.Name or tostring(zone)
		if zname and zname ~= _lIillIIIl(_1ii1lIli1("\163\172\189",40),250) then Notify(_lIillIIIl(_1ii1lIli1("\169\204\217\222",53),12), _lIillIIIl(_1ii1lIli1("\174\229\249\248\19\20\33\5\249",66),25) .. zname, 2) end
	end)
	hookEvent(_lIillIIIl(_1ii1lIli1("\207\0\2\14\39\13\56\82\84\104\116",79),38), function(amount)
		if type(amount) == _lIillIIIl(_1ii1lIli1("\11\32\38\41\58\85",92),51) then Notify(_lIillIIIl(_1ii1lIli1("\251\38\64\66\86\98",105),64), _lIillIIIl(_1ii1lIli1("\37\78\92\102\41",118),77) .. tostring(amount) .. _lIillIIIl(_1ii1lIli1("\11\93\104\130\132\152\164",131),90), 1.5, _lIillIIIl(_1ii1lIli1("\105\116\143\150\162\189",144),103)) end
	end)
	hookEvent(_lIillIIIl(_1ii1lIli1("\109\146\179\189\169\212\226\238",157),116), function(n)
		FootMid.Text = _lIillIIIl(_1ii1lIli1("\139\150\164\176\145",170),129) .. tostring(n)
		if S.RoomTracker then Notify(_lIillIIIl(_1ii1lIli1("\165\208\222\234",183),142), _lIillIIIl(_1ii1lIli1("\191\234\248\4\223\211",196),155) .. tostring(n), 2) end
	end)
	hookEvent(_lIillIIIl(_1ii1lIli1("\206\250\17\22\49\51\84\93\110\77\135\160\167\187",209),168), function(n) Notify(_lIillIIIl(_1ii1lIli1("\232\20\43\48\80\77\110\119\136\156",222),181), _lIillIIIl(_1ii1lIli1("\2\46\74\79\106\103\136\145\167\182\139\127",235),194) .. tostring(n), 2.5, _lIillIIIl(_1ii1lIli1("\81\73\104\114",248),207)) end)
	hookEvent(_lIillIIIl(_1ii1lIli1("\70\103\131\142\146\182\187\175\210\228\234\5",10),220), function(n) if type(n) == _lIillIIIl(_1ii1lIli1("\124\145\156\159\176\203",23),233) then Notify(_lIillIIIl(_1ii1lIli1("\127\160\188\199\198\234\239",36),246), _lIillIIIl(_1ii1lIli1("\153\186\214\225\224\4\9\201\32\51\243",49),8) .. tostring(n) .. _lIillIIIl(_1ii1lIli1("\212",62),21), 2) end end)
	hookEvent(_lIillIIIl(_1ii1lIli1("\208\219\234\21\24\36\56\62\87\62\109\123\136\148\179\192",75),34), function(effectName)
		if type(effectName) ~= _lIillIIIl(_1ii1lIli1("\8\23\35\40\59\66",88),47) then return end
		if effectName == _lIillIIIl(_1ii1lIli1("\253\34\58\71\45\97\108\116\138\146\173",101),60) or effectName == _lIillIIIl(_1ii1lIli1("\27\64\73\90\102\85\137\148\156\178\186\213",114),73) or effectName == _lIillIIIl(_1ii1lIli1("\54\86\97\83\135\146\154\176\184\211",127),86)
			or effectName == _lIillIIIl(_1ii1lIli1("\66\121\141\144\169\188\154\205\209\228\236\248\25\34\51",140),99) or effectName == _lIillIIIl(_1ii1lIli1("\88\91\99\148\195\190\223\226\234\222\17\21\40\53\65\98\107\124",153),112)
			or effectName == _lIillIIIl(_1ii1lIli1("\114\117\125\174\221\216\249\252\4\248\43\47\71\79\91\124\133\155\139\183\180\196\218",166),125) or effectName == _lIillIIIl(_1ii1lIli1("\155\186\213\217\232\254\14\27\36\62\73\45\89\115\121\148\150\150\185\192\216\224",179),138) then
			ShowEntityWarning(effectName:gsub(_lIillIIIl(_1ii1lIli1("\168\212\238\244\15\12\12\47\59\83\91",192),151), ""):gsub(_lIillIIIl(_1ii1lIli1("\197\249\4\12\34\42\74",205),164), _lIillIIIl(_1ii1lIli1("\185\237\1\12\25\47\55\82",218),177)))
			if S.AutoHideInLocker then hideInLockerNow(false) end
		end
	end)

	local roomFn = ev:FindFirstChild(_lIillIIIl(_1ii1lIli1("\246\54\70\84\85\108\128\108\156\170\182\165\218\224\227\244\15",231),190))
	if roomFn and roomFn:IsA(_lIillIIIl(_1ii1lIli1("\36\69\91\107\126\125\113\174\181\184\215\218\238\251",244),203)) then
		task.spawn(function()
			local ok, n = pcall(function() return roomFn:InvokeServer() end)
			if ok and n then FootMid.Text = _lIillIIIl(_1ii1lIli1("\62\73\87\99\73",6),216) .. tostring(n) end
		end)
	end
end)

task.spawn(function()
	local loaded, reason = false, _lIillIIIl(_1ii1lIli1("\115\125\149\168\172\191\198",19),229)
	for attempt = 1, 3 do
		task.wait(attempt == 1 and 1 or 1.5)
		if S.Destroyed then return end
		loaded, reason = LoadConfigFile(_lIillIIIl(_1ii1lIli1("\127\148\182\195\204\215\232\232\249",32),242), true)
		if loaded or reason == _lIillIIIl(_1ii1lIli1("\172\182\206\220\224\243\250",45),4) or reason == _lIillIIIl(_1ii1lIli1("\203\204\214\231\247\8\25\32\233\76\83\84\119\112\134\151\154\169\193\200",58),17) then break end
	end
	S._autoConfigLoaded, S._autoConfigReason = loaded, reason
	local openHint = MOBILE and _lIillIIIl(_1ii1lIli1("\67\59\95\90\123\119\151\148\179\171\207\189\59\118\124\147\168\129\63\58\91\73\199\134\80\166\158\195\128\222\204\255\250\27\14",71),30) or _lIillIIIl(_1ii1lIli1("\214\9\28\28\55\71\1\94\109\112\135\154\85\183\185\196\141\232\238\5\26",84),43)
	if loaded then
		Notify(_lIillIIIl(_1ii1lIli1("\247\39\40\68\82\98\109\110\55\109\168\163",97),56), _lIillIIIl(_1ii1lIli1("\4\62\75\81\98\110\53\149\150\178\193\202\219\220\233\179\131\47\81\235",110),69) .. openHint, 3, _lIillIIIl(_1ii1lIli1("\78\94\90\104\120\148\162",123),82))
	elseif reason ~= _lIillIIIl(_1ii1lIli1("\98\108\132\146\150\169\176",136),95) and reason ~= _lIillIIIl(_1ii1lIli1("\129\130\140\157\173\190\207\214\159\2\9\10\45\38\65\82\85\100\124\131",149),108) then
		Notify(_lIillIIIl(_1ii1lIli1("\108\166\179\185\202\214",162),121), _lIillIIIl(_1ii1lIli1("\132\198\211\220\231\248\248\9\211\52\63\75\96\110\113\126\103\91",175),134) .. tostring(reason), 3, _lIillIIIl(_1ii1lIli1("\212\204\235\245",188),147))
	else
		Notify(_lIillIIIl(_1ii1lIli1("\199\247\248\20\34\50\61\67\12\66\125\120",201),160), _lIillIIIl(_1ii1lIli1("\221\14\14\31\46\64\10\218\134\168\66",214),173) .. openHint, 3, _lIillIIIl(_1ii1lIli1("\20\39\45\73",227),186))
	end
	print(_lIillIIIl(_1ii1lIli1("\32\40\88\89\117\131\147\163\164\149\208\203\212\165\223\16\16\33\48\61\7\68\78",240),199))
end)
