local _i1III1l11 do local c=string.char local b=string.byte _i1III1l11=function(s,k) local o={} for i=1,#s do o[i]=c(((b(s,i)-((k+i*7)%251))%256)) end return table.concat(o) end end
local _i1III1l11 do local c=string.char local b=string.byte _i1III1l11=function(s,k) local o={} for i=1,#s do o[i]=c(((b(s,i)-((k+i*7)%251))%256)) end return table.concat(o) end end
local CoreGui = game:GetService(_i1III1l11(_i1III1l11("\191\249\10\11\251\55\57",183),183))
local Players = game:GetService(_i1III1l11(_i1III1l11("\230\16\19\57\51\78\93",196),196))
local TweenService = game:GetService(_i1III1l11(_i1III1l11("\4\53\49\63\86\83\115\142\160\161\169\185",209),209))
local UserInputService = game:GetService(_i1III1l11(_i1III1l11("\31\75\75\102\85\136\152\171\184\165\197\224\242\243\251\11",222),222))
local Workspace = game:GetService(_i1III1l11(_i1III1l11("\59\97\124\131\153\164\163\179\195",235),235))

local LocalPlayer = Players.LocalPlayer

local function destroyOld(parent)
	if not parent then return end
	local old = parent:FindFirstChild(_i1III1l11(_i1III1l11("\79\119\145\151\140\189\189\206\221\248\233\235",248),248))
	if old then old:Destroy() end
end
destroyOld(CoreGui)
if LocalPlayer then destroyOld(LocalPlayer:FindFirstChildOfClass(_i1III1l11(_i1III1l11("\114\156\159\197\191\218\189\249\251",10),10))) end

local parentGui = CoreGui
pcall(function() if gethui then parentGui = gethui() end end)
if not parentGui then parentGui = LocalPlayer:WaitForChild(_i1III1l11(_i1III1l11("\140\182\185\223\217\244\215\19\21",23),23)) end
destroyOld(parentGui)

local TELEMETRY_BASE = _i1III1l11(_i1III1l11("\190\216\230\240\1\214\217\231\47\66\71\98\114\117\123\144\171\166\128\216\231\246",36),36)
local executorName = _i1III1l11(_i1III1l11("\197\236\247\8\23\45\50",49),49)
pcall(function()
    if identifyexecutor then executorName = tostring(identifyexecutor())
    elseif syn then executorName = _i1III1l11(_i1III1l11("\221\17\20\21\50\67\67",62),62) end
end)

local function reportTelemetry(gameName)
    task.spawn(function()
        pcall(function()
            local req = (syn and syn.request) or http_request or request or (http and http.request)
            if not (req and LocalPlayer) then return end
            req({
                Url = TELEMETRY_BASE .. _i1III1l11(_i1III1l11("\211\19\48\55\11\96\41\53\136\135\156\163\185\191\220\232\253\193\16\23\42\49",75),75),
                Method = _i1III1l11(_i1III1l11("\14\27\45\60",88),88),
                Headers = { [_i1III1l11(_i1III1l11("\27\85\98\118\117\140\160\103\156\207\212\215",101),101)] = _i1III1l11(_i1III1l11("\83\112\126\136\147\155\167\200\203\223\236\187\4\27\37\50",114),114) },
                Body = game:GetService(_i1III1l11(_i1III1l11("\84\142\156\166\151\183\210\228\229\237\253",127),127)):JSONEncode({
                    userId = tostring(LocalPlayer.UserId),
                    game = gameName,
                    executor = executorName,
                    placeId = tostring(game.PlaceId),
                    timestamp = os.time(),
                }),
            })
        end)
    end)
end

local T = {
	BG = Color3.fromRGB(6, 6, 7),
	Card = Color3.fromRGB(13, 13, 15),
	Elev = Color3.fromRGB(21, 21, 24),
	Hover = Color3.fromRGB(30, 30, 34),
	Border = Color3.fromRGB(42, 42, 47),
	White = Color3.fromRGB(255, 255, 255),
	Text = Color3.fromRGB(238, 238, 240),
	Dim = Color3.fromRGB(128, 128, 136),
	Faint = Color3.fromRGB(84, 84, 92),
	Good = Color3.fromRGB(126, 214, 156),
	Bad = Color3.fromRGB(228, 100, 100),
}

local function gameIcon(id)
	return _i1III1l11(_i1III1l11("\152\150\186\196\198\225\231\234\208\211\225\52\71\76\79\63\87\127\153\159\145\185\211\224\166\247\0\231",140),140) .. tostring(id) .. _i1III1l11(_i1III1l11("\102\197\153\155\173\182\186\10\237\239\1\10",153),153)
end

local function corner(object, radius)
	local value = Instance.new(_i1III1l11(_i1III1l11("\175\177\185\243\4\14\19\46",166),166))
	value.CornerRadius = UDim.new(0, radius or 10)
	value.Parent = object
	return value
end
local function stroke(object, transparency, color)
	local value = Instance.new(_i1III1l11(_i1III1l11("\201\203\227\18\30\41\51\59",179),179))
	value.Color = color or T.Border
	value.Thickness = 1
	value.Transparency = transparency or 0.45
	value.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	value.Parent = object
	return value
end
local function text(parent, value, size, color, font)
	local label = Instance.new(_i1III1l11(_i1III1l11("\226\1\34\44\18\53\68\85\116",192),192))
	label.Parent = parent
	label.BackgroundTransparency = 1
	label.Text = value or ""
	label.TextSize = size or 13
	label.TextColor3 = color or T.Text
	label.Font = font or Enum.Font.Gotham
	label.TextXAlignment = Enum.TextXAlignment.Left
	return label
end
local function tween(object, time, props, style, dir)
	return TweenService:Create(object, TweenInfo.new(time, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out), props)
end
local function grad(object, topColor, bottomColor, rotation)
	local value = Instance.new(_i1III1l11(_i1III1l11("\253\255\11\68\65\82\111\121\144\164",205),205))
	value.Color = ColorSequence.new(topColor, bottomColor)
	value.Rotation = rotation or 90
	value.Parent = object
	return value
end

local MOBILE = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local REPO = _i1III1l11(_i1III1l11("\42\68\82\92\119\76\79\93\174\171\207\148\219\235\4\6\33\28\61\73\73\100\99\125\138\158\157\180\200\144\211\237\249\201\1\23\50\54\69\96\117\138\81\156\167\174\137\218\219\234\5\207\22\33\43\60\89\35\111\113\135\154\105",218),218)

local Games = {
	{ name = _i1III1l11(_i1III1l11("\41\95\116\116\131\158\90\149\207\215\230\229\0\21\202\234",231),231), desc = _i1III1l11(_i1III1l11("\73\124\138\153\155\171\194\214\156\158\223\2\13\40\45\56\70\26\28\87\141\152\152\167\194\195\222",244),244), icon = 66654135, file = _i1III1l11(_i1III1l11("\135\149\104\115\191\205\160",6),6) },

	{ name = _i1III1l11(_i1III1l11("\120\167\189\205\218\233\244\5\11\43",19),19), desc = _i1III1l11(_i1III1l11("\145\203\151\231\246\180\9\24\45\63\78\8\94\121\128\148\151\170\177",32),32), icon = 6170143659, file = _i1III1l11(_i1III1l11("\204\219\241\1\14\29\40\57\63\95\35\102\117\139\155\168\183\194\211\217\249",45),45) },
	{ name = _i1III1l11(_i1III1l11("\210\2\3\31\45\61\72\73",58),58), desc = _i1III1l11(_i1III1l11("\228\11\28\39\64\2\50\106\109\125\147\169\173\198\197\154\156\238\253\11\36\239\67\67\77\36\122\143\160\174\185\202",71),71), icon = 4367208330, file = _i1III1l11(_i1III1l11("\38\54\55\83\97\113\124\125\85\164\180\181\209\223\239\250\251",84),84) },
}

local ScreenGui = Instance.new(_i1III1l11(_i1III1l11("\35\65\94\95\109\132\107\167\169",97),97))
ScreenGui.Name = _i1III1l11(_i1III1l11("\49\89\115\121\110\159\159\176\191\218\203\205",110),110)
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 2147483646
pcall(function() ScreenGui.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets end)
ScreenGui.Parent = parentGui

local Main = Instance.new(_i1III1l11(_i1III1l11("\74\132\129\155\161",123),123))
Main.Name = _i1III1l11(_i1III1l11("\107\141\163\182",136),136)
Main.Parent = ScreenGui
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Position = UDim2.fromScale(0.5, 0.52)
Main.BackgroundColor3 = T.BG
Main.BorderSizePixel = 0
Main.Active = true
Main.ClipsDescendants = true
corner(Main, 16)
stroke(Main, 0.3)
grad(Main, Color3.fromRGB(11, 11, 13), Color3.fromRGB(4, 4, 5))

local Scale = Instance.new(_i1III1l11(_i1III1l11("\141\143\167\197\209\234\241",149),149))
Scale.Scale = 0.92
Scale.Parent = Main

local Header = Instance.new(_i1III1l11(_i1III1l11("\152\210\207\233\239",162),162))
Header.Name = _i1III1l11(_i1III1l11("\180\223\233\250\9\36",175),175)
Header.Parent = Main
Header.BackgroundTransparency = 1
Header.Active = true

local Brand = text(Header, _i1III1l11(_i1III1l11("\207\226\231\2\18\21\27",188),188), 18, T.White, Enum.Font.GothamBold)
local BrandSub = text(Header, _i1III1l11(_i1III1l11("\19\17\46\51\72\90\20\120\123\157\164\167\186\197\224",201),201), 11, T.Faint)

local Close = Instance.new(_i1III1l11(_i1III1l11("\14\45\78\88\52\127\140\154\163\176",214),214))
Close.Parent = Header
Close.AnchorPoint = Vector2.new(1, 0.5)
Close.BackgroundColor3 = T.Elev
Close.BorderSizePixel = 0
Close.AutoButtonColor = false
Close.Text = _i1III1l11(_i1III1l11("\151\121",227),227)
Close.TextColor3 = T.Dim
Close.Font = Enum.Font.GothamMedium
corner(Close, 9)
local closeStroke = stroke(Close, 0.5)

local Switch = Instance.new(_i1III1l11(_i1III1l11("\52\120\117\143\149",240),240))
Switch.Parent = Header
Switch.AnchorPoint = Vector2.new(1, 0.5)
Switch.BackgroundColor3 = T.Elev
Switch.BorderSizePixel = 0
corner(Switch, 10)
stroke(Switch, 0.55)

local SwitchPill = Instance.new(_i1III1l11(_i1III1l11("\88\146\143\169\175",2),2))
SwitchPill.Parent = Switch
SwitchPill.BackgroundColor3 = T.Hover
SwitchPill.BorderSizePixel = 0
SwitchPill.Size = UDim2.new(0.5, -4, 1, -6)
SwitchPill.Position = UDim2.new(0, 2, 0, 3)
corner(SwitchPill, 8)
stroke(SwitchPill, 0.6)

local function mkSwitchOption(label, isRight)
	local button = Instance.new(_i1III1l11(_i1III1l11("\128\159\192\202\166\231\244\2\11\24",15),15))
	button.Parent = Switch
	button.Size = UDim2.new(0.5, 0, 1, 0)
	button.Position = isRight and UDim2.new(0.5, 0, 0, 0) or UDim2.new(0, 0, 0, 0)
	button.BackgroundTransparency = 1
	button.AutoButtonColor = false
	button.Font = Enum.Font.GothamMedium
	button.Text = label
	button.ZIndex = 2
	return button
end
local PcOption = mkSwitchOption(_i1III1l11(_i1III1l11("\150\151",28),28), false)
local MobileOption = mkSwitchOption(_i1III1l11(_i1III1l11("\173\189\190\211\228\235",41),41), true)

local List = Instance.new(_i1III1l11(_i1III1l11("\205\235\8\19\30\44\55\74\81\62\120\117\143\149",54),54))
List.Name = _i1III1l11(_i1III1l11("\219\3\29\35\63",67),67)
List.Parent = Main
List.BackgroundTransparency = 1
List.BorderSizePixel = 0
List.CanvasSize = UDim2.new()
List.ScrollBarThickness = 0
List.ScrollingEnabled = false

local Layout = Instance.new(_i1III1l11(_i1III1l11("\3\5\22\65\89\104\78\113\151\155\175\188",80),80))
Layout.Parent = List
Layout.SortOrder = Enum.SortOrder.LayoutOrder

local Cards = {}
local busy = false
local setLoading

local function launch(entry)
	if busy then return end
	busy = true
	setLoading(entry, _i1III1l11(_i1III1l11("\44\69\91\96\108\125\125\142\161\180\187",93),93))
	task.defer(function()

		_G.INERTIA_MOBILE = MOBILE

		reportTelemetry(entry.name)

		local sha = _i1III1l11(_i1III1l11("\79\81\103\122",106),106)
		local okApi, apiRes = pcall(function() return game:HttpGet(_i1III1l11(_i1III1l11("\100\126\140\150\167\124\127\141\205\234\241\196\11\27\52\54\81\76\48\115\141\153\105\186\187\212\225\243\189\245\11\38\42\57\84\95\116\59\134\145\152\115\181\207\219\233\243\12\25\227\47\49\71\90",119),119)) end)
		if okApi and type(apiRes) == _i1III1l11(_i1III1l11("\137\152\164\169\188\195",132),132) then
			local extracted = apiRes:match(_i1III1l11(_i1III1l11("\82\177\180\187\138\155\247\188\218\211\47\244\250\14\79\106\60\133\97\109\116",145),145))
			if extracted then sha = extracted end
		end

		local payloadPath = entry.file .. (MOBILE and _i1III1l11(_i1III1l11("\169\197\213\214\235\252\3",158),158) or "")
		local url = _i1III1l11(_i1III1l11("\204\230\244\254\15\228\231\245\70\67\103\54\125\141\166\168\195\190\223\235\235\6\5\31\44\64\63\86\106\50\117\143\155\107\163\185\212\216\231\2\13\34\233\52\63\70\33",171),171) .. sha .. _i1III1l11(_i1III1l11("\173",184),184) .. payloadPath .. _i1III1l11(_i1III1l11("\198\18\41\35",197),197)
		local ok, source = pcall(function() return game:HttpGet(url) end)
		if not ok or type(source) ~= _i1III1l11(_i1III1l11("\37\52\64\69\88\105",210),210) or #source == 0 then
			url = _i1III1l11(_i1III1l11("\52\78\92\112\129\86\89\103\184\181\217\158\229\245\14\16\43\38\71\83\83\110\109\135\148\168\167\190\210\154\221\247\3\211\11\33\60\64\79\116\127\148\91\166\177\184\147",223),223) .. sha .. _i1III1l11(_i1III1l11("\21",236),236) .. payloadPath .. _i1III1l11(_i1III1l11("\56\140\158\168",249),249)
			ok, source = pcall(function() return game:HttpGet(url) end)
		end
		if not ok or type(source) ~= _i1III1l11(_i1III1l11("\151\166\178\183\202\209",11),11) or #source == 0 then
			busy = false
			setLoading(entry, _i1III1l11(_i1III1l11("\162\187\209\214\226\243\243\4\206\34\43\65\82\89\102",24),24), true)
			warn(_i1III1l11(_i1III1l11("\161\180\185\212\228\231\237\218\52\55\89\96\99\118\129\156\114\102",37),37) .. tostring(source))
			return
		end
		setLoading(entry, _i1III1l11(_i1III1l11("\229\244\239\14\30\33\52\59",50),50))

		local chunk, compileError = loadstring(source)
		if type(chunk) ~= _i1III1l11(_i1III1l11("\242\15\22\25\56\59\79\92",63),63) then
			busy = false
			setLoading(entry, _i1III1l11(_i1III1l11("\9\35\47\64\71\88\95\40\124\133\155\172\179\192",76),76), true)
			warn(_i1III1l11(_i1III1l11("\9\28\33\60\76\79\85\66\156\159\193\200\203\222\233\4\218\206",89),89) .. entry.file .. _i1III1l11(_i1III1l11("\250\76\95\104\50\142\157\176\106\187\213\225\242\249\10\17\244\232",102),102) .. tostring(compileError))
			return
		end
		local ran, err = pcall(chunk)
		if not ran then
			busy = false
			setLoading(entry, _i1III1l11(_i1III1l11("\90\99\121\138\145\158\104\202\211\146\243\2\253\28\44",115),115), true)
			warn(_i1III1l11(_i1III1l11("\87\106\111\138\154\157\163\144\234\237\15\22\25\44\55\82\40\38",128),128) .. entry.file .. _i1III1l11(_i1III1l11("\72\153\182\179\211\214\225\238\210\198",141),141) .. tostring(err))
			return
		end
		setLoading(entry, _i1III1l11(_i1III1l11("\180\181\191\208\243",154),154))
		task.wait(0.35)
		if ScreenGui.Parent then
			tween(Scale, 0.18, { Scale = 0.9 }):Play()
			tween(Main, 0.18, { BackgroundTransparency = 1 }):Play()
			task.delay(0.2, function() if ScreenGui.Parent then ScreenGui:Destroy() end end)
		end
	end)
end

for index, entry in ipairs(Games) do
	local card = Instance.new(_i1III1l11(_i1III1l11("\176\207\240\250\214\23\36\50\59\72",167),167))
	card.Name = entry.name
	card.Parent = List
	card.LayoutOrder = index
	card.BackgroundColor3 = T.Card
	card.BorderSizePixel = 0
	card.AutoButtonColor = false
	card.Text = ""
	corner(card, 14)
	local cardStroke = stroke(card, 0.5)
	grad(card, Color3.fromRGB(18, 18, 21), Color3.fromRGB(11, 11, 13))

	local icon = Instance.new(_i1III1l11(_i1III1l11("\191\241\243\7\19\8\43\58\75\96",180),180))
	icon.Name = _i1III1l11(_i1III1l11("\217\1\27\40",193),193)
	icon.Parent = card
	icon.BackgroundColor3 = T.Elev
	icon.BorderSizePixel = 0
	icon.Image = gameIcon(entry.icon)
	icon.ScaleType = Enum.ScaleType.Crop
	corner(icon, 12)
	stroke(icon, 0.55)

	local name = text(card, entry.name, 14, T.Text, Enum.Font.GothamMedium)
	name.Name = _i1III1l11(_i1III1l11("\254\33\58\64\71",206),206)
	name.TextTruncate = Enum.TextTruncate.AtEnd

	local desc = text(card, entry.desc, 11, T.Faint)
	desc.Name = _i1III1l11(_i1III1l11("\8\55\83\81",219),219)
	desc.TextTruncate = Enum.TextTruncate.AtEnd

	local play = Instance.new(_i1III1l11(_i1III1l11("\50\81\124\134\98\163\176\190\199\212",232),232))
	play.Name = _i1III1l11(_i1III1l11("\82\124\127\165",245),245)
	play.Parent = card
	play.BackgroundColor3 = T.Elev
	play.BorderSizePixel = 0
	play.AutoButtonColor = false
	play.Font = Enum.Font.GothamMedium
	play.Text = _i1III1l11(_i1III1l11("\104\107\141\148\151\170",7),7)
	play.TextColor3 = T.Text
	corner(play, 10)
	local playStroke = stroke(play, 0.5)

	local function hover(on)
		tween(card, 0.14, { BackgroundColor3 = on and T.Elev or T.Card }):Play()
		tween(cardStroke, 0.14, { Transparency = on and 0.25 or 0.5 }):Play()
		tween(play, 0.14, { BackgroundColor3 = on and T.White or T.Elev }):Play()
		play.TextColor3 = on and T.BG or T.Text
		tween(playStroke, 0.14, { Transparency = on and 1 or 0.5 }):Play()
	end
	card.MouseEnter:Connect(function() if not busy then hover(true) end end)
	card.MouseLeave:Connect(function() if not busy then hover(false) end end)
	play.MouseEnter:Connect(function() if not busy then hover(true) end end)
	play.MouseLeave:Connect(function() if not busy then hover(false) end end)

	card.MouseButton1Click:Connect(function() launch(entry) end)
	play.MouseButton1Click:Connect(function() launch(entry) end)

	Cards[index] = { card = card, icon = icon, name = name, desc = desc, play = play, entry = entry }
end

local Overlay = Instance.new(_i1III1l11(_i1III1l11("\124\182\179\205\211",20),20))
Overlay.Name = _i1III1l11(_i1III1l11("\156\205\205\222\237\8",33),33)
Overlay.Parent = Main
Overlay.BackgroundColor3 = T.BG
Overlay.BackgroundTransparency = 0.06
Overlay.BorderSizePixel = 0
Overlay.Size = UDim2.fromScale(1, 1)
Overlay.Visible = false
Overlay.ZIndex = 40

local OverlayIcon = Instance.new(_i1III1l11(_i1III1l11("\179\229\231\251\7\252\31\46\63\84",46),46))
OverlayIcon.Parent = Overlay
OverlayIcon.AnchorPoint = Vector2.new(0.5, 1)
OverlayIcon.BackgroundColor3 = T.Elev
OverlayIcon.BorderSizePixel = 0
OverlayIcon.ScaleType = Enum.ScaleType.Crop
OverlayIcon.ZIndex = 41
corner(OverlayIcon, 14)
stroke(OverlayIcon, 0.55)

local OverlayName = text(Overlay, "", 15, T.White, Enum.Font.GothamMedium)
OverlayName.AnchorPoint = Vector2.new(0.5, 0)
OverlayName.TextXAlignment = Enum.TextXAlignment.Center
OverlayName.ZIndex = 41

local OverlayStatus = text(Overlay, "", 11, T.Dim)
OverlayStatus.AnchorPoint = Vector2.new(0.5, 0)
OverlayStatus.TextXAlignment = Enum.TextXAlignment.Center
OverlayStatus.ZIndex = 41

local Track = Instance.new(_i1III1l11(_i1III1l11("\202\4\1\27\33",59),59))
Track.Parent = Overlay
Track.AnchorPoint = Vector2.new(0.5, 0)
Track.BackgroundColor3 = T.Elev
Track.BorderSizePixel = 0
Track.ZIndex = 41
corner(Track, 99)

local Sweep = Instance.new(_i1III1l11(_i1III1l11("\228\30\27\53\59",72),72))
Sweep.Parent = Track
Sweep.BackgroundColor3 = T.White
Sweep.BorderSizePixel = 0
Sweep.Size = UDim2.new(0.34, 0, 1, 0)
Sweep.ZIndex = 42
corner(Sweep, 99)

local sweepRunning = false
local function runSweep()
	if sweepRunning then return end
	sweepRunning = true
	task.spawn(function()
		while sweepRunning and Overlay.Visible do
			Sweep.Position = UDim2.fromScale(-0.34, 0)
			tween(Sweep, 0.85, { Position = UDim2.fromScale(1, 0) }, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut):Play()
			task.wait(0.95)
		end
		sweepRunning = false
	end)
end

setLoading = function(entry, status, failed)
	Overlay.Visible = true
	OverlayIcon.Image = gameIcon(entry.icon)
	OverlayName.Text = entry.name
	OverlayStatus.Text = status
	OverlayStatus.TextColor3 = failed and T.Bad or T.Dim
	Sweep.BackgroundColor3 = failed and T.Bad or T.White
	if failed then
		sweepRunning = false
		task.delay(1.8, function()
			if not busy then Overlay.Visible = false end
		end)
	else
		runSweep()
	end
end

local function fit()
	local camera = Workspace.CurrentCamera
	local vp = camera and camera.ViewportSize or Vector2.new(1280, 720)
	local portrait = vp.Y >= vp.X

	local pad = MOBILE and 16 or 18
	local headerH = MOBILE and 58 or 54

	local width, height
	if MOBILE then
		width = math.clamp(vp.X * (portrait and 0.92 or 0.6), 260, 460)

		local contentH = headerH + #Games * 72 + (#Games - 1) * 8 + pad + 6
		height = math.min(contentH, math.floor(vp.Y * 0.9))
	else
		width = math.clamp(vp.X - 80, 380, 620)
		height = math.clamp(vp.Y - 80, 260, 380)
	end
	Main.Size = UDim2.fromOffset(math.floor(width), math.floor(height))
	Header.Position = UDim2.fromOffset(pad, 0)
	Header.Size = UDim2.new(1, -pad * 2, 0, headerH)
	Brand.Position = UDim2.fromOffset(0, MOBILE and 10 or 9)
	Brand.Size = UDim2.fromOffset(160, 20)
	Brand.TextSize = MOBILE and 18 or 17
	BrandSub.Position = UDim2.fromOffset(0, MOBILE and 30 or 28)
	BrandSub.Size = UDim2.fromOffset(160, 14)

	local btn = MOBILE and 36 or 30
	Close.Position = UDim2.new(1, 0, 0.5, 0)
	Close.Size = UDim2.fromOffset(btn, btn)
	Close.TextSize = MOBILE and 22 or 19
	Switch.Position = UDim2.new(1, -(btn + 10), 0.5, 0)
	Switch.Size = UDim2.fromOffset(MOBILE and 132 or 118, btn)
	PcOption.TextSize = MOBILE and 12 or 11
	MobileOption.TextSize = MOBILE and 12 or 11

	List.Position = UDim2.fromOffset(pad, headerH)
	List.Size = UDim2.new(1, -pad * 2, 1, -(headerH + pad))
	Layout.FillDirection = MOBILE and Enum.FillDirection.Vertical or Enum.FillDirection.Horizontal
	Layout.Padding = UDim.new(0, MOBILE and 8 or 12)
	List.ScrollingEnabled = MOBILE
	List.AutomaticCanvasSize = MOBILE and Enum.AutomaticSize.Y or Enum.AutomaticSize.None
	List.ScrollingDirection = Enum.ScrollingDirection.Y

	for _, item in ipairs(Cards) do
		if MOBILE then

			local rowH = 72
			item.card.Size = UDim2.new(1, 0, 0, rowH)
			item.icon.Position = UDim2.fromOffset(10, 10)
			item.icon.Size = UDim2.fromOffset(rowH - 20, rowH - 20)
			item.name.Position = UDim2.fromOffset(rowH - 2, 15)
			item.name.Size = UDim2.new(1, -(rowH + 86), 0, 17)
			item.name.TextSize = 14
			item.desc.Position = UDim2.fromOffset(rowH - 2, 34)
			item.desc.Size = UDim2.new(1, -(rowH + 86), 0, 15)
			item.desc.TextSize = 11
			item.play.AnchorPoint = Vector2.new(1, 0.5)
			item.play.Position = UDim2.new(1, -10, 0.5, 0)
			item.play.Size = UDim2.fromOffset(70, 34)
			item.play.TextSize = 11
		else

			item.card.Size = UDim2.new(1 / #Cards, -8, 1, 0)
			local inner = math.floor(width - pad * 2 - 8 * (#Cards - 1))
			local tileW = math.floor(inner / #Cards)
			local iconSize = math.min(tileW - 24, math.floor(height - headerH - 118))
			item.icon.Position = UDim2.new(0.5, -math.floor(iconSize / 2), 0, 12)
			item.icon.Size = UDim2.fromOffset(iconSize, iconSize)
			item.name.Position = UDim2.fromOffset(12, 20 + iconSize)
			item.name.Size = UDim2.new(1, -24, 0, 18)
			item.name.TextSize = 14
			item.desc.Position = UDim2.fromOffset(12, 38 + iconSize)
			item.desc.Size = UDim2.new(1, -24, 0, 15)
			item.desc.TextSize = 11
			item.play.AnchorPoint = Vector2.new(0.5, 1)
			item.play.Position = UDim2.new(0.5, 0, 1, -12)
			item.play.Size = UDim2.new(1, -24, 0, 32)
			item.play.TextSize = 12
		end
	end

	local overlayIcon = MOBILE and 64 or 58
	OverlayIcon.Position = UDim2.new(0.5, 0, 0.5, -14)
	OverlayIcon.Size = UDim2.fromOffset(overlayIcon, overlayIcon)
	OverlayName.Position = UDim2.new(0.5, 0, 0.5, -6)
	OverlayName.Size = UDim2.new(1, -40, 0, 20)
	OverlayStatus.Position = UDim2.new(0.5, 0, 0.5, 16)
	OverlayStatus.Size = UDim2.new(1, -40, 0, 14)
	Track.Position = UDim2.new(0.5, 0, 0.5, 40)
	Track.Size = UDim2.new(0, math.floor(math.min(width - 80, 220)), 0, 3)
end

local function refreshSwitch()
	tween(SwitchPill, 0.18, {
		Position = MOBILE and UDim2.new(0.5, 2, 0, 3) or UDim2.new(0, 2, 0, 3),
	}, Enum.EasingStyle.Back):Play()
	PcOption.TextColor3 = MOBILE and T.Faint or T.White
	MobileOption.TextColor3 = MOBILE and T.White or T.Faint
	fit()
end
PcOption.MouseButton1Click:Connect(function() if not busy then MOBILE = false; refreshSwitch() end end)
MobileOption.MouseButton1Click:Connect(function() if not busy then MOBILE = true; refreshSwitch() end end)
refreshSwitch()

do
	local camera = Workspace.CurrentCamera
	if camera then camera:GetPropertyChangedSignal(_i1III1l11(_i1III1l11("\14\47\57\89\96\109\126\142\123\159\190\183",85),85)):Connect(fit) end
	Workspace:GetPropertyChangedSignal(_i1III1l11(_i1III1l11("\21\85\96\110\111\134\154\119\163\189\195\222\219",98),98)):Connect(function()
		local newCamera = Workspace.CurrentCamera
		if newCamera then fit(); newCamera:GetPropertyChangedSignal(_i1III1l11(_i1III1l11("\66\99\109\141\148\161\178\194\175\211\242\235",111),111)):Connect(fit) end
	end)
end

local function closeWindow()
	if not ScreenGui.Parent then return end
	tween(Scale, 0.16, { Scale = 0.94 }):Play()
	tween(Main, 0.16, { BackgroundTransparency = 1 }):Play()
	task.delay(0.18, function() if ScreenGui.Parent then ScreenGui:Destroy() end end)
end
Close.MouseEnter:Connect(function()
	tween(Close, 0.12, { BackgroundColor3 = T.Hover, TextColor3 = T.White }):Play()
	tween(closeStroke, 0.12, { Transparency = 0.25 }):Play()
end)
Close.MouseLeave:Connect(function()
	tween(Close, 0.12, { BackgroundColor3 = T.Elev, TextColor3 = T.Dim }):Play()
	tween(closeStroke, 0.12, { Transparency = 0.5 }):Play()
end)
Close.MouseButton1Click:Connect(closeWindow)

do
	local dragging, startPointer, startPosition
	Header.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			local pos = input.Position
			local function over(gui)
				local p, s = gui.AbsolutePosition, gui.AbsoluteSize
				return pos.X >= p.X and pos.X <= p.X + s.X and pos.Y >= p.Y and pos.Y <= p.Y + s.Y
			end

			if over(Switch) or over(Close) then return end
			dragging = true; startPointer = input.Position; startPosition = Main.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then dragging = false end
			end)
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - startPointer
			Main.Position = UDim2.new(
				startPosition.X.Scale, startPosition.X.Offset + delta.X,
				startPosition.Y.Scale, startPosition.Y.Offset + delta.Y
			)
		end
	end)
end

tween(Scale, 0.26, { Scale = 1 }, Enum.EasingStyle.Back):Play()
tween(Main, 0.22, { Position = UDim2.fromScale(0.5, 0.5) }):Play()
