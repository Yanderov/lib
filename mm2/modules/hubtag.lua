--[[
    ╔════════════════════════════════════════════════════════════════════════╗
    ║                 INERTIAHUB OVERHEAD PRESENCE TAG                       ║
    ║                 Real-time cross-client tag rendering                   ║
    ║                 Robust CoreGui/PlayerGui Adornee Pipeline              ║
    ╚════════════════════════════════════════════════════════════════════════╝
]]

task.spawn(function()
	if _G.__INERTIA_HUB_TAG_INITIALIZED then return end
	_G.__INERTIA_HUB_TAG_INITIALIZED = true

	local Players = game:GetService("Players")
	local HttpService = game:GetService("HttpService")
	local RunService = game:GetService("RunService")
	local CollectionService = game:GetService("CollectionService")
	local CoreGui = game:GetService("CoreGui")

	local LocalPlayer = Players.LocalPlayer
	if not LocalPlayer then
		LocalPlayer = Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
	end
	if not LocalPlayer then return end

	local BASE = "https://inertiahub.xyz/api/v1/telemetry/presence"
	local TAG_NAME = "InertiaOverheadTag"
	local HUB_ATTR = "InertiaHubUser"
	local placeId = tostring(game.PlaceId)

	local gameName = "Universal"
	if game.PlaceId == 142823291 or game.PlaceId == 335132309 or game.PlaceId == 66654135 then
		gameName = "MM2"
	elseif game.PlaceId == 12411473842 or game.PlaceId == 14120361937 then
		gameName = "Pressure"
	elseif game.PlaceId == 15886981881 or game.PlaceId == 18451885664 then
		gameName = "Demonology"
	end

	local function enc(value)
		return HttpService:UrlEncode(tostring(value or ""))
	end

	-- GUI Container (CoreGui or PlayerGui to avoid Workspace cleaners)
	local tagContainer = nil
	pcall(function() tagContainer = CoreGui end)
	if not tagContainer then
		tagContainer = LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui")
	end

	local activeTags = {} -- [Player] = BillboardGui

	-- Mark local character with attribute and CollectionService
	local function markLocalCharacter()
		pcall(function()
			CollectionService:AddTag(LocalPlayer, HUB_ATTR)
		end)
		local char = LocalPlayer.Character
		if char then
			local head = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
			if head then
				pcall(function()
					head:SetAttribute(HUB_ATTR, true)
				end)
			end
		end
	end

	local function removeTag(player)
		if activeTags[player] then
			pcall(function() activeTags[player]:Destroy() end)
			activeTags[player] = nil
		end
		-- Also clean any tags inside head
		local character = player and player.Character
		local head = character and (character:FindFirstChild("Head") or character:FindFirstChild("HumanoidRootPart"))
		if head then
			for _, child in ipairs(head:GetChildren()) do
				if child.Name == TAG_NAME or child.Name == "InertiaTag" or child.Name == "InertiaOverheadTag" then
					pcall(function() child:Destroy() end)
				end
			end
		end
	end

	local function addTag(player)
		if not player then return end
		local character = player.Character
		if not character then return end
		local head = character:FindFirstChild("Head") or character:FindFirstChild("HumanoidRootPart")
		if not head then return end

		-- Check if existing tag is still valid
		local existing = activeTags[player]
		if existing and existing.Parent and existing.Adornee == head then
			return
		end

		removeTag(player)

		local billboard = Instance.new("BillboardGui")
		billboard.Name = TAG_NAME .. "_" .. player.Name
		billboard.Adornee = head
		billboard.AlwaysOnTop = true
		billboard.MaxDistance = 500
		billboard.LightInfluence = 0
		billboard.Size = UDim2.fromOffset(124, 26)
		billboard.StudsOffset = Vector3.new(0, 2.7, 0)
		billboard.ResetOnSpawn = false

		local container = Instance.new("Frame")
		container.Size = UDim2.fromScale(1, 1)
		container.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
		container.BackgroundTransparency = 0.15
		container.BorderSizePixel = 0
		container.Parent = billboard

		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 6)
		corner.Parent = container

		local stroke = Instance.new("UIStroke")
		stroke.Color = Color3.fromRGB(60, 60, 75)
		stroke.Transparency = 0.2
		stroke.Thickness = 1
		stroke.Parent = container

		local dot = Instance.new("Frame")
		dot.Size = UDim2.fromOffset(6, 6)
		dot.Position = UDim2.new(0, 8, 0.5, -3)
		dot.BackgroundColor3 = Color3.fromRGB(56, 189, 248) -- Sky blue glow dot
		dot.BorderSizePixel = 0
		dot.Parent = container

		local dotCorner = Instance.new("UICorner")
		dotCorner.CornerRadius = UDim.new(1, 0)
		dotCorner.Parent = dot

		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(1, -22, 1, 0)
		label.Position = UDim2.new(0, 18, 0, 0)
		label.BackgroundTransparency = 1
		label.Text = "INERTIA USER"
		label.TextColor3 = Color3.fromRGB(240, 240, 248)
		label.TextSize = 10
		label.Font = Enum.Font.GothamBold
		label.TextXAlignment = Enum.TextXAlignment.Center
		label.Parent = container

		billboard.Parent = tagContainer or head
		activeTags[player] = billboard
	end

	local activeUsers = {}

	local function ping()
		pcall(function()
			game:HttpGet(BASE .. "?userId=" .. enc(LocalPlayer.UserId)
				.. "&username=" .. enc(LocalPlayer.Name)
				.. "&game=" .. enc(gameName)
				.. "&placeId=" .. enc(placeId))
		end)
	end

	local function refresh()
		-- Always tag local player
		addTag(LocalPlayer)

		local body = nil
		local ok = pcall(function()
			body = game:HttpGet(BASE .. "?placeId=" .. enc(placeId) .. "&window=60")
		end)
		if not ok or not body then return end

		local decoded
		if not pcall(function() decoded = HttpService:JSONDecode(body) end) then return end
		local currentOnline = {}

		currentOnline[LocalPlayer.UserId] = true

		for _, row in ipairs(decoded.data or {}) do
			local userId = tonumber(row.userId)
			if userId then
				currentOnline[userId] = true
				local player = Players:GetPlayerByUserId(userId)
				if player then
					addTag(player)
				end
			end
		end

		activeUsers = currentOnline

		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= LocalPlayer then
				local isHubUser = false
				pcall(function()
					if CollectionService:HasTag(player, HUB_ATTR) then isHubUser = true end
					local char = player.Character
					local h = char and (char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart"))
					if h and h:GetAttribute(HUB_ATTR) == true then isHubUser = true end
				end)

				if activeUsers[player.UserId] or isHubUser then
					addTag(player)
				else
					removeTag(player)
				end
			end
		end
	end

	local function watchPlayer(player)
		player.CharacterAdded:Connect(function()
			task.wait(0.6)
			if player == LocalPlayer then
				markLocalCharacter()
				addTag(LocalPlayer)
			elseif activeUsers[player.UserId] then
				addTag(player)
			end
		end)
	end

	for _, player in ipairs(Players:GetPlayers()) do
		watchPlayer(player)
	end
	Players.PlayerAdded:Connect(function(p)
		watchPlayer(p)
		task.delay(1, refresh)
	end)
	Players.PlayerRemoving:Connect(removeTag)

	markLocalCharacter()
	addTag(LocalPlayer)
	LocalPlayer.CharacterAdded:Connect(function()
		task.wait(0.4)
		markLocalCharacter()
		addTag(LocalPlayer)
	end)

	-- Heartbeat & refresh loops
	task.spawn(function()
		ping()
		task.wait(0.5)
		refresh()
	end)

	task.spawn(function()
		while true do
			task.wait(8)
			ping()
		end
	end)

	task.spawn(function()
		while true do
			task.wait(3.5)
			pcall(refresh)
			if LocalPlayer.Character then
				addTag(LocalPlayer)
			end
		end
	end)
end)
