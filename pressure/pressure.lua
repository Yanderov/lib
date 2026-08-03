local _lIillIIIl do local c=string.char local b=string.byte _lIillIIIl=function(s,k) local o={} for i=1,#s do o[i]=c(((b(s,i)-((k+i*7)%251))%256)) end return table.concat(o) end end
if _G.Pressure_Script then
	pcall(function() _G.Pressure_Script:Destroy() end)
	_G.Pressure_Script = nil
end

do
	local Players2 = game:GetService(_lIillIIIl("\139\174\170\201\188\208\216",52))
	local parents = {}
	local CoreGui2
	pcall(function() CoreGui2 = game:GetService(_lIillIIIl("\139\190\200\194\171\224\219",65)) end)
	if CoreGui2 then
		table.insert(parents, CoreGui2)
		local robloxGui = CoreGui2:FindFirstChild(_lIillIIIl("\167\203\197\214\224\240\198\251\246",78))
		if robloxGui then table.insert(parents, robloxGui) end
	end
	local playerGui = Players2.LocalPlayer:FindFirstChild(_lIillIIIl("\178\213\209\240\227\247\211\8\3",91))
	if playerGui then table.insert(parents, playerGui) end
	if gethui then pcall(function() table.insert(parents, gethui()) end) end
	local seen = {}
	for _, parent in ipairs(parents) do
		if parent then

			for _, guiName in ipairs({ _lIillIIIl("\191\232\226\247\254\7\11\5\239\35\23",104), _lIillIIIl("\204\245\239\4\11\20\24\18\249\14\18",117) }) do
				local direct = parent:FindFirstChild(guiName)
				if direct and direct:IsA(_lIillIIIl("\220\243\9\3\10\26\250\47\42",130)) then
					seen[direct] = true
					pcall(function() direct:Destroy() end)
				end
			end

			for _, inst in ipairs(parent:GetDescendants()) do
				if not seen[inst] and inst:IsA(_lIillIIIl("\233\0\22\16\23\39\7\60\55",143)) and (inst.Name == _lIillIIIl("\243\28\22\43\50\59\63\57\35\87\75",156) or inst.Name == _lIillIIIl("\0\41\35\56\63\72\76\70\45\66\70",169)) then
					seen[inst] = true
					pcall(function() inst:Destroy() end)
				end
			end
		end
	end

	for _, inst in ipairs(game:GetService(_lIillIIIl("\20\51\61\61\76\80\72\81\90",182)):GetDescendants()) do
		if inst.Name == _lIillIIIl("\26\67\61\82\89\98\102\101\76\129\133\112\132\145",195) or inst.Name == _lIillIIIl("\39\80\74\95\102\111\120\114\89\142\146\113\124",208) or inst.Name == _lIillIIIl("\52\93\87\108\120\129\133\127\117\141\144\163\170\165\191\183\156\200\200\219",221) then
			pcall(function() inst:Destroy() end)
		end
	end
end

local Players = game:GetService(_lIillIIIl("\65\100\101\132\119\139\147",234))
local RunService = game:GetService(_lIillIIIl("\85\127\127\107\132\152\163\157\158\167",247))
local UIS = game:GetService(_lIillIIIl("\101\138\131\151\117\161\170\182\188\162\187\207\218\212\213\222",9))
local SoundService = game:GetService(_lIillIIIl("\112\147\160\160\157\147\172\192\203\197\198\207",22))
local Lighting = game:GetService(_lIillIIIl("\118\154\159\167\186\182\194\194",35))
local Workspace = game:GetService(_lIillIIIl("\142\173\183\183\198\202\194\203\212",48))
local ReplicatedStorage = game:GetService(_lIillIIIl("\150\176\194\197\201\202\207\233\225\231\221\5\7\17\7\20\25",61))
local HttpService = game:GetService(_lIillIIIl("\153\204\211\214\192\217\237\248\242\243\252",74))
local TweenService = game:GetService(_lIillIIIl("\178\220\209\216\232\212\237\1\12\6\7\16",87))

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

	UITheme = _lIillIIIl("\175\215\223\225\252\250\9",100), UITextScale = 1, HUDScale = 1,
	NotificationPosition = MOBILE and _lIillIIIl("\204\238\246\173\215\0\16\29\21\41",113) or _lIillIIIl("\217\251\3\186\243\17\22\30\49",126),

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
	if type(container) ~= _lIillIIIl("\6\250\2\19\19",139) then return end
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
		if effect:IsA(_lIillIIIl("\224\26\26\35\46\50\49\53\73\67",152)) then
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
				if effect:IsA(_lIillIIIl("\237\39\39\48\59\63\62\66\86\80",165)) then applied.atmospheres[effect] = { density = effect.Density, haze = effect.Haze } end
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
			if effect:IsA(_lIillIIIl("\250\52\52\61\72\76\75\79\99\93",178)) then
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
local function getEvents() return ReplicatedStorage:FindFirstChild(_lIillIIIl("\11\67\57\73\86\92",191)) end
local function findRemote(name)
	local ev = getEvents()
	local r = ev and ev:FindFirstChild(name)
	if r and (r:IsA(_lIillIIIl("\37\63\78\87\99\91\71\127\117\133\146",204)) or r:IsA(_lIillIIIl("\53\85\96\90\109\113\112\120\137\137\125\151\166\175\187\179\154\210\200\216\229",217)) or r:IsA(_lIillIIIl("\63\89\109\118\130\122\98\152\152\148\172\168\181\187",230))) then
		return r
	end
	return nil
end

local function applyModuleTuning()
	local m = getMain()
	local tuned = S._tunedFields
	if not (m and tuned) then return end
	if tuned.CrouchSpeed and type(m.CameraModule) == _lIillIIIl("\110\103\111\128\128",243) then
		setGameField(m.CameraModule, _lIillIIIl("\79\133\137\150\139\151\141\158\176\182\165\201\197\204\210",5), S.CrouchSpeed)
	end
	if tuned.SprintMod then
		if type(m.CameraModule) == _lIillIIIl("\141\129\137\154\154",18) then setGameField(m.CameraModule, _lIillIIIl("\121\157\166\164\176\189\157\198\194\206\210\220\223\243",31), S.SprintMod) end
	end
	if tuned.GliderSpeed and type(m.Swimming) == _lIillIIIl("\167\155\163\180\180",44) then
		setGameField(m.Swimming, _lIillIIIl("\135\179\183\185\193\213\189\225\221\228\234",57), S.GliderSpeed)
	end
end

local function saveSwimDefaults(sw)
	if type(sw) ~= _lIillIIIl("\193\181\189\206\206",70) then return nil end
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
	if type(sw) ~= _lIillIIIl("\206\194\202\219\219",83) or not saved then return end
	if saved.swim ~= nil then sw.SwimmingSpeed = saved.swim end
	if saved.current ~= nil then sw.CurrentSwimSpeed = saved.current end
	if restoreGlider and saved.glider ~= nil then sw.GliderSpeed = saved.glider end
end

local function installSpeedHook()
	if SpeedHook.installed then return end
	local m = getMain()
	local se = m and m.StatusEffects
	if type(se) ~= _lIillIIIl("\219\207\215\232\232",96) or type(se.GetSpeed) ~= _lIillIIIl("\218\240\240\236\4\0\13\19",109) then return end
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
	if m and type(m.StatusEffects) == _lIillIIIl("\245\233\241\2\2",122) then
		pcall(function() m.StatusEffects:RefreshSpeed(LP) end)
	end
end

local function installJumpscareHook()
	if JumpscareHook.installed then return end
	local m = getMain()
	local bj = m and m.BlitzJumpscare
	if type(bj) ~= _lIillIIIl("\2\246\254\15\15",135) or type(bj.Start) ~= _lIillIIIl("\1\23\23\19\43\39\52\58",148) then return end
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
			local pg = LP:FindFirstChild(_lIillIIIl("\248\27\23\54\41\61\25\78\73",161))
			local mg = pg and pg:FindFirstChild(_lIillIIIl("\2\29\44\56",174))
			local cl = mg and mg:FindFirstChild(_lIillIIIl("\5\53\57\60\76\89",187))
			local mc = cl and cl:FindFirstChild(_lIillIIIl("\28\55\70\82\46\94\98\106\122\135",200))
			local cmod = mc and mc:FindFirstChild(_lIillIIIl("\31\68\87\86\106\101\88\129\125\149\147\147",213))
			if cmod then
				local cmv = require(cmod)
				if type(cmv) == _lIillIIIl("\93\81\89\111\111",226) and type(cmv.Main) == _lIillIIIl("\106\99\107\124\124",239) then
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
	pcall(function() RunService:UnbindFromRenderStep(_lIillIIIl("\88\129\123\144\151\160\164\158\141\182\195\200\193\184\216\221\231\226\241",1)) end)
	pcall(function() if SpeedHook.installed and SpeedHook.se then SpeedHook.se.GetSpeed = SpeedHook.orig end end)
	pcall(function() if JumpscareHook.installed and JumpscareHook.mod then JumpscareHook.mod.Start = JumpscareHook.orig end end)
	pcall(function() LP.CameraMode = Enum.CameraMode.LockFirstPerson; LP.CameraMaxZoomDistance = _origMaxZoom or 0.5 end)
	pcall(function()
		local m = getMain()
		local sw = m and m.Swimming
		if type(sw) == _lIillIIIl("\137\125\133\150\150",14) and self._savedSwim then
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
			s = Instance.new(_lIillIIIl("\117\152\165\165\162",27)); s.SoundId = id; s.Parent = SoundService; SndCache[k] = s
		end
		s.PlaybackSpeed = pitch; s.Volume = vol or 0.3; s:Play()
	end) end)
end
local SFX = {
	On = function() snd(_lIillIIIl("\161\152\181\165\190\197\190\212\208\210\175\171\178\192\201\209\212\214\228\237\243\247\252",40), 1.35, 0.4) end,
	Off = function() snd(_lIillIIIl("\174\165\194\178\203\210\203\225\221\223\188\184\191\205\214\222\225\227\241\250\0\4\9",53), 0.8, 0.25) end,
	Click = function() snd(_lIillIIIl("\187\178\207\191\216\223\216\238\234\236\201\197\204\218\227\235\238\240\254\7\13\17\22",66), 1.05, 0.3) end,
	Pop = function() snd(_lIillIIIl("\200\191\220\204\229\236\229\251\247\249\214\210\217\229\237\248\246\3\10\13\25\31\38",79), 1.2, 0.35) end,
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
	return THEMES[name] and name or _lIillIIIl("\167\207\215\217\244\242\1",92)
end
S.UITheme = loadPalette(S.UITheme)
local TONE = {
	info = Color3.fromRGB(218, 223, 228),
	warn = Color3.fromRGB(255, 192, 88),
	danger = Color3.fromRGB(255, 92, 92),
}
local F, FM, FB = Enum.Font.Gotham, Enum.Font.GothamMedium, Enum.Font.GothamBold

local function Corner(i, r) local c = Instance.new(_lIillIIIl("\197\192\193\244\254\1\255\19",105)); c.CornerRadius = UDim.new(0, r or 6); c.Parent = i; return c end
local function Stroke(i, col, th, tr)
	local s = Instance.new(_lIillIIIl("\210\205\222\6\11\15\18\19",118))
	s.Color = col or T.Bd; s.Thickness = th or 1; s.Transparency = tr or 0
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; s.Parent = i
	return s
end
local function Grad(i, c1, c2, rot)
	local g = Instance.new(_lIillIIIl("\223\218\223\17\7\17\29\32\48\61",131)); g.Color = ColorSequence.new(c1, c2); g.Rotation = rot or 90; g.Parent = i
	return g
end
local function Pad(i, t, b, l, r)
	local p = Instance.new(_lIillIIIl("\236\231\245\13\23\30\42\54\54",144))
	p.PaddingTop = UDim.new(0, t or 0); p.PaddingBottom = UDim.new(0, b or 0)
	p.PaddingLeft = UDim.new(0, l or 0); p.PaddingRight = UDim.new(0, r or 0)
	p.Parent = i
	return p
end
local function Shadow(i, tr)
	local s = Instance.new(_lIillIIIl("\249\244\5\45\50\54\57\58",157))
	s.Color = T.Bd2; s.Thickness = 2; s.Transparency = tr or 0.6
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; s.Parent = i
	return s
end
local function Tween(inst, time, props, style, dir)
	return TweenService:Create(inst, TweenInfo.new(time, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out), props)
end

S._NavIconData = {
	[_lIillIIIl("\22\49\36",170)] = _lIillIIIl("\39\27\14\34\44\88\24\58\61\105\120\81\88\95\102\122\134\143\169\141\164\189\158\165\172\182\186\193\200\207\214\19\230\235\10\249\0\7\15\44\28\88\86\56\56\68\75\82\91\119\104\118\139\147\143\138\145\152\151\205\173\180\187\209\225\224\221\12\244\225\22\41\1\8\15\24\7\78\86\54\73\90\93\129\128\133\89\135\172\145\123\158\162\170\179\173\227\235\210\197\1\213\232\19\222\2\255\14\58\9\58\38\66\39\49\40\58\71\87\103\95\139\150\120\105\113\137\147\149\155\217\214\196\167\241\236\2\194\204\10\11\33\1\7\40\64\22\72\22\38\37\52\62\71\112\86\125\90\146\122\158\116\134\185\190\156\162\208\185\184\190\216\210\203\228\6\15\227\229\41\61\34\36\10\46\24\29\76\69\85\62\139\78\133\126\147\158\163\117\128\135\198\218\215\163\233\179\186\225\2\9\246\243\5\1\40\239\21\10\43\42\42\51\56\89\82\100\70\105\115\152\151\100\162\190\182\160\175\179\218\230\226\199\187\216\249\7\227\217\33\237\41\27\33\62\76\76\92\80\57\75\89\121\109\134\117\87\138\123\137\153\146\138\149\165\205\225\190\250\1\217\215\18\24\249\255\250\244\52\60\26\14\35\63\64\56\119\130\114\91\137\153\120\131\107\167\192\134\141\137\169\180\218\189\185\210\209\3\210\14\236\42\33\50\17\55\54\82\51\59\51\91\111\113\100\108\80\148\129\122\143\152\162\185\138\213\154\216\213\208\181\220\252\10\231\214\18\229\253\38\34\7\78\14\55\36\61\74\117\78\90\96\134\94\132\160\142\185\118\131\201\174\210\213\184\196\186\193\9\218\2\254\19\246\234\57\24\39\35\37\89\91\59\66\87\88\72\97\85\131\170\159\160\176\176\194\204\216\181\162\168\244\183\182\224\11\228\29\243\249\244\8\36\64\32\84\90\85\109\69\87\128\134\106\84\155\121\124\185\192\129\203\139\173\217\231\199\181\201\250\216\224\209\237\252\43\237\11\2\72\28\56\52\82\100\51\65\126\90\72\126\158\136\178\183\136\135\161\205\170\182\156\176\240\238\190\235\198\248\22\23\9\9\60\31\45\65\82\97\26\80\57\76\115\129\101\136\112\168\135\171\124\193\194\136\222\224\157\242\181\216\5\11\207\220\218\43\5\17\11\17\23\19\35\67\95\56\87\76\72\125\106\107\95\132\143\143\145\187\152\163\220\163\232\199\235\191\5\217\200\231\245\25\234\58\62\17\29\18\88\59\86\57\54\64\124\144\103\95\145\159\126\142\130\170\158\175\221\214\215\210\243\219\197\1\206\237\252\1\252\7\0\21\58\42\73\96\104\70\92\65\139\107\122\138\116\136\113\166\195\153\132\161\219\210\222\234\202\221\1\240\25\0\31\5\253\249\56\29\45\68\74\27\57\91\82\102\63\103\85\123\115\102\111\166\164\172\210\218\222\216\235\214\185\237\7\254\216\31\1\46\14\9\2\4\46\78\82\32\58\118\57\87\90\139\136\85\158\135\142\187\156\138\143\166\183\169\209\208\237\187\252\18\226\217\37\230\232\16\55\25\18\74\84\58\89\117\86\99\142\76\112\113\167\100\180\192\121\191\165\176\210\227\169\197\210\240\6\203\252\221\247\43\40\247\35\53\62\79\60\103\44\108\79\95\77\141\80\141\104\164\149\148\198\164\206\166\157\179\239\237\232\243\250\227\15\32\8\231\21\7\17\43\10\87\67\106\80\54\77\94\67\147\81\158\151\113\133\194\135\141\168\207\206\184\236\235\238\241\221\236\244\18\233\233\49\46\54\45\43\23\66\94\75\75\111\100\146\142\159\156\129\137\178\148\162\209\215\212\196\190\240\239\247\210\7\240\244\244\12\236\14\25\21\5\22\40\45\43\76\123\121\125\95\100\119\162\127\144\184\157\163\174\207\202\228\215\232\231\212\215\202\24\27\24\21\46\27\60\4\7\44\77\54\53\65\73\101\110\130\90\89\126\152\135\137\158\149\146\209\171\232\200\176\244\206\11\234\217\241\245\46\52\46\15\55\12\48\46\79\92\87\58\136\129\83\135\96\162\123\110\153\130\197\162\141\214\210\217\201\200\188\255\238\230\251\17\12\49\55\60\67\8\46\86\95\108\120\120\113\97\78\108\86\138\105\171\184\152\163\166\186\219\194\208\231\221\192\217\5\251\28\17\10\53\6\37\56\60\16\33\33\56\51\79\132\99\131\89\151\122\138\168\151\156\163\200\153\164\162\224\183\238\223\251\221\228\27\225\235\35\62\50\33\45\85\93\70\90\93\86\133\81\114\109\115\107\161\151\155\163\173\203\154\158\158\238\184\203\3\11\237\239\224\254\16\12\254\33\14\74\76\52\55\97\108\92\130\72\135\149\102\118\148\135\154\138\199\212\204\222\165\174\246\202\209\216\223\230\241\31\0\21\51\34\75\46\81\46\53",183),
	[_lIillIIIl("\46\68\72\83\90\86\86\106\122",196)] = _lIillIIIl("\65\53\40\60\70\119\55\89\92\131\146\107\114\121\128\148\160\169\195\167\190\215\184\191\198\208\212\219\226\233\240\45\0\5\36\19\26\33\41\70\54\119\117\87\87\94\101\108\117\145\130\144\165\173\169\164\171\178\177\231\199\206\213\235\251\250\247\38\14\251\48\67\27\34\41\51\57\50\117\85\104\116\119\155\154\159\115\169\194\171\145\198\188\196\188\199\225\191\227\228\22\23\26\11\38\57\61\29\45\78\44\53\43\69\111\82\97\146\141\94\163\170\143\152\192\188\168\187\189\229\234\210\217\212\6\0\245\244\8\12\248\8\24\10\29\84\61\92\44\69\123\91\96\137\143\123\118\150\138\177\146\171\166\145\179\192\224\180\186\195\229\16\10\215\236\242\27\247\66\65\12\87\92\29\103\93\59\69\136\88\157\104\105\161\177\175\151\140\206\173\200\188\196\252\237\210\225\248\235\3\31\14\45\33\37\41\79\62\98\60\97\117\119\97\132\149\145\146\152\109\142\179\156\206\196\209\180\229\235\205\248\235\3\216\236\248\251\34\59\50\59\81\21\42\37\110\103\75\127\140\95\84\163\132\128\175\171\164\171\144\141\174\168\186\238\252\250\216\224\209\248\39\45\1\245\35\23\34\82\94\48\91\104\107\114\121\149\134\145\170\154\136\120\166\190\196\172\153\181\168\208\202\207\218\18\228\212\232\248\43\56\27\29\74\57\31\53\106\45\66\113\73\102\158\119\154\166\179\174\131\164\194\168\186\162\178\235\219\198\214\205\252\244\31\238\17\30\34\8\43\56\51\101\111\113\78\68\138\112\81\122\139\146\143\189\156\134\162\199\227\229\190\241\188\208\231\209\254\248\249\237\8\9\47\25\79\84\94\83\80\109\65\91\81\97\96\163\159\165\175\121\203\193\171\158\177\187\226\202\236\255\216\223\8\215\42\28\11\56\254\77\42\74\56\97\106\123\129\109\146\104\105\119\176\164\170\195\167\154\182\208\189\172\246\181\193\219\253\207\221\254\8\53\36\42\21\58\48\50\54\67\61\88\56\131\92\110\112\91\164\146\126\123\187\205\217\184\231\218\204\230\244\222\15\244\246\253\47\241\36\14\67\3\53\81\87\103\80\54\84\98\125\135\149\129\130\162\117\161\163\147\219\161\181\225\198\242\220\1\17\209\10\1\247\51\29\68\31\27\86\23\62\105\106\88\135\97\150\86\117\120\156\153\152\125\169\192\211\158\201\223\202\232\224\247\5\245\246\5\253\35\10\60\9\29\80\43\35\63\102\77\104\136\130\91\121\160\158\116\177\185\165\201\218\219\161\210\201\1\195\236\210\29\247\224\34\3\13\252\22\34\52\32\27\105\124\122\133\125\120\139\117\140\144\153\174\166\208\146\184\221\187\241\197\213\0\226\9\231\29\24\45\54\62\61\79\39\27\34\89\105\83\82\120\123\103\127\151\169\176\150\117\130\138\195\221\214\232\198\173\192\0\15\226\8\15\252\39\10\249\61\33\79\48\51\83\42\122\77\91\138\139\96\145\131\172\153\157\191\192\212\191\193\165\241\234\207\4\227\234\246\31\43\48\21\52\56\16\63\94\89\63\59\71\68\123\135\102\153\159\141\174\140\155\186\207\199\171\182\170\223\179\218\223\205\25\235\252\26\8\251\66\73\74\89\54\60\77\67\94\119\97\147\111\158\133\158\134\141\151\156\198\177\213\177\173\243\198\209\203\220\233\242\36\8\4\23\57\19\28\16\30\31\99\100\81\122\130\141\110\155\164\122\178\188\177\196\190\164\205\180\233\175\238\238\197\205\219\32\30\252\1\51\49\10\34\75\83\49\75\72\123\95\110\77\84\143\116\135\117\157\127\183\207\204\206\222\195\196\189\191\219\253\28\219\39\3\48\11\27\39\16\72\54\84\80\100\91\139\108\139\117\115\132\106\188\190\153\168\173\204\186\205\241\177\242\243\222\213\212\252\233\242\18\58\47\29\18\80\34\72\40\116\87\131\133\108\148\130\151\108\175\182\128\188\184\222\193\227\234\187\193\215\238\2\251\253\29\10\53\42\35\64\78\70\26\83\71\75\132\98\105\88\108\135\138\110\183\190\186\136\213\182\221\172\179\203\235\201\203\6\8\25\6\252\59\12\53\34\78\88\65\86\92\128\130\120\95\109\152\167\131\132\141\194\155\144\204\180\199\186\210\203\225\12\0\231\246\225\4\33\247\21\64\37\65\96\50\88\65\73\129\128\113\155\89\164\156\164\120\191\157\142\177\203\198\241\233\221\190\221\19\8\25\22\7\41\244\44\30\36\86\51\98\74\109\91\97\106\148\122\126\116\146\117\192\148\157\139\168\180\183\193\214\186\251\220\211\10\0\41\253\245\44\66\31\34\66\86\64\100\103\110\126\89\134\80\151\94\112\175\138\190\204\196\147\185\198\226\216\190\255\248\227\25\224\23\32\244\21\5\42\74\13\50\31\76\104\77\139\134\98\105\147\134\111\177\138\145\152\159\166\191\200\208\208\218\218\203\224\253\244\251\246",209),
	[_lIillIIIl("\76\77\104\97\107",222)] = _lIillIIIl("\91\79\71\91\101\145\81\115\118\157\172\133\140\147\154\174\186\195\221\193\216\241\210\217\224\234\238\245\252\3\10\71\26\31\62\45\52\59\72\101\85\145\143\113\113\120\127\134\143\171\156\170\191\199\195\190\197\204\203\1\225\232\239\5\21\20\17\64\40\21\74\93\53\65\72\81\69\113\143\111\130\142\145\181\180\185\141\187\184\162\238\210\214\222\229\224\212\216\9\47\254\245\34\29\64\37\80\87\72\70\79\90\103\96\101\148\120\124\164\146\186\168\166\211\205\179\205\239\240\238\8\228\22\239\242\10\16\58\24\39\18\23\86\82\107\67\80\90\111\149\107\118\122\173\130\120\126\152\204\211\172\184\199\198\183\211\235\230\228\3\8\28\16\15\56\41\37\50\93\65\92\70\131\88\77\151\146\155\101\116\121\173\192\165\197\215\222\202\204\182\191\198\12\19\30\243\34\235\26\65\254\62\73\55\52\93\113\114\94\99\92\149\112\121\118\175\157\144\171\158\148\171\221\223\211\237\254\217\254\1\242\224\24\3\20\22\255\57\43\54\50\98\98\120\117\74\99\98\145\97\106\178\182\175\197\141\163\225\191\183\234\220\212\3\9\209\250\18\230\21\54\20\21\27\55\39\34\98\51\71\81\136\112\90\127\155\175\168\158\182\185\170\163\172\230\190\236\201\254\216\202\26\15\252\10\29\16\20\34\45\14\41\55\69\54\64\88\77\93\90\145\117\126\136\135\159\157\162\200\191\165\234\246\184\206\248\234\251\222\249\0\17\5\67\52\67\72\89\29\93\98\108\104\87\139\139\109\134\137\151\155\187\169\179\150\190\220\171\175\191\217\10\3\20\23\23\24\52\44\37\62\51\25\81\83\67\110\116\132\111\73\156\93\153\157\154\156\196\151\179\201\172\217\209\183\239\0\233\208\231\244\31\8\15\246\36\255\71\19\34\51\58\76\53\136\112\108\104\122\140\176\141\153\190\193\173\210\212\215\205\199\249\191\217\225\27\34\41\254\38\44\47\10\36\41\62\53\100\75\88\100\76\121\107\112\128\181\136\151\167\144\161\220\182\190\179\235\253\187\194\2\243\0\228\45\17\63\55\56\45\51\89\41\60\88\131\126\148\150\162\150\171\140\190\179\191\208\216\186\227\230\237\205\248\219\228\225\233\238\31\18\41\43\63\11\74\93\27\94\59\107\88\73\116\144\158\100\143\141\176\131\197\140\197\159\198\190\175\197\187\211\255\8\19\223\22\34\56\2\42\8\64\78\95\77\97\123\84\73\125\153\141\120\107\112\159\183\202\203\201\173\230\191\215\201\4\198\203\241\13\6\239\240\7\65\3\71\39\49\92\54\114\74\117\125\100\121\122\170\140\163\124\192\132\178\142\223\231\200\244\213\214\215\17\216\12\245\45\54\62\53\33\75\82\89\87\106\119\119\71\101\118\85\163\137\144\122\193\191\165\194\166\178\167\235\175\246\191\231\1\245\19\246\249\18\22\30\63\45\81\47\99\39\116\75\129\108\116\113\113\168\137\146\170\185\189\169\151\165\223\198\204\242\197\1\16\25\219\34\36\55\53\18\60\43\27\99\67\100\91\82\115\140\149\87\165\153\168\188\180\190\209\206\208\190\232\243\233\207\6\10\12\238\29\232\241\244\20\67\29\72\62\81\104\82\73\110\66\102\146\139\146\120\159\169\177\180\144\144\190\208\172\225\178\255\254\11\11\12\15\42\44\248\244\33\8\36\90\67\61\37\60\90\139\98\136\90\114\140\117\117\183\182\212\162\194\209\170\182\186\253\249\255\3\221\246\47\0\52\59\3\28\21\28\65\55\43\93\135\119\85\142\154\170\178\166\182\148\159\205\214\182\159\209\211\183\244\219\203\251\217\255\248\54\239\32\32\38\84\92\25\41\78\65\118\89\76\111\113\129\106\166\156\154\161\175\175\184\198\199\193\0\208\4\1\19\2\36\34\50\250\59\22\67\39\73\97\47\88\63\69\66\73\136\165\173\162\130\125\200\184\178\151\172\183\240\225\189\194\202\20\5\253\245\26\239\19\15\57\38\92\54\60\40\79\119\117\108\103\150\121\137\181\113\184\133\193\181\215\219\183\209\219\209\0\206\10\15\15\2\26\244\11\62\4\53\85\79\98\103\78\132\101\139\151\156\154\167\134\172\175\178\165\152\216\223\224\171\207\0\231\201\246\23\1\226\1\247\250\6\76\72\54\93\94\47\124\87\125\101\118\105\100\163\138\158\152\201\209\151\207\227\227\189\241\190\2\242\236\19\5\255\39\17\53\71\13\49\16\27\109\104\121\94\96\149\101\159\157\136\127\134\141\148\156\171\186\196\171\194\246\246\220\0\7\14\235\242",235),
	[_lIillIIIl("\121\126\119\139\77\153\157\170\170\167",248)] = _lIillIIIl("\122\110\97\117\127\171\107\141\144\183\198\159\166\173\180\200\212\221\247\219\242\11\236\243\250\4\8\15\22\29\36\97\52\57\93\76\83\90\98\127\111\171\169\139\139\146\153\160\169\197\182\196\217\225\221\216\223\230\229\27\251\2\9\31\47\46\43\90\66\47\105\124\84\91\98\107\163\161\169\137\156\168\171\207\206\211\167\213\211\188\192\236\240\232\23\251\19\248\23\61\34\56\45\91\36\69\91\103\104\103\149\144\155\145\111\116\147\136\177\164\170\177\191\208\221\222\219\236\244\247\255\249\51\4\65\55\71\69\94\71\109\103\88\128\93\109\102\116\168\160\168\156\186\169\148\163\192\188\193\212\206\252\255\235\228\235\4\8\41\28\255\31\40\53\93\99\60\123\125\135\144\79\137\98\120\145\171\178\161\136\201\199\223\156\220\180\185\3\228\255\216\216\255\1\10\17\16\20\9\88\27\63\64\84\118\135\96\135\112\95\133\155\146\184\152\190\193\169\197\191\172\184\235\225\214\5\235\252\249\237\8\9\23\11\73\87\79\41\91\78\119\115\95\130\103\166\108\125\147\162\157\191\151\169\156\166\219\182\234\221\206\6\237\18\254\14\39\30\2\24\16\91\90\85\103\74\65\68\68\117\88\149\142\131\136\117\200\153\163\191\185\193\239\186\217\243\241\214\236\227\26\2\236\13\19\28\53\48\33\39\42\57\65\93\137\149\143\157\173\148\152\154\136\139\206\187\176\237\235\205\181\251\242\236\216\39\247\241\8\21\59\68\75\40\102\54\71\78\126\85\137\88\116\95\127\115\141\145\190\210\216\220\183\238\203\234\228\244\11\1\33\240\232\241\6\20\7\31\19\78\84\55\53\54\90\140\142\108\127\151\131\142\140\127\150\196\152\162\186\236\180\243\193\231\2\11\23\19\42\18\252\34\69\37\74\78\48\107\87\80\134\73\94\85\142\171\122\130\119\127\182\202\151\177\189\228\184\254\243\236\233\17\247\6\25\238\49\68\30\78\59\55\50\103\77\84\69\89\117\140\98\149\133\153\155\184\175\167\180\172\217\210\242\223\215\1\15\15\17\220\238\49\59\50\58\30\44\88\55\70\108\123\74\113\130\103\128\104\172\183\149\198\158\192\206\191\167\219\212\222\228\232\17\246\1\43\228\57\14\2\70\70\80\44\86\82\73\111\118\123\137\127\100\150\159\174\187\171\175\214\210\215\168\195\212\255\197\6\23\247\3\23\48\49\14\67\38\63\26\61\84\113\55\55\128\102\137\130\158\134\135\169\147\187\192\139\193\164\192\225\221\206\228\250\241\239\230\29\237\53\22\33\41\63\63\62\99\96\72\64\109\149\140\113\102\120\150\156\143\140\187\177\182\209\237\203\237\205\189\234\226\17\7\0\47\12\254\1\78\32\95\101\91\84\89\70\86\71\91\107\154\108\129\179\196\149\177\186\183\228\228\198\250\220\231\244\22\18\246\255\241\28\66\24\36\69\28\100\88\106\90\84\124\94\114\157\117\154\167\180\196\171\149\165\214\183\176\199\185\218\222\236\13\35\255\31\46\43\51\25\73\40\98\95\104\106\57\88\129\147\85\154\166\177\118\194\165\136\214\180\172\230\190\207\210\3\214\231\219\19\220\250\234\252\5\22\16\55\48\39\40\106\110\70\145\112\110\102\154\141\149\162\201\153\150\222\162\188\222\226\246\242\250\23\236\36\247\13\49\29\55\36\74\19\56\90\110\116\101\103\110\84\112\161\132\159\151\128\147\176\184\153\221\220\211\186\249\211\194\228\219\254\21\14\55\248\22\12\67\25\63\57\102\48\127\140\111\87\107\167\175\132\173\155\136\172\207\211\194\214\227\238\247\219\220\1\222\27\26\40\17\67\37\78\53\70\81\104\49\116\65\88\127\113\128\102\98\132\148\127\153\206\187\155\159\202\176\181\223\10\243\26\13\224\250\49\10\30\58\69\14\44\59\78\121\93\117\88\81\139\130\103\107\179\182\150\186\178\154\222\189\216\248\240\252\212\226\212\22\231\41\5\26\53\57\51\22\50\30\109\48\108\92\94\77\103\129\101\145\170\147\168\155\142\185\193\223\192\237\250\247\226\0\9\244\248\38\34\254\5\77\9\48\47\38\95\124\88\120\139\102\150\148\101\113\122\155\164\135\198\213\215\182\201\216\215\254\218\235\17\15\6\42\33\245\14\21\76\69\47\31\110\69\111\102\113\134\147\99\120\143\137\163\161\152\159\166\173\181\196\211\221\196\219\15\15\245\25\32\39\4\11",10),
	[_lIillIIIl("\128\148\160",23)] = _lIillIIIl("\148\136\123\143\153\197\133\167\170\209\224\185\192\199\206\226\238\247\17\245\12\37\6\13\20\30\34\41\48\55\67\128\83\88\119\102\109\116\124\153\137\197\195\165\165\172\179\186\195\223\208\222\243\251\247\242\249\0\255\53\21\28\35\57\73\72\74\121\97\78\131\150\110\117\124\132\170\149\195\163\182\194\197\233\232\237\193\239\234\250\247\246\6\2\9\20\31\49\84\62\56\97\56\81\93\113\105\115\101\156\125\124\164\202\153\148\170\199\195\202\237\194\247\239\23\232\0\1\41\249\11\17\64\63\38\87\73\91\78\117\90\73\123\89\157\162\171\186\122\139\132\216\215\207\238\201\216\220\227\222\246\249\1\245\253\51\48\42\71\69\62\30\99\96\57\56\93\143\102\97\148\107\166\168\156\192\143\218\182\199\215\177\253\196\231\205\234\10\241\9\9\36\43\43\81\74\77\96\66\108\107\120\124\93\150\146\146\111\141\181\165\185\206\184\226\223\208\197\208\209\196\235\226\247\240\8\34\5\46\33\72\69\91\91\71\53\65\96\90\142\87\130\131\108\137\125\189\150\166\149\179\169\203\237\224\244\248\240\237\250\247\233\0\40\254\57\63\58\91\32\108\123\64\132\111\106\104\123\118\156\131\123\188\200\212\167\220\168\226\238\212\227\202\207\212\1\33\2\248\48\20\34\69\77\31\68\46\82\107\87\81\146\152\127\132\177\164\159\137\204\148\180\207\189\172\229\214\213\238\204\10\214\41\253\35\247\39\25\20\39\57\75\58\89\60\119\114\75\155\130\159\130\118\177\194\178\174\186\159\217\191\237\207\230\6\4\22\21\236\48\249\21\5\10\50\91\89\56\50\117\99\123\79\116\97\157\174\142\118\124\138\178\216\146\212\216\241\220\235\195\226\14\27\254\230\47\10\252\55\48\72\71\68\37\45\118\116\67\84\138\113\128\144\177\158\154\194\158\167\206\199\236\175\209\240\216\255\14\223\0\250\42\5\23\58\81\73\47\79\101\54\58\57\125\76\144\147\114\104\181\173\144\194\170\179\175\211\193\244\223\245\204\236\26\16\229\26\17\30\1\26\81\34\22\86\108\115\116\71\76\100\143\100\129\170\111\140\134\137\159\186\217\161\218\202\206\184\254\253\231\12\31\240\20\247\51\20\48\59\61\61\105\85\93\126\112\99\144\114\122\130\186\120\188\163\171\151\189\225\234\201\246\225\3\245\206\235\18\43\13\18\253\75\81\36\64\97\40\68\75\82\89\96\107\153\122\143\173\156\197\168\203\168\175",36),
	[_lIillIIIl("\175\177\171\187\183\195",49)] = _lIillIIIl("\174\162\149\169\179\223\159\193\196\235\250\211\218\225\232\252\8\17\43\15\38\63\32\39\46\56\65\72\79\86\93\154\109\114\145\128\135\142\150\179\163\223\221\191\191\198\205\212\221\249\234\248\13\21\17\12\19\26\25\79\47\54\66\88\104\103\100\147\123\104\157\176\136\143\150\159\155\175\221\189\208\220\223\3\2\7\219\9\8\19\44\33\40\44\75\48\30\111\80\92\85\92\112\107\148\117\141\131\147\150\193\166\182\192\183\209\235\224\195\232\7\228\0\244\18\24\18\21\22\38\13\43\88\45\55\118\117\89\149\151\114\156\141\132\158\151\169\142\168\162\189\220\195\247\217\233\227\16\241\22\33\2\19\71\43\33\78\88\54\113\54\94\106\97\88\139\99\162\109\144\184\131\145\204\184\166\167\223\239\226\232\208\21\29\225\32\48\55\243\7\13\12\74\80\104\69\107\130\120\147\113\126\155\151\111\135\172\187\178\164\182\215\201\173\214\206\0\13\16\252\224\7\11\42\45\49\67\34\54\86\84\79\120\96\77\110\99\114\101\168\180\143\184\166\193\200\169\183\231\191\218\193\230\237\230\217\240\5\237\55\67\36\34\42\39\51\97\69\110\88\93\144\121\115\98\173\182\137\161\187\164\145\188\223\184\213\222\1\201\234\17\224\226\10\18\7\19\6\33\75\83\62\63\102\56\134\133\111\122\117\107\178\147\171\186\201\173\208\203\210\237\234\207\226\204\239\213\34\34\249\42\26\60\20\33\24\44\90\61\102\95\98\134\108\145\96\94\180\114\190\190\167\158\199\229\195\234\171\200\232\255\21\26\240\233\250\0\59\28\34\66\13\24\64\57\81\63\83\81\119\148\148\156\181\116\116\127\164\163\156\223\180\178\200\233\252\15\23\237\34\234\28\1\25\2\23\16\27\43\58\100\106\124\94\91\113\91\136\166\134\124\139\186\135\165\150\223\220\203\231\186\201\4\20\28\247\232\5\37\23\18\79\48\60\63\88\45\58\122\118\100\105\160\129\103\182\182\157\185\172\195\212\231\205\231\215\236\11\234\224\237\225\9\3\9\12\68\13\87\28\87\67\110\80\131\134\80\155\129\104\106\178\190\193\168\144\175\224\210\215\226\200\193\189\219\235\241\224\246\49\16\53\26\36\44\64\36\57\75\89\95\143\84\138\128\152\177\141\189\191\186\146\167\177\214\192\182\240\227\220\20\25\32\242\237\38\6\27\58\4\17\82\36\36\106\118\99\125\140\84\152\93\137\120\160\166\151\142\213\155\168\163\175\199\207\196\19\21\30\36\31\35\20\48\57\27\83\52\93\107\58\99\125\90\103\109\147\166\155\150\140\162\183\210\183\157\167\207\233\221\220\228\223\219\218\37\39\244\22\69\36\14\22\48\82\39\52\118\138\126\136\122\125\123\159\141\146\191\154\215\158\182\205\174\178\246\242\1\236\233\254\3\3\53\52\66\59\20\42\35\89\75\56\123\126\104\151\150\132\153\159\143\131\155\199\173\180\161\225\234\199\184\0\12\208\244\15\38\10\248\253\69\43\32\20\53\92\114\48\97\116\128\141\87\112\102\139\118\189\179\199\193\214\181\219\189\202\190\230\225\0\216\31\231\42\25\45\2\15\19\90\53\102\68\81\121\94\113\151\153\117\157\119\184\142\163\179\170\218\179\231\240\203\194\243\243\235\219\248\37\53\57\16\41\66\71\77\71\35\72\77\87\123\114\139\121\105\162\151\136\155\154\159\179\179\167\192\173\204\240\13\16\240\233\34\255\46\245\34\57\51\47\65\47\76\103\94\89\125\145\153\155\120\135\112\175\152\204\167\210\153\232\217\229\215\212\7\224\248\18\4\26\1\244\22\8\82\52\50\67\92\99\95\83\138\127\139\96\161\172\115\194\149\162\136\187\164\188\208\240\209\190\233\226\238\28\40\43\247\59\24\9\39\79\51\72\41\86\67\87\138\114\153\166\117\132\178\181\165\204\202\188\218\222\237\251\245\6\199\200\236\29\234\251\52\24\64\56\42\22\27\107\68\60\89\127\92\82\113\163\122\160\115\149\168\185\199\190\209\197\191\249\188\225\240\231\28\34\25\233\2\23\6\28\13\41\76\51\46\85\63\109\75\131\141\112\153\112\138\186\152\186\162\215\222\194\204\207\185\8\3\6\250\16\1\3\3\63\55\42\64\40\28\44\66\76\101\97\105\110\110\164\123\132\156\181\134\212\144\225\213\186\227\209\212\234\219\4\33\38\44\10\28\17\71\27\48\40\31\40\72\105\81\123\95\137\145\150\110\178\149\174\164\212\208\208\213\184\202\240\250\1\228\227\218\6\42\3\58\30\70\38\41\93\80\40\102\76\88\102\133\122\123\148\178\118\127\191\128\139\214\213\182\225\179\237\206\221\202\215\225\241\248\255\6\13\38\47\55\55\65\65\55\76\105\96\103\98",62),
	[_lIillIIIl("\197\190\212\219\215\227\227\246\183\195",75)] = _lIillIIIl("\200\188\175\195\205\249\185\219\222\5\20\237\244\251\2\22\34\43\69\41\64\89\58\70\77\87\91\98\105\112\119\180\135\140\171\154\161\168\176\205\189\249\247\217\217\224\231\238\247\19\4\18\39\47\43\38\45\52\51\110\78\85\92\114\130\129\126\173\149\130\183\202\162\169\176\184\208\217\247\215\234\246\249\29\28\33\245\34\30\47\22\41\62\54\66\77\61\140\117\143\115\153\156\136\190\146\192\174\141\208\167\218\191\243\213\229\7\15\235\37\239\8\249\68\19\11\72\41\65\96\84\83\97\65\98\114\120\155\173\119\143\164\202\157\199\163\182\176\248\223\229\236\206\209\242\22\24\246\42\49\31\82\78\47\72\77\83\75\93\88\108\124\125\116\165\164\119\149\158\147\216\207\224\210\175\243\253\215\228\243\235\0\239\6\50\59\11\85\56\94\82\67\60\120\118\104\111\152\150\132\130\147\173\166\161\164\144\184\217\219\237\179\231\239\19\13\2\22\242\46\64\2\55\48\25\44\50\104\110\65\129\72\98\153\146\141\157\174\122\147\166\180\224\191\225\220\240\3\228\6\232\12\221\249\44\14\42\70\30\31\83\93\51\42\83\82\101\96\151\88\98\141\163\115\164\147\169\173\220\161\238\174\209\242\9\15\10\246\255\13\18\245\57\2\81\84\23\28\84\69\107\96\138\141\149\142\126\166\129\185\175\126\142\146\178\221\223\177\251\246\224\15\243\24\39\246\46\238\14\9\36\64\49\59\76\82\125\89\107\144\109\147\105\134\114\169\158\166\171\208\152\194\228\212\210\2\190\236\244\1\253\253\38\21\4\37\32\73\62\89\74\121\78\91\140\151\124\140\100\129\172\149\165\202\190\213\213\192\235\179\232\223\254\226\6\12\26\233\45\249\14\63\17\35\45\87\43\59\80\85\74\103\137\112\171\162\179\152\182\170\201\186\187\228\169\176\237\226\223\206\213\11\19\44\33\8\15\59\36\13\85\92\80\83\58\137\67\140\122\160\140\102\168\172\165\140\174\151\222\221\202\249\208\6\10\243\207\17\6\12\249\20\60\46\53\55\32\32\72\90\117\89\109\135\105\167\100\172\137\148\189\202\167\186\212\224\245\202\234\243\228\21\15\240\2\9\39\249\41\62\53\80\65\58\71\119\64\84\91\98\105\112\137\146\154\154\164\164\149\170\199\190\197\192",88),
}
S._NavIconCache = {}

function S._DecodeNavIcon(data)
	local env = (getgenv and getgenv()) or _G
	local cryptApi = env and env.crypt
	local decoder
	if type(cryptApi) == _lIillIIIl("\224\212\220\237\237",101) then
		if type(cryptApi.base64) == _lIillIIIl("\237\225\233\250\250",114) then decoder = cryptApi.base64.decode end
		if type(decoder) ~= _lIillIIIl("\236\2\2\254\22\18\31\37",127) then decoder = cryptApi.base64decode end
	end
	local synApi = env and env.syn
	if type(decoder) ~= _lIillIIIl("\249\15\15\11\35\31\44\50",140) and type(synApi) == _lIillIIIl("\20\8\16\33\33",153) and type(synApi.crypt) == _lIillIIIl("\33\21\29\46\46",166)
		and type(synApi.crypt.base64) == _lIillIIIl("\46\34\42\59\59",179) then
		decoder = synApi.crypt.base64.decode
	end
	if type(decoder) ~= _lIillIIIl("\45\67\67\63\87\83\96\102",192) and env then decoder = env.base64_decode end
	if type(decoder) == _lIillIIIl("\58\80\80\76\100\96\114\120",205) then
		local ok, decoded = pcall(decoder, data)
		if ok and type(decoded) == _lIillIIIl("\84\92\97\95\112\112",218) then return decoded end
	end

	local alphabet = _lIillIIIl("\47\55\68\76\84\92\100\108\116\124\132\140\148\156\164\172\180\188\196\204\212\220\228\236\244\252\10\18\26\34\42\50\58\66\74\82\90\98\111\119\127\135\143\151\159\167\175\183\191\199\207\215\148\156\164\172\180\188\196\204\212\220\213\224",231)
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
	if not data or type(getter) ~= _lIillIIIl("\102\124\124\120\144\140\153\159",244) or type(writefile) ~= _lIillIIIl("\115\137\137\133\157\153\166\172",6) then return nil end
	local path = _lIillIIIl("\99\143\141\161\170\166\165\140\197\204\197\219\225\164\232\248\237\250\252\4\218\229\19",19) .. string.gsub(kind, _lIillIIIl("\76\91",32), _lIillIIIl("\147",45)) .. _lIillIIIl("\111\184\189\189",58)
	local exists = false
	if type(isfile) == _lIillIIIl("\180\202\202\198\222\218\231\237",71) then
		local ok, result = pcall(isfile, path)
		exists = ok and result == true
	end
	if not exists then
		pcall(function()
			if type(makefolder) == _lIillIIIl("\193\215\215\211\235\231\244\250",84) and (type(isfolder) ~= _lIillIIIl("\206\228\228\224\248\244\1\7",97) or not isfolder(_lIillIIIl("\190\234\232\252\5\1\0\231\32\39\32\54\60",110))) then
				makefolder(_lIillIIIl("\203\247\245\9\18\14\13\244\45\52\45\67\73",123))
			end
		end)
		local ok = pcall(writefile, path, S._DecodeNavIcon(data))
		if not ok then return nil end
	end
	local asset = S._NavIconCache[kind]
	if not asset then
		local ok, result = pcall(getter, path)
		if not ok or type(result) ~= _lIillIIIl("\2\10\15\13\25\25",136) then return nil end
		asset = result
		S._NavIconCache[kind] = asset
	end

	local slot = Instance.new(_lIillIIIl("\226\21\11\30\29",149))
	slot.Name = _lIillIIIl("\247\17\45\7\40\59\65\45\77\87\99",162)
	slot.Parent = parent
	slot.Position = UDim2.new(0, 8, 0.5, -11)
	slot.Size = UDim2.fromOffset(22, 22)
	slot.BackgroundColor3 = T.Elev
	slot.BackgroundTransparency = 1
	slot.BorderSizePixel = 0
	Corner(slot, 6)

	local image = Instance.new(_lIillIIIl("\255\42\37\50\55\37\65\73\83\97",175))
	image.Name = _lIillIIIl("\17\43\71\33\66\85\91",188)
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

local SG = Instance.new(_lIillIIIl("\35\58\80\74\81\97\65\123\118",201))
SG.Name = _lIillIIIl("\45\86\80\101\108\122\126\120\98\150\138",214)
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SG.ResetOnSpawn = false
SG.DisplayOrder = 1000
SG.IgnoreGuiInset = false
pcall(function() SG.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets end)

local uiP
if gethui then pcall(function() uiP = gethui() end) end
if not uiP then pcall(function() uiP = game:GetService(_lIillIIIl("\45\96\106\105\82\135\130",227)) end) end
if not uiP then uiP = LP:WaitForChild(_lIillIIIl("\71\111\107\138\125\145\109\162\157",240)) end
SG.Parent = uiP
S.Gui = SG

local NHost = Instance.new(_lIillIIIl("\79\130\120\139\138",2))
NHost.Name = _lIillIIIl("\100\140\152\148\152\172",15)
NHost.Parent = SG
NHost.AnchorPoint = Vector2.new(1, 0)
NHost.BackgroundTransparency = 1
NHost.Position = UDim2.new(1, -20, 0, 74)
NHost.Size = UDim2.new(0, 330, 0, 190)
NHost.ZIndex = 900
local nLayout = Instance.new(_lIillIIIl("\120\115\125\161\178\186\153\181\212\209\222\228",28))
nLayout.Parent = NHost
nLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
nLayout.SortOrder = Enum.SortOrder.LayoutOrder
nLayout.Padding = UDim.new(0, 6)

local refreshSB
local UIStyle = {
	Roots = { SG },
	BackgroundRoles = { _lIillIIIl("\114\126",41), _lIillIIIl("\144\173\175\183\187\193\217",54), _lIillIIIl("\141\178\202\195",67), _lIillIIIl("\156\202\202\226",80), _lIillIIIl("\172\218\232\222\242",93), _lIillIIIl("\178\219\243\239\3\249\221\9",106), _lIillIIIl("\192\233",119), _lIillIIIl("\205\246\203",132), _lIillIIIl("\236\23\217",145), _lIillIIIl("\249\36\231",158), _lIillIIIl("\6\32\15\45\52",171), _lIillIIIl("\19\45\28\66",184), _lIillIIIl("\23\65\73\67\55\85\92",197), _lIillIIIl("\36\78\86\80\68\111",210), _lIillIIIl("\39\80\87\101\117\130",223), _lIillIIIl("\74\98\111\129\121",236) },
	TextRoles = { _lIillIIIl("\92\116\124\142\134",249), _lIillIIIl("\102\145",11), _lIillIIIl("\115\158\95",24), _lIillIIIl("\128\171\109",37), _lIillIIIl("\141\184\123",50), _lIillIIIl("\135\176\183\192\208\221",63) },
	StrokeRoles = { _lIillIIIl("\149\190",76), _lIillIIIl("\162\203\160",89), _lIillIIIl("\174\215\222\231\247\4",102), _lIillIIIl("\209\233\241\3\251",115), _lIillIIIl("\219\6",128), _lIillIIIl("\232\19\212",141), _lIillIIIl("\245\32\226",154) },
}

function UIStyle:ReplaceColor(object, property, oldPalette, roles)
	local ok, value = pcall(function() return object[property] end)
	if not ok or typeof(value) ~= _lIillIIIl("\241\36\40\50\60\4",167) then return end
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
				if object:IsA(_lIillIIIl("\2\55\50\31\57\72\74\79\103",180)) and not object:GetAttribute(_lIillIIIl("\27\67\55\81\77\78\70\97\106\121\120\93\144\148\158\168",193)) then
					self:ReplaceColor(object, _lIillIIIl("\23\61\70\85\88\106\115\128\128\125\99\150\154\164\174\118",206), oldPalette, self.BackgroundRoles)
				end
				if object:IsA(_lIillIIIl("\54\78\104\107\79\107\115\125\139",219)) or object:IsA(_lIillIIIl("\67\91\122\125\82\140\146\153\155\161",232)) or object:IsA(_lIillIIIl("\85\109\135\138\95\147\163",245)) then
					self:ReplaceColor(object, _lIillIIIl("\98\122\148\151\109\160\164\174\184\128",7), oldPalette, self.TextRoles)
					if object:IsA(_lIillIIIl("\111\135\161\164\121\173\189",20)) then self:ReplaceColor(object, _lIillIIIl("\120\155\151\160\169\179\193\197\196\204\224\184\235\239\249\3\203",33), oldPalette, self.TextRoles) end
				elseif (object:IsA(_lIillIIIl("\126\169\164\177\182\164\192\200\210\224",46)) or object:IsA(_lIillIIIl("\139\182\177\190\195\167\225\231\238\240\246",59))) and not object:GetAttribute(_lIillIIIl("\162\202\190\216\212\213\205\232\236\251\250\223\18\22\32\42",72)) then
					self:ReplaceColor(object, _lIillIIIl("\165\208\203\216\221\194\245\249\3\13\213",85), oldPalette, self.TextRoles)
				elseif object:IsA(_lIillIIIl("\188\211\233\237\241\248\252\8\8\238\33\23\42\41",98)) then
					self:ReplaceColor(object, _lIillIIIl("\201\224\246\250\254\5\226\8\32\254\41\36\49\54\27\78\82\92\102\51",111), oldPalette, self.TextRoles)
				elseif object:IsA(_lIillIIIl("\216\211\228\12\17\21\24\25",124)) then
					self:ReplaceColor(object, _lIillIIIl("\211\6\10\20\30",137), oldPalette, self.StrokeRoles)
				elseif object:IsA(_lIillIIIl("\242\237\242\36\26\36\48\51\67\80",150)) and object.Parent and object.Parent:IsA(_lIillIIIl("\241\38\33\14\40\55\57\62\86",163)) then
					if object.Name == _lIillIIIl("\255\19\9\20\56\59\69\77\97\61\116\106\116\128\131\147\160",176) then
						object.Color = ColorSequence.new(T.White:Lerp(T.Accent, 0.14), T.White:Lerp(T.Card, 0.06))
					elseif object.Name == _lIillIIIl("\21\64\59\60\75\58\98\86\117\125\130\93\143\133\143\155\158\174\187",189) then
						object.Color = ColorSequence.new(T.White:Lerp(T.Accent, 0.16), T.White:Lerp(T.Elev, 0.08))
					elseif object.Name == _lIillIIIl("\21\81\77\71\90\93\99\80\129\129\125\145\142\120\170\160\170\182\185\201\214",202) then
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
				if object:IsA(_lIillIIIl("\50\74\100\103\70\103\111\121\135",215)) or object:IsA(_lIillIIIl("\63\87\113\121\78\136\142\149\151\157",228)) or object:IsA(_lIillIIIl("\76\105\131\134\91\143\159",241)) then
					local original = object:GetAttribute(_lIillIIIl("\90\131\125\146\153\162\166\160\145\187\185\190\199\211\205\223\206\230\0\3\233\6\30\16",3))
					if not original then
						original = object.TextSize
						pcall(function() object:SetAttribute(_lIillIIIl("\103\144\138\159\166\175\179\173\158\200\198\203\212\224\218\236\219\243\13\16\246\19\43\29",16), original) end)
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
				if object:IsA(_lIillIIIl("\107\160\155\136\162\177\179\184\208",29)) and object:GetAttribute(_lIillIIIl("\132\155\160\178\174\182\199\199\177\197\187",42)) == true then
					local scaler = object:FindFirstChild(_lIillIIIl("\134\154\144\168\205\198\218\194\217\222\240\240",55))
					if not scaler then
						scaler = Instance.new(_lIillIIIl("\160\155\172\195\200\218\218",68))
						scaler.Name = _lIillIIIl("\160\180\170\194\231\224\244\220\243\248\10\10",81)
						scaler.Parent = object
					end

					scaler.Scale = S.HUDScale * (tonumber(object:GetAttribute(_lIillIIIl("\178\219\213\227\237\237\213\255\17",94))) or 1)
				end
			end
		end
	end
	if S._refreshKeybindHUD then pcall(S._refreshKeybindHUD) end
	if S._refreshAppearance then pcall(S._refreshAppearance) end
end

UIStyle.NotificationPositions = {
	[_lIillIIIl("\198\232\240\167\218\250\2\23",107)] = true, [_lIillIIIl("\211\245\253\180\222\7\23\36\28\48",120)] = true, [_lIillIIIl("\224\2\10\193\250\24\29\37\56",133)] = true,
	[_lIillIIIl("\219\15\27\34\36\41\227\22\54\62\83",146)] = true, [_lIillIIIl("\232\28\40\47\49\54\240\26\67\83\96\88\108",159)] = true, [_lIillIIIl("\245\41\53\60\62\67\253\54\84\89\97\121",172)] = true,
}
function UIStyle:PlaceNotifications(value)
	S.NotificationPosition = self.NotificationPositions[value] and value or _lIillIIIl("\20\54\62\245\46\76\81\89\108",185)
	local top = S.NotificationPosition:sub(1, 3) == _lIillIIIl("\33\67\75",198)
	local left = S.NotificationPosition:sub(-4) == _lIillIIIl("\38\70\78\99",211)
	local right = S.NotificationPosition:sub(-5) == _lIillIIIl("\57\87\92\105\124",224)
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
	local toneKey = tone == _lIillIIIl("\88\97\117\117\122\142",237) and _lIillIIIl("\106\110\130\130\135\155",250) or tone == _lIillIIIl("\138\123\147\150",12) and _lIillIIIl("\151\136\160\163",25) or _lIillIIIl("\150\162\161\177",38)
	local key = toneKey .. _lIillIIIl("\58",51) .. tostring(title or "") .. _lIillIIIl("\71",64) .. tostring(msg or "")
	local now = os.clock()
	if RecentNotifs[key] and now - RecentNotifs[key] < 1.1 then return end
	RecentNotifs[key] = now
	NOrder += 1
	dur = dur or 2.8
	local accent = toneKey == _lIillIIIl("\189\201\200\216",77) and T.Accent or TONE[toneKey]
	SFX.Pop()

	local toast = Instance.new(_lIillIIIl("\167\218\208\227\226",90))
	toast.Name = _lIillIIIl("\188",103)
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

	local bar = Instance.new(_lIillIIIl("\193\244\234\253\252",116))
	bar.Parent = toast
	bar.BackgroundColor3 = accent
	bar.BorderSizePixel = 0
	bar.Size = UDim2.new(0, 2, 1, 0)
	bar.ZIndex = 902
	Corner(bar, 2)

	local sc = Instance.new(_lIillIIIl("\221\216\233\0\5\23\23",129)); sc.Scale = 0.9; sc.Parent = toast

	local tt = Instance.new(_lIillIIIl("\233\1\27\30\253\25\33\43\57",142))
	tt.Parent = toast; tt.BackgroundTransparency = 1; tt.Font = FB
	tt.Position = UDim2.new(0, MOBILE and 12 or 16, 0, MOBILE and 4 or 8); tt.Size = UDim2.new(1, -28, 0, MOBILE and 15 or 17)
	tt.Text = string.upper(tostring(title or "")); tt.TextColor3 = T.White; tt.TextSize = MOBILE and 10 or 12
	tt.TextXAlignment = Enum.TextXAlignment.Left; tt.TextTruncate = Enum.TextTruncate.AtEnd; tt.ZIndex = 902

	local bt = Instance.new(_lIillIIIl("\246\14\40\43\10\38\46\56\70",155))
	bt.Parent = toast; bt.BackgroundTransparency = 1; bt.Font = F
	bt.Position = UDim2.new(0, MOBILE and 12 or 16, 0, MOBILE and 19 or 25); bt.Size = UDim2.new(1, -28, 0, MOBILE and 16 or 17)
	bt.Text = tostring(msg or ""); bt.TextColor3 = T.Tx2; bt.TextSize = MOBILE and 10 or 11
	bt.TextXAlignment = Enum.TextXAlignment.Left; bt.TextTruncate = Enum.TextTruncate.AtEnd; bt.ZIndex = 902

	local timer = Instance.new(_lIillIIIl("\245\40\30\49\48",168))
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

local WarnFrame = Instance.new(_lIillIIIl("\2\53\43\62\61",181))
WarnFrame.Name = _lIillIIIl("\14\62\75\71\89\101\52\102\107\127\136",194)
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

local warnBar = Instance.new(_lIillIIIl("\28\79\69\88\87",207))
warnBar.Parent = WarnFrame
warnBar.BackgroundColor3 = Color3.fromRGB(255, 88, 88)
warnBar.BorderSizePixel = 0
warnBar.Size = UDim2.new(0, 3, 1, 0)
warnBar.ZIndex = 891
Corner(warnBar, 2)

local warnScale = Instance.new(_lIillIIIl("\56\51\68\91\101\119\119",220)); warnScale.Parent = WarnFrame

local WarnTxt = Instance.new(_lIillIIIl("\68\92\123\126\93\121\129\139\153",233))
WarnTxt.Parent = WarnFrame; WarnTxt.BackgroundTransparency = 1
WarnTxt.Position = UDim2.new(0, 17, 0, 8); WarnTxt.Size = UDim2.new(1, -95, 0, 18)
WarnTxt.Font = FB; WarnTxt.TextColor3 = Color3.fromRGB(255, 238, 238); WarnTxt.TextSize = 15
WarnTxt.TextXAlignment = Enum.TextXAlignment.Left; WarnTxt.Text = _lIillIIIl("\71\87\100\96\114\126\76\124\136\132\151\156\159\171\171",246); WarnTxt.TextTruncate = Enum.TextTruncate.AtEnd; WarnTxt.ZIndex = 891

local warnPill = Instance.new(_lIillIIIl("\99\123\149\152\119\147\155\165\179",8))
warnPill.Parent = WarnFrame; warnPill.AnchorPoint = Vector2.new(1, 0)
warnPill.Position = UDim2.new(1, -10, 0, 9); warnPill.Size = UDim2.fromOffset(66, 15)
warnPill.BackgroundColor3 = Color3.fromRGB(255, 88, 88); warnPill.BackgroundTransparency = 0.78
warnPill.BorderSizePixel = 0; warnPill.Font = FB; warnPill.TextSize = 8; warnPill.TextColor3 = Color3.fromRGB(255, 150, 150)
warnPill.Text = _lIillIIIl("\112\107\124\118\121\147",21); warnPill.ZIndex = 891
Corner(warnPill, 5)

local WarnSub = Instance.new(_lIillIIIl("\125\149\175\178\145\173\181\191\205",34))
WarnSub.Parent = WarnFrame; WarnSub.BackgroundTransparency = 1
WarnSub.Position = UDim2.new(0, 17, 0, 30); WarnSub.Size = UDim2.new(1, -30, 0, 16)
WarnSub.Font = F; WarnSub.TextColor3 = Color3.fromRGB(220, 177, 179); WarnSub.TextSize = 11
WarnSub.TextXAlignment = Enum.TextXAlignment.Left; WarnSub.Text = _lIillIIIl("\125\162\184\107\198\200\128\202\221\235\225\245",47); WarnSub.ZIndex = 891

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
	WarnSub.Text = _lIillIIIl("\151\146\163\157\160\186\141\163\170\162",60) .. (subText or _lIillIIIl("\151\188\210\133\224\226\154\228\247\5\251\15\196\218\210\33\41\43\51",73))
	WarnFrame.Visible = true
	warnScale.Scale = 0.85
	Tween(warnScale, 0.25, { Scale = 1 }, Enum.EasingStyle.Back):Play()
	if S.WarningSound then snd(_lIillIIIl("\207\198\227\211\236\243\236\2\254\0\221\217\224\241\240\247\1\6\13\21\26\39\46",86), 1, 0.6) end
	task.delay(3.5, function() if warnToken == my then WarnFrame.Visible = false end end)
end

local WW, WH = 920, 590

local Main = Instance.new(_lIillIIIl("\176\227\217\236\235",99))
Main.Name = _lIillIIIl("\196\223\238\250",112)
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
local mainScale = Instance.new(_lIillIIIl("\217\212\229\252\1\19\19",125)); mainScale.Parent = Main
mainScale.Scale = 0.9
if MOBILE then

	local limit = Instance.new(_lIillIIIl("\230\225\242\15\39\25\254\49\55\67\75\80\70\85\97\110",138))
	limit.MaxSize = Vector2.new(540, 430)
	limit.MinSize = Vector2.new(300, 260)
	limit.Parent = Main
end

local TBar = Instance.new(_lIillIIIl("\228\23\13\32\31",151))
TBar.Name = _lIillIIIl("\255\244\26\50",164)
TBar.Parent = Main
TBar.BackgroundTransparency = 1
TBar.Size = UDim2.new(1, 0, 0, M.titleH - 1)
TBar.Position = UDim2.new(0, 0, 0, 1)
TBar.Active = true

local TTitle = Instance.new(_lIillIIIl("\12\36\62\65\32\60\68\78\92",177))
TTitle.Parent = TBar; TTitle.BackgroundTransparency = 1
TTitle.Position = UDim2.new(0, MOBILE and 16 or 18, 0, MOBILE and 12 or 7)
TTitle.Size = UDim2.new(0, 180, 0, MOBILE and 22 or 20)
TTitle.Font = FB; TTitle.Text = _lIillIIIl("\21\30\24\45\52\61\65\59",190); TTitle.TextColor3 = T.White; TTitle.TextSize = 17
TTitle.TextXAlignment = Enum.TextXAlignment.Left

local TSub = Instance.new(_lIillIIIl("\38\62\88\91\58\86\99\109\123",203))
TSub.Parent = TBar; TSub.BackgroundTransparency = 1
TSub.Position = UDim2.new(0, MOBILE and 16 or 18, 0, MOBILE and 31 or 27)
TSub.Size = UDim2.new(0, 180, 0, 15)
TSub.Font = F; TSub.Text = _lIillIIIl("\39\39\49\53\76\39\80\97\93\102\117\132\129\147\139",216); TSub.TextColor3 = T.Tx3; TSub.TextSize = MOBILE and 11 or 12
TSub.TextXAlignment = Enum.TextXAlignment.Left

local UIRegistry = {}
local SearchEmpty
local SearchBox = Instance.new(_lIillIIIl("\64\88\114\122\79\131\147",229))
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
SearchBox.PlaceholderText = _lIillIIIl("\76\106\109\133\125\137\86\93\100",242)
SearchBox.PlaceholderColor3 = T.Tx3
SearchBox.Text = ""
SearchBox.ClearTextOnFocus = false
SearchBox.TextXAlignment = Enum.TextXAlignment.Left
Corner(SearchBox, MOBILE and 10 or 6)
Stroke(SearchBox, T.Bd2, 1, 0.4)
Pad(SearchBox, 0, 0, MOBILE and 14 or 8, MOBILE and 34 or 20)

local ClearSearchBtn = Instance.new(_lIillIIIl("\95\119\145\148\105\163\169\176\178\184",4))
ClearSearchBtn.Parent = SearchBox
ClearSearchBtn.AnchorPoint = Vector2.new(1, 0.5)
ClearSearchBtn.Position = UDim2.new(1, MOBILE and -8 or -3, 0.5, 0)
ClearSearchBtn.Size = UDim2.new(0, MOBILE and 22 or 16, 0, MOBILE and 22 or 16)
ClearSearchBtn.BackgroundTransparency = 1
ClearSearchBtn.Font = FB; ClearSearchBtn.Text = _lIillIIIl("\144",17); ClearSearchBtn.TextColor3 = T.Tx3; ClearSearchBtn.TextSize = 12
ClearSearchBtn.Visible = false
ClearSearchBtn.MouseButton1Click:Connect(function() SearchBox.Text = "" end)

local Pages, activePage = {}, nil
local function applySearch()
	local q = string.lower(SearchBox.Text):gsub(_lIillIIIl("\131\81\166\101",30), ""):gsub(_lIillIIIl("\87\172\107\107",43), "")
	local tokens = {}
	for w in string.gmatch(q, _lIillIIIl("\100\153\120",56)) do table.insert(tokens, w) end
	ClearSearchBtn.Visible = (#tokens > 0)
	local cardVis = {}
	local matches = 0
	for _, e in ipairs(UIRegistry) do
		if e.row and e.row.Parent then
			local vis = true
			if #tokens > 0 then
				local hay = e.label .. _lIillIIIl("\108",69) .. string.lower(e.card and e.card.Name or "")
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
SearchBox:GetPropertyChangedSignal(_lIillIIIl("\173\197\223\226",82)):Connect(applySearch)

local function mkWinBtn(txt, xOff)
	local b = Instance.new(_lIillIIIl("\186\210\236\239\196\254\4\11\13\19",95))
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
local btnClose = mkWinBtn(_lIillIIIl("\203",108), MOBILE and -14 or -16)

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
	RunService:BindToRenderStep(_lIillIIIl("\208\249\243\8\15\24\28\22\5\46\59\64\57\48\80\85\95\90\110",121), Enum.RenderPriority.Last.Value, function()
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

local Body = Instance.new(_lIillIIIl("\211\6\252\15\14",134))
Body.Name = _lIillIIIl("\220\16\12\40",147)
Body.Parent = Main
Body.BackgroundTransparency = 1
Body.Position = UDim2.new(0, 0, 0, M.titleH)

Body.Size = UDim2.new(1, 0, 1, -(M.titleH + (MOBILE and 8 or 32)))

local Sidebar = Instance.new(MOBILE and _lIillIIIl("\250\17\39\43\47\54\58\70\70\44\95\85\109\108",160) or _lIillIIIl("\250\45\35\54\53",173))
Sidebar.Name = _lIillIIIl("\20\49\51\59\63\69\93",186)
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
local SBLayout = Instance.new(_lIillIIIl("\35\30\40\76\93\101\68\101\132\129\142\148",199))
SBLayout.Parent = Sidebar
SBLayout.SortOrder = Enum.SortOrder.LayoutOrder
SBLayout.FillDirection = Enum.FillDirection.Vertical

SBLayout.VerticalAlignment = Enum.VerticalAlignment.Top
SBLayout.HorizontalAlignment = MOBILE and Enum.HorizontalAlignment.Center or Enum.HorizontalAlignment.Left
SBLayout.Padding = UDim.new(0, MOBILE and 6 or 4)

local openAppearance

if not MOBILE then
local ProfileButton = Instance.new(_lIillIIIl("\47\71\97\100\57\120\126\133\135\141",212))
ProfileButton.Name = _lIillIIIl("\56\97\101\104\114\124\124",225)
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
local ProfileAvatar = Instance.new(_lIillIIIl("\62\110\105\118\123\105\133\141\151\165",238))
ProfileAvatar.Name = _lIillIIIl("\72\132\118\144\132\156",0)
ProfileAvatar.Parent = ProfileButton
ProfileAvatar.Position = UDim2.new(0, 8, 0.5, -17)
ProfileAvatar.Size = UDim2.fromOffset(34, 34)
ProfileAvatar.BackgroundTransparency = 1
ProfileAvatar.BorderSizePixel = 0
ProfileAvatar.Image = _lIillIIIl("\134\125\154\138\163\170\163\185\134\130\137\213\205\231\234\242\246\240\5\200\21\16\221\252\49\44\46\54\76\78\85\89\35\80\115\111\142\129\149\115\148\167\173\116\189\194\194",13)
ProfileAvatar.ImageColor3 = Color3.fromRGB(254, 254, 254)
ProfileAvatar.ScaleType = Enum.ScaleType.Crop
ProfileAvatar:SetAttribute(_lIillIIIl("\116\156\144\170\166\167\159\186\190\205\204\177\228\232\242\252",26), true)
Corner(ProfileAvatar, 9999)
Stroke(ProfileAvatar, T.Bd2, 1, 0.4)
task.spawn(function()
	local ok, image = pcall(function()
		return Players:GetUserThumbnailAsync(LP.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
	end)
	if ok and type(image) == _lIillIIIl("\161\169\174\172\184\184",39) and image ~= "" and ProfileAvatar.Parent then
		ProfileAvatar.Image = image
	end
end)
local ProfileTitle = Instance.new(_lIillIIIl("\143\167\193\196\163\191\199\209\223",52))
ProfileTitle.Parent = ProfileButton; ProfileTitle.BackgroundTransparency = 1
ProfileTitle.Position = UDim2.new(0, 49, 0.5, -13); ProfileTitle.Size = UDim2.new(1, -56, 0, 15)
ProfileTitle.Font = FM; ProfileTitle.TextSize = 12; ProfileTitle.TextColor3 = T.Tx
ProfileTitle.TextXAlignment = Enum.TextXAlignment.Left; ProfileTitle.TextTruncate = Enum.TextTruncate.AtEnd
ProfileTitle.Text = LP.DisplayName
local ProfileSub = Instance.new(_lIillIIIl("\156\180\206\209\176\204\212\222\236",65))
ProfileSub.Parent = ProfileButton; ProfileSub.BackgroundTransparency = 1
ProfileSub.Position = UDim2.new(0, 49, 0.5, 2); ProfileSub.Size = UDim2.new(1, -56, 0, 11)
ProfileSub.Font = F; ProfileSub.TextSize = 10; ProfileSub.TextColor3 = T.Tx3
ProfileSub.TextXAlignment = Enum.TextXAlignment.Left; ProfileSub.TextTruncate = Enum.TextTruncate.AtEnd
ProfileSub.Text = _lIillIIIl("\149",78) .. tostring(LP.Name)
ProfileButton.MouseEnter:Connect(function() Tween(ProfileButton, 0.14, { BackgroundColor3 = T.Hover }):Play() end)
ProfileButton.MouseLeave:Connect(function() Tween(ProfileButton, 0.14, { BackgroundColor3 = T.Card }):Play() end)
ProfileButton.MouseButton1Click:Connect(function() if openAppearance then openAppearance() end end)
end

local SBLine = Instance.new(_lIillIIIl("\168\219\209\228\227",91))
SBLine.Name = _lIillIIIl("\194\184\201\237\249\247",104)
SBLine.Parent = Body
SBLine.BackgroundColor3 = T.Bd
SBLine.BorderSizePixel = 0
SBLine.Position = UDim2.new(0, 157, 0, 8)
SBLine.Size = UDim2.new(0, 1, 1, -24)
SBLine.Visible = not MOBILE
Corner(SBLine, 1)

local ContentArea = Instance.new(_lIillIIIl("\207\230\252\0\4\11\15\27\27\1\52\42\61\60",117))
ContentArea.Name = _lIillIIIl("\204\255\5\18\10\26\39",130)
ContentArea.Parent = Body
ContentArea.BackgroundTransparency = 1
ContentArea.BorderSizePixel = 0

ContentArea.Position = MOBILE and UDim2.new(0, M.railW + 12, 0, 0) or UDim2.new(0, 164, 0, 0)
ContentArea.Size = MOBILE and UDim2.new(1, -(M.railW + 18), 1, 0) or UDim2.new(1, -172, 1, 0)
ContentArea.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentArea.AutomaticCanvasSize = Enum.AutomaticSize.Y
ContentArea.ScrollBarThickness = MOBILE and 0 or 3
ContentArea.ScrollBarImageColor3 = T.Tx3

SearchEmpty = Instance.new(_lIillIIIl("\234\2\28\31\254\26\34\44\58",143))
SearchEmpty.Name = _lIillIIIl("\246\15\18\42\34\46\18\65\75\86\98",156)
SearchEmpty.Parent = Main
SearchEmpty.BackgroundTransparency = 1
SearchEmpty.Position = UDim2.new(0, MOBILE and (M.railW + 12) or 164, 0, M.titleH)
SearchEmpty.Size = MOBILE and UDim2.new(1, -(M.railW + 18), 1, -(M.titleH + 8)) or UDim2.new(1, -172, 1, -83)
SearchEmpty.Font = FM; SearchEmpty.TextSize = 14; SearchEmpty.TextColor3 = T.Tx3
SearchEmpty.TextXAlignment = Enum.TextXAlignment.Center; SearchEmpty.TextYAlignment = Enum.TextYAlignment.Center
SearchEmpty.Text = _lIillIIIl("\254\38\222\50\45\71\61\73\81\93\93\34\111\133\133\129\153\149\162\168\180",169)
SearchEmpty.Visible = false
SearchEmpty.ZIndex = 20

local Footer = Instance.new(_lIillIIIl("\3\54\44\63\62",182))
Footer.Parent = Main
Footer.BackgroundColor3 = T.Sidebar
Footer.BorderSizePixel = 0
Footer.AnchorPoint = Vector2.new(0, 1)
Footer.Position = UDim2.new(0, 0, 1, 0)
Footer.Size = UDim2.new(1, 0, 0, 32)
Footer.Visible = not MOBILE
Corner(Footer, 14)

local FootLeft = Instance.new(_lIillIIIl("\30\54\80\83\50\78\86\101\115",195))
FootLeft.Parent = Footer; FootLeft.BackgroundTransparency = 1
FootLeft.Position = UDim2.new(0, 16, 0, 0); FootLeft.Size = UDim2.new(0, 200, 1, 0)
FootLeft.Font = FM; FootLeft.Text = _lIillIIIl("\39\48\42\63\70\79\88\82\52\99\119\107",208); FootLeft.TextColor3 = T.Tx3; FootLeft.TextSize = 12
FootLeft.TextXAlignment = Enum.TextXAlignment.Left

local FootMid = Instance.new(_lIillIIIl("\56\80\106\109\81\109\117\127\141",221))
FootMid.Parent = Footer; FootMid.BackgroundTransparency = 1
FootMid.AnchorPoint = Vector2.new(0.5, 0); FootMid.Position = UDim2.new(0.5, 0, 0, 0)
FootMid.Size = UDim2.new(0, 280, 1, 0)
FootMid.Font = FM; FootMid.Text = ""; FootMid.TextColor3 = T.Tx2; FootMid.TextSize = 12

local FootRight = Instance.new(_lIillIIIl("\69\93\124\127\94\122\130\140\154",234))
FootRight.Parent = Footer; FootRight.BackgroundTransparency = 1
FootRight.AnchorPoint = Vector2.new(1, 0); FootRight.Position = UDim2.new(1, -16, 0, 0)
FootRight.Size = UDim2.new(0, 220, 1, 0)
FootRight.Font = F; FootRight.Text = _lIillIIIl("\76\120\132\125\145\154\77\22\187\214\105\189\188\204\218",247); FootRight.TextColor3 = T.Tx3; FootRight.TextSize = 12
FootRight.TextXAlignment = Enum.TextXAlignment.Right

local isMinimized = false

local function mkPage(name)
    local sf = Instance.new(_lIillIIIl("\86\137\127\146\145",9))
    sf.Name = name
    sf.Parent = ContentArea
    sf.BackgroundTransparency = 1
    sf.BorderSizePixel = 0
    sf.Position = UDim2.new(0, 0, 0, 0)
    sf.Size = UDim2.new(1, 0, 1, 0)
    sf.AutomaticSize = Enum.AutomaticSize.None
    sf.Visible = false

    local hdr = Instance.new(_lIillIIIl("\113\137\163\166\133\161\169\179\193",22))
    hdr.Name = _lIillIIIl("\125\150\153\177\169\181\156\191\212",35)
    hdr.Parent = sf
    hdr.LayoutOrder = -1
    hdr.BackgroundColor3 = T.Elev; pcall(function() hdr:SetAttribute(_lIillIIIl("\139\166\170\185\184\157\208\212\222\232\207\243\247\247\248\226\8\17\32\35\53\57\70\70\67\41\92\96\111\121\65",48), _lIillIIIl("\137\183\183\207",61)) end)
    hdr.BackgroundTransparency = 0.25
    hdr.BorderSizePixel = 0
    hdr.Size = UDim2.new(1, 0, 0, 24)
    hdr.Font = FB
    hdr.TextSize = 12
    hdr.TextColor3 = T.Tx2; pcall(function() hdr:SetAttribute(_lIillIIIl("\165\192\196\211\210\183\234\238\248\2\233\13\17\17\18\14\38\64\67\25\76\80\90\100\44",74), _lIillIIIl("\178\221\158",87)) end)
    hdr.TextXAlignment = Enum.TextXAlignment.Left
    hdr.Text = string.upper(name)
    hdr.Visible = false
    Corner(hdr, 6)
    Pad(hdr, 0, 0, 10, 10)
    Pages[name] = sf
    return sf
end

local TAB_DEFS = {
	{ name = _lIillIIIl("\193\219\236\245\232\250\8",100), icon = _lIillIIIl("\221\248\235",113) },
	{ name = _lIillIIIl("\200\251\0\252\2\28",126), icon = _lIillIIIl("\245\11\15\26\33\29\29\44\60",139) },
	{ name = _lIillIIIl("\236\21\33\29\42\48",152), icon = _lIillIIIl("\19\20\47\40\45",165) },
	{ name = _lIillIIIl("\9\44\40\71\58\78",178), icon = _lIillIIIl("\59\64\57\77\15\91\95\108\113\110",191) },
	{ name = _lIillIIIl("\20\79\85\87",204), icon = _lIillIIIl("\66\86\98",217) },
	{ name = _lIillIIIl("\58\93\115\106",230), icon = _lIillIIIl("\113\120\114\130\126\138",243) },
	{ name = _lIillIIIl("\79\130\136\135\145\150",5), icon = _lIillIIIl("\140\133\155\162\158\170\170\189\126\138",18) },
}

if MOBILE then table.insert(TAB_DEFS, { name = _lIillIIIl("\104\162\168\175\177\183\195",31), icon = _lIillIIIl("\166\159\181\188\184\196\196\215\152\164",44) }) end

local SBItems = {}

local function mkSBItem(name, iconKind, page, order)
	local btn = Instance.new(_lIillIIIl("\148\172\198\201\158\216\222\229\231\237",57))
	btn.Name = _lIillIIIl("\161\181\189\193",70) .. name
	btn.Parent = Sidebar
	btn.LayoutOrder = order

	btn.Size = MOBILE and UDim2.new(0, M.railW - 12, 0, M.railItemH) or UDim2.new(1, 0, 0, 34)
	btn.AutoButtonColor = false
	btn.BackgroundTransparency = 1
	btn.BorderSizePixel = 0
	btn.Text = ""
	Corner(btn, MOBILE and 12 or 8)

	local barInd = Instance.new(_lIillIIIl("\160\211\201\220\219",83))
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
	local label = Instance.new(_lIillIIIl("\187\211\237\240\207\235\243\253\11",96))
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
	local card = Instance.new(_lIillIIIl("\186\237\227\246\245",109))
	card.Name = _lIillIIIl("\210\253\248\249\8\247\31\19\45\53\58",122); card.Parent = Sidebar; card.LayoutOrder = 100
	card.Size = UDim2.new(1, 0, 0, 94); card.BackgroundColor3 = T.Card; card.BorderSizePixel = 0
	Corner(card, 9); Stroke(card, T.Bd2, 1, 0.28)
	local quickGradient = Grad(card, T.White:Lerp(T.Accent, 0.16), T.White:Lerp(T.Elev, 0.08), 90)
	quickGradient.Name = _lIillIIIl("\223\10\5\6\21\4\44\32\58\66\71\34\84\74\84\96\104\120\133",135)
	local headMark = Instance.new(_lIillIIIl("\225\20\10\29\28",148))
	headMark.Parent = card; headMark.Position = UDim2.fromOffset(9, 7); headMark.Size = UDim2.fromOffset(2, 11)
	headMark.BackgroundColor3 = T.Accent; headMark.BorderSizePixel = 0; Corner(headMark, 2)
	local heading = Instance.new(_lIillIIIl("\252\20\46\49\16\44\52\62\76",161))
	heading.Parent = card; heading.BackgroundTransparency = 1
	heading.Position = UDim2.fromOffset(17, 4); heading.Size = UDim2.new(1, -35, 0, 18)
	heading.Font = FB; heading.TextSize = 10; heading.TextColor3 = T.Tx2
	heading.TextXAlignment = Enum.TextXAlignment.Left; heading.Text = _lIillIIIl("\6\17\12\13\28\248\50\58\46\72\85\90",174)
	local stateDot = Instance.new(_lIillIIIl("\8\59\49\68\67",187))
	stateDot.Parent = card; stateDot.AnchorPoint = Vector2.new(1, 0.5)
	stateDot.Position = UDim2.new(1, -9, 0, 13); stateDot.Size = UDim2.fromOffset(5, 5)
	stateDot.BackgroundColor3 = T.Accent; stateDot.BorderSizePixel = 0; Corner(stateDot, 5)
	local divider = Instance.new(_lIillIIIl("\21\72\62\81\80",200))
	divider.Parent = card; divider.Position = UDim2.fromOffset(9, 25); divider.Size = UDim2.new(1, -18, 0, 1)
	divider.BackgroundColor3 = T.Bd; divider.BackgroundTransparency = 0.48; divider.BorderSizePixel = 0
	local body = Instance.new(_lIillIIIl("\34\85\75\94\93",213))
	body.Parent = card; body.BackgroundTransparency = 1
	body.Position = UDim2.fromOffset(0, 27); body.Size = UDim2.new(1, 0, 1, -29)
	local function statusRow(keyText, index)
		local row = Instance.new(_lIillIIIl("\47\98\88\112\111",226))
		row.Parent = body; row.BackgroundTransparency = 1
		row.Position = UDim2.new(0, 9, 0, (index - 1) * 21); row.Size = UDim2.new(1, -18, 0, 21)
		if index > 1 then
			local line = Instance.new(_lIillIIIl("\60\116\106\125\124",239))
			line.Parent = row; line.Size = UDim2.new(1, 0, 0, 1)
			line.BackgroundColor3 = T.Bd; line.BackgroundTransparency = 0.62; line.BorderSizePixel = 0
		end
		local key = Instance.new(_lIillIIIl("\92\116\142\145\112\140\148\158\172",1))
		key.Parent = row; key.BackgroundTransparency = 1; key.Size = UDim2.new(0, 48, 1, 0)
		key.Font = F; key.TextSize = 9; key.TextColor3 = T.Tx4; key.TextXAlignment = Enum.TextXAlignment.Left; key.Text = keyText
		local value = Instance.new(_lIillIIIl("\105\129\155\158\125\153\161\171\185",14))
		value.Parent = row; value.BackgroundTransparency = 1; value.Position = UDim2.fromOffset(48, 0)
		value.Size = UDim2.new(1, -48, 1, 0); value.Font = FM; value.TextSize = 10; value.TextColor3 = T.Tx
		value.TextXAlignment = Enum.TextXAlignment.Right; value.TextTruncate = Enum.TextTruncate.AtEnd; value.Text = _lIillIIIl("\79\86",27)
		return value
	end
	local roomValue = statusRow(_lIillIIIl("\129\133\140\145",40), 1)
	local stateValue = statusRow(_lIillIIIl("\143\151\139\165\157",53), 2)
	local networkValue = statusRow(_lIillIIIl("\153\153\165\165",66), 3)
	task.spawn(function()
		while not S.Destroyed and card.Parent do
			local room = LP:GetAttribute(_lIillIIIl("\168\204\211\216\192\238\237",79)) or LP:GetAttribute(_lIillIIIl("\166\223\227\234\228\244\1\230\10\17\22",92)) or _lIillIIIl("\157\164",105)
			local ping = math.floor((LP:GetNetworkPing() or 0) * 1000 + 0.5)
			local active = S.Ready ~= false
			roomValue.Text = tostring(room)
			stateValue.Text = active and _lIillIIIl("\190\199\223\219\239\229",118) or _lIillIIIl("\225\210\225\243\239\251\251",131)
			stateValue.TextColor3 = active and T.Accent or T.Tx3
			stateDot.BackgroundColor3 = active and T.Accent or T.Tx4
			stateDot.BackgroundTransparency = active and 0 or 0.45
			networkValue.Text = tostring(ping) .. _lIillIIIl("\183\11\24",144)
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
	local panel = Instance.new(_lIillIIIl("\234\29\19\38\37",157))
	panel.Name = _lIillIIIl("\242\40\47\43\46\70\60\80\76\85\74\104\126\133\129\141\141\160",170)
	panel.Parent = SG
	panel.AnchorPoint = Vector2.new(0.5, 0.5)
	panel.Position = UDim2.fromScale(0.5, 0.5)

	panel.Size = MOBILE and UDim2.fromScale(0.9, 0.78) or UDim2.fromOffset(320, 456)
	if MOBILE then
		local limit = Instance.new(_lIillIIIl("\19\14\31\60\84\70\43\94\100\117\125\130\120\135\147\160",183))
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
	local scale = Instance.new(_lIillIIIl("\32\27\44\67\72\90\90",196)); scale.Parent = panel

	local title = Instance.new(_lIillIIIl("\44\68\94\97\64\97\105\115\129",209))
	title.Parent = panel; title.BackgroundTransparency = 1
	title.Position = UDim2.fromOffset(16, 12); title.Size = UDim2.new(1, -58, 0, 24)
	title.Font = FB; title.TextSize = 15; title.TextColor3 = T.White
	title.TextXAlignment = Enum.TextXAlignment.Left; title.Text = _lIillIIIl("\46\58\71\63\88\83\85\94\103",222)
	local subtitle = Instance.new(_lIillIIIl("\70\94\125\128\95\123\131\141\155",235))
	subtitle.Parent = panel; subtitle.BackgroundTransparency = 1
	subtitle.Position = UDim2.fromOffset(16, 34); subtitle.Size = UDim2.new(1, -32, 0, 18)
	subtitle.Font = F; subtitle.TextSize = 10; subtitle.TextColor3 = T.Tx3
	subtitle.TextXAlignment = Enum.TextXAlignment.Left; subtitle.Text = _lIillIIIl("\88\115\119\134\133\83\78\125\145\135\106\196\187\192\210\210\160\155\244\238\241\251\255\7\21\31\35\53\65\239\55\75\72\11\96\104\121\117\121\131\132\137\163\159\172\178\190",248)

	local close = Instance.new(_lIillIIIl("\101\125\151\154\111\169\175\182\184\190",10))
	close.Parent = panel; close.AnchorPoint = Vector2.new(1, 0)
	close.Position = UDim2.new(1, -12, 0, 12); close.Size = UDim2.fromOffset(MOBILE and 36 or 26, MOBILE and 36 or 26)
	close.BackgroundColor3 = T.Elev; close.BorderSizePixel = 0; close.AutoButtonColor = false
	close.Font = FM; close.TextSize = MOBILE and 22 or 18; close.TextColor3 = T.Tx2; close.Text = _lIillIIIl("\225\188",23); close.ZIndex = 1502
	Corner(close, MOBILE and 10 or 7); Stroke(close, T.Bd2, 1, 0.4)

	local body = Instance.new(_lIillIIIl("\126\149\171\175\179\186\190\202\202\176\227\217\236\235",36))
	body.Parent = panel; body.BackgroundTransparency = 1; body.BorderSizePixel = 0
	body.Position = UDim2.fromOffset(14, 62); body.Size = UDim2.new(1, -28, 1, -76)
	body.CanvasSize = UDim2.new()
	body.AutomaticCanvasSize = Enum.AutomaticSize.Y
	body.ScrollBarThickness = MOBILE and 0 or 3
	body.ScrollBarImageColor3 = T.Tx3
	local layout = Instance.new(_lIillIIIl("\141\136\146\182\199\207\174\202\233\230\243\249",49))
	layout.Parent = body; layout.SortOrder = Enum.SortOrder.LayoutOrder; layout.Padding = UDim.new(0, MOBILE and 10 or 8)
	local choiceRefreshers = {}

	local function makeChoice(labelText, values, getValue, onValue, order, display)
		local row = Instance.new(_lIillIIIl("\139\190\180\199\198",62))
		row.Parent = body; row.LayoutOrder = order; row.Size = UDim2.new(1, 0, 0, MOBILE and 68 or 52)
		row.BackgroundColor3 = T.BG; row.BorderSizePixel = 0
		Corner(row, 9); Stroke(row, T.Bd2, 1, 0.42)
		local label = Instance.new(_lIillIIIl("\166\190\216\219\186\214\222\232\246",75))
		label.Parent = row; label.BackgroundTransparency = 1
		label.Position = UDim2.fromOffset(10, MOBILE and 7 or 5); label.Size = UDim2.new(1, -20, 0, 17)
		label.Font = F; label.TextSize = MOBILE and 11 or 10; label.TextColor3 = T.Tx3
		label.TextXAlignment = Enum.TextXAlignment.Left; label.Text = labelText
		local button = Instance.new(_lIillIIIl("\179\203\229\232\189\247\253\4\6\12",88))
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
	makeChoice(_lIillIIIl("\192\184\210\213\168\226\223\247\233",101), textValues, function() return S.UITextScale end, function(value)
		UIStyle:ApplyTextScale(value)
	end, 1, function(value) return value == 0.88 and _lIillIIIl("\204\237\232\250\1",114) or (value == 1.18 and _lIillIIIl("\210\238\6\2\7",127) or _lIillIIIl("\225\9\19\21\16\34",140)) end)
	makeChoice(_lIillIIIl("\232\252\242\213\15\12\36\22",153), { 0.8, 0.9, 1, 1.15, 1.3 }, function()
		return S.HUDScale
	end, function(value)
		UIStyle:ApplyHUDScale(value)
	end, 2, function(value) return tostring(math.floor(value * 100 + 0.5)) .. _lIillIIIl("\210",166) end)
	makeChoice(_lIillIIIl("\8\16\28\24\28\38\39\44\70\66\84\90\51\106\112\123\120\138\134\147\153",179), { _lIillIIIl("\27\61\69\252\53\83\88\96\120",192), _lIillIIIl("\22\74\86\93\95\100\35\92\122\127\135\154",205), _lIillIIIl("\35\87\99\106\113\118\48\90\131\147\160\152\172",218), _lIillIIIl("\48\100\117\124\126\131\61\112\144\152\173",231), _lIillIIIl("\84\118\126\53\104\136\144\165",244), _lIillIIIl("\97\131\139\66\108\149\165\178\170\190",6) }, function()
		return S.NotificationPosition
	end, function(value)
		UIStyle:PlaceNotifications(value)
	end, 3)
	local themeCard = Instance.new(_lIillIIIl("\96\147\137\156\155",19))
	themeCard.Parent = body; themeCard.LayoutOrder = 4; themeCard.Size = UDim2.new(1, 0, 0, MOBILE and 216 or 150)
	themeCard.BackgroundColor3 = T.BG; themeCard.BorderSizePixel = 0
	Corner(themeCard, 9); Stroke(themeCard, T.Bd2, 1, 0.42)
	local themeTitle = Instance.new(_lIillIIIl("\123\147\173\176\143\171\179\189\203",32))
	themeTitle.Parent = themeCard; themeTitle.BackgroundTransparency = 1
	themeTitle.Position = UDim2.fromOffset(10, 5); themeTitle.Size = UDim2.new(1, -20, 0, 17)
	themeTitle.Font = F; themeTitle.TextSize = 10; themeTitle.TextColor3 = T.Tx3
	themeTitle.TextXAlignment = Enum.TextXAlignment.Left; themeTitle.Text = _lIillIIIl("\136\131\135\150\149",45)
	local gridHost = Instance.new(_lIillIIIl("\135\186\176\195\194",58))
	gridHost.Parent = themeCard; gridHost.BackgroundTransparency = 1
	gridHost.Position = UDim2.fromOffset(8, 26); gridHost.Size = UDim2.new(1, -16, 1, -34)
	local grid = Instance.new(_lIillIIIl("\163\158\163\213\211\213\196\224\255\252\9\15",71))
	grid.Parent = gridHost; grid.CellSize = UDim2.new(0.5, -3, 0, MOBILE and 34 or 20); grid.CellPadding = UDim2.fromOffset(6, MOBILE and 6 or 4)
	grid.FillDirectionMaxCells = 2; grid.SortOrder = Enum.SortOrder.LayoutOrder
	local themeButtons = {}
	local themeNames = { _lIillIIIl("\159\199\207\209\236\234\249",84), _lIillIIIl("\175\225\215\237\236\244\6\254",97), _lIillIIIl("\196\223\232\235\255",110), _lIillIIIl("\200\248\2\252\17\25",123), _lIillIIIl("\230\255\11\9",136), _lIillIIIl("\242\12\25\29\29\51",149), _lIillIIIl("\238\29\25\35\55",162), _lIillIIIl("\247\42\38\48\68",175), _lIillIIIl("\21\57\68\61",188) }
	local function refreshThemes()
		for name, button in pairs(themeButtons) do
			local selected = name == S.UITheme
			button.BackgroundColor3 = selected and T.ActiveBg or T.Elev
			button.TextColor3 = selected and T.White or T.Tx2
		end
	end
	for index, name in ipairs(themeNames) do
		local button = Instance.new(_lIillIIIl("\36\60\86\89\46\104\110\122\124\130",201))
		button.Parent = gridHost; button.LayoutOrder = index; button.AutoButtonColor = false
		button.BackgroundColor3 = T.Elev; button.BorderSizePixel = 0
		button.Font = FM; button.TextSize = MOBILE and 13 or 10; button.TextColor3 = T.Tx2; button.Text = name
		Corner(button, MOBILE and 9 or 6); Stroke(button, T.Bd2, 1, 0.48)
		local dot = Instance.new(_lIillIIIl("\35\86\76\95\94",214))
		dot.Parent = button; dot.AnchorPoint = Vector2.new(1, 0.5); dot.Position = UDim2.new(1, -7, 0.5, 0)
		dot.Size = UDim2.fromOffset(7, 7); dot.BackgroundColor3 = THEMES[name].Accent; dot.BorderSizePixel = 0; Corner(dot, 99)
		dot:SetAttribute(_lIillIIIl("\61\101\89\120\116\117\109\136\140\155\154\127\178\182\192\202",227), true)
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

	local executor = Instance.new(_lIillIIIl("\75\104\130\133\100\128\136\146\160",240))
	executor.Parent = body; executor.LayoutOrder = 5; executor.Size = UDim2.new(1, 0, 0, 28)
	executor.BackgroundColor3 = T.BG; executor.BorderSizePixel = 0
	executor.Font = F; executor.TextSize = 10; executor.TextColor3 = T.Tx2
	executor.TextXAlignment = Enum.TextXAlignment.Left
	local executorName = _lIillIIIl("\94\126\130\140\148\163\161\90\166\192\180\185\210\216\218\228",2)
	pcall(function() if identifyexecutor then executorName = tostring(identifyexecutor()) end end)
	executor.Text = _lIillIIIl("\54\61\68\112\138\126\131\156\162\164\174\131\138\145",15) .. executorName
	Corner(executor, 8); Stroke(executor, T.Bd2, 1, 0.44)
	for _, object in ipairs(panel:GetDescendants()) do if object:IsA(_lIillIIIl("\106\159\154\135\161\176\178\183\207",28)) then object.ZIndex = math.max(object.ZIndex, 1501) end end

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

local BindPrompt = Instance.new(_lIillIIIl("\118\169\159\178\177",41))
BindPrompt.Name = _lIillIIIl("\141\182\176\197\204\213\217\211\183\229\241\238\212\249\15\26\34\38\32",54)
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

local BindPromptTitle = Instance.new(_lIillIIIl("\158\182\208\211\178\206\214\224\238",67))
BindPromptTitle.Parent = BindPrompt; BindPromptTitle.BackgroundTransparency = 1
BindPromptTitle.Position = UDim2.fromOffset(12, 7); BindPromptTitle.Size = UDim2.new(1, -24, 0, 15)
BindPromptTitle.Font = FB; BindPromptTitle.TextSize = 11; BindPromptTitle.TextColor3 = T.White
BindPromptTitle.TextXAlignment = Enum.TextXAlignment.Left; BindPromptTitle.ZIndex = 981

local BindPromptSub = Instance.new(_lIillIIIl("\171\195\221\224\191\219\227\237\251",80))
BindPromptSub.Parent = BindPrompt; BindPromptSub.BackgroundTransparency = 1
BindPromptSub.Position = UDim2.fromOffset(12, 24); BindPromptSub.Size = UDim2.new(1, -24, 0, 15)
BindPromptSub.Font = F; BindPromptSub.TextSize = 11; BindPromptSub.TextColor3 = T.Tx2
BindPromptSub.TextXAlignment = Enum.TextXAlignment.Left; BindPromptSub.Text = _lIillIIIl("\180\221\215\236\243\167\239\181\7\8\35\209\39\49\230\58\67\80\85\78\16\89\120\126\133\135\141\70\15\180\207\98\142\195\186\126\200\216\216\219\243\251",93)
BindPromptSub.ZIndex = 981

local function bindTokenFromInput(input)
	if input.KeyCode and input.KeyCode ~= Enum.KeyCode.Unknown then
		if input.KeyCode == S.MenuKeybind then return nil end
		return _lIillIIIl("\220\221\248\192",106) .. input.KeyCode.Name
	end
	local kind = input.UserInputType
	if kind == Enum.UserInputType.MouseButton1 or kind == Enum.UserInputType.MouseButton2
		or kind == Enum.UserInputType.MouseButton3 then
		return _lIillIIIl("\235\244\1\6\255\219",119) .. kind.Name
	end
	return nil
end

local function bindTokenTitle(token)
	if type(token) ~= _lIillIIIl("\254\6\11\9\21\21",132) then return _lIillIIIl("\122\31\58",145) end
	local kind, value = token:match(_lIillIIIl("\3\212\216\27\236\241\9\254\11\15\20\22",158))
	if not kind or not value then return _lIillIIIl("\148\57\84",171) end
	local pretty = {
		LeftControl = _lIillIIIl("\11\9\33\38\39",184), RightControl = _lIillIIIl("\30\22\46\51\52",197), LeftShift = _lIillIIIl("\37\51\47\55\59\85",210), RightShift = _lIillIIIl("\56\64\60\73\77\98",223),
		LeftAlt = _lIillIIIl("\63\59\82\97",236), RightAlt = _lIillIIIl("\87\77\95\110",249), MouseButton1 = _lIillIIIl("\95\74",11), MouseButton2 = _lIillIIIl("\108\88",24), MouseButton3 = _lIillIIIl("\121\102",37),
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
	S.Keybinds = type(S.Keybinds) == _lIillIIIl("\173\161\169\186\186",50) and S.Keybinds or {}
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
	if type(map) == _lIillIIIl("\186\174\182\199\199",63) then
		for id, token in pairs(map) do
			if BindRegistry[id] and type(token) == _lIillIIIl("\198\206\211\209\221\221",76) then S.Keybinds[id] = token end
		end
	end
	for id in pairs(BindRegistry) do refreshBindChips(id) end
	markKeybindHUDDirty()
end
S._applyKeybindMap = applyKeybindMap

local function clearAllKeybinds()
	applyKeybindMap({})
	if RequestAutoSave then RequestAutoSave() end
	Notify(_lIillIIIl("\171\204\231\215\229\241\238\4",89), _lIillIIIl("\174\224\231\162\235\249\5\2\24\204\22\38\38\41\65\59\65",102), 1.8, _lIillIIIl("\227\239\238\254",115))
end
S._clearAllKeybinds = clearAllKeybinds

local function startBindCapture(id)
	local entry = BindRegistry[id]
	if not entry then return end
	BindCapture.target = id

	BindCapture.readyAt = os.clock() + 0.12
	BindPromptTitle.Text = _lIillIIIl("\201\215\227\224\195\217\224\216",128) .. string.upper(entry.label)
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
		Notify(_lIillIIIl("\223\0\27\11\25\37\34",141), entry.label .. _lIillIIIl("\193\138\53\72\221",154) .. bindTokenTitle(token), 1.8, _lIillIIIl("\33\42\31\38\47\68\75",167))
	else
		Notify(_lIillIIIl("\6\39\66\50\64\76\73",180), entry.label .. _lIillIIIl("\232\50\66\66\69\93\87\93",193), 1.6, _lIillIIIl("\62\74\73\89",206))
	end
end

local function registerBindable(id, label, trigger, isActive, kind)
	BindRegistry[id] = { label = label, trigger = trigger, isActive = isActive, kind = kind, chips = {} }
	return id
end
S._registerBindable = registerBindable

local function requestBindFromRightClick(target, id)
	target.Active = true
	target:SetAttribute(_lIillIIIl("\50\91\85\106\118\127\131\125\97\143\155\152\132\166",219), id)
end
S._requestBindFromRightClick = requestBindFromRightClick

local function bindTargetAt(position)
	local ok, hits = pcall(function()
		local root = SG.Parent
		if root and type(root.GetGuiObjectsAtPosition) == _lIillIIIl("\85\107\112\108\132\128\141\147",232) then
			return root:GetGuiObjectsAtPosition(position.X, position.Y)
		end
		local pg = LP:FindFirstChildOfClass(_lIillIIIl("\81\116\112\143\130\150\114\167\162",245))
		return pg and pg:GetGuiObjectsAtPosition(position.X, position.Y) or {}
	end)
	if not ok or type(hits) ~= _lIillIIIl("\130\118\126\143\143",7) then return nil end
	for _, hit in ipairs(hits) do
		local node = hit
		while node and node ~= SG do
			local id = node:GetAttribute(_lIillIIIl("\107\148\142\163\170\179\183\177\149\195\207\204\184\218",20))
			if id and BindRegistry[id] then return id end
			node = node.Parent
		end
	end
	return nil
end

local function addBindChip(parent, id, rightOffset)
	local chip = Instance.new(_lIillIIIl("\124\148\174\177\134\192\198\205\207\213",33))
	chip.Name = (MOBILE and _lIillIIIl("\123\168\178\171\197\183",46) or _lIillIIIl("\132\178\190\187\189",59)) .. id
	chip.Parent = parent
	chip.AnchorPoint = Vector2.new(1, 0.5)
	chip.Position = UDim2.new(1, rightOffset or -52, 0.5, 0)
	chip.Size = UDim2.fromOffset(MOBILE and 42 or 48, MOBILE and 26 or 20)
	chip.BackgroundColor3 = T.Elev
	chip.BorderSizePixel = 0
	chip.AutoButtonColor = false
	chip.Font = FM; chip.TextSize = 10; chip.TextColor3 = T.Tx2
	chip.Text = MOBILE and _lIillIIIl("\145\170\171",72) or bindTokenTitle(S.Keybinds[id])
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
	local FloatHost = Instance.new(_lIillIIIl("\162\213\203\222\221",85))
	FloatHost.Name = _lIillIIIl("\175\220\230\223\249\245\1\1\227\29\35\42\44\50\62",98)
	FloatHost.Parent = SG
	FloatHost.BackgroundTransparency = 1
	FloatHost.Size = UDim2.fromScale(1, 1)

	FloatHost.ZIndex = 0
	FloatHost.Visible = MOBILE
	S._floatHost = FloatHost

	local Buttons = {}
	local spawnIndex = 0

	local FLOAT_ICON_RULES = {
		{ _lIillIIIl("\227\226\242\0",111), _lIillIIIl("\246\239\5\12\8\20\20\39\232\244",124) },
		{ _lIillIIIl("\245\10\14",137), _lIillIIIl("\2\29\16",150) },
		{ _lIillIIIl("\13\25\25\44",163), _lIillIIIl("\28\55\42",176) },
		{ _lIillIIIl("\58\52\69\78\65\83",189), _lIillIIIl("\54\81\68",202) },
		{ _lIillIIIl("\82\87\77\86\95\120",215), _lIillIIIl("\80\107\94",228) },
		{ _lIillIIIl("\106\101\111\115\139",241), _lIillIIIl("\111\138\125",3) },
		{ _lIillIIIl("\120\135\146",16), _lIillIIIl("\135\157\161\172\179\175\175\190\206",29) },
		{ _lIillIIIl("\156\161\171\178",42), _lIillIIIl("\161\183\187\198\205\201\201\216\232",55) },
		{ _lIillIIIl("\194\179\203\206",68), _lIillIIIl("\187\209\213\224\231\227\227\242\2",81) },
		{ _lIillIIIl("\202\218\231\227\245\1",94), _lIillIIIl("\213\235\239\250\1\253\253\12\28",107) },
		{ _lIillIIIl("\229\242\6",120), _lIillIIIl("\243\244\15\8\13",133) },
		{ _lIillIIIl("\12\16\12\19\25",146), _lIillIIIl("\13\14\41\34\39",159) },
		{ _lIillIIIl("\29\47\46\56",172), _lIillIIIl("\39\40\67\60\65",185) },
		{ _lIillIIIl("\68\53\71\77",198), _lIillIIIl("\65\66\93\86\91",211) },
		{ _lIillIIIl("\85\93\88\109\113\127",224), _lIillIIIl("\91\97\124\117\122",237) },
		{ _lIillIIIl("\121\132\125\136",250), _lIillIIIl("\122\123\150\143\148",12) },
		{ _lIillIIIl("\147\151\160\158\170\183",25), _lIillIIIl("\148\149\176\169\174",38) },
		{ _lIillIIIl("\155\182\188\190",51), _lIillIIIl("\169\189\201",64) },
		{ _lIillIIIl("\186\188\212\214",77), _lIillIIIl("\195\215\227",90) },
		{ _lIillIIIl("\209\228\232\239\239\244\12",103), _lIillIIIl("\221\241\253",116) },
		{ _lIillIIIl("\236\254\5\15",129), _lIillIIIl("\247\11\23",142) },
		{ _lIillIIIl("\18\21\17\48\35\55",155), _lIillIIIl("\36\41\34\54\248\68\72\85\85\82",168) },
		{ _lIillIIIl("\43\59\67\56\61\77",181), _lIillIIIl("\62\67\60\80\18\94\98\111\116\113",194) },
		{ _lIillIIIl("\62\66\69\87",207), _lIillIIIl("\88\93\86\106\49\125\129\142\142\139",220) },
		{ _lIillIIIl("\83\102\113\112\122\127",233), _lIillIIIl("\117\110\132\139\135\147\147\166\103\115",246) },
		{ _lIillIIIl("\130\123\145\152\148\160\160",8), _lIillIIIl("\143\136\158\165\161\173\173\192\129\141",21) },
		{ _lIillIIIl("\146\158\171\163\183\178\180\189\198",34), _lIillIIIl("\169\162\184\191\187\199\199\218\155\167",47) },
	}
	local function floatIconKind(id, label)
		local hay = string.lower(tostring(id) .. _lIillIIIl("\99",60) .. tostring(label or ""))
		for _, rule in ipairs(FLOAT_ICON_RULES) do
			if string.find(hay, rule[1], 1, true) then return rule[2] end
		end
		return _lIillIIIl("\199\201\195\211\207\219",73)
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
		if type(saved) ~= _lIillIIIl("\209\197\205\222\222",86) or type(saved.x) ~= _lIillIIIl("\216\230\229\225\235\255",99) or type(saved.y) ~= _lIillIIIl("\229\243\242\238\248\12",112) then

			spawnIndex += 1
			saved = { x = 0.08, y = math.min(0.22 + (spawnIndex - 1) * 0.12, 0.9) }
			S.FloatButtons[id] = saved
		end

		local frame = Instance.new(_lIillIIIl("\216\240\10\13\226\28\34\41\43\49",125))
		frame.Name = _lIillIIIl("\215\4\14\7\33\19",138) .. id
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

		local dot = Instance.new(_lIillIIIl("\228\23\13\32\31",151))
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

		local label = Instance.new(_lIillIIIl("\255\23\49\52\19\47\55\65\79",164))
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

		local scale = Instance.new(_lIillIIIl("\13\8\25\48\53\71\71",177))
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

		if id == _lIillIIIl("\58\53\13\71\70\86\100",190) and not on then return end
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

		local keepMenu = S.FloatButtons[_lIillIIIl("\71\66\26\84\83\99\118",203)]
		for id in pairs(Buttons) do destroyButton(id) end
		S.FloatButtons = {}
		if type(map) == _lIillIIIl("\83\71\79\96\101",216) then
			for id, pos in pairs(map) do
				if type(pos) == _lIillIIIl("\96\84\92\114\114",229) and entryFor(id) then
					S.FloatButtons[id] = { x = tonumber(pos.x) or 0.08, y = tonumber(pos.y) or 0.3 }
					createButton(id)
				end
			end
		end

		createButton(_lIillIIIl("\110\110\70\128\127\143\157",242))
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

		tc(cam():GetPropertyChangedSignal(_lIillIIIl("\97\123\126\151\151\157\167\176\150\179\203\189",4)):Connect(function()
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
	tc(cam():GetPropertyChangedSignal(_lIillIIIl("\110\136\139\164\164\170\180\189\163\192\216\202",17)):Connect(relayout))

	tc(Workspace:GetPropertyChangedSignal(_lIillIIIl("\104\161\165\172\166\182\195\153\190\209\208\228\218",30)):Connect(function()
		if cam() then
			relayout()
			tc(cam():GetPropertyChangedSignal(_lIillIIIl("\136\162\165\190\190\196\206\215\189\218\242\228",43)):Connect(relayout))
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
    local header = page:FindFirstChild(_lIillIIIl("\146\171\174\198\190\202\177\212\233",56))
    local subBar = page:FindFirstChild(_lIillIIIl("\159\200\188\181\201\209\184\222\246",69)) or page:FindFirstChild(_lIillIIIl("\175\201\218\227\214\232\246\221\6\250\243\7\15\246\28\52",82))

    if header and header.Visible then
        header.Position = UDim2.fromOffset(inset, top)
        header.Size = UDim2.new(1, -(inset * 2), 0, 24)
        top = top + 24 + gap
    end
    if subBar and subBar.Visible then
        local subBarHeight = tonumber(subBar:GetAttribute(_lIillIIIl("\178\206\237\234\247\253\216\252\7\12\20\39",95))) or 30
        subBar.Position = UDim2.fromOffset(inset, top)
        subBar.Size = UDim2.new(1, -(inset * 2), 0, subBarHeight)
        top = top + subBarHeight + gap
    end

    local cards = {}
    for _, child in ipairs(page:GetChildren()) do
        if child:IsA(_lIillIIIl("\185\236\226\245\244",108)) and child.Visible and child ~= subBar and (child:FindFirstChild(_lIillIIIl("\201\245\252\250\14",121)) or child:FindFirstChildOfClass(_lIillIIIl("\226\221\231\11\28\36\3\31\62\59\72\78",134))) then
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
    if not child:IsA(_lIillIIIl("\225\22\17\254\24\39\41\46\70",147)) then return end
    tc(child:GetPropertyChangedSignal(_lIillIIIl("\253\23\40\37\37\54\54",160)):Connect(queuePageLayout))
    tc(child:GetPropertyChangedSignal(_lIillIIIl("\245\29\53\56\60\76\82\74\63\92\116\107",173)):Connect(queuePageLayout))
end
for _, page in pairs(Pages) do
    tc(page:GetPropertyChangedSignal(_lIillIIIl("\23\49\66\63\63\80\80",186)):Connect(function()
        if page.Visible then queuePageLayout() end
    end))
    for _, child in ipairs(page:GetChildren()) do watchPageChild(child) end
    tc(page.ChildAdded:Connect(function(child)
        watchPageChild(child)
        queuePageLayout()
    end))
end
tc(ContentArea:GetPropertyChangedSignal(_lIillIIIl("\15\55\79\82\86\102\108\105\94\123\147\133",199)):Connect(queuePageLayout))
S._RefreshPageLayout = function(searching)
    pageLayoutSearchMode = searching == true
    ContentArea.CanvasPosition = Vector2.zero
    queuePageLayout()
end
queuePageLayout()
end

local function mkSection(parent, title, order)
	local card = Instance.new(_lIillIIIl("\33\84\74\93\92",212))
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

	local layout = Instance.new(_lIillIIIl("\61\56\66\107\124\132\99\127\158\155\168\174",225))
	layout.Parent = card; layout.SortOrder = Enum.SortOrder.LayoutOrder; layout.Padding = UDim.new(0, M.rowGap)

	local hdrRow = Instance.new(_lIillIIIl("\59\115\105\124\123",238))
	hdrRow.Parent = card; hdrRow.LayoutOrder = 0; hdrRow.BackgroundTransparency = 1
	hdrRow.Size = UDim2.new(1, 0, 0, 24)

	local tick = Instance.new(_lIillIIIl("\77\128\118\137\136",0))
	tick.Parent = hdrRow; tick.BackgroundColor3 = T.Accent; tick.BorderSizePixel = 0
	tick.Position = UDim2.new(0, 0, 0.5, -6); tick.Size = UDim2.new(0, 3, 0, 13)
	Corner(tick, 2)
	local hdr = Instance.new(_lIillIIIl("\104\128\154\157\124\152\160\170\184",13))
	hdr.Parent = hdrRow; hdr.BackgroundTransparency = 1
	hdr.Position = UDim2.new(0, 13, 0, 0); hdr.Size = UDim2.new(1, -13, 1, 0)
	hdr.Font = FB; hdr.TextSize = 13; hdr.TextColor3 = T.Tx2
	hdr.TextXAlignment = Enum.TextXAlignment.Left; hdr.Text = string.upper(title)

	return card
end

local function mkToggle(parent, label, key, order, callback)
	local knobInset = math.floor((M.trackH - M.knob) / 2)
	local row = Instance.new(_lIillIIIl("\103\154\144\163\162",26))
	row.Name = label; row.Parent = parent; row.LayoutOrder = order
	row.Size = UDim2.new(1, 0, 0, M.rowH); row.BackgroundTransparency = 1

	local lbl = Instance.new(_lIillIIIl("\130\154\180\183\150\178\186\196\210",39))
	lbl.Parent = row; lbl.BackgroundTransparency = 1
	lbl.Position = UDim2.new(0, 4, 0, 0)

	lbl.Size = UDim2.new(1, -(M.trackW + (MOBILE and 70 or 78)), 1, 0)
	lbl.Font = F; lbl.TextSize = M.rowFont; lbl.TextColor3 = T.Tx2
	lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.TextTruncate = Enum.TextTruncate.AtEnd; lbl.Text = label

	local track = Instance.new(_lIillIIIl("\143\167\193\196\153\211\217\224\226\232",52))
	track.Parent = row
	track.AnchorPoint = Vector2.new(1, 0.5)
	track.Position = UDim2.new(1, -4, 0.5, 0)
	track.Size = UDim2.new(0, M.trackW, 0, M.trackH)
	track.BackgroundColor3 = T.TgOff
	track.AutoButtonColor = false
	track.Text = ""
	Corner(track, math.floor(M.trackH / 2))
	local trackStroke = Stroke(track, T.Bd2, 1, 0.5)

	local knob = Instance.new(_lIillIIIl("\142\193\183\202\201",65))
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

	local bindId = S._registerBindable(_lIillIIIl("\201\203\202\209\221\221\185",78) .. key, label, function()
		update(not S[key])
		SFX.Click()
		if RequestAutoSave then RequestAutoSave() end
	end, function() return S[key] == true end, _lIillIIIl("\214\216\215\222\234\234",91))
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
	local card = Instance.new(_lIillIIIl("\181\232\222\241\240",104))
	card.Name = label; card.Parent = parent; card.LayoutOrder = order
	card.Size = UDim2.new(1, 0, 0, M.sliderH); card.BackgroundTransparency = 1

	local lbl = Instance.new(_lIillIIIl("\208\232\2\5\228\0\8\18\32",117))
	lbl.Parent = card; lbl.BackgroundTransparency = 1
	lbl.Position = UDim2.new(0, 4, 0, 2); lbl.Size = UDim2.new(0.6, 0, 0, 18)
	lbl.Font = F; lbl.TextSize = M.rowFont; lbl.TextColor3 = T.Tx2
	lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.TextTruncate = Enum.TextTruncate.AtEnd; lbl.Text = label

	local pill = Instance.new(_lIillIIIl("\207\2\248\11\10",130))
	pill.Parent = card; pill.AnchorPoint = Vector2.new(1, 0)
	pill.Position = UDim2.new(1, -4, 0, 0); pill.Size = UDim2.new(0, MOBILE and 54 or 50, 0, MOBILE and 22 or 20)
	pill.BackgroundColor3 = T.Elev
	Corner(pill, 7); Stroke(pill, T.Bd, 1, 0.5)
	local valLbl = Instance.new(_lIillIIIl("\234\2\28\31\244\40\56",143))
	valLbl.ClearTextOnFocus = false
	valLbl.Parent = pill; valLbl.BackgroundTransparency = 1; valLbl.Size = UDim2.new(1, 0, 1, 0)
	valLbl.Font = FM; valLbl.TextSize = MOBILE and 12 or 13; valLbl.TextColor3 = T.White; valLbl.Text = tostring(S[key] or minVal)

	local bar = Instance.new(_lIillIIIl("\233\28\18\37\36",156))
	bar.Parent = card
	bar.Position = UDim2.new(0, 4, 0, MOBILE and 34 or 30); bar.Size = UDim2.new(1, -8, 0, M.barH)
	bar.BackgroundColor3 = T.Elev; bar.Active = true
	Corner(bar, math.floor(M.barH / 2))
	local fill = Instance.new(_lIillIIIl("\246\41\31\50\49",169))
	fill.Parent = bar
	fill.Size = UDim2.new(math.clamp(((S[key] or minVal) - minVal) / (maxVal - minVal), 0, 1), 0, 1, 0)
	fill.BackgroundColor3 = T.Accent
	Corner(fill, math.floor(M.barH / 2))
	local grab = Instance.new(_lIillIIIl("\3\54\44\63\62",182))
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
	local btn = Instance.new(_lIillIIIl("\30\54\80\83\40\98\104\116\118\124",195))
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
	local bindId = S._registerBindable(_lIillIIIl("\57\83\89\96\98\104\64",208) .. label:gsub(_lIillIIIl("\63\73\23\112\98",221), _lIillIIIl("\80",234)), label, function()
		pcall(callback)
		SFX.Click()
	end, nil, _lIillIIIl("\101\127\133\140\142\148",247))
	S._addBindChip(btn, bindId, MOBILE and -8 or -6)
	S._requestBindFromRightClick(btn, bindId)
	btn.MouseButton1Click:Connect(function() pcall(callback); SFX.Click() end)
	table.insert(UIRegistry, { card = parent, row = btn, label = string.lower(label) })
	return btn
end

local function getGF() return Workspace:FindFirstChild(_lIillIIIl("\87\120\139\138\156\159\155\186\142\190\194\193\201\221",9)) end
local function getHRP() local c = LP.Character; return c and c:FindFirstChild(_lIillIIIl("\101\153\152\147\167\175\176\178\167\203\210\222\193\217\241\250",22)) end
local function getHum() local c = LP.Character; return c and c:FindFirstChildOfClass(_lIillIIIl("\114\166\165\160\180\188\189\191",35)) end
local function objPos(obj)
	if obj:IsA(_lIillIIIl("\121\159\184\177\163\187\211\220",48)) then return obj.Position end
	if obj:IsA(_lIillIIIl("\145\186\182\190\204",61)) then
		local ok, piv = pcall(function() return obj:GetPivot() end)
		if ok and piv then return piv.Position end
		local p = obj:FindFirstChildWhichIsA(_lIillIIIl("\147\185\210\203\189\213\237\246",74), true)
		return p and p.Position
	end
	return nil
end

local MONSTER_NAMES = {
	_lIillIIIl("\191\211\211\223\223\243",87), _lIillIIIl("\205\222\226\244\1",100), _lIillIIIl("\232\232\244\248\253\0",113), _lIillIIIl("\235\254\2\1\6\26",126), _lIillIIIl("\2\250\14\11\19\34\43\49\51\70\69",139), _lIillIIIl("\2\14\14\29\41\53\54\63\66\67\87",152),
	_lIillIIIl("\13\233\234",165), _lIillIIIl("\27\47\59\66\68\73\73\79\86\92\105\125",178), _lIillIIIl("\40\60\73\73\69\78\98",191), _lIillIIIl("\54\59\79\76\91\91\100\110\113\137\131\151",204), _lIillIIIl("\69\96\83\91\102\123\131\119\145\141\154\160",217), _lIillIIIl("\96\101\117\112\114\121\136\136",230),
	_lIillIIIl("\91\104\124\129\132\144\138\164\160\173\179",243), _lIillIIIl("\128\133\127\143\139\151\152\169\169\176\182\190\210",5), _lIillIIIl("\137\137\151\161\166\177\168\171\188",18), _lIillIIIl("\139\145\169\158\163\189\191\201",31), _lIillIIIl("\167\172\170\171\186\201\209\201\221",44),
	_lIillIIIl("\168\182\194\197\203\215\203\229\231",57), _lIillIIIl("\185\195\203\199\206",70), _lIillIIIl("\190\208\226\212\232",83), _lIillIIIl("\218\211\214\238\230\242\253\1\6\14\33",96), _lIillIIIl("\235\220\238\245\244\14\3\17\24\24\44",109), _lIillIIIl("\233\233\1\248\6\18\18\23\43",122),
	_lIillIIIl("\241\246\14\17\11\37\33\46\52",135), _lIillIIIl("\255\17\25\32\28\42",148), _lIillIIIl("\26\16\44\34\61\44\68\61",161),
}
local function monsterKind(nameLower)
	if nameLower:find(_lIillIIIl("\25\51\40\54\61\61\81",174)) then return _lIillIIIl("\38\64\53\67\74\74\94",187) end
	if nameLower:find(_lIillIIIl("\52\79\66\74\80\101\109",200)) or nameLower:find(_lIillIIIl("\72\82\89\92\101\101\121",213)) then return _lIillIIIl("\78\105\92\105\111\132\140",226) end
	if nameLower:find(_lIillIIIl("\105\115\126\121\123\130\145\145",239)) then return _lIillIIIl("\123\128\139\134\136\143\158\158",1) end
	if nameLower:find(_lIillIIIl("\120\125\149\152\146\172\168\181\187",14)) then return _lIillIIIl("\133\138\162\165\159\185\181\194\200",27) end
	for _, m in ipairs(MONSTER_NAMES) do
		if nameLower:find(m, 1, true) then return _lIillIIIl("\156\165\171\183\191\183\203",40) end
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
	BoardPuzzle = _lIillIIIl("\140\146\161\150\170\127\168\188\181\205\198\169\191\198\190\230\248\252\1\15",53), BridgeControl = _lIillIIIl("\139\162\160\162\172\177\147\189\208\214\227\232\236\240",66),
	Button = _lIillIIIl("\165\159\174\176\181\205\201\221\211\181\222\248\254\5\7\13",79), Lever = _lIillIIIl("\178\172\187\189\194\218\214\234\224\194\245\245\13\3\23",92),
	TreadmillPanel = _lIillIIIl("\196\201\195\198\208\224\227\237\244\207\249\12\18\31\36\40\44",105), Tram = _lIillIIIl("\209\214\204\223\185\227\246\252\9\14\18\22",118),
	TurretControls = _lIillIIIl("\222\230\234\241\235\1\212\254\17\23\36\41\45\49",131),
}
local PromptCache = {}

local PassedDoors = {}

local function getInteractionType(prompt)
	local node = prompt.Parent
	while node and node ~= Workspace do
		local interactionType = node:GetAttribute(_lIillIIIl("\224\12\25\17\37\27\36\60\56\69\75\56\100\98\94",144))
		if type(interactionType) == _lIillIIIl("\23\31\36\34\46\46",157) and interactionType ~= "" then
			return interactionType, node
		end
		node = node.Parent
	end
	return nil, nil
end
local function classifyPrompt(prompt)
	local parent = prompt.Parent
	local part
	if parent and parent:IsA(_lIillIIIl("\243\25\50\43\29\53\77\86",170)) then
		part = parent
	elseif parent and parent:IsA(_lIillIIIl("\255\57\64\52\61\73\85\84\100\118",183)) then
		part = parent.Parent
	end
	if not (part and part:IsA(_lIillIIIl("\13\51\76\69\55\79\103\117",196))) then
		part = parent and parent:FindFirstAncestorWhichIsA(_lIillIIIl("\26\64\89\82\68\97\121\130",209))
	end
	if not part then return nil end
	local model = part:FindFirstAncestorOfClass(_lIillIIIl("\50\91\87\95\114",222))
	local mname = model and model.Name or part.Name
	local mnameLower = mname:lower()
	local interactionType, interactionRoot = getInteractionType(prompt)
	local kind
	if mname:match(_lIillIIIl("\80\60\122\126\133\127\143\139\168",235)) or interactionType == _lIillIIIl("\71\128\132\139\133\149\145\174\126\164\189\182",248) then kind = _lIillIIIl("\116\141\145\152\146\162\158\187",10)
	elseif mname == _lIillIIIl("\97\148\144\152\124\179\173\176\185\197\201\221",23) or KEY_INTERACTIONS[interactionType] or mnameLower:find(_lIillIIIl("\150\151\178\163\168\192\185",36), 1, true) then kind = _lIillIIIl("\163\164\191\176\181\205\198",49)
	elseif ITEM_MODELS[mname] or ITEM_INTERACTIONS[interactionType] then kind = _lIillIIIl("\174\192\184\199",62)
	elseif DOOR_INTERACTIONS[interactionType] or (mnameLower:find(_lIillIIIl("\182\200\207\217",75), 1, true) and part.Name == _lIillIIIl("\177\213\220\232",88)) then kind = _lIillIIIl("\208\226\233\243",101)
	elseif mname == _lIillIIIl("\197\239\234\249\250\14",114) then
		if model and (model:GetAttribute(_lIillIIIl("\207\251\8\0\20\10\19\43\39\52\58\39\83\81\77",127)) == _lIillIIIl("\224\9\15\27\35\27\47\16\58\53\68\69\89",140) or model:FindFirstChild(_lIillIIIl("\8\16\21\29\40\44\49\57\76",153))) then
			kind = _lIillIIIl("\35\35\36\38\53\63\58\73\74\94",166)
		else
			kind = _lIillIIIl("\38\48\43\58\59\79",179)
		end
	elseif DRAWER_INTERACTIONS[interactionType] or mnameLower:find(_lIillIIIl("\43\64\54\83\72\92",192), 1, true) or mnameLower:find(_lIillIIIl("\55\60\68\82\94\92\119",205), 1, true) then kind = _lIillIIIl("\69\90\80\109\103\123",218)
	elseif HAZARD_INTERACTIONS[interactionType] or mnameLower:find(_lIillIIIl("\98\103\106\120\134\127\143\137",231), 1, true) or mnameLower:find(_lIillIIIl("\116\124\128\135\129\151",244), 1, true) or mnameLower:find(_lIillIIIl("\122\125\137\135",6), 1, true) then kind = _lIillIIIl("\130\130\162\144\168\161",19)
	elseif interactionType == _lIillIIIl("\121\147\155\165\175\182\147\185\211\218\210\230\228\231\252",32) then kind = _lIillIIIl("\166\160\168\178\188\195",45)
	elseif interactionType == _lIillIIIl("\151\169\187\204\194",58) then kind = _lIillIIIl("\196\182\200\217\207",71)
	elseif interactionType == _lIillIIIl("\173\199\217\209\224\240\216\5\6\14\6\21",84) then kind = _lIillIIIl("\218\212\230\222\237\253",97)
	elseif OBJECTIVE_INTERACTIONS[interactionType] then kind = _lIillIIIl("\228\222\237\239\244\12\8\28\18",110)
	else kind = _lIillIIIl("\241\253\248\252\16",123) end
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
		or model:GetAttribute(_lIillIIIl("\225\5\12\17\255\43\41\37",136)) == _lIillIIIl("\224\8\11\21\253\45\42\64",149)
		or model:GetAttribute(_lIillIIIl("\237\21\24\34\10\58\55",162)) == true
end

local function textMentionsKeycard(value)
	if type(value) ~= _lIillIIIl("\41\49\54\52\64\64",175) then return false end
	local text = value:lower()
	return text:find(_lIillIIIl("\46\47\74\59\64\88\81",188), 1, true) ~= nil
		or text:find(_lIillIIIl("\59\60\87\5\79\84\108\106",201), 1, true) ~= nil
		or text:find(_lIillIIIl("\64\69\93\86\25\119\113\116\126\134\154",214), 1, true) ~= nil
end

local function isKeycardDoor(e)
	if not (e and e.kind == _lIillIIIl("\78\96\103\118",227) and e.model) then return false end
	local model = e.model
	for _, attrName in ipairs({ _lIillIIIl("\73\104\123\134\129\145\139\160\127\160\187\172\177\201\194",240), _lIillIIIl("\84\117\144\129\134\158\151\140\166\185\196\191\207\201\207",2), _lIillIIIl("\97\130\157\110\147\171\164\153\179\198\209\204\220\214\220",15), _lIillIIIl("\102\139\163\156\145\171\190\201\196\212\206\212",28), _lIillIIIl("\130\156\175\186\181\197\191\212\171\208\232\225",41), _lIillIIIl("\126\167\174\183\204\211\179\211\235\225\239",54), _lIillIIIl("\156\182\201\212\207\223\217\223\195\236\243\252\17\24",67), _lIillIIIl("\163\205\200\215\199\243\241\237",80) }) do
		local value = model:GetAttribute(attrName)
		if value == true or (type(value) == _lIillIIIl("\210\224\223\219\229\249",93) and value > 0) or textMentionsKeycard(value) then return true end
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
					if d:IsA(_lIillIIIl("\193\234\238\254\246\1\4\22\34\0\41\45\50\60\71",106)) then
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
	DropBattery = _lIillIIIl("\192\230\0\7\255\19\33",119), Flashlight = _lIillIIIl("\209\254\250\19\15\26\30\35\43\62",132), Lantern = _lIillIIIl("\228\0\20\33\25\45\48",145),
	FlashBeacon = _lIillIIIl("\235\24\20\45\41\232\17\59\62\71\90\96",158), Glider = _lIillIIIl("\249\37\41\43\51\71",171), HealthCrate = _lIillIIIl("\7\43\46\64\79\74\9\51\105\100\126\118",184),
	OxygenTank = _lIillIIIl("\27\75\83\72\77\93\22\86\106\126\130",197), Medkit = _lIillIIIl("\38\69\75\89\94\117",210), SPRINT = _lIillIIIl("\57\61\70\45\80\92\105",223),
	HealthBoost = _lIillIIIl("\59\95\103\121\136\131\66\107\159\166\177\185",236), SmallLantern = _lIillIIIl("\88\121\116\134\141\72\123\151\171\184\176\196\199",249), WindupLight = _lIillIIIl("\105\130\142\139\163\165\92\143\179\184\192\211",11),
}
local function tagTitleFor(e)
	if e.kind == _lIillIIIl("\130\155\159\166\160\176\172\201",24) then
		local amt = e.name:match(_lIillIIIl("\138\118\175\179\186\180\196\192\221\147\151\221\171\176",37))
		return amt and (amt .. _lIillIIIl("\89\139\185\189\195\193\213",50)) or _lIillIIIl("\145\191\195\201\199\219",63)
	elseif e.kind == _lIillIIIl("\188\206\198\213",76) then return ITEM_LABEL[e.name] or e.name
	elseif e.kind == _lIillIIIl("\203\204\231\216\221\245\238",89) then
		if e.name == _lIillIIIl("\176\227\223\231\203\2\252\255\8\20\24\44",102) then return _lIillIIIl("\189\208\204\212\182\223\246\240\243\252\8\12\32\245\11\18\10\65\65\71\86\50\110\112",115) end
		if e.interactionType == _lIillIIIl("\204\250\250\18\4\30\32\42\10\43\70",128) then return _lIillIIIl("\217\231\231\255\241\11\13\23\236\30\31\58\8\30\37\34\89\89\90\105\69\129\131",141) end
		if e.interactionType == _lIillIIIl("\241\9\34\41\52\51\61\54\41\65\87\83\103",154) then return _lIillIIIl("\239\248\255\8\29\36\248\34\53\49\57\32\54\61\53\108\108\109\124\88\148\150",167) end
		return _lIillIIIl("\6\7\34\19\24\48\41\12\34\41\38\93\93\94\109\73\133\135",180)
	elseif e.kind == _lIillIIIl("\44\62\69\79",193) then
		local m = e.model
		if m:GetAttribute(_lIillIIIl("\37\78\82\81\99\93\119\126\86\136\143\153",206)) then return _lIillIIIl("\48\46\72\75\35\92\96\103\108\70\107\114",219) end
		if isKeycardDoor(e) then return _lIillIIIl("\58\59\91\76\81\105\98\69\109\118\125\134\155\162\118\140\147\139\190\200\195\210\211\217",232) end
		if m:GetAttribute(_lIillIIIl("\77\119\114\129\130\136",245)) then
			local code = LP:GetAttribute(_lIillIIIl("\81\132\128\136",7))
			return code and (_lIillIIIl("\102\103\130\128\120\130\101\123\130\122",20) .. tostring(code)) or _lIillIIIl("\115\116\143\141\133\143\114\136\143\135\186\196\191\206\207\213",33)
		end
		return _lIillIIIl("\121\171\178\188",46)
	elseif e.kind == _lIillIIIl("\174\184\179\194\195\215",59) then return _lIillIIIl("\155\197\192\207\208\228\153\168\250\239\251\1\204",72)
	elseif e.kind == _lIillIIIl("\210\210\211\213\228\238\233\248\249\13",85) then return _lIillIIIl("\191\191\192\194\165\216\226\221\236\237\1\214\234\228\15\33\249\46\54\66\21\73\81\83\91",98)
	elseif e.kind == _lIillIIIl("\218\239\229\2\247\11",111) then return _lIillIIIl("\199\252\242\15\4\24",124)
	elseif e.kind == _lIillIIIl("\248\248\24\6\30\23",137) then
		if e.interactionType == _lIillIIIl("\233\5\25\22\38\41\53\51",150) or e.interactionType == _lIillIIIl("\238\35\25\54\43\63\32\60\80\77\93\96\113\111",163) then return _lIillIIIl("\3\255\19\16\32\35\47\45\15\37\49\41\84\96\113\102\126\128",176) end
		if e.interactionType == _lIillIIIl("\24\61\59\73\87\80\96\90",189) then return _lIillIIIl("\37\42\40\54\68\61\82\76\46\68\75\67\110\114\134\134\139\159",202) end
		if e.interactionType == _lIillIIIl("\50\90\94\101\95\122",215) or e.interactionType == _lIillIIIl("\46\103\108\121\123\128\110\150\154\161\155\177",228) then return _lIillIIIl("\76\89\93\100\94\116\71\93\100\92\135\139\159\159\164\184",241) end
		if e.interactionType == _lIillIIIl("\93\118\121\108\143\155\153\174",3) then return _lIillIIIl("\106\99\102\76\128\131\143\141\111\133\140\132\175\179\199\199\204\224",16) end
		return e.name
	elseif e.kind == _lIillIIIl("\150\144\152\162\172\179",29) then return _lIillIIIl("\115\121\147\154\146\166\180\130\187\181\189\199\209\216",42)
	elseif e.kind == _lIillIIIl("\180\166\184\201\191",55) then return _lIillIIIl("\161\147\165\182\172\142\164\171\163\220\224\236\224\250\242",68)
	elseif e.kind == _lIillIIIl("\202\196\214\206\221\237",81) then
		local fixed = e.interactionRoot and e.interactionRoot:FindFirstChild(_lIillIIIl("\171\213\235\223\229",94))
		local progress = fixed and tonumber(fixed.Value)
		return progress and (_lIillIIIl("\185\190\206\204\224\214\240\242\252\209\231\238\230",107) .. math.floor(progress + 0.5) .. _lIillIIIl("\164",120)) or _lIillIIIl("\211\216\232\230\250\240\10\12\22\235\1\8\0\57\51\69\66\81\97",133)
	elseif e.kind == _lIillIIIl("\8\2\17\19\24\48\44\64\54",146) then return OBJECTIVE_LABELS[e.interactionType] or _lIillIIIl("\245\239\254\0\5\29\25\45\35",159)
	end
	return e.name
end

local function isRepairComplete(e)
	if not (e and e.kind == _lIillIIIl("\37\31\49\41\56\72",172) and e.interactionRoot) then return false end
	local fixed = e.interactionRoot:FindFirstChild(_lIillIIIl("\6\48\70\58\64",185))
	return fixed ~= nil and tonumber(fixed.Value) ~= nil and fixed.Value >= 100
end

local hideInLockerNow, attemptRespawn
local SaveConfigFile, LoadConfigFile
local refreshVisionEffects

local suppressedPostEffects = {}

local TeammateChamReg = {}
local function getVisionGrade()
	local grade = Lighting:FindFirstChild(_lIillIIIl("\29\70\64\85\92\101\105\104\82\134\122\117\143\160\157\170\176\144\194\184\194\202",198))
	if not grade then
		grade = Instance.new(_lIillIIIl("\29\80\84\94\104\69\120\130\137\131\136\160\156\169\175\141\181\188\194\199\223",211))
		grade.Name = _lIillIIIl("\55\96\90\116\123\132\136\130\108\160\148\143\169\186\183\196\202\170\220\210\220\228",224)
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
					local removable = effect:IsA(_lIillIIIl("\54\108\124\128\90\130\137\143\148\172",237)) or effect:IsA(_lIillIIIl("\72\121\131\138\143\110\150\157\163\168\192",250)) or effect:IsA(_lIillIIIl("\86\137\141\151\161\121\172\182\189\183\188\212\208\221\227\193\233\240\246\251\19",12))
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
		local grade = Lighting:FindFirstChild(_lIillIIIl("\112\153\147\168\175\184\188\182\160\212\200\195\221\238\235\248\254\222\16\6\16\24",25))
		if grade then grade:Destroy() end
	end)
	for _, plr in ipairs(Players:GetPlayers()) do
		local ch = plr.Character
		local hl = ch and ch:FindFirstChild(_lIillIIIl("\125\166\160\181\188\197\201\195\181\216\212\243\230\250\210\254\254\17",38))
		if hl then pcall(function() hl:Destroy() end) end
	end
	for plr, entry in pairs(TeammateChamReg) do
		pcall(function() if entry.model then entry.model:Destroy() end end)
		TeammateChamReg[plr] = nil
	end
end

local secEntities = mkSection(Pages.Visuals, _lIillIIIl("\127\175\188\184\202\214\132\176\197\201",51), 1)
mkToggle(secEntities, _lIillIIIl("\148\189\195\207\215\207\227\152\196\217\221\180\195\227\23\23\35\35\55\251\21\70\74\92\105\37\48\55\62\64",64), _lIillIIIl("\153\201\214\210\228\240\195\216\220",77), 1)
mkToggle(secEntities, _lIillIIIl("\184\201\219\226\157\200\2\247\5\12\12\32\213\1\22\26",90), _lIillIIIl("\197\214\232\239\206\8\253\11\18\18\38\0\21\25",103), 2)
mkToggle(secEntities, _lIillIIIl("\192\251\238\246\252\17\25\13\39\35\48\54\239\5\253\48\90\97\100\114\109\129\58\102\123\127",116), _lIillIIIl("\205\8\251\3\9\30\38\254\19\23",129), 3)
mkToggle(secEntities, _lIillIIIl("\232\13\24\19\21\28\43\43\237\25\46\50",142), _lIillIIIl("\245\26\37\32\34\41\56\56\31\52\56",155), 4)
mkToggle(secEntities, _lIillIIIl("\242\23\47\50\44\70\66\79\85\14\58\84\88\47\62\144\152\140\164\158\164\182\197\195\124\200\216\229\225\243\255\182",168), _lIillIIIl("\255\36\60\63\57\83\79\92\98\69\90\94",181), 5)
mkToggle(secEntities, _lIillIIIl("\17\49\81\63\87\80\19\63\89\93\52\67\118\155\153\167\181\174\190\184\137\181\221\225\232\226\248\180",194), _lIillIIIl("\30\62\94\76\100\93\74\95\99",207), 6)

local secDoors = mkSection(Pages.Visuals, _lIillIIIl("\39\89\96\106\119\43\56\57\111\137\152\154\159\183\179\199\189\210\134\178\199\203",220), 2)
mkToggle(secDoors, _lIillIIIl("\52\102\114\124\49\93\114\118\77\92\169\167\193\196\119\141\133\205\214\221\230\251\2\182\204\196\23\33\28\43\44\50\254",233), _lIillIIIl("\70\120\127\137\99\120\124",246), 1)
mkToggle(secDoors, _lIillIIIl("\91\133\128\143\144\164\89\133\154\158\117\132\201\214\210\223\242\166\3\3\4\6\201\28\38\33\48\49\69\77\1\90\84\90\43",8), _lIillIIIl("\104\146\141\156\157\177\139\160\164",21), 2)
mkToggle(secDoors, _lIillIIIl("\109\162\152\181\170\190\115\137\129\171\208\216\230\242\240\6\185\229\250\254",34), _lIillIIIl("\122\175\165\194\183\203\165\186\190",47), 3)
mkToggle(secDoors, _lIillIIIl("\146\172\187\189\194\218\214\234\224\162\206\227\231\190\205\19\24\40\38\58\48\74\76\86\11\33\25\123\109\127\144\134\72\94\86\160\179\185\198\203\207\211\225\158",60), _lIillIIIl("\159\185\200\202\207\231\227\247\237\212\233\237",73), 4)

local secItems = mkSection(Pages.Visuals, _lIillIIIl("\169\211\218\230\153\197\218\222",86), 3)
mkToggle(secItems, _lIillIIIl("\179\229\221\236\166\210\231\235\194\209\242\24\50\57\49\69\83\16\52\88\93\106\125\63\90\144\134\160\152\99",99), _lIillIIIl("\192\242\234\249\216\237\241",112), 1)
mkToggle(secItems, _lIillIIIl("\207\253\1\7\5\25\206\250\15\19\234\249\27\84\88\95\89\110\106\135\62",125), _lIillIIIl("\220\10\14\20\18\38\0\21\25",138), 2)
mkToggle(secItems, _lIillIIIl("\238\23\21\34\44\42\60\72\246\40\73\100\85\90\119\112\51\73\65\107\158\154\162\100\141\196\190\193\202\214\218\238\163\207\228\232",151), _lIillIIIl("\246\23\50\35\40\64\57\33\54\58",164), 3)

local secPlayers = mkSection(Pages.Visuals, _lIillIIIl("\8\43\39\70\57\77\2\46\67\71",177), 4)
	mkToggle(secPlayers, _lIillIIIl("\19\45\64\63\1\60\80\93\117",190), _lIillIIIl("\32\58\77\76\51\72\81",203), 1)
	mkToggle(secPlayers, _lIillIIIl("\33\85\101\20\69\90\94",216), _lIillIIIl("\46\98\114\75\96\100",229), 2)
	mkToggle(secPlayers, _lIillIIIl("\65\106\109\127\142\137",242), _lIillIIIl("\83\119\122\140\155\150\122\143\147",4), 3)
	mkToggle(secPlayers, _lIillIIIl("\108\145\135\144\153\173\181",17), _lIillIIIl("\121\158\148\157\166\186\148\169\173",30), 4)
	mkToggle(secPlayers, _lIillIIIl("\134\158\161\180\187\182\208\200\138\180\224\224\243\0",43), _lIillIIIl("\143\178\174\205\192\212\172\216\216\235\248",56), 5)

local secEnv = mkSection(Pages.Visuals, _lIillIIIl("\145\193\208\202\218\222\228\234\233\249\6\185\198\199\250\30\35\43\62\58\70\70",69), 5)

	mkToggle(secEnv, _lIillIIIl("\159\213\211\218\215\238\236\241\249\12",82), _lIillIIIl("\172\226\224\231\196\251\249\254\6\25",95), 1)
	mkToggle(secEnv, _lIillIIIl("\193\233\161\206\254\253",108), _lIillIIIl("\206\246\212\4\3",121), 2)
	mkToggle(secEnv, _lIillIIIl("\217\3\18\207\245\25\30\38\57\236\41\67\84\81\94\100",134), _lIillIIIl("\230\16\31\251\31\36\44\63\40\66\83\80\93\99",147), 3, refreshVisionEffects)
	mkToggle(secEnv, _lIillIIIl("\234\26\26\29\49\234\36\59\81\75\82\98\32\76\116\123\129\134\158\164\88\103\168\185\201\205\130\152\144\221\234\230\255\251\195",160), _lIillIIIl("\247\39\39\42\62\42\65\87\81\88\104\75\115\122\128\133\157\163",173), 4, refreshVisionEffects)
	mkSlider(secEnv, _lIillIIIl("\7\61\59\66\63\86\84\89\97\121\44\85\140\138\143\151\170\171\169\190\197",186), 1, 10, _lIillIIIl("\16\71\69\74\82\101\102\105\126\133",199), 5)
	mkSlider(secEnv, _lIillIIIl("\50\81\91\92\91\35\77\128\134\147\152\142\167\175",212), 0, 100, _lIillIIIl("\62\88\105\119\106\124\90\141\147\160\165\155\180\188",225), 6, refreshVisionEffects)
	mkSlider(secEnv, _lIillIIIl("\76\112\122\123\122\61\119\140\166\174\178\168\194\190\203\209",238), 0, 200, _lIillIIIl("\93\119\136\145\132\150\132\153\179\187\191\181\207\203\216\222",0), 7, refreshVisionEffects)
	mkToggle(secEnv, _lIillIIIl("\87\144\149\157\159\164\94\139\155\169",13), _lIillIIIl("\100\137\156\124\140\154\144\192\186\194\211\211\217",26), 8, function(v) if not v and cam() then pcall(function() cam().FieldOfView = 70 end) end end)

mkSlider(secEnv, _lIillIIIl("\116\132\146",39), 55, 85, _lIillIIIl("\126\163\182\150\166\180",52), 9)

local secVisualHUD = mkSection(Pages.Visuals, _lIillIIIl("\158\184\201\210\197\215\146\193\213\203\174\187\188\245\11\31\31\36",65), 6)
	mkToggle(secVisualHUD, _lIillIIIl("\164\194\201\151\196\219\241\235\242\2\187\246\17\34\28\31\57\236\37\59\69\73\97",78), _lIillIIIl("\182\209\226\220\223\249\222\244\254\2\26",91), 1)
	mkToggle(secVisualHUD, _lIillIIIl("\194\234\222\248\0\5\185\232\252\242\213\228\53\57\64\69\255\21\13\99\120\128\117\122\138\67\89\81\160\164\167\185\200\195\139",104), _lIillIIIl("\207\247\235\5\13\18\238\2\248",117), 2)

	if not MOBILE then mkToggle(secVisualHUD, _lIillIIIl("\212\245\16\0\14\26\23\218\9\29\19\246\5\69\78\102\98\123\113\51\128\134\137\163\171\175\169\190\123",130), _lIillIIIl("\225\2\29\13\27\39\36\15\35\25",143), 3) end
	mkToggle(secVisualHUD, _lIillIIIl("\231\35\31\25\44\47\48\244\36\85\85\81\101\103\42\57\103\81\70\92\84\171\171\183\183\119\141\133\210\227\237\161\183\175\10\6\17\16\219",156), _lIillIIIl("\244\48\44\38\57\60\61\42\91\91\87\112\109",169), 4)
	mkToggle(secVisualHUD, _lIillIIIl("\11\41\67\70\249\36\86\93\103\33\95\112\143\141\147\148\160\173",182), _lIillIIIl("\24\54\80\83\42\92\99\114\91\128\118\127\136\156",195), 5)
	mkSlider(secVisualHUD, _lIillIIIl("\28\49\53\12\64\91\126\45\88\132\149\157\145\165\161\170",208), 250, 2500, _lIillIIIl("\41\62\66\70\102\132\87\131\148\156",221), 5)

local secDef = mkSection(Pages.Combat, _lIillIIIl("\50\100\105\125\134\140\64\77\78\121\161\169\175\191\203\196",234), 1)
mkToggle(secDef, _lIillIIIl("\72\120\133\129\147\159\77\139\156\180\183\185\197\197\133\174\212\232\239\237\1",247), _lIillIIIl("\85\133\146\142\160\172\145\162\186\189\191\203\203",9), 1)
mkToggle(secDef, _lIillIIIl("\94\153\143\155\168\96\154\183\199\193\209\138\200\217\241\244\246\2\2",22), _lIillIIIl("\129\146\170\173\175\187\187\174\209\222\222\219",35), 2)
mkToggle(secDef, _lIillIIIl("\121\173\184\191\115\159\207\203\222\235\235\248\240\4\185\225\19\19\39\48\54\234\249\28\78\96\82\102\47\75\125\132\137\133\156\154\166\166\171\191\125",48), _lIillIIIl("\134\186\197\204\161\211\211\231\240\246",61), 3)
mkToggle(secDef, _lIillIIIl("\146\205\211\213\141\188\228\230\238\176\0\12\197\248\34\29\44\45\65",74), _lIillIIIl("\159\218\224\226\194\234\236\244\223\11\240\26\21\36\37\57",87), 4)
mkButton(secDef, _lIillIIIl("\179\219\221\229\167\247\3\188\239\25\20\35\36\56\237\34\42\57",100), function() hideInLockerNow(true) end, 5)

local secCounters = mkSection(Pages.Combat, _lIillIIIl("\197\238\244\0\8\0\20\201\243\38\51\51\64\56\76\84",113), 2)
mkToggle(secCounters, _lIillIIIl("\198\250\7\3\206\237\40\27\35\41\62\70\58\84\80\93\99\33\48\91\133\140\143\75\115\176\161\192\119",126), _lIillIIIl("\211\7\20\16\243\46\33\41\47\68\76",139), 1)
mkToggle(secCounters, _lIillIIIl("\224\27\33\35\219\6\56\74\60\80\5\63\103\95\103\121\136\131\66\81\147\169\173\186\175\187\122\209\209\221\221\166",152), _lIillIIIl("\237\40\46\48\12\62\80\66\86\62\102\94\102\120\135\130",165), 2)
mkToggle(secCounters, _lIillIIIl("\250\53\59\61\245\47\75\75\92\93\36\90\120\127\64\119\143\167\157\182\179\197\189\210",178), _lIillIIIl("\7\66\72\74\53\81\81\98\104\90\114\138\128\153\150\168\160",191), 3)
mkToggle(secCounters, _lIillIIIl("\37\63\78\87\101\91\34\75\124\128\146\159\76\125\175\174\184\194\185\190\214\208",204), _lIillIIIl("\50\76\91\100\119\109\89\139\138\148\158\149\154\178\172\193",217), 4)

local secMovement = mkSection(Pages.Motion, _lIillIIIl("\64\100\101\108\114\53\66\67\112\157\161\166\174\193",230), 1)
mkToggle(secMovement, _lIillIIIl("\61\123\128\136\138\143\73\135\152\170\176\159\195\191\198\204",243), _lIillIIIl("\95\131\127\134\140\116\164\158\166\183\183\189",5), 1, function() refreshGameSpeed() end)
mkSlider(secMovement, _lIillIIIl("\112\129\147\153\136\172\168\175\181",18), 8, 120, _lIillIIIl("\105\162\167\175\177\182\167\184\202\208\191\227\223\230\236",31), 2, function() refreshGameSpeed() end)
mkSlider(secMovement, _lIillIIIl("\118\172\176\189\178\190\125\183\219\215\222\228",44), 4, 60, _lIillIIIl("\131\185\189\202\191\203\189\225\221\228\234",57), 3, function(v)
	S._tunedFields = S._tunedFields or {}; S._tunedFields.CrouchSpeed = true
	local m = getMain(); if m and type(m.CameraModule) == _lIillIIIl("\193\181\189\206\206",70) then setGameField(m.CameraModule, _lIillIIIl("\157\211\215\228\217\229\219\236\254\4\243\23\19\26\32",83), v) end
end)
mkSlider(secMovement, _lIillIIIl("\186\222\231\229\241\254\177\229\14\10\22\26\36\39\59",96), 0, 150, _lIillIIIl("\199\235\244\242\254\11\235\20\16",109), 4, function(v)
	S._tunedFields = S._tunedFields or {}; S._tunedFields.SprintMod = true
	local m = getMain()
	if m then
		if type(m.CameraModule) == _lIillIIIl("\245\233\241\2\2",122) then setGameField(m.CameraModule, _lIillIIIl("\225\5\14\12\24\37\5\46\42\54\58\68\71\91",135), v) end
	end
end)
mkToggle(secMovement, _lIillIIIl("\222\23\28\36\38\43\229\22\72\71\81\56\94\109\103\123",148), _lIillIIIl("\242\36\35\45\9\57\51\59\76\76\82",161), 5, function(v)
	if not v then restoreJumpPower() end
end)
mkSlider(secMovement, _lIillIIIl("\255\49\48\58\33\71\86\75\95",174), 50, 250, _lIillIIIl("\5\62\67\75\77\82\54\104\103\118\93\131\146\135\155",187), 6)
mkToggle(secMovement, _lIillIIIl("\21\66\86",200), _lIillIIIl("\34\79\99",213), 7, function(v)
	if not v then
		pcall(function() if S._flyBV then S._flyBV:Destroy(); S._flyBV = nil end end)
		if not S.NoClip then restoreNoClip() end
	end
end)
mkSlider(secMovement, _lIillIIIl("\47\92\112\35\93\129\125\132\138",226), 10, 200, _lIillIIIl("\60\110\130\99\135\131\138\144",239), 8)
mkToggle(secMovement, _lIillIIIl("\86\126\121\137\141\155",1), _lIillIIIl("\99\139\102\150\154\168",14), 9, function(v)
	if not v and not S.Fly then restoreNoClip() end
end)
mkToggle(secMovement, _lIillIIIl("\107\151\150\160\172\174\192\184\122\171\221\220\230",27), _lIillIIIl("\120\164\163\173\185\187\205\197\177\227\226\236",40), 10)
mkToggle(secMovement, _lIillIIIl("\143\179\179\191\186\206\218",53), _lIillIIIl("\156\192\192\204\199\219\231",66), 11)
mkSlider(secMovement, _lIillIIIl("\169\205\205\217\146\204\240\236\243\249",79), 2, 50, _lIillIIIl("\182\218\218\230\210\246\242\249\255",92), 12)

local secPhysics = mkSection(Pages.Motion, _lIillIIIl("\195\238\231\242\249\252\8\8\200\213\214\12\60\68\57\62\78",105), 2)
mkToggle(secPhysics, _lIillIIIl("\195\229\254\6\185\243\30\23\34",118), _lIillIIIl("\208\242\11\19\249\36\29\40",131), 1, function(v)
	local m = getMain(); local sw = m and m.Swimming
	if type(sw) ~= _lIillIIIl("\11\255\7\24\24",144) then return end
	if v then
		saveSwimDefaults(sw)
		sw.SwimmingSpeed = math.clamp(tonumber(S.SwimSpeed) or 32, 18, 65)
	else

		restoreSwimDefaults(sw, false)
	end
end)
mkSlider(secPhysics, _lIillIIIl("\247\34\27\38\224\26\62\58\65\71",157), 18, 65, _lIillIIIl("\4\47\40\51\32\68\64\71\77",170), 2, function(v)
	local m = getMain(); local sw = m and m.Swimming
	if S.FastSwim and type(sw) == _lIillIIIl("\50\38\46\63\63",183) then
		saveSwimDefaults(sw)
		sw.SwimmingSpeed = v
	end
end)
mkSlider(secPhysics, _lIillIIIl("\18\62\66\68\76\96\21\84\120\116\123\129",196), 60, 140, _lIillIIIl("\31\75\79\81\89\114\90\126\122\129\135",209), 3, function(v)
	S._tunedFields = S._tunedFields or {}; S._tunedFields.GliderSpeed = true
	local m = getMain(); if m and type(m.Swimming) == _lIillIIIl("\89\77\85\102\107",222) then setGameField(m.Swimming, _lIillIIIl("\57\101\110\112\120\140\116\152\148\155\161",235), v) end
end)
mkToggle(secPhysics, _lIillIIIl("\77\121\120\130\142\144\162\154\92\146\194\202\191\196\212",248), _lIillIIIl("\90\134\133\143\155\157\175\167\152\200\208\197\202\218",10), 4)

local secChar = mkSection(Pages.Player, _lIillIIIl("\97\141\141\165\155\164\188\180\200",23), 1)
mkButton(secChar, _lIillIIIl("\108\166\173\165\180\190\201\124\181\207\228\232\224\253\251",36), function() attemptRespawn() end, 1)
mkToggle(secChar, _lIillIIIl("\121\173\186\182\129\156\168\180\144\187\231\248\239\2\8\15\13\18\42",49), _lIillIIIl("\134\186\199\195\162\174\186",62), 2)

local secMouse = mkSection(Pages.Player, _lIillIIIl("\159\200\213\218\211",75), 2)
do
	local note = Instance.new(_lIillIIIl("\179\203\229\232\199\227\235\245\3",88))
	note.Parent = secMouse; note.LayoutOrder = 1; note.BackgroundTransparency = 1
	note.Size = UDim2.new(1, 0, 0, 30); note.Font = F; note.TextSize = 12
	note.TextColor3 = T.Tx3; note.TextWrapped = true; note.TextXAlignment = Enum.TextXAlignment.Left
	note.Text = _lIillIIIl("\185\226\239\244\237\175\11\11\16\26\21\36\51\231\47\74\80\82\87\82\108\109\110\115\133\140\160\78\172\164\172\182\182\120\211\206\214\231\155\239\238\254\12\190\14\31\211\41\49\45\61\2\253\69\89\86\25\113\123\118\133\148\72\145\151\160\175\107\198\193\197\135\219\228\233\232\248\5\184\24\21\34\212\30\46\56\67\60\254\78\96\33",101)
end

local secAuto = mkSection(Pages.Auto, _lIillIIIl("\186\245\251\253\2\253\23\19\32\38",114), 1)
mkToggle(secAuto, _lIillIIIl("\199\2\8\10\194\248\32\28\44\229\16\66\73\83\91",127), _lIillIIIl("\212\15\21\23\254\38\34\50\15\65\72\82\90",140), 1)
mkToggle(secAuto, _lIillIIIl("\225\28\34\36\220\6\57\61\68\68\73\97\20\75\121\125\131\129\149\74\87\88\136\186\178\193\206",153), _lIillIIIl("\238\41\47\49\12\63\67\74\74\79\103\67\122\114\129\142",166), 2)
mkToggle(secAuto, _lIillIIIl("\251\54\60\62\246\48\73\76\100\92\109\44\87\140\130\159\148\168\176",179), _lIillIIIl("\8\67\73\75\54\79\82\106\103\115\86\139\129\158\147\167\175",192), 3)
mkToggle(secAuto, _lIillIIIl("\21\80\86\88\16\58\114\118\125\125\130\154\77\127\160\187\188\112\125\126\168\219\215\223\161\202\1\251\254\7\19\23\43\51",205), _lIillIIIl("\34\93\99\101\69\120\124\131\131\136\160\126\159\186\187",218), 4)
mkToggle(secAuto, _lIillIIIl("\47\106\117\119\47\88\146\157\75\116\154\180\187\179\199\197\200\221\145\160\242\246\242\2\255\21\201\2\28\49\42\45\69\61\73\17",231), _lIillIIIl("\65\124\130\132\110\136\144\154\164\171\136\174\200\207\199\219\217\220\241",244), 5)
mkToggle(secAuto, _lIillIIIl("\78\137\143\145\73\132\172\176\179\108\169\187\205\222\212\233",6), _lIillIIIl("\91\150\156\158\138\178\182\185\168\186\204\221\211\232",19), 6)
mkToggle(secAuto, _lIillIIIl("\104\163\169\171\99\156\182\200\192\207\223\148\194\231\247\245\9\255\25\27\37\45",32), _lIillIIIl("\117\176\182\184\162\188\206\198\213\229\193\230\246\244\8\254\24\26\36\44",45), 7)
mkToggle(secAuto, _lIillIIIl("\130\189\195\197\125\168\212\229\218\242\244\174\225\253\17\14\30\33\45\43\64",58), _lIillIIIl("\143\202\208\210\174\218\235\224\248\250\224\252\16\13\29\32\44\42\63",71), 8)
mkToggle(secAuto, _lIillIIIl("\173\209\216\221\151\210\247\237\246\5\6\26\207\222\43\51\63\59\63\89\7\96\100\112\117\47\57\70",84), _lIillIIIl("\186\222\229\234\216\253\243\252\11\12\32",97), 9)

local secInteract = mkSection(Pages.Auto, _lIillIIIl("\190\234\247\239\3\249\2\26\22\35\41\226\29\71\60\63\80\95",110), 2)
mkToggle(secInteract, _lIillIIIl("\203\247\3\11\255\19\32\211\3\47\60\52\72\62\71\95\18\33\115\123\51\130\144\148\147\95",123), _lIillIIIl("\216\4\16\24\12\32\45\9\53\66\58\78\68\77\101",136), 1)
mkToggle(secInteract, _lIillIIIl("\225\27\30\22\38\35\43\49\244\43\84\88\93\103\119\42\99\125\128\137\149\84\99\186\124\121",149), _lIillIIIl("\249\34\38\43\53\64\37\63\66\75\87",162), 2)

local secTP = mkSection(Pages.Misc, _lIillIIIl("\10\34\48\48\66\72\82\91\97",175), 1)
mkButton(secTP, _lIillIIIl("\23\47\61\61\79\85\95\104\32\123\125\53\106\136\139\163\157\178\186\109\152\202\209\219",188), function()
	local hrp = getHRP(); if not hrp then return end
	local best, bestD = nil, math.huge
	for _, e in ipairs(PromptCache) do
		if e.kind == _lIillIIIl("\52\70\77\87",201) and e.part.Parent and not isDeadEndDoor(e.model) and not PassedDoors[e.model] then
			local d = (e.part.Position - hrp.Position).Magnitude
			if d < bestD then best, bestD = e.part, d end
		end
	end
	if best then hrp.CFrame = best.CFrame * CFrame.new(0, 0, 3); Notify(_lIillIIIl("\49\73\87\87\105\116\126\135",214), _lIillIIIl("\62\86\100\105\123\129\139\148\140\146\85\176\178\106\191\189\192\216\210\231\239\162\237\255\6\16",227), 2, _lIillIIIl("\106\120\109\116\125\146\153",240))
	else Notify(_lIillIIIl("\93\117\131\131\149\155\165\174",2), _lIillIIIl("\100\140\68\143\161\168\178\103\180\196\209\209\206",15), 2, _lIillIIIl("\154\139\163\166",28)) end
end, 1)
mkButton(secTP, _lIillIIIl("\132\156\170\170\188\194\204\213\136\227\229\157\210\240\243\11\5\26\34\213\8\50\45\60\61\81",41), function()
	local hrp = getHRP(); if not hrp then return end
	local best, bestD = nil, math.huge
	for _, e in ipairs(PromptCache) do
		if e.kind == _lIillIIIl("\169\179\174\189\190\210",54) and e.part.Parent then
			local d = (e.part.Position - hrp.Position).Magnitude
			if d < bestD then best, bestD = e.part, d end
		end
	end
	if best then hrp.CFrame = best.CFrame + best.CFrame.LookVector * 2; Notify(_lIillIIIl("\158\182\196\196\214\220\230\239",67), _lIillIIIl("\171\195\209\209\227\233\243\252\244\250\189\24\26\210\39\37\40\64\58\79\87\10\93\103\103\118\119\139",80), 2, _lIillIIIl("\215\224\213\220\229\250\1",93))
	else Notify(_lIillIIIl("\197\221\235\235\253\3\13\22",106), _lIillIIIl("\204\244\172\255\9\4\19\20\40\221\42\58\71\71\68",119), 2, _lIillIIIl("\2\243\11\14",132)) end
end, 2)

local secCfg = mkSection(Pages.Config, _lIillIIIl("\219\14\20\19\29\34\55\59\49\75\71\84\90",145), 1)

S._readConfigData = function(name)
	if not readfile then return false, nil, _lIillIIIl("\23\17\20\30\39\49\59\59\253\89\89\83\111\102\117\127\123\131\148\148",158) end
	local base = _lIillIIIl("\2\43\37\58\65\74\78\72\73\52\103\114\113\123\128\147\86",171) .. name .. _lIillIIIl("\237\48\64\67\73",184)
	local function readCandidate(path)
		if isfile and not isfile(path) then return false, nil, _lIillIIIl("\57\60\77\84\81\93\93",197) end
		local ok, raw = pcall(readfile, path)
		if not ok or type(raw) ~= _lIillIIIl("\76\84\89\87\99\104",210) then return false, nil, _lIillIIIl("\83\86\103\115\112\124\124",223) end
		local parsedOk, data = pcall(function() return HttpService:JSONDecode(raw) end)
		if not parsedOk or type(data) ~= _lIillIIIl("\103\91\104\121\121",236) then return false, nil, _lIillIIIl("\110\122\137\123\141\145\147\86\167\183\186\192",249) end
		return true, data
	end
	local ok, data, reason = readCandidate(base)
	if ok then return true, data end
	local backupOk, backupData = readCandidate(base .. _lIillIIIl("\64\141\141\151",11))
	if backupOk then return true, backupData, _lIillIIIl("\145\139\144\163\177\167\187\181\187",24) end
	return false, nil, reason
end

S._applyConfigData = function(data)
	if type(data) ~= _lIillIIIl("\160\148\156\173\173",37) then return end
	if type(data._ui) == _lIillIIIl("\173\161\169\186\186",50) then
		if data._ui.Theme then pcall(function() UIStyle:ApplyTheme(data._ui.Theme) end) end
		if data._ui.TextScale then pcall(function() UIStyle:ApplyTextScale(data._ui.TextScale) end) end
		if data._ui.HUDScale then pcall(function() UIStyle:ApplyHUDScale(data._ui.HUDScale) end) end
		if data._ui.NotificationPosition then pcall(function() UIStyle:PlaceNotifications(data._ui.NotificationPosition) end) end
	end

	for key, value in pairs(data) do
		if CfgBind[key] and type(S[key]) ~= _lIillIIIl("\168\188\195\199\199\202\222",63) then pcall(CfgBind[key], value) end
	end
	for key, value in pairs(data) do
		if CfgBind[key] and type(S[key]) == _lIillIIIl("\181\201\208\212\212\215\235",76) then pcall(CfgBind[key], value) end
	end
	S._applyKeybindMap(type(data._keybinds) == _lIillIIIl("\212\200\208\225\225",89) and data._keybinds or {})

	if MOBILE and S._floatApplyMap then
		pcall(S._floatApplyMap, type(data._floats) == _lIillIIIl("\225\213\221\238\238",102) and data._floats or {})
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
	if not writefile then Notify(_lIillIIIl("\189\240\246\245\255\4",115), _lIillIIIl("\204\6\250\255\24\30\32\42\223\46\46\71\251\80\88\16\110\117\115\133\125\133\143\153\153",128), 2, _lIillIIIl("\11\252\20\23",141)) return end
	local ok, err = pcall(function()
		if makefolder and (not isfolder or not isfolder(_lIillIIIl("\241\26\20\41\48\57\61\55\56\35\86\92\91\106\111\130",154))) then

			pcall(makefolder, _lIillIIIl("\254\39\33\54\61\70\74\68\69\48\99\110\109\119\124\143",167))
		end
		local data = {}
		for key in pairs(CfgBind) do data[key] = S[key] end
		data._keybinds = S.Keybinds
		data._floats = S.FloatButtons
		data._ui = { Theme = S.UITheme, TextScale = S.UITextScale, HUDScale = S.HUDScale, NotificationPosition = S.NotificationPosition }
		data._schema = 3
		local path = _lIillIIIl("\11\52\46\67\74\83\87\81\82\61\117\123\122\132\137\156\95",180) .. name .. _lIillIIIl("\246\57\73\76\82",193)
		local encoded = HttpService:JSONEncode(data)

		writefile(path .. _lIillIIIl("\3\80\80\90",206), encoded)
		writefile(path, encoded)
		if readfile then
			local verify = readfile(path)
			assert(type(verify) == _lIillIIIl("\85\93\98\96\113\113",219) and type(HttpService:JSONDecode(verify)) == _lIillIIIl("\99\87\100\117\117",232), _lIillIIIl("\100\119\125\124\134\139\75\168\158\178\176\180\190\191\196\222\218\231\237\166\243\245\4\14\14\20",245))
		end
		if delfile and (not isfile or isfile(path .. _lIillIIIl("\60\137\137\147",7))) then pcall(delfile, path .. _lIillIIIl("\73\150\150\160",20)) end
	end)
	Notify(_lIillIIIl("\107\158\164\163\173\178",33), ok and (_lIillIIIl("\136\157\185\175\181\120\134",46) .. name .. _lIillIIIl("\105",59)) or (_lIillIIIl("\162\183\211\201\139\216\218\233\243\243\249\214\195",72) .. tostring(err)), 2, ok and _lIillIIIl("\207\216\205\212\221\242\249",85) or _lIillIIIl("\205\209\229\229\234\254",98))
	return ok, err
end
LoadConfigFile = function(name, silent)
	local ok, data, reason = S._readConfigData(name)
	if not ok then
		if not silent then Notify(_lIillIIIl("\185\236\242\241\251\0",111), reason == _lIillIIIl("\240\243\4\11\8\20\20",124) and _lIillIIIl("\222\6\190\24\13\41\31\37\232\50\69\75\74\84\89\25\107\123\136\136\133",137) or (_lIillIIIl("\233\19\12\22\217\38\40\55\65\65\71\36\17",150) .. tostring(reason)), 2, _lIillIIIl("\33\18\42\45",163)) end
		return false, reason
	end
	local applied, err = xpcall(function() S._applyConfigData(data) end, debug.traceback)
	if not applied then
		if not silent then Notify(_lIillIIIl("\250\45\51\50\60\65",176), _lIillIIIl("\16\58\51\61\0\77\79\94\109\109\115\80\61",189) .. tostring(err), 2, _lIillIIIl("\53\57\77\77\82\102",202)) end
		return false, err
	end
	if not silent then Notify(_lIillIIIl("\33\84\90\89\99\109",215), _lIillIIIl("\55\97\90\105\113\119\58\72",228) .. name .. _lIillIIIl("\31",241) .. (reason == _lIillIIIl("\124\118\123\142\156\146\166\160\166",3) and _lIillIIIl("\55\70\151\145\150\169\183\173\193\187\193\141",16) or ""), 2, _lIillIIIl("\151\160\149\156\165\186\193",29)) end
	return true, reason
end
mkButton(secCfg, _lIillIIIl("\132\153\181\171\109\152\192\200\202\229\227\242\165\207\2\8\7\17\22",42), function() SaveConfigFile(_lIillIIIl("\157\166\193\199\201\205\215\208\218",55)) end, 1)
mkButton(secCfg, _lIillIIIl("\151\193\186\196\135\178\218\226\228\255\253\12\191\233\28\34\33\43\48",68), function() LoadConfigFile(_lIillIIIl("\183\192\219\225\227\231\241\234\244",81)) end, 2)

if MOBILE then
	mkButton(secCfg, _lIillIIIl("\183\209\224\233\247\237\175\215\9\16\203\248\37\47\40\66\62\74\74\10\51\109\120\127\129\135\147",94), function()
		if S._floatClearAll then S._floatClearAll() end
		Notify(_lIillIIIl("\180\238\244\251\253\3\15",107), _lIillIIIl("\192\242\249\180\1\14\24\17\43\39\51\51\243\60\86\92\99\101\112\124\48\137\131\146\155\169\159\165",120), 2, _lIillIIIl("\245\1\0\16",133))
	end, 3)
else
	mkButton(secCfg, _lIillIIIl("\220\12\12\15\39\220\4\54\61\248\42\75\102\86\105\117\114\136",146), function() S._clearAllKeybinds() end, 3)
end

do
	local scheduled = false
	RequestAutoSave = function()
		if scheduled or not writefile then return end
		scheduled = true
		task.delay(1, function() scheduled = false; SaveConfigFile(_lIillIIIl("\5\14\41\47\49\53\63\56\66",159)) end)
	end
end
do
	local note = Instance.new(_lIillIIIl("\7\31\57\60\27\55\63\73\87",172))
	note.Parent = secCfg; note.LayoutOrder = 4; note.BackgroundTransparency = 1
	note.Size = UDim2.new(1, 0, 0, MOBILE and 36 or 18); note.Font = F; note.TextSize = 12
	note.TextColor3 = T.Tx3; note.TextXAlignment = Enum.TextXAlignment.Left
	note.TextWrapped = MOBILE
	note.Text = MOBILE
		and _lIillIIIl("\144\97\158\146\172\161\186\176\200\190\219\194\57\98\123\124\85\13\196\26\16\41\223\54\29\68\45\82\57\176\103\92\118\46\211\139\69\153\82\166\154\180\165\195\127\213\196\227\210\65\248\225\7\200\20\8\34\23\49\232\62\45\77\5\170\97\77\112\55\205\132\120\146\121\240\168\107\181\166\196\122\214\189\228\216\80\73\0\201\15\198\28\8\122\49\32\63\45\77\64\91\71\105\93\119\99\133\121\147\130\162\103\255\183\110\196\190\216\147\230\156\243\218\1\245\16\213\30\226\44\228\58\241\72\13\165\92\67\106\83\121\49\134\123\148\135\162\137\177\105\190\173\210\143\223\203\238\165\251\236\9\248\117",185)
		or _lIillIIIl("\157\115\171\124\185\140\23\211\201\225\214\63\247\177\5\190\18\6\32\17\47\235\60\43\74\57\168\113\22\49\196\123\111\137\112\151\133\165\153\179\154\194\127\212\195\227\155\241\179\78\5\237\19\2\33\21\47\26\155\148\75\20\90\17\103\83\197\124\107\138\120\152\139\166\146\180\168\194\174\213\201\227\210\242\183\79\7\190\20\9\35\222\49\231\62\37\76\64\91\32\105\45\119\47\133\60\147\88\240\167\142\181\158\196\124\214\203\228\215\242\217\1\185\14\253\29\218\42\22\57\240\70\55\84\67\192",198)
end

if MOBILE and Pages.Buttons then

	local function mkPill(parent, text, x)
		local pill = Instance.new(_lIillIIIl("\46\70\96\99\56\119\125\132\134\140",211))
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
		local row = Instance.new(_lIillIIIl("\45\96\86\110\109",224))
		row.Name = _lIillIIIl("\58\108\118\111\137\123",237) .. item.id
		row.Parent = secFloat
		row.LayoutOrder = index + 1
		row.Size = UDim2.new(1, 0, 0, M.rowH)
		row.BackgroundTransparency = 1

		local label = Instance.new(_lIillIIIl("\90\114\140\143\110\138\146\156\170",250))
		label.Parent = row; label.BackgroundTransparency = 1
		label.Position = UDim2.new(0, 4, 0, 0); label.Size = UDim2.new(1, -168, 1, 0)
		label.Font = F; label.TextSize = M.rowFont; label.TextColor3 = T.Tx2
		label.TextXAlignment = Enum.TextXAlignment.Left; label.TextTruncate = Enum.TextTruncate.AtEnd
		label.Text = item.label

		local enable, enableStroke = mkPill(row, _lIillIIIl("\88\104\98\106\123\123",12), -82)
		local remove, removeStroke = mkPill(row, _lIillIIIl("\114\108\123\132\146\136",25), -4)

		local locked = item.id == _lIillIIIl("\162\157\117\175\174\190\204",38)
		local function paint()
			local on = S._floatIsOn(item.id)
			enable.BackgroundColor3 = on and T.ActiveBg or T.Elev
			enable.TextColor3 = on and T.White or T.Tx2
			enable.Text = on and _lIillIIIl("\137\143\104\162\153\175\169\176\192",51) or _lIillIIIl("\140\156\150\158\175\175",64)
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

	S._floatSet(_lIillIIIl("\201\196\156\214\213\229\243",77), true)
end

attemptRespawn = function()
	task.spawn(function()
		local r = findRemote(_lIillIIIl("\179\205\226\230\222\251\249",90))
		if r and r:IsA(_lIillIIIl("\192\218\233\242\254\246\222\20\20\16\40\36\49\55",103)) then
			local ok, res = pcall(function() return r:InvokeServer() end)
			Notify(_lIillIIIl("\205\231\252\0\248\21\19",116), ok and (_lIillIIIl("\218\244\7\18\9\30\38\30\36\231\246",129) .. tostring(res) .. _lIillIIIl("\190",142)) or _lIillIIIl("\244\14\35\39\31\60\58\243\76\70\78\100\105\103\109",155), 2, ok and _lIillIIIl("\34\43\32\39\48\69\76",168) or _lIillIIIl("\51\36\60\63",181))
		else
			Notify(_lIillIIIl("\27\53\74\78\70\99\97",194), _lIillIIIl("\40\66\87\91\83\112\115\44\133\127\142\151\163\155\93\178\186\198\121\198\214\227\227\224",207), 2, _lIillIIIl("\90\75\99\102",220))
		end
	end)
end

local lastHideAt = 0
hideInLockerNow = function(manual)
	local now = os.clock()
	if not manual and now - lastHideAt < 12 then return end
	lastHideAt = now
	task.spawn(function()
		local chk = findRemote(_lIillIIIl("\51\95\104\109\124\100\142\137\152\153\173\149\189\177\203\211\216",233))
		if chk and chk:IsA(_lIillIIIl("\84\110\125\134\146\138\114\168\168\164\188\184\197\203",246)) then
			local ok, inLocker = pcall(function() return chk:InvokeServer() end)
			if ok and inLocker == true then return end
		end
		local hrp = getHRP(); if not hrp then return end
		local best, bestD, bestPrompt = nil, math.huge, nil

		for _, e in ipairs(PromptCache) do
			if e.kind == _lIillIIIl("\123\133\128\143\144\164",8) and e.part.Parent then
				local d = (e.part.Position - hrp.Position).Magnitude
				if d < bestD then best, bestD, bestPrompt = e.part, d, e.prompt end
			end
		end
		if not best then
			if manual then Notify(_lIillIIIl("\100\140\142\150",21), _lIillIIIl("\119\159\87\177\166\178\184\122\205\215\210\225\226\246\171\248\8\21\21\18",34), 2, _lIillIIIl("\173\158\182\185",47)) end
			return
		end
		hrp.CFrame = best.CFrame + best.CFrame.LookVector * 2
		task.wait(0.1)
		if fireproximityprompt and bestPrompt.Parent then pcall(fireproximityprompt, bestPrompt) end
		Notify(_lIillIIIl("\139\179\181\189",60), _lIillIIIl("\152\192\194\206\218\218\154\234\246\175\2\12\7\22\23\43",73), 2, _lIillIIIl("\208\217\206\213\222\243\250",86))
	end)
end

tc(LP.Idled:Connect(function()
	if S.AntiAFK then
		local VirtualUser = game:GetService(_lIillIIIl("\192\218\234\243\251\238\0\240\21\14\34",99))
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
	local hrp = c and c:FindFirstChild(_lIillIIIl("\191\243\242\237\1\9\10\12\1\37\44\56\27\51\75\84",112))
	local hum = c and c:FindFirstChildOfClass(_lIillIIIl("\204\0\255\250\14\22\23\25",125))

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
			bv = Instance.new(_lIillIIIl("\211\7\3\31\3\25\39\49\44\57\75\87",138))
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
				if p:IsA(_lIillIIIl("\224\6\31\24\10\34\58\67",151)) then
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
				if type(ox) == _lIillIIIl("\31\19\27\44\44",164) and ox.TankValue then ox.TankValue.Value = 100 end
			end)
		end
		if S.FastSwim then
			pcall(function()
				local m = getMain(); local sw = m and m.Swimming
				if type(sw) == _lIillIIIl("\44\32\40\57\57",177) then
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
			local r = findRemote(_lIillIIIl("\21\45\69\59\84\81\99\91\85\113\113\130\131\116\146\153",190))
			if r and r.FireServer then pcall(function() r:FireServer() end) end
		end
		task.wait(0.5)
	end
end)
task.spawn(function()
	while not S.Destroyed do
		if S.AutoDozerStealth then

			local r = findRemote(_lIillIIIl("\22\72\90\76\96\56\115\119\132\121\133\141\153\153\124\168\172\177\192",203))
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
		local code = LP:GetAttribute(_lIillIIIl("\34\85\81\89",216))
		if code and tostring(code) ~= "" then
			local rn = LP:GetAttribute(_lIillIIIl("\62\98\105\115\91\137\136",229))
			Notify(_lIillIIIl("\68\106\133\131\123\133\72\114\165\161\169",242), tostring(code) .. (rn and (_lIillIIIl("\43\50\65\146\150\157\162\92",4) .. tostring(rn) .. _lIillIIIl("\65",17)) or ""), 6, _lIillIIIl("\156\141\165\168",30))
		end
	end
	tc(LP:GetAttributeChangedSignal(_lIillIIIl("\117\168\164\172",43)):Connect(announceCode))
	task.spawn(announceCode)
end

local EntityCache = {}
task.spawn(function()
	while not S.Destroyed do
		local found = {}
		local gf = getGF()
		local monstersFolder = gf and gf:FindFirstChild(_lIillIIIl("\140\181\187\199\207\199\219\227",56))
		local function scan(container)
			if not container then return end
			for _, obj in ipairs(container:GetChildren()) do
				if obj:IsA(_lIillIIIl("\153\194\190\198\212",69)) or obj:IsA(_lIillIIIl("\155\193\218\211\197\221\245\254",82)) then
					local kind = monsterKind(obj.Name:lower())
					if kind then found[#found + 1] = { obj = obj, kind = kind } end
				end
			end
		end
		pcall(scan, monstersFolder)
		pcall(scan, Workspace)
		EntityCache = found
		for _, e in ipairs(found) do
			if e.kind == _lIillIIIl("\211\220\226\238\246\238\2",95) or e.kind == _lIillIIIl("\215\241\230\244\251\251\15",108) then
				ShowEntityWarning(e.obj.Name)
				if S.AutoHideInLocker and e.kind == _lIillIIIl("\237\246\252\8\16\8\28",121) then hideInLockerNow(false) end
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
		local check = findRemote(_lIillIIIl("\208\252\0\5\20\252\38\33\48\49\69\45\85\73\99\107\117",134))
		if check and check:IsA(_lIillIIIl("\236\6\21\30\42\34\10\64\64\60\84\80\93\99",147)) then
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
					if e.kind == _lIillIIIl("\12\39\26\34\40\61\69",160) and e.obj.Parent then
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
			local mf = gf and gf:FindFirstChild(_lIillIIIl("\1\42\48\60\68\60\80\88",173))
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
	if not adornee:IsA(_lIillIIIl("\14\55\51\59\73",186)) then return Vector3.new(0, 0, 0) end
	local ok, boxCF = pcall(function() return (adornee:GetBoundingBox()) end)
	if not ok or not boxCF then return Vector3.new(0, 0, 0) end
	local ok2, pivot = pcall(function() return adornee:GetPivot() end)
	if not ok2 or not pivot then return Vector3.new(0, 0, 0) end
	return boxCF.Position - pivot.Position
end
local function mkEspTag(adornee, title, color, strong, style)
	local priority = style == _lIillIIIl("\57\58\85\70\75\99\92",199) or style == _lIillIIIl("\70\71\98\83\88\117\110\117\135\142\152",212)
	local bb = Instance.new(_lIillIIIl("\42\88\98\110\107\127\120\144\137\115\168\163",225))
	bb.Name = _lIillIIIl("\69\115\109\130\137\146\150\144\119\172\176\155\175\188",238)
	bb.Adornee = adornee; bb.AlwaysOnTop = true; bb.LightInfluence = 0
	bb.Size = UDim2.fromOffset(priority and 172 or 134, priority and 42 or 38)
	bb.StudsOffset = Vector3.new(0, 1.8, 0)
	bb.StudsOffsetWorldSpace = centerOffsetFor(adornee)
	bb.MaxDistance = S.ESPMaxDist or 1500
	bb.Parent = adornee

	local card = Instance.new(_lIillIIIl("\77\128\118\137\136",0))
	card.Parent = bb; card.BackgroundColor3 = Color3.fromRGB(9, 9, 10); card.BackgroundTransparency = 0.22
	card.BorderSizePixel = 0; card.Size = UDim2.new(1, 0, 1, 0)
	Corner(card, 9); Stroke(card, color, 1.2, 0.25); Grad(card, Color3.fromRGB(26, 26, 28), Color3.fromRGB(9, 9, 10), 90)

	local dot = Instance.new(_lIillIIIl("\90\141\131\150\149",13))
	dot.Parent = card; dot.AnchorPoint = Vector2.new(0, 0.5)
	dot.Position = UDim2.new(0, 8, 0.3, 0); dot.Size = UDim2.new(0, priority and 8 or 6, 0, priority and 8 or 6); dot.BackgroundColor3 = color
	Corner(dot, priority and 4 or 3)

	local tl = Instance.new(_lIillIIIl("\117\141\167\170\137\165\173\183\197",26))
	tl.Parent = card; tl.BackgroundTransparency = 1
	tl.Position = UDim2.new(0, 18, 0, 2); tl.Size = UDim2.new(1, priority and -72 or -22, 0, 16)
	tl.Font = FM; tl.Text = title; tl.TextColor3 = T.White; tl.TextSize = 13
	tl.TextXAlignment = Enum.TextXAlignment.Left; tl.TextTruncate = Enum.TextTruncate.AtEnd
	if priority then
		local badge = Instance.new(_lIillIIIl("\130\154\180\183\150\178\186\196\210",39))
		badge.Parent = card; badge.AnchorPoint = Vector2.new(1, 0)
		badge.Position = UDim2.new(1, -7, 0, 6); badge.Size = UDim2.fromOffset(48, 13)
		badge.BackgroundColor3 = color; badge.BackgroundTransparency = 0.72
		badge.BorderSizePixel = 0; badge.Font = FB; badge.TextSize = 8; badge.TextColor3 = color
		badge.Text = style == _lIillIIIl("\166\167\194\179\184\208\201",52) and _lIillIIIl("\152\152\153\168\132\192\194",65) or _lIillIIIl("\150\159\166\175\196\203",78)
		Corner(badge, 4); Stroke(badge, color, 1, 0.25)
	end

	local distLbl = Instance.new(_lIillIIIl("\182\206\232\235\202\230\238\248\6",91))
	distLbl.Parent = card; distLbl.BackgroundTransparency = 1
	distLbl.Position = UDim2.new(0, 18, 0, 19); distLbl.Size = UDim2.new(1, -22, 0, 14)
	distLbl.Font = F; distLbl.Text = ""; distLbl.TextColor3 = T.Tx2; distLbl.TextSize = 11
	distLbl.TextXAlignment = Enum.TextXAlignment.Left

	local sc = Instance.new(_lIillIIIl("\196\191\208\231\236\254\254",104)); sc.Scale = 0.6; sc.Parent = card
	Tween(sc, 0.25, { Scale = 1 }, Enum.EasingStyle.Back):Play()

	local hl = Instance.new(_lIillIIIl("\196\236\241\249\4\8\13\21\40",117))
	hl.Name = _lIillIIIl("\217\2\252\17\24\33\37\31\6\59\63\30\41",130); hl.Adornee = adornee; hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
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

				local completedRepair = e.kind == _lIillIIIl("\8\2\20\12\27\43",143) and isRepairComplete(e)
				if e.part.Parent and promptKindOn[e.kind] and not completedRepair and not (e.kind == _lIillIIIl("\7\25\32\42",156) and isDeadEndDoor(e.model)) then
					local displayKind = e.kind
					if e.kind == _lIillIIIl("\20\38\45\55",169) and isKeycardDoor(e) then displayKind = _lIillIIIl("\40\41\68\53\58\82\75\82\100\112\122",182) end
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
						if c.e.kind == _lIillIIIl("\46\64\71\81",195) and doorPassed(c.e.model, objPos(c.e.model) or c.e.part.Position, myPos) then

						else
							local displayKind = c.displayKind
							if c.e.kind == _lIillIIIl("\59\77\84\94",208) and c.e.model:GetAttribute(_lIillIIIl("\52\93\97\96\119\113\134\141\101\151\158\168",221)) then displayKind = _lIillIIIl("\95\93\124\127\118\136\143\153",234) end
							local priority = displayKind == _lIillIIIl("\110\111\138\123\128\152\145",247) or displayKind == _lIillIIIl("\123\124\151\136\141\165\158\165\183\190\200",9)
								or displayKind == _lIillIIIl("\139\137\163\166\157\175\182\192",22) or displayKind == _lIillIIIl("\156\150\168\160\175\191",35) or displayKind == _lIillIIIl("\173\159\177\194\184",48)
							wants[c.e.model] = {
								title = tagTitleFor(c.e), color = ESP_COLORS[displayKind] or ESP_COLORS[c.e.kind],
								strong = priority or c.e.kind == _lIillIIIl("\172\172\204\186\210\203",61) or c.e.kind == _lIillIIIl("\199\199\200\202\217\227\222\237\238\2",74),
								style = displayKind, d = c.d,
							}
						end
					end
				end
			end

			if S.DoorESP then
				local gf2 = getGF()
				local rooms = gf2 and gf2:FindFirstChild(_lIillIIIl("\176\212\219\224\237",87))
				if rooms then
					for _, room in ipairs(rooms:GetChildren()) do
						for _, ch in ipairs(room:GetChildren()) do
							if ch:IsA(_lIillIIIl("\184\225\221\229\243",100)) then
								local isNext = ch:GetAttribute(_lIillIIIl("\200\241\245\244\6\0\21\28\244\38\45\55",113)) == true
								if isNext and not isDeadEndDoor(ch) then
									local p = objPos(ch)
									if p and not doorPassed(ch, p, myPos) then
										local d = (myPos and p) and (p - myPos).Magnitude or 0
										if d <= 500 then
											wants[ch] = { title = _lIillIIIl("\211\209\235\238\193\250\254\5\10\228\9\16",126), color = ESP_COLORS.nextdoor, strong = true, style = _lIillIIIl("\0\254\24\27\18\36\43\53",139), d = d }
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
					if p then e.distLbl.Text = math.floor((p - myPos).Magnitude + 0.5) .. _lIillIIIl("\12",152) end
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
						if S.AutoOpenDoors and e.kind == _lIillIIIl("\16\34\41\51",165) and not isDeadEndDoor(e.model) and d <= 12 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoCollectItems and (e.kind == _lIillIIIl("\28\53\57\64\58\74\70\99",178) or e.kind == _lIillIIIl("\47\65\57\72",191)) and d <= 18 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoSearchDrawers and e.kind == _lIillIIIl("\55\76\66\95\84\104",204) and d <= 10 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoCollectKeys and e.kind == _lIillIIIl("\75\76\103\88\98\122\115",217) and d <= 18 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoRefillBatteries and e.kind == _lIillIIIl("\95\89\102\112\122\129",230) and d <= 7 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoTurnValves and e.kind == _lIillIIIl("\112\103\121\138\128",243) and d <= 5 then pcall(fireproximityprompt, e.prompt)
						elseif S.AutoDisarmLandmines and e.interactionType == _lIillIIIl("\88\116\136\133\149\152\164\162",5) and d <= 5.5 then pcall(fireproximityprompt, e.prompt)
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
				if e.kind == _lIillIIIl("\139\133\151\143\158\174",18) and e.interactionRoot and e.interactionRoot.Parent and e.part.Parent then
					local fixed = e.interactionRoot:FindFirstChild(_lIillIIIl("\108\150\172\160\166",31))
					if fixed and tonumber(fixed.Value) and fixed.Value < 100 and (e.part.Position - myPos).Magnitude <= 5.25 then
						target = e
						break
					end
				end
			end
			if not target then return end

			local root = target.interactionRoot
			local remoteFunction = root:FindFirstChild(_lIillIIIl("\133\159\174\183\195\187\163\217\217\213\237\233\246\252",44))
			local remoteEvent = root:FindFirstChild(_lIillIIIl("\146\172\187\196\208\200\175\231\221\237\250",57))
			if not (remoteFunction and remoteFunction:IsA(_lIillIIIl("\159\185\200\209\221\213\189\243\243\239\7\3\16\22",70)) and remoteEvent and remoteEvent:IsA(_lIillIIIl("\172\198\213\222\234\226\201\1\247\7\20",83))) then return end
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

local ESPGui = Instance.new(_lIillIIIl("\186\209\231\225\232\248\216\13\8",96))
ESPGui.Name = _lIillIIIl("\196\237\231\252\3\12\16\10\241\6\10",109); ESPGui.ResetOnSpawn = false; ESPGui.IgnoreGuiInset = true; ESPGui.DisplayOrder = 950
pcall(function() ESPGui.Parent = uiP end)
table.insert(UIStyle.Roots, ESPGui)
SG.Destroying:Connect(function() pcall(function() ESPGui:Destroy() end) end)

local KeycardTracer = Instance.new(_lIillIIIl("\199\250\240\3\2",122))
KeycardTracer.BorderSizePixel = 0
KeycardTracer.AnchorPoint = Vector2.new(0.5, 0.5)
KeycardTracer.Size = UDim2.new(0, 2, 0, 0)
KeycardTracer.BackgroundColor3 = ESP_COLORS.keycard
KeycardTracer.BackgroundTransparency = 0.03
KeycardTracer.Visible = false
KeycardTracer.Parent = ESPGui
Corner(KeycardTracer, 1)

local KeycardBeacon = Instance.new(_lIillIIIl("\226\250\20\23\246\18\26\36\50",135))
KeycardBeacon.Name = _lIillIIIl("\235\20\14\35\42\51\55\49\30\63\90\75\80\104\102\75\117\120\129\148\154",148)
KeycardBeacon.AnchorPoint = Vector2.new(0.5, 1)
KeycardBeacon.Size = UDim2.fromOffset(138, 24)
KeycardBeacon.BackgroundColor3 = Color3.fromRGB(24, 19, 7)
KeycardBeacon.BackgroundTransparency = 0.12
KeycardBeacon.BorderSizePixel = 0
KeycardBeacon.Font = FB
KeycardBeacon.TextSize = 11
KeycardBeacon.TextColor3 = ESP_COLORS.keycard
KeycardBeacon.Text = _lIillIIIl("\243\244\15\0\5\29\22",161)
KeycardBeacon.Visible = false
KeycardBeacon.Parent = ESPGui
Corner(KeycardBeacon, 7)
Stroke(KeycardBeacon, ESP_COLORS.keycard, 1, 0.15)

local NextDoorTracer = Instance.new(_lIillIIIl("\251\46\36\55\54",174))
NextDoorTracer.Name = _lIillIIIl("\18\59\53\74\81\90\94\88\72\107\133\136\95\145\152\162\142\159\190\188\194\195\207\220",187)
NextDoorTracer.BorderSizePixel = 0
NextDoorTracer.AnchorPoint = Vector2.new(0.5, 0.5)
NextDoorTracer.Size = UDim2.new(0, 2, 0, 0)
NextDoorTracer.BackgroundColor3 = ESP_COLORS.nextdoor
NextDoorTracer.BackgroundTransparency = 0.05
NextDoorTracer.Visible = false
NextDoorTracer.Parent = ESPGui
Corner(NextDoorTracer, 1)

local StatusHUD = Instance.new(_lIillIIIl("\21\72\62\81\80",200))
StatusHUD.Name = _lIillIIIl("\44\85\79\100\107\121\125\119\108\148\136\162\170\175\139\159\149",213)
StatusHUD:SetAttribute(_lIillIIIl("\60\83\88\111\107\115\132\132\110\130\120",226), true)
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
statusSurface.Name = _lIillIIIl("\62\87\77\99\140\144\139\141\150\159\136\186\176\186\198\201\217\230",239)
local statusTop = Instance.new(_lIillIIIl("\78\129\119\138\137",1))
statusTop.Parent = StatusHUD; statusTop.Size = UDim2.new(1, 0, 0, 28)
statusTop.BackgroundColor3 = T.Elev; statusTop.BackgroundTransparency = 0.025; statusTop.BorderSizePixel = 0
Corner(statusTop, 10)
local statusHeaderGradient = Grad(statusTop, T.White:Lerp(T.Accent, 0.14), T.White:Lerp(T.Card, 0.06), 0)
statusHeaderGradient.Name = _lIillIIIl("\93\113\103\114\150\153\163\171\191\155\205\195\205\217\220\236\249",14)
local statusTopLine = Instance.new(_lIillIIIl("\104\155\145\164\163",27))
statusTopLine.Parent = statusTop; statusTopLine.AnchorPoint = Vector2.new(0, 1)
statusTopLine.Position = UDim2.new(0, 0, 1, 0); statusTopLine.Size = UDim2.new(1, 0, 0, 1)
statusTopLine.BackgroundColor3 = T.Bd; statusTopLine.BackgroundTransparency = 0.2; statusTopLine.BorderSizePixel = 0
local statusTick = Instance.new(_lIillIIIl("\117\168\158\177\176",40))
statusTick.Parent = statusTop; statusTick.Position = UDim2.new(0, 8, 0.5, -6); statusTick.Size = UDim2.fromOffset(2, 12)
statusTick.BackgroundColor3 = T.Accent; statusTick.BorderSizePixel = 0; Corner(statusTick, 2)

local statusHeader = Instance.new(_lIillIIIl("\144\168\194\197\164\192\200\210\224",53))
statusHeader.Parent = statusTop; statusHeader.BackgroundTransparency = 1
statusHeader.Position = UDim2.fromOffset(16, 0); statusHeader.Size = UDim2.new(1, -24, 1, 0)
statusHeader.Font = FB; statusHeader.TextSize = 11; statusHeader.TextColor3 = T.Tx
statusHeader.TextXAlignment = Enum.TextXAlignment.Left; statusHeader.Text = _lIillIIIl("\145\145\155\159\177\140\162\169\161\222\216\234\222\240\254",66)
end

local statusRoom = Instance.new(_lIillIIIl("\170\194\220\223\190\218\226\236\250",79))
statusRoom.Parent = StatusHUD; statusRoom.BackgroundTransparency = 1
statusRoom.Position = UDim2.fromOffset(12, 31); statusRoom.Size = UDim2.new(1, -24, 0, 16)
statusRoom.Font = FM; statusRoom.TextSize = 12; statusRoom.TextColor3 = T.White
statusRoom.TextXAlignment = Enum.TextXAlignment.Left; statusRoom.Text = _lIillIIIl("\181\185\192\197\159\104\13\40",92)

local function mkVitalRow(parent, label, y)
	local text = Instance.new(_lIillIIIl("\196\220\246\249\216\244\252\6\20",105))
	text.Parent = parent; text.BackgroundTransparency = 1
	text.Position = UDim2.fromOffset(12, y); text.Size = UDim2.new(1, -24, 0, 14)
	text.Font = F; text.TextSize = 11; text.TextColor3 = T.Tx2; text.TextXAlignment = Enum.TextXAlignment.Left
	local back = Instance.new(_lIillIIIl("\195\246\236\255\254",118))
	back.Parent = parent; back.Position = UDim2.fromOffset(12, y + 16); back.Size = UDim2.new(1, -24, 0, 4)
	back.BackgroundColor3 = T.Bd2; back.BorderSizePixel = 0; Corner(back, 2)
	local fill = Instance.new(_lIillIIIl("\208\3\249\12\11",131))
	fill.Parent = back; fill.Size = UDim2.new(1, 0, 1, 0); fill.BackgroundColor3 = T.Tx
	fill.BorderSizePixel = 0; Corner(fill, 2)
	return text, fill
end
local oxygenText, oxygenFill = mkVitalRow(StatusHUD, "", 49)
local healthText, healthFill = mkVitalRow(StatusHUD, "", 73)

local KeybindHUD = Instance.new(_lIillIIIl("\221\16\6\25\24",144))
KeybindHUD.Name = _lIillIIIl("\244\29\23\44\51\60\64\58\39\72\99\83\97\114\111\90\110\100",157)
KeybindHUD:SetAttribute(_lIillIIIl("\4\27\32\50\46\54\71\71\49\69\59",170), true)
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
keybindSurface.Name = _lIillIIIl("\6\26\16\38\79\83\78\80\89\103\80\130\120\130\142\145\161\174",183)
local keybindTop = Instance.new(_lIillIIIl("\17\68\58\77\76",196))
keybindTop.Parent = KeybindHUD; keybindTop.Size = UDim2.new(1, 0, 0, 28)
keybindTop.BackgroundColor3 = T.Elev; keybindTop.BackgroundTransparency = 0.025; keybindTop.BorderSizePixel = 0
Corner(keybindTop, 10)
local keybindHeaderGradient = Grad(keybindTop, T.White:Lerp(T.Accent, 0.14), T.White:Lerp(T.Card, 0.06), 0)
keybindHeaderGradient.Name = _lIillIIIl("\32\52\42\53\89\97\107\115\135\99\149\139\149\161\164\180\193",209)
local keybindTopLine = Instance.new(_lIillIIIl("\43\94\84\103\107",222))
keybindTopLine.Parent = keybindTop; keybindTopLine.AnchorPoint = Vector2.new(0, 1)
keybindTopLine.Position = UDim2.new(0, 0, 1, 0); keybindTopLine.Size = UDim2.new(1, 0, 0, 1)
keybindTopLine.BackgroundColor3 = T.Bd; keybindTopLine.BackgroundTransparency = 0.2; keybindTopLine.BorderSizePixel = 0
local keybindTick = Instance.new(_lIillIIIl("\56\107\102\121\120",235))
keybindTick.Parent = keybindTop; keybindTick.Position = UDim2.new(0, 8, 0.5, -6); keybindTick.Size = UDim2.fromOffset(2, 12)
keybindTick.BackgroundColor3 = T.Accent; keybindTick.BorderSizePixel = 0; Corner(keybindTick, 2)

local keybindTitle = Instance.new(_lIillIIIl("\88\112\138\141\108\136\144\154\168",248))
keybindTitle.Parent = keybindTop; keybindTitle.BackgroundTransparency = 1
keybindTitle.Position = UDim2.fromOffset(16, 0); keybindTitle.Size = UDim2.new(1, -24, 1, 0)
keybindTitle.Font = FB; keybindTitle.TextSize = 11; keybindTitle.TextColor3 = T.Tx
keybindTitle.TextXAlignment = Enum.TextXAlignment.Left; keybindTitle.Text = _lIillIIIl("\92\93\120\104\118\130\127\149",10)
end

local KeybindRows = {}
local function getKeybindRow(index)
	local row = KeybindRows[index]
	if row then return row end
	row = Instance.new(_lIillIIIl("\100\151\141\160\159",23))
	row.Name = _lIillIIIl("\109\155\167\164\153\189\204",36); row.Parent = KeybindHUD
	row.BackgroundColor3 = T.Elev; row.BackgroundTransparency = 0.38
	row.BorderSizePixel = 0; row.Size = UDim2.new(1, -16, 0, 18)
	Corner(row, 5)
	local label = Instance.new(_lIillIIIl("\140\164\190\193\160\188\196\206\220",49))
	label.Name = _lIillIIIl("\145\173\181\191\205",62); label.Parent = row; label.BackgroundTransparency = 1
	label.Position = UDim2.fromOffset(7, 0); label.Size = UDim2.new(1, -66, 1, 0)
	label.Font = F; label.TextSize = 11; label.TextColor3 = T.Tx2
	label.TextXAlignment = Enum.TextXAlignment.Left; label.TextTruncate = Enum.TextTruncate.AtEnd
	local key = Instance.new(_lIillIIIl("\166\190\216\219\186\214\222\232\246",75))
	key.Name = _lIillIIIl("\170\203\230",88); key.Parent = row; key.BackgroundTransparency = 1
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
			local show = entry.kind ~= _lIillIIIl("\224\226\225\232\244\244",101)
			if entry.kind == _lIillIIIl("\237\239\238\245\1\1",114) and entry.isActive then
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
		row.Label.TextColor3 = data.entry.kind == _lIillIIIl("\250\252\251\2\14\14",127) and T.White or T.Tx2
		row.Key.TextColor3 = data.entry.kind == _lIillIIIl("\7\9\8\15\27\27",140) and T.Accent or T.Tx
	end
	for i = #entries + 1, #KeybindRows do KeybindRows[i].Visible = false end
end
UIStyle:ApplyHUDScale(S.HUDScale)
S._markKeybindHUDDirty()

do
	local island = Instance.new(_lIillIIIl("\230\25\15\34\33",153))
	island.Name = _lIillIIIl("\253\38\32\53\60\69\73\67\41\101\97\91\115\118\119\100\149\149\145\165\162",166)
	island:SetAttribute(_lIillIIIl("\13\36\41\59\55\63\80\80\58\78\73",179), true)
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
	islandGrad.Name = _lIillIIIl("\11\71\67\61\80\83\84\65\119\119\115\135\132\110\160\150\160\172\175\191\204",192)
	local islandScale = Instance.new(_lIillIIIl("\41\36\53\76\81\99\104",205))
	islandScale.Name = _lIillIIIl("\41\61\51\75\117\110\130\106\129\134\152\152",218); islandScale.Scale = S.HUDScale; islandScale.Parent = island
	local iDot = Instance.new(_lIillIIIl("\52\103\98\117\116",231))
	iDot.Parent = island
	iDot.AnchorPoint = Vector2.new(0, 0.5)
	iDot.Position = UDim2.new(0, 13, 0.5, 0)
	iDot.Size = UDim2.fromOffset(6, 6)
	iDot.BackgroundColor3 = T.Accent
	iDot.BackgroundTransparency = 0.05
	iDot.BorderSizePixel = 0
	Corner(iDot, 4)
	local iBrand = Instance.new(_lIillIIIl("\84\108\134\137\104\132\140\150\164",244))
	iBrand.Parent = island
	iBrand.Position = UDim2.new(0, 26, 0, 0)
	iBrand.Size = UDim2.new(0, 72, 1, 0)
	iBrand.BackgroundTransparency = 1
	iBrand.Font = FB
	iBrand.TextSize = 12
	iBrand.TextColor3 = T.White
	iBrand.TextYAlignment = Enum.TextYAlignment.Center
	iBrand.TextXAlignment = Enum.TextXAlignment.Left
	iBrand.Text = _lIillIIIl("\86\98\96\116\125\121\120",6)
	local iDiv = Instance.new(_lIillIIIl("\96\147\137\156\155",19))
	iDiv.Parent = island
	iDiv.Position = UDim2.new(0, 104, 0.5, -12)
	iDiv.Size = UDim2.fromOffset(1, 24)
	iDiv.BackgroundColor3 = T.Bd2
	iDiv.BackgroundTransparency = 0.28
	iDiv.BorderSizePixel = 0
	local function islandMetric(x, width, caption)
		local key = Instance.new(_lIillIIIl("\123\147\173\176\143\171\179\189\203",32))
		key.Parent = island
		key.Position = UDim2.fromOffset(x, 6)
		key.Size = UDim2.fromOffset(width, 12)
		key.BackgroundTransparency = 1
		key.Font = FB
		key.TextSize = 10
		key.TextColor3 = T.Tx3
		key.TextXAlignment = Enum.TextXAlignment.Left
		key.Text = caption
		local value = Instance.new(_lIillIIIl("\136\160\186\189\156\184\192\202\216",45))
		value.Parent = island
		value.Position = UDim2.fromOffset(x, 19)
		value.Size = UDim2.fromOffset(width, 20)
		value.BackgroundTransparency = 1
		value.Font = FM
		value.TextSize = 13
		value.TextColor3 = T.Tx
		value.TextXAlignment = Enum.TextXAlignment.Left
		value.TextTruncate = Enum.TextTruncate.AtEnd
		value.Text = _lIillIIIl("\35\200\227",58)
		return value
	end
	local iO2 = islandMetric(116, 60, _lIillIIIl("\157\135",71))
	local iPing = islandMetric(190, 52, _lIillIIIl("\171\171\183\183",84))
	local iFps = islandMetric(250, 44, _lIillIIIl("\174\191\201",97))
	local iTime = islandMetric(302, 60, _lIillIIIl("\201\197\208\207",110))

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
			island:SetAttribute(_lIillIIIl("\207\248\242\0\10\10\242\28\46",123), math.clamp((vp.X - 32) / 420, 0.40, 0.65))
			islandScale.Scale = S.HUDScale * (tonumber(island:GetAttribute(_lIillIIIl("\220\5\255\13\23\23\255\41\59",136))) or 1)
		end
		fitIsland()
		tc(cam():GetPropertyChangedSignal(_lIillIIIl("\242\12\15\40\40\46\56\65\39\68\92\78",149)):Connect(fitIsland))
	end

	S._islandGulp = function(outward)
		if not island.Visible then return end

		local base = S.HUDScale * (tonumber(island:GetAttribute(_lIillIIIl("\246\31\25\39\49\49\25\67\85",162))) or 1)

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
				local tank = type(ox) == _lIillIIIl("\42\30\38\55\55",175) and ox.TankValue or nil
				local oxygen = tank and tonumber(tank.Value) or nil
				iO2.Text = oxygen and (tostring(math.floor(oxygen + 0.5)) .. _lIillIIIl("\232",188)) or _lIillIIIl("\178\87\114",201)
				local lowO2 = oxygen and oxygen <= 25
				iO2.TextColor3 = lowO2 and Color3.fromRGB(255, 180, 75) or T.Tx
				iDot.BackgroundColor3 = lowO2 and Color3.fromRGB(255, 180, 75) or T.Accent
				local ping = math.floor((LP:GetNetworkPing() or 0) * 1000 + 0.5)
				iPing.Text = ping .. _lIillIIIl("\74\87",214)
				iFps.Text = tostring(fpsMeter.value)
				local elapsed = os.time() - islandStart
				if elapsed >= 3600 then
					iTime.Text = string.format(_lIillIIIl("\15\33\42\104\69\55\73\82\139",227), math.floor(elapsed / 3600), math.floor((elapsed % 3600) / 60))
				else
					iTime.Text = string.format(_lIillIIIl("\28\51\60\117\82\68\86\95\152",240), math.floor(elapsed / 60), elapsed % 60)
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
	local holder = Instance.new(_lIillIIIl("\79\130\120\139\138",2))
	holder.Name = _lIillIIIl("\102\143\137\158\165\174\178\172\162\189\206\200\203\229\185\241\248\252\11",15)
	holder.AnchorPoint = Vector2.new(0.5, 0.5)
	holder.Size = UDim2.fromOffset(96, 46)
	holder.BackgroundTransparency = 1
	holder.Visible = false
	holder.Parent = ESPGui
	local arrow = Instance.new(_lIillIIIl("\119\143\169\172\139\167\175\185\199",28))
	arrow.Parent = holder; arrow.BackgroundTransparency = 1
	arrow.AnchorPoint = Vector2.new(0.5, 0.5); arrow.Position = UDim2.fromOffset(48, 12)
	arrow.Size = UDim2.fromOffset(24, 24); arrow.Font = FB; arrow.TextSize = 20
	arrow.Text = _lIillIIIl("\18\205\240",41); arrow.TextColor3 = Color3.fromRGB(255, 85, 85)
	local label = Instance.new(_lIillIIIl("\145\169\195\198\165\193\201\211\225",54))
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
	local legacy = ch and ch:FindFirstChild(_lIillIIIl("\154\195\189\210\217\226\230\224\210\245\241\16\3\23\239\27\27\46",67))
	if legacy then pcall(function() legacy:Destroy() end) end
end

local function createTeammateCham(plr, ch)
	local proxy = Instance.new(_lIillIIIl("\164\205\201\209\223",80))
	proxy.Name = _lIillIIIl("\180\221\215\236\243\252\0\250\240\8\11\30\37\32\58\50\23\67\67\86",93)
	local links = {}
	for _, source in ipairs(ch:GetDescendants()) do
		if source:IsA(_lIillIIIl("\179\217\242\235\221\245\13\22",106)) and source.Name ~= _lIillIIIl("\198\250\249\244\8\16\17\19\8\44\51\63\34\58\82\91",119) then
			local ok, copy = pcall(function() return source:Clone() end)
			if ok and copy and copy:IsA(_lIillIIIl("\205\243\12\5\247\15\39\48",132)) then

				for _, child in ipairs(copy:GetChildren()) do
					if not (child:IsA(_lIillIIIl("\235\15\11\16\29\28\46\22\53\74\70",145)) or child:IsA(_lIillIIIl("\233\17\22\27\45",158)) or child:IsA(_lIillIIIl("\6\30\56\59\67\71\65",171))) then
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
	local hl = Instance.new(_lIillIIIl("\7\47\52\60\71\75\80\88\107",184))
	hl.Name = _lIillIIIl("\28\69\63\84\91\100\104\103\89\124\120\151\138\158\118\162\162\181",197); hl.Adornee = proxy; hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
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
		local room = LP:GetAttribute(_lIillIIIl("\43\79\86\91\67\118\117",210))
		statusRoom.Text = _lIillIIIl("\56\60\67\77\39",223) .. (room and tostring(room) or _lIillIIIl("\213\122\154",236))
		local hum = getHum()
		local hp = hum and math.clamp(hum.Health, 0, hum.MaxHealth > 0 and hum.MaxHealth or 100) or 0
		local maxHp = hum and hum.MaxHealth > 0 and hum.MaxHealth or 100
		local hpRatio = math.clamp(hp / maxHp, 0, 1)
		healthText.Text = _lIillIIIl("\91\85\103\91\109\123\79\86",249) .. tostring(math.floor(hp + 0.5)) .. _lIillIIIl("\50\72\64",11) .. tostring(math.floor(maxHp + 0.5))
		healthFill.Size = UDim2.new(hpRatio, 0, 1, 0)
		healthFill.BackgroundColor3 = hpRatio <= 0.3 and Color3.fromRGB(255, 82, 82) or T.Tx

		local m = getMain(); local ox = m and m.OxygenTank
		local tank = type(ox) == _lIillIIIl("\147\135\143\160\160",24) and ox.TankValue or nil
		local oxygen = tank and tonumber(tank.Value) or 100
		local oxyRatio = math.clamp(oxygen / 100, 0, 1)
		oxygenText.Text = _lIillIIIl("\123\139\147\136\141\157\118\125",37) .. tostring(math.floor(oxygen + 0.5)) .. _lIillIIIl("\94",50)
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
		if e.obj.Parent and (e.kind == _lIillIIIl("\179\188\194\206\214\206\226",63) or e.kind == _lIillIIIl("\183\209\198\212\219\219\239",76) or e.kind == _lIillIIIl("\197\224\211\219\225\246\254",89) or e.kind == _lIillIIIl("\224\229\240\235\237\244\3\3",102) or e.kind == _lIillIIIl("\221\226\250\253\247\17\13\26\32",115)) then
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
			arrow.label.Text = string.upper(candidate.e.obj.Name) .. _lIillIIIl("\167\174",128) .. tostring(math.floor(candidate.d + 0.5)) .. _lIillIIIl("\1",141)
			arrow.holder.Visible = true
		else
			arrow.holder.Visible = false
		end
	end
end))

local ESPObjects = {}
local function makeESP(plr)
	local o = {}
	o.box = Instance.new(_lIillIIIl("\231\26\16\35\34",154))
	o.box.BackgroundTransparency = 1; o.box.BorderSizePixel = 0; o.box.Visible = false; o.box.Parent = ESPGui
	o.boxStroke = Instance.new(_lIillIIIl("\3\254\15\55\60\64\67\68",167))
	o.boxStroke.Thickness = 1.5; o.boxStroke.Color = Color3.fromRGB(120, 220, 255); o.boxStroke.Parent = o.box
	Corner(o.box, 4)

	o.tracer = Instance.new(_lIillIIIl("\1\52\42\61\60",180))
	o.tracer.BorderSizePixel = 0; o.tracer.AnchorPoint = Vector2.new(0.5, 0.5)
	o.tracer.Size = UDim2.new(0, 1, 0, 0); o.tracer.BackgroundColor3 = Color3.fromRGB(120, 220, 255)
	o.tracer.BackgroundTransparency = 0.25; o.tracer.Visible = false; o.tracer.Parent = ESPGui
	Corner(o.tracer, 1)

	o.bill = Instance.new(_lIillIIIl("\10\56\66\73\70\90\83\107\105\83\136\131",193))
	o.bill.Size = UDim2.fromOffset(150, 36); o.bill.AlwaysOnTop = true; o.bill.LightInfluence = 0
	o.bill.StudsOffset = Vector3.new(0, 2.6, 0); o.bill.Enabled = false; o.bill.Parent = ESPGui

	o.card = Instance.new(_lIillIIIl("\27\78\68\87\86",206))
	o.card.Parent = o.bill; o.card.BackgroundColor3 = Color3.fromRGB(9, 9, 10); o.card.BackgroundTransparency = 0.22
	o.card.BorderSizePixel = 0; o.card.Size = UDim2.new(1, 0, 1, 0)
	Corner(o.card, 8); Stroke(o.card, Color3.fromRGB(120, 220, 255), 1.2, 0.25); Grad(o.card, Color3.fromRGB(26, 26, 28), Color3.fromRGB(9, 9, 10), 90)

	local dot = Instance.new(_lIillIIIl("\40\91\81\100\104",219))
	dot.Parent = o.card; dot.AnchorPoint = Vector2.new(0, 0.5)
	dot.Position = UDim2.new(0, 8, 0.5, 0); dot.Size = UDim2.new(0, 6, 0, 6); dot.BackgroundColor3 = Color3.fromRGB(120, 220, 255)
	Corner(dot, 3)

	o.txt = Instance.new(_lIillIIIl("\67\91\122\125\92\120\128\138\152",232))
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
			local hrp = ch and ch:FindFirstChild(_lIillIIIl("\73\125\124\119\139\147\148\150\139\175\182\194\165\189\213\222",245))
			local head = ch and (ch:FindFirstChild(_lIillIIIl("\86\122\125\135",7)) or hrp)
			local hum = ch and ch:FindFirstChildOfClass(_lIillIIIl("\99\151\150\145\165\173\174\176",20))
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
					if S.HealthESP and hum then parts[#parts + 1] = math.floor(hum.Health + 0.5) .. _lIillIIIl("\72\119\134",33) end
					parts[#parts + 1] = math.floor(dist + 0.5) .. _lIillIIIl("\162",46)
					o.txt.Text = table.concat(parts, _lIillIIIl("\98\105\18\14\126\133",59))
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
			if e.kind == _lIillIIIl("\186\187\214\199\204\228\221",72) and e.part.Parent and hrp then
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
				KeycardBeacon.Text = bestEntry and bestEntry.name == _lIillIIIl("\159\210\206\214\186\241\235\238\247\3\7\27",85) and _lIillIIIl("\172\191\187\195\165\206\229\223\226\235\247\251\15",98) or _lIillIIIl("\193\194\221\206\211\235\228",111)
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
			if e.kind == _lIillIIIl("\231\249\0\10",124) and e.part.Parent and not isDeadEndDoor(e.model) and e.model:GetAttribute(_lIillIIIl("\224\9\13\12\30\24\45\52\12\62\69\79",137)) and hrp then
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
		if r and (r:IsA(_lIillIIIl("\239\9\24\33\45\37\12\68\58\74\87",150)) or r:IsA(_lIillIIIl("\255\31\42\36\50\54\53\61\78\78\66\92\112\121\133\125\100\156\146\162\175",163))) then
			tc(r.OnClientEvent:Connect(function(...) pcall(fn, ...) end))
		end
	end

	hookEvent(_lIillIIIl("\250\38\38\63\56",176), function()
		ShowEntityWarning(_lIillIIIl("\7\19\19\44\37\7\55\67\68\87\92\95\107\107",189), _lIillIIIl("\35\77\77\6\92\102\32\111\119\121\129\67\147\159\88\160\102\185\195\190\205\206\226",202))
		if S.AutoHideInLocker then hideInLockerNow(false) end
	end)
	hookEvent(_lIillIIIl("\49\86\97\92\94\106\121\121",215), function() ShowEntityWarning(_lIillIIIl("\62\67\78\78\80\87\102\102",228), _lIillIIIl("\75\108\116\128\126\64\160\157\170\174\99\182\186\191\199\218\141\163\155\237\238\245\7\190\9\21\38\46\34\54\50\59",241)) end)
	hookEvent(_lIillIIIl("\90\114\134\131\139\154\163\169\171\190\189\155\205\212\222\191\233\228\243",3), function() ShowEntityWarning(_lIillIIIl("\103\95\115\112\120\135\144\150\152\171\170",16), _lIillIIIl("\104\154\161\171\179\103\175\199\193\131\214\224\219\234\239\251\251",29)) end)
	hookEvent(_lIillIIIl("\129\157\177\179\174\194\192\208\221\181\240\227\235\241\6\14\2\28\24\37\43",42), function() ShowEntityWarning(_lIillIIIl("\131\158\145\153\159\180\188\176\202\198\211\217",55), _lIillIIIl("\143\193\121\206\214\226\149\232\242\249\252\184\0\26\205\29\47",68)) end)
	hookEvent(_lIillIIIl("\155\192\216\219\213\239\235\248\254\224\12\9\21\22\27\53\55\65",81), function() ShowEntityWarning(_lIillIIIl("\168\173\197\200\194\220\216\229\235",94), _lIillIIIl("\197\237\225\249\243\181\5\23\202\21\39\54\52\249\244\63\81\87\23\107\35\118\128\135\138\70\142\171\156\187",107)) end)
	hookEvent(_lIillIIIl("\195\245\7\249\13\245\12\34\28\35\51\31\59\73\88",120), function() if S.BossAlerts then Notify(_lIillIIIl("\208\2\20\6\26",133), _lIillIIIl("\221\15\33\19\39\220\40\56\52\71\84\84\97\89\114\39\111\120\144\140\160\150\88\33\198\225\116\200\209\223\213\151\239\250\245\248\14\13\33",146), 4, _lIillIIIl("\29\14\38\41",159)) end end)
	hookEvent(_lIillIIIl("\247\41\48\53\49\72\70\82\82\87\107\89\123\122\129\141\141\130\153\175\169\172\191",172), function() if S.BossAlerts then Notify(_lIillIIIl("\4\54\61\66\62\85\83\95\95\105\125",185), _lIillIIIl("\15\67\78\85\9\89\106\35\107\116\140\136\156\146",198), 4, _lIillIIIl("\62\66\86\86\91\116",211)) end end)

	hookEvent(_lIillIIIl("\65\93\99\102\75\119\119\139\139\144",224), function(zone)
		local zname = typeof(zone) == _lIillIIIl("\61\110\122\130\118\138\134\143",237) and zone.Name or tostring(zone)
		if zname and zname ~= _lIillIIIl("\116\118\128",250) then Notify(_lIillIIIl("\109\137\143\141",12), _lIillIIIl("\101\149\162\154\174\168\174\139\120",25) .. zname, 2) end
	end)
	hookEvent(_lIillIIIl("\121\163\158\163\181\148\184\203\198\211\216",38), function(amount)
		if type(amount) == _lIillIIIl("\168\182\181\177\187\207",51) then Notify(_lIillIIIl("\139\175\194\189\202\207",64), _lIillIIIl("\168\202\209\212\144",77) .. tostring(amount) .. _lIillIIIl("\129\204\208\227\222\235\240",90), 1.5, _lIillIIIl("\210\214\234\234\239\3",103)) end
	end)
	hookEvent(_lIillIIIl("\201\231\1\4\233\13\20\25",116), function(n)
		FootMid.Text = _lIillIIIl("\218\222\229\234\196",129) .. tostring(n)
		if S.RoomTracker then Notify(_lIillIIIl("\231\11\18\23",142), _lIillIIIl("\244\24\31\36\248\229",155) .. tostring(n), 2) end
	end)
	hookEvent(_lIillIIIl("\246\27\43\41\61\51\77\79\89\49\100\118\118\131",168), function(n) Notify(_lIillIIIl("\3\40\56\54\74\64\90\92\102\115",181), _lIillIIIl("\16\53\69\67\87\77\103\105\120\128\78\59",194) .. tostring(n), 2.5, _lIillIIIl("\77\62\86\89",207)) end)
	hookEvent(_lIillIIIl("\53\79\100\104\101\130\128\109\137\148\147\167",220), function(n) if type(n) == _lIillIIIl("\94\108\112\108\118\138",233) then Notify(_lIillIIIl("\84\110\131\135\127\156\154",246), _lIillIIIl("\97\123\144\148\140\169\167\96\176\188\117",8) .. tostring(n) .. _lIillIIIl("\143",21), 2) end end)
	hookEvent(_lIillIIIl("\126\130\138\174\170\175\188\187\205\173\213\220\226\231\255\5",34), function(effectName)
		if type(effectName) ~= _lIillIIIl("\169\177\182\180\192\192",47) then return end
		if effectName == _lIillIIIl("\145\175\192\198\165\210\214\215\230\231\251",60) or effectName == _lIillIIIl("\162\192\194\204\209\185\230\234\235\250\251\15",73) or effectName == _lIillIIIl("\176\201\205\184\229\233\234\249\250\14",86)
			or effectName == _lIillIIIl("\175\223\236\232\250\6\221\9\6\18\19\24\50\52\62",99) or effectName == _lIillIIIl("\184\180\181\223\7\251\21\17\18\255\43\40\52\53\58\84\86\96",112)
			or effectName == _lIillIIIl("\197\193\194\236\20\8\34\30\31\12\56\53\65\66\71\97\99\114\91\128\118\127\142",125) or effectName == _lIillIIIl("\225\249\13\10\18\33\42\48\50\69\68\33\70\89\88\108\103\96\124\124\141\142",138) then
			ShowEntityWarning(effectName:gsub(_lIillIIIl("\225\6\25\24\44\34\27\55\55\72\73",151), ""):gsub(_lIillIIIl("\241\30\34\35\50\51\71",164), _lIillIIIl("\216\5\18\22\23\38\39\59",177)))
			if S.AutoHideInLocker then hideInLockerNow(false) end
		end
	end)

	local roomFn = ev:FindFirstChild(_lIillIIIl("\8\65\69\76\70\86\99\72\113\120\125\101\147\146\142\152\172",190))
	if roomFn and roomFn:IsA(_lIillIIIl("\36\62\77\86\98\90\71\125\125\121\145\141\154\160",203)) then
		task.spawn(function()
			local ok, n = pcall(function() return roomFn:InvokeServer() end)
			if ok and n then FootMid.Text = _lIillIIIl("\49\53\60\65\32",216) .. tostring(n) end
		end)
	end
end)

task.spawn(function()
	local loaded, reason = false, _lIillIIIl("\89\92\109\121\118\130\130",229)
	for attempt = 1, 3 do
		task.wait(attempt == 1 and 1 or 1.5)
		if S.Destroyed then return end
		loaded, reason = LoadConfigFile(_lIillIIIl("\88\102\129\135\137\141\151\144\154",242), true)
		if loaded or reason == _lIillIIIl("\120\123\140\147\144\156\156",4) or reason == _lIillIIIl("\138\132\135\145\154\164\174\174\112\204\204\198\226\212\227\237\233\241\2\2",17) then break end
	end
	S._autoConfigLoaded, S._autoConfigReason = loaded, reason
	local openHint = MOBILE and _lIillIIIl("\245\230\3\247\17\6\31\21\45\30\59\34\153\205\204\220\234\188\115\103\129\104\223\151\90\164\149\179\105\192\167\211\199\225\205",30) or _lIillIIIl("\123\167\179\172\192\201\124\210\218\214\230\242\166\1\252\0\194\22\21\37\51",43)
	if loaded then
		Notify(_lIillIIIl("\143\184\178\199\206\215\219\213\151\198\250\238",56), _lIillIIIl("\143\194\200\199\209\214\150\239\233\254\6\8\18\12\18\213\158\67\94\241",69) .. openHint, 3, _lIillIIIl("\204\213\202\209\218\239\246",82))
	elseif reason ~= _lIillIIIl("\211\214\231\238\235\247\247",95) and reason ~= _lIillIIIl("\229\223\226\236\245\255\9\9\203\39\39\33\61\47\62\72\68\76\93\93",108) then
		Notify(_lIillIIIl("\195\246\252\251\5\10",121), _lIillIIIl("\206\9\15\17\21\31\24\34\229\63\62\67\81\88\84\90\60\41",134) .. tostring(reason), 3, _lIillIIIl("\17\2\26\29",147))
	else
		Notify(_lIillIIIl("\247\32\26\47\54\63\67\61\255\46\98\86",160), _lIillIIIl("\0\42\35\45\53\59\254\199\108\135\26",173) .. openHint, 3, _lIillIIIl("\42\54\53\69",186))
	end
	print(_lIillIIIl("\41\37\78\72\93\100\109\118\112\90\142\130\132\78\129\171\164\174\182\188\127\181\184",199))
end)
