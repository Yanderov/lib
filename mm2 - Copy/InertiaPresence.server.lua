--!strict
-- Install this Script in ServerScriptService in the owned experience.
-- It grants no permissions: the registration is cosmetic presence only.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local FOLDER_NAME = "InertiaPresence"
local REMOTE_NAME = "RegisterClient"
local BADGE_NAME = "InertiaPresenceBadge"
local PRESENCE_ATTRIBUTE = "InertiaClient"
local PROTOCOL = "INERTIA/1"
local REQUEST_COOLDOWN = 1.5
local PRESENCE_TIMEOUT = 210

local folder = ReplicatedStorage:FindFirstChild(FOLDER_NAME)
if not folder then
    folder = Instance.new("Folder")
    folder.Name = FOLDER_NAME
    folder.Parent = ReplicatedStorage
end

local remote = folder:FindFirstChild(REMOTE_NAME)
if not remote then
    remote = Instance.new("RemoteEvent")
    remote.Name = REMOTE_NAME
    remote.Parent = folder
end

assert(remote:IsA("RemoteEvent"), FOLDER_NAME .. "." .. REMOTE_NAME .. " must be a RemoteEvent")

local lastRequest: { [Player]: number } = {}
local presenceGeneration: { [Player]: number } = {}

local function nextPresenceGeneration(player: Player): number
    local generation = (presenceGeneration[player] or 0) + 1
    presenceGeneration[player] = generation
    return generation
end

local function requestIsCurrent(player: Player, character: Model, requestGeneration: number): boolean
    return player.Parent == Players
        and player.Character == character
        and player:GetAttribute(PRESENCE_ATTRIBUTE) == true
        and presenceGeneration[player] == requestGeneration
end

local function addCorner(parent: Instance, radius: number)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = parent
end

local function removeBadge(character: Model?)
    if not character then return end
    local old = character:FindFirstChild(BADGE_NAME, true)
    if old then old:Destroy() end
end

local function createBadge(player: Player, character: Model, requestGeneration: number)
    if not requestIsCurrent(player, character, requestGeneration) then return end

    local head = character:FindFirstChild("Head") or character:WaitForChild("Head", 8)
    if not head or not head:IsA("BasePart") or not requestIsCurrent(player, character, requestGeneration) then return end
    removeBadge(character)

    local billboard = Instance.new("BillboardGui")
    billboard.Name = BADGE_NAME
    billboard.Adornee = head
    billboard.AlwaysOnTop = true
    billboard.LightInfluence = 0
    billboard.MaxDistance = 220
    billboard.Size = UDim2.fromOffset(154, 34)
    billboard.StudsOffsetWorldSpace = Vector3.new(0, 2.75, 0)

    local shadow = Instance.new("Frame")
    shadow.Name = "Shadow"
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    shadow.BackgroundTransparency = 0.56
    shadow.Position = UDim2.new(0.5, 0, 0.5, 2)
    shadow.Size = UDim2.new(1, 2, 1, 2)
    shadow.ZIndex = 0
    addCorner(shadow, 11)
    shadow.Parent = billboard

    local body = Instance.new("Frame")
    body.Name = "Body"
    body.AnchorPoint = Vector2.new(0.5, 0.5)
    body.BackgroundColor3 = Color3.fromRGB(10, 13, 18)
    body.BackgroundTransparency = 0.06
    body.BorderSizePixel = 0
    body.Position = UDim2.fromScale(0.5, 0.5)
    body.Size = UDim2.fromScale(1, 1)
    body.ZIndex = 1
    addCorner(body, 10)

    local bodyGradient = Instance.new("UIGradient")
    bodyGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(23, 31, 42)),
        ColorSequenceKeypoint.new(0.58, Color3.fromRGB(12, 16, 23)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(7, 10, 15)),
    })
    bodyGradient.Rotation = 12
    bodyGradient.Parent = body

    local outline = Instance.new("UIStroke")
    outline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    outline.Color = Color3.fromRGB(82, 192, 255)
    outline.Transparency = 0.28
    outline.Thickness = 1
    outline.Parent = body

    local iconPlate = Instance.new("Frame")
    iconPlate.Name = "Icon"
    iconPlate.BackgroundColor3 = Color3.fromRGB(25, 151, 226)
    iconPlate.BorderSizePixel = 0
    iconPlate.Position = UDim2.fromOffset(6, 5)
    iconPlate.Size = UDim2.fromOffset(24, 24)
    iconPlate.ZIndex = 2
    addCorner(iconPlate, 7)

    local iconGradient = Instance.new("UIGradient")
    iconGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(108, 224, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(44, 103, 255)),
    })
    iconGradient.Rotation = 135
    iconGradient.Parent = iconPlate

    local diamond = Instance.new("Frame")
    diamond.AnchorPoint = Vector2.new(0.5, 0.5)
    diamond.BackgroundColor3 = Color3.fromRGB(245, 252, 255)
    diamond.BorderSizePixel = 0
    diamond.Position = UDim2.fromScale(0.5, 0.5)
    diamond.Rotation = 45
    diamond.Size = UDim2.fromOffset(9, 9)
    diamond.ZIndex = 3
    addCorner(diamond, 2)
    diamond.Parent = iconPlate

    local core = Instance.new("Frame")
    core.AnchorPoint = Vector2.new(0.5, 0.5)
    core.BackgroundColor3 = Color3.fromRGB(41, 133, 237)
    core.BorderSizePixel = 0
    core.Position = UDim2.fromScale(0.5, 0.5)
    core.Size = UDim2.fromOffset(3, 3)
    core.ZIndex = 4
    addCorner(core, 2)
    core.Parent = diamond
    iconPlate.Parent = body

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.Position = UDim2.fromOffset(38, 3)
    title.Size = UDim2.new(1, -44, 0, 17)
    title.Text = "INERTIA"
    title.TextColor3 = Color3.fromRGB(241, 247, 255)
    title.TextSize = 12
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 2
    title.Parent = body

    local subtitle = Instance.new("TextLabel")
    subtitle.Name = "Subtitle"
    subtitle.BackgroundTransparency = 1
    subtitle.Font = Enum.Font.GothamMedium
    subtitle.Position = UDim2.fromOffset(38, 17)
    subtitle.Size = UDim2.new(1, -44, 0, 12)
    subtitle.Text = "CLIENT"
    subtitle.TextColor3 = Color3.fromRGB(105, 190, 241)
    subtitle.TextSize = 8
    subtitle.TextTransparency = 0.06
    subtitle.TextXAlignment = Enum.TextXAlignment.Left
    subtitle.ZIndex = 2
    subtitle.Parent = body

    body.Parent = billboard
    if requestIsCurrent(player, character, requestGeneration) then
        billboard.Parent = head
    else
        billboard:Destroy()
    end
end

local function setPresence(player: Player, enabled: boolean)
    local requestGeneration = nextPresenceGeneration(player)
    player:SetAttribute(PRESENCE_ATTRIBUTE, enabled)
    player:SetAttribute("InertiaClientVersion", if enabled then PROTOCOL else nil)
    if enabled then
        local character = player.Character
        if character then task.spawn(createBadge, player, character, requestGeneration) end
    else
        removeBadge(player.Character)
    end
end

remote.OnServerEvent:Connect(function(player: Player, protocol: unknown, enabled: unknown)
    if protocol ~= PROTOCOL or typeof(enabled) ~= "boolean" then return end

    local now = os.clock()
    local previous = lastRequest[player]
    if previous and now - previous < REQUEST_COOLDOWN then return end
    lastRequest[player] = now
    setPresence(player, enabled)
end)

local function bindPlayer(player: Player)
    setPresence(player, false)
    player.CharacterAdded:Connect(function(character)
        if player:GetAttribute(PRESENCE_ATTRIBUTE) == true then
            local requestGeneration = nextPresenceGeneration(player)
            task.spawn(createBadge, player, character, requestGeneration)
        else
            nextPresenceGeneration(player)
            removeBadge(character)
        end
    end)
end

for _, player in Players:GetPlayers() do bindPlayer(player) end
Players.PlayerAdded:Connect(bindPlayer)
Players.PlayerRemoving:Connect(function(player)
    lastRequest[player] = nil
    presenceGeneration[player] = nil
end)

task.spawn(function()
    while task.wait(30) do
        local now = os.clock()
        for player, lastSeen in lastRequest do
            if not player.Parent then
                lastRequest[player] = nil
            elseif player:GetAttribute(PRESENCE_ATTRIBUTE) == true and now - lastSeen > PRESENCE_TIMEOUT then
                lastRequest[player] = nil
                setPresence(player, false)
            end
        end
    end
end)
