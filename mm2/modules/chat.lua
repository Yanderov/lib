--[[
    inertiahub :: in-game chat & live announcement module
    Roblox-style draggable UI + native bubble chat + live admin broadcast toasts
]]
do
	if _G.__INERTIA_HUB_CHAT_INITIALIZED then return end
	_G.__INERTIA_HUB_CHAT_INITIALIZED = true

	local ok, err = pcall(function()
		local Players = game:GetService("Players")
		local HttpService = game:GetService("HttpService")
		local TweenService = game:GetService("TweenService")
		local UIS = game:GetService("UserInputService")
		local TextChatService = game:GetService("TextChatService")
		local ChatService = game:GetService("Chat")
		local RunService = game:GetService("RunService")
		local MOBILE = UIS.TouchEnabled and not UIS.KeyboardEnabled

		local BASE = "https://inertiahub.xyz/api/v1/chat"
		local CHANNEL = "global"
		if game.PlaceId == 142823291 or game.PlaceId == 335132309 or game.PlaceId == 66654135 then
			CHANNEL = "mm2"
		end
		local MAX_LINES = 120

		local LP = Players.LocalPlayer
		if not LP then
			LP = Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
		end
		if not LP then return end
		local senderName = LP.Name or "unknown"
		local playerGui = LP:WaitForChild("PlayerGui")

		for _, child in ipairs(playerGui:GetChildren()) do
			if child.Name == "InertiaChat" then
				pcall(function() child:Destroy() end)
			end
		end

		local screenGui = Instance.new("ScreenGui")
		screenGui.Name = "InertiaChat"
		screenGui.ResetOnSpawn = false
		screenGui.IgnoreGuiInset = true
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui.DisplayOrder = 100
		pcall(function() screenGui.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets end)
		screenGui.Parent = playerGui

		local function mk(className, props)
			local inst = Instance.new(className)
			for k, v in pairs(props or {}) do
				inst[k] = v
			end
			return inst
		end

		-- ===== DRAGGABLE CHAT BUTTON =====
		local initialPos = MOBILE and UDim2.new(0, 10, 0, 72) or UDim2.new(0, 10, 0, 70)
		local button = mk("TextButton", {
			Name = "ChatButton",
			Text = "CHAT",
			Font = Enum.Font.GothamBold,
			TextSize = 12,
			TextColor3 = Color3.fromRGB(230, 230, 235),
			BackgroundColor3 = Color3.fromRGB(18, 18, 22),
			BackgroundTransparency = 0.15,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 60, 0, 26),
			Position = initialPos,
			ZIndex = 20,
			AutoButtonColor = false,
			Active = true,
		})
		button.Parent = screenGui

		local btnCorner = mk("UICorner", { CornerRadius = UDim.new(0, 6) })
		btnCorner.Parent = button

		local btnStroke = mk("UIStroke", {
			Thickness = 1,
			Color = Color3.fromRGB(60, 60, 72),
			Transparency = 0.3,
		})
		btnStroke.Parent = button

		-- Dragging logic for chat button
		local dragging = false
		local dragStart = Vector2.new()
		local startPos = UDim2.new()
		local hasMoved = false

		button.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				hasMoved = false
				dragStart = Vector2.new(input.Position.X, input.Position.Y)
				startPos = button.Position

				local connMoved, connEnded
				connMoved = UIS.InputChanged:Connect(function(moveInput)
					if moveInput.UserInputType == Enum.UserInputType.MouseMovement or moveInput.UserInputType == Enum.UserInputType.Touch then
						local delta = Vector2.new(moveInput.Position.X, moveInput.Position.Y) - dragStart
						if delta.Magnitude > 6 then
							hasMoved = true
						end
						if hasMoved then
							local screenSize = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(800, 600)
							local newX = math.clamp(startPos.X.Offset + delta.X, 4, math.max(4, screenSize.X - button.AbsoluteSize.X - 4))
							local newY = math.clamp(startPos.Y.Offset + delta.Y, 4, math.max(4, screenSize.Y - button.AbsoluteSize.Y - 4))
							button.Position = UDim2.new(0, newX, 0, newY)
						end
					end
				end)

				connEnded = UIS.InputEnded:Connect(function(endInput)
					if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
						dragging = false
						if connMoved then connMoved:Disconnect() end
						if connEnded then connEnded:Disconnect() end
					end
				end)
			end
		end)

		button.MouseEnter:Connect(function()
			TweenService:Create(button, TweenInfo.new(0.1), {BackgroundTransparency = 0.05}):Play()
			TweenService:Create(btnStroke, TweenInfo.new(0.1), {Transparency = 0.1}):Play()
		end)
		button.MouseLeave:Connect(function()
			TweenService:Create(button, TweenInfo.new(0.15), {BackgroundTransparency = 0.15}):Play()
			TweenService:Create(btnStroke, TweenInfo.new(0.15), {Transparency = 0.3}):Play()
		end)

		-- ===== CHAT WINDOW =====
		local windowWidth = MOBILE and 290 or 320
		local windowHeight = MOBILE and 210 or 240
		local window = mk("Frame", {
			Name = "ChatWindow",
			Visible = false,
			BackgroundColor3 = Color3.fromRGB(15, 15, 18),
			BackgroundTransparency = 0.05,
			BorderSizePixel = 0,
			Size = UDim2.new(0, windowWidth, 0, windowHeight),
			Position = MOBILE and UDim2.new(0, 10, 0, 104) or UDim2.new(0, 10, 0, 104),
			ZIndex = 15,
			Active = true,
			ClipsDescendants = true,
		})
		window.Parent = screenGui

		local wCorner = mk("UICorner", { CornerRadius = UDim.new(0, 8) })
		wCorner.Parent = window

		local wStroke = mk("UIStroke", {
			Thickness = 1,
			Color = Color3.fromRGB(50, 50, 60),
			Transparency = 0.2,
		})
		wStroke.Parent = window

		-- Header
		local header = mk("Frame", {
			Name = "Header",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 24),
			Position = UDim2.new(0, 0, 0, 0),
			ZIndex = 16,
		})
		header.Parent = window

		local title = mk("TextLabel", {
			Name = "Title",
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 10, 0, 4),
			Size = UDim2.new(1, -30, 0, 18),
			Font = Enum.Font.GothamBold,
			Text = "INERTIA CHAT (" .. string.upper(CHANNEL) .. ")",
			TextColor3 = Color3.fromRGB(190, 190, 200),
			TextSize = 11,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 16,
		})
		title.Parent = header

		-- Message area (ScrollingFrame)
		local scroll = mk("ScrollingFrame", {
			Name = "Scroll",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, -12, 1, -62),
			Position = UDim2.new(0, 6, 0, 24),
			ScrollBarThickness = 3,
			ScrollBarImageColor3 = Color3.fromRGB(90, 90, 100),
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ZIndex = 16,
		})
		scroll.Parent = window
		scroll.ClipsDescendants = true

		local listLayout = Instance.new("UIListLayout")
		listLayout.Parent = scroll
		listLayout.SortOrder = Enum.SortOrder.LayoutOrder
		listLayout.Padding = UDim.new(0, 4)
		listLayout.FillDirection = Enum.FillDirection.Vertical
		listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left

		local scrollPadding = Instance.new("UIPadding")
		scrollPadding.PaddingLeft = UDim.new(0, 4)
		scrollPadding.PaddingRight = UDim.new(0, 4)
		scrollPadding.PaddingTop = UDim.new(0, 2)
		scrollPadding.PaddingBottom = UDim.new(0, 2)
		scrollPadding.Parent = scroll

		-- Input bar container
		local inputBar = mk("Frame", {
			Name = "InputBar",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -12, 0, 28),
			Position = UDim2.new(0, 6, 1, -34),
			ZIndex = 16,
		})
		inputBar.Parent = window

		local inputBox = mk("TextBox", {
			Name = "Input",
			Text = "",
			PlaceholderText = "Message...",
			Font = Enum.Font.Gotham,
			TextSize = 12,
			TextColor3 = Color3.fromRGB(240, 240, 245),
			PlaceholderColor3 = Color3.fromRGB(120, 120, 130),
			BackgroundColor3 = Color3.fromRGB(22, 22, 26),
			BackgroundTransparency = 0.1,
			BorderSizePixel = 0,
			ClearTextOnFocus = false,
			Size = UDim2.new(1, -38, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			ZIndex = 17,
			TextXAlignment = Enum.TextXAlignment.Left,
		})
		inputBox.Parent = inputBar

		local iCorner = mk("UICorner", { CornerRadius = UDim.new(0, 6) })
		iCorner.Parent = inputBox

		local iStroke = mk("UIStroke", {
			Thickness = 1,
			Color = Color3.fromRGB(50, 50, 60),
			Transparency = 0.3,
		})
		iStroke.Parent = inputBox

		local iPadding = Instance.new("UIPadding")
		iPadding.PaddingLeft = UDim.new(0, 8)
		iPadding.PaddingRight = UDim.new(0, 8)
		iPadding.Parent = inputBox

		local sendButton = mk("TextButton", {
			Name = "Send",
			Text = ">",
			Font = Enum.Font.GothamBold,
			TextSize = 14,
			TextColor3 = Color3.fromRGB(240, 240, 245),
			BackgroundColor3 = Color3.fromRGB(32, 32, 38),
			BackgroundTransparency = 0.1,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 32, 1, 0),
			Position = UDim2.new(1, -32, 0, 0),
			AutoButtonColor = true,
			ZIndex = 17,
		})
		sendButton.Parent = inputBar

		local sendCorner = mk("UICorner", { CornerRadius = UDim.new(0, 6) })
		sendCorner.Parent = sendButton

		local sendStroke = mk("UIStroke", {
			Thickness = 1,
			Color = Color3.fromRGB(55, 55, 68),
			Transparency = 0.3,
		})
		sendStroke.Parent = sendButton

		-- ===== NATIVE ROBLOX BUBBLE CHAT =====
		local function showNativeBubble(targetPlayer, text)
			if not targetPlayer then return end
			local char = targetPlayer.Character
			if not char then return end
			local head = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
			if not head then return end

			task.spawn(function()
				local shown = false
				pcall(function()
					if TextChatService and typeof(TextChatService.DisplayBubble) == "function" then
						TextChatService:DisplayBubble(head, text)
						shown = true
					end
				end)

				if not shown then
					pcall(function()
						if ChatService and typeof(ChatService.Chat) == "function" then
							ChatService:Chat(head, text, Enum.ChatColor.White)
							shown = true
						end
					end)
				end
			end)
		end

		-- ===== MESSAGE RENDERING =====
		local messageFrames = {}
		local latestId = 0
		local systemMessages = {}

		local function escapeRichText(s)
			return (tostring(s or ""))
				:gsub("&", "&amp;")
				:gsub("<", "&lt;")
				:gsub(">", "&gt;")
				:gsub('"', "&quot;")
				:gsub("'", "&apos;")
		end

		local function makeMessageRow(sender, content, isSystem)
			latestId = latestId + 1

			local row = Instance.new("Frame")
			row.Name = "Msg_" .. tostring(latestId)
			row.BackgroundTransparency = 1
			row.Size = UDim2.new(1, -4, 0, 0)
			row.AutomaticSize = Enum.AutomaticSize.Y
			row.LayoutOrder = latestId

			local label = Instance.new("TextLabel")
			label.Name = "Text"
			label.BackgroundTransparency = 1
			label.Size = UDim2.new(1, 0, 0, 0)
			label.AutomaticSize = Enum.AutomaticSize.Y
			label.Font = Enum.Font.GothamMedium
			label.TextSize = 12
			label.TextColor3 = Color3.fromRGB(230, 230, 235)
			label.TextWrapped = true
			label.TextXAlignment = Enum.TextXAlignment.Left
			label.TextYAlignment = Enum.TextYAlignment.Top
			label.LineHeight = 1.15
			label.RichText = true

			local safeSender = escapeRichText(sender)
			local safeContent = escapeRichText(content)

			if isSystem then
				label.Text = '<font color="#F59E0B"><b>[' .. safeSender .. ']:</b></font> <font color="#FDE68A">' .. safeContent .. '</font>'
			elseif sender == senderName then
				label.Text = '<font color="#38BDF8"><b>[' .. safeSender .. ']:</b></font> ' .. safeContent
			else
				label.Text = '<font color="#60A5FA"><b>[' .. safeSender .. ']:</b></font> ' .. safeContent
			end

			label.Parent = row
			row.Parent = scroll

			table.insert(messageFrames, row)
			if #messageFrames > MAX_LINES then
				local old = table.remove(messageFrames, 1)
				pcall(function() old:Destroy() end)
			end

			task.defer(function()
				scroll.CanvasPosition = Vector2.new(0, 999999)
			end)
		end

		local function sanitize(v)
			return (tostring(v or "")):gsub("[%z\1-\8\11-\31\127]", "")
		end

		local function onMessage(msg)
			local sender = sanitize(msg.sender)
			local content = sanitize(msg.content)
			if content == "" then return end

			local first = sender:sub(1, 1)
			local isSystem = sender == "SYSTEM" or first == "@" or first == "#"
			if isSystem then
				local seenAt = systemMessages[content]
				if seenAt and tick() - seenAt < 60 then return end
				systemMessages[content] = tick()
			end

			-- Render native Roblox bubble above player's head
			if not isSystem then
				local targetPlayer = Players:FindFirstChild(sender)
				if targetPlayer then
					showNativeBubble(targetPlayer, content)
				end
			end

			-- Add to chat list
			makeMessageRow(sender, content, isSystem)
		end

		-- ===== HTTP & POLLING =====
		local lastTs = 0
		local windowOpen = false
		local localEchoes = {}
		local sendBlockedUntil = 0

		local function fetchMessages()
			local ok1, body = pcall(function()
				return game:HttpGet(BASE .. "?channel=" .. CHANNEL .. "&after=" .. tostring(lastTs))
			end)
			if not ok1 or not body then return false end
			local ok2, decoded = pcall(function()
				return HttpService:JSONDecode(body)
			end)
			if not ok2 or not decoded or not decoded.data then return false end
			for _, m in ipairs(decoded.data) do
				if (m.t or 0) > lastTs then
					lastTs = m.t
					local sender = sanitize(m.sender)
					local echoKey = sender .. "\0" .. sanitize(m.content)
					local echoedAt = localEchoes[echoKey]
					if echoedAt and tick() - echoedAt < 15 then
						localEchoes[echoKey] = nil
					else
						onMessage(m)
					end
				end
			end
			return true
		end
		task.defer(function() pcall(fetchMessages) end)

		local function sendMessage(text)
			text = sanitize(text)
			if text == "" then return end
			local now = tick()
			if now < sendBlockedUntil then return end
			sendBlockedUntil = now + 0.5
			localEchoes[senderName .. "\0" .. text] = tick()
			onMessage({ sender = senderName, content = text })

			task.spawn(function()
				local q = "?channel=" .. CHANNEL
					.. "&sender=" .. HttpService:UrlEncode(senderName)
					.. "&content=" .. HttpService:UrlEncode(text)
				local okSend = pcall(function()
					game:HttpGet(BASE .. q)
				end)
				if not okSend then
					makeMessageRow("SYSTEM", "(send failed)", true)
				end
			end)
		end

		local function toggle()
			if hasMoved then return end
			windowOpen = not windowOpen
			window.Visible = windowOpen
			if windowOpen then
				if not MOBILE then
					task.defer(function() inputBox:CaptureFocus() end)
				end
				scroll.CanvasPosition = Vector2.new(0, 999999)
			end
		end

		button.Activated:Connect(toggle)
		sendButton.Activated:Connect(function()
			sendMessage(inputBox.Text)
			inputBox.Text = ""
		end)

		local function sendFocusedText()
			if not inputBox:IsFocused() then return end
			sendMessage(inputBox.Text)
			inputBox.Text = ""
		end

		UIS.InputBegan:Connect(function(input, gp)
			if gp then return end
			if input.KeyCode == Enum.KeyCode.Return and windowOpen and inputBox:IsFocused() then
				sendFocusedText()
			end
		end)

		inputBox.FocusLost:Connect(function(enterReleased)
			if enterReleased then
				sendMessage(inputBox.Text)
				inputBox.Text = ""
			end
		end)
		pcall(function()
			inputBox.ReturnPressedFromOnScreenKeyboard:Connect(sendFocusedText)
		end)

		-- Poll channel every 2s
		task.spawn(function()
			while true do
				task.wait(2)
				pcall(fetchMessages)
			end
		end)

		-- ===== ANNOUNCEMENTS (Global Channel Toast) =====
		local lastAnnounceTs = (os.time() * 1000) - 20000
		local toastGui

		local function showToast(text, duration)
			if toastGui and toastGui.Parent then
				pcall(function() toastGui:Destroy() end)
			end

			toastGui = Instance.new("Frame")
			toastGui.Name = "InertiaToast"
			toastGui.AnchorPoint = Vector2.new(0.5, 0)
			toastGui.Size = UDim2.new(0, 360, 0, 0)
			toastGui.AutomaticSize = Enum.AutomaticSize.Y
			toastGui.Position = UDim2.new(0.5, 0, 0, 48)
			toastGui.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
			toastGui.BackgroundTransparency = 0.05
			toastGui.BorderSizePixel = 0
			toastGui.ZIndex = 60
			toastGui.Parent = screenGui

			local c = Instance.new("UICorner")
			c.CornerRadius = UDim.new(0, 8)
			c.Parent = toastGui

			local s = Instance.new("UIStroke")
			s.Color = Color3.fromRGB(245, 158, 11)
			s.Thickness = 1
			s.Transparency = 0.2
			s.Parent = toastGui

			local p = Instance.new("UIPadding")
			p.PaddingTop = UDim.new(0, 8)
			p.PaddingBottom = UDim.new(0, 8)
			p.PaddingLeft = UDim.new(0, 12)
			p.PaddingRight = UDim.new(0, 12)
			p.Parent = toastGui

			local lbl = Instance.new("TextLabel")
			lbl.Size = UDim2.new(1, 0, 0, 0)
			lbl.AutomaticSize = Enum.AutomaticSize.Y
			lbl.BackgroundTransparency = 1
			lbl.TextColor3 = Color3.fromRGB(254, 243, 199)
			lbl.TextSize = 12
			lbl.Font = Enum.Font.GothamMedium
			lbl.Text = "<b><font color=\"#F59E0B\">[INERTIA BROADCAST]</font></b>\n" .. escapeRichText(text)
			lbl.TextWrapped = true
			lbl.TextXAlignment = Enum.TextXAlignment.Left
			lbl.RichText = true
			lbl.Parent = toastGui

			local visibleFor = math.clamp(tonumber(duration) or 6, 3, 60)
			task.delay(visibleFor, function()
				if toastGui and toastGui.Parent then
					local t1 = TweenService:Create(toastGui, TweenInfo.new(0.3), {BackgroundTransparency = 1})
					local t2 = TweenService:Create(s, TweenInfo.new(0.3), {Transparency = 1})
					t1:Play()
					t2:Play()
					task.delay(0.35, function()
						pcall(function() toastGui:Destroy() end)
					end)
				end
			end)
		end

		local function fetchAnnouncements()
			local ok1, body = pcall(function()
				return game:HttpGet(BASE .. "?channel=global&after=" .. tostring(lastAnnounceTs))
			end)
			if not ok1 or not body then return end
			local ok2, decoded = pcall(function()
				return HttpService:JSONDecode(body)
			end)
			if not ok2 or not decoded or not decoded.data then return end
			for _, m in ipairs(decoded.data) do
				if (m.t or 0) > lastAnnounceTs then
					lastAnnounceTs = m.t
					local content = sanitize(m.content)
					if content ~= "" then
						onMessage(m)
						showToast(content, m.duration)
					end
				end
			end
		end
		task.defer(function() pcall(fetchAnnouncements) end)

		task.spawn(function()
			while true do
				task.wait(3.5)
				pcall(fetchAnnouncements)
			end
		end)
	end)

	if not ok then
		warn("[InertiaHub] chat module initialization failed: " .. tostring(err))
	end
end
