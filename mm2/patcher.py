import os
import re

asset_data = open("asset_data.lua", "r").read()

fetcher_code = """
-- ==========================================================
-- CUSTOM ASSET FETCHER (GitHub Integration)
-- ==========================================================
local BASE_URL = "https://raw.githubusercontent.com/Yanderov/snpware_assets/master/"
local function fetchCustomAsset(assetPath, subfolder)
    if not assetPath or assetPath == "" then return "" end
    local localFolder = "snpware_assets/" .. subfolder
    local localPath = localFolder .. "/" .. string.gsub(assetPath, "/", "_")
    
    if not isfolder("snpware_assets") then makefolder("snpware_assets") end
    if not isfolder(localFolder) then makefolder(localFolder) end
    
    if not isfile(localPath) then
        local success, data = pcall(function()
            return game:HttpGet(BASE_URL .. assetPath)
        end)
        if success and data and #data > 0 then
            writefile(localPath, data)
        else
            return ""
        end
    end
    
    local success, assetId = pcall(function() return getcustomasset(localPath) end)
    return success and assetId or ""
end

""" + asset_data + """

-- Pre-fill CustomCrosshairs table with Roblox IDs + Custom GitHub assets
local CustomCrosshairs = {
    ["Neon Cyan"] = "rbxassetid://358650771",
    ["Electric Purple"] = "rbxassetid://10891594364",
    ["Precision Dot"] = "rbxassetid://2130621557",
    ["Aim Cross"] = "rbxassetid://311756276",
    ["Blue Spec"] = "rbxassetid://11759193017",
    ["Circle Dot"] = "rbxassetid://13763954073",
    ["Green Hit"] = "rbxassetid://2827093428",
    ["Simple Dot"] = "rbxassetid://2130621557"
}

local crosshairNames = {"Neon Cyan", "Electric Purple", "Precision Dot", "Aim Cross", "Blue Spec", "Circle Dot", "Green Hit", "Simple Dot"}

for _, cursor in ipairs(CustomAssets.Cursors) do
    CustomCrosshairs[cursor.Name] = cursor.Path -- temporarily store path
    table.insert(crosshairNames, cursor.Name)
end

local skyboxNames = {"Default"}
local skyboxMap = {}
for _, sky in ipairs(CustomAssets.Skyboxes) do
    table.insert(skyboxNames, sky.Name)
    skyboxMap[sky.Name] = sky
end

local backgroundNames = {"Default"}
local backgroundMap = {}
for _, bg in ipairs(CustomAssets.Backgrounds) do
    table.insert(backgroundNames, bg.Name)
    backgroundMap[bg.Name] = bg
end

local gunSoundNames = {"Default"}
local gunSoundMap = {}
for _, gs in ipairs(CustomAssets.GunSounds) do
    table.insert(gunSoundNames, gs.Name)
    gunSoundMap[gs.Name] = gs
end
-- ==========================================================
"""

def patch_file(filepath):
    with open(filepath, "r", encoding="utf-8") as f:
        content = f.read()

    # 1. Inject Fetcher Code before `local secCrosshair = mkSection...`
    # or if not found, before `local sec1 = mkSection...`
    target_anchor = 'local secCrosshair = mkSection(Pages.Visuals, "Custom Crosshair", 0.5)'
    if target_anchor not in content:
        print(f"Error: Could not find anchor in {filepath}")
        return False
    
    # We want to replace the existing CustomCrosshairs definition and the mkCycle for crosshair style.
    
    # Regex to find the mkToggle and the block up to mkCycle
    crosshair_pattern = re.compile(
        r'local secCrosshair = mkSection\(Pages\.Visuals, "Custom Crosshair", 0\.5\).*?mkCycle\(secCrosshair, "Crosshair Style", \{.*?\}.*?end, 2\)',
        re.DOTALL
    )
    
    new_crosshair_ui = """local secCrosshair = mkSection(Pages.Visuals, "Custom Crosshair", 0.5)
    mkToggle(secCrosshair, "Enable Custom Crosshair", false, function(v) S.CustomCrosshair = v end, 1)
    
    mkCycle(secCrosshair, "Crosshair Style", crosshairNames, "Neon Cyan", function(v) 
        S.CrosshairStyle = v 
        -- If it's a custom asset path, fetch it now
        if CustomCrosshairs[v] and not string.match(CustomCrosshairs[v], "rbxassetid") and not string.match(CustomCrosshairs[v], "rbxasset://") then
            local path = CustomCrosshairs[v]
            task.spawn(function()
                local fetchedId = fetchCustomAsset(path, "cursors")
                if fetchedId ~= "" then
                    CustomCrosshairs[v] = fetchedId
                end
            end)
        end
    end, 2)"""

    content = content.replace(target_anchor, fetcher_code + target_anchor)
    content = crosshair_pattern.sub(new_crosshair_ui, content)

    # 2. Add Skybox Changer
    skybox_anchor = 'local secEnv = mkSection(Pages.Environment, "Time & Weather", 1)'
    new_skybox_ui = """local secEnv = mkSection(Pages.Environment, "Time & Weather", 1)
    
    mkCycle(secEnv, "Custom Skybox", skyboxNames, "Default", function(v)
        S.CustomSkybox = v
        if v ~= "Default" and skyboxMap[v] then
            task.spawn(function()
                local sky = skyboxMap[v]
                local bk = fetchCustomAsset(sky.Files.Bk, "skyboxes")
                local dn = fetchCustomAsset(sky.Files.Dn, "skyboxes")
                local ft = fetchCustomAsset(sky.Files.Ft, "skyboxes")
                local lf = fetchCustomAsset(sky.Files.Lf, "skyboxes")
                local rt = fetchCustomAsset(sky.Files.Rt, "skyboxes")
                local up = fetchCustomAsset(sky.Files.Up, "skyboxes")
                
                local lighting = game:GetService("Lighting")
                local skyboxObj = lighting:FindFirstChild("CustomSkyboxUI")
                if not skyboxObj then
                    skyboxObj = Instance.new("Sky")
                    skyboxObj.Name = "CustomSkyboxUI"
                    skyboxObj.Parent = lighting
                end
                
                skyboxObj.SkyboxBk = bk
                skyboxObj.SkyboxDn = dn
                skyboxObj.SkyboxFt = ft
                skyboxObj.SkyboxLf = lf
                skyboxObj.SkyboxRt = rt
                skyboxObj.SkyboxUp = up
            end)
        else
            local lighting = game:GetService("Lighting")
            local skyboxObj = lighting:FindFirstChild("CustomSkyboxUI")
            if skyboxObj then skyboxObj:Destroy() end
        end
    end, 1.5)
"""
    content = content.replace(skybox_anchor, new_skybox_ui)

    # 3. Add Custom Background UI
    bg_anchor = 'local secColors = mkSection(Pages.Settings, "Theme Colors", 2)'
    new_bg_ui = """local secColors = mkSection(Pages.Settings, "Theme Colors", 2)
    
    mkCycle(secColors, "UI Background", backgroundNames, "Default", function(v)
        S.UIBackground = v
        if v ~= "Default" and backgroundMap[v] then
            task.spawn(function()
                local bgPath = backgroundMap[v].Path
                local bgId = fetchCustomAsset(bgPath, "backgrounds")
                if bgId ~= "" then
                    local bgImg = SG:FindFirstChild("CustomUIBg") or Instance.new("ImageLabel")
                    bgImg.Name = "CustomUIBg"
                    bgImg.Image = bgId
                    bgImg.Size = UDim2.new(1, 0, 1, 0)
                    bgImg.Position = UDim2.new(0, 0, 0, 0)
                    bgImg.ZIndex = -10
                    bgImg.ScaleType = Enum.ScaleType.Crop
                    bgImg.BackgroundTransparency = 1
                    bgImg.ImageTransparency = 0.5
                    
                    local mainFrame = SG:FindFirstChild("MainFrame") or SG:FindFirstChildWhichIsA("Frame")
                    if mainFrame then
                        bgImg.Parent = mainFrame
                    end
                end
            end)
        else
            local bgImg = SG:FindFirstChild("CustomUIBg", true)
            if bgImg then bgImg:Destroy() end
        end
    end, 0.5)
"""
    content = content.replace(bg_anchor, new_bg_ui)

    # 4. Add Gunshot Sound
    gun_anchor = 'mkToggle(secSurvival, "Auto Dodge Knife", false, function(v) S.AutoDodgeKnife = v end, 6)'
    new_gun_ui = gun_anchor + """
    
    local secAudio = mkSection(Pages.Visuals, "Custom Audio", 4)
    mkCycle(secAudio, "Gunshot Sound", gunSoundNames, "Default", function(v)
        S.CustomGunSound = v
        if v ~= "Default" and gunSoundMap[v] then
            task.spawn(function()
                local soundPath = gunSoundMap[v].Path
                S.CustomGunSoundId = fetchCustomAsset(soundPath, "gun_sounds")
            end)
        else
            S.CustomGunSoundId = nil
        end
    end, 1)
"""
    content = content.replace(gun_anchor, new_gun_ui)
    
    # 5. Hook Gunshot sound
    gunshot_hook = """-- Gun kill: GunFired fires client-side when a bullet connects"""
    gunshot_hook_new = """-- Gunshot: 
    local ws = workspace
    local function playGunSound()
        if S.CustomGunSoundId and S.CustomGunSoundId ~= "" then
            playOnce(S.CustomGunSoundId, 1)
        end
    end
    
    local oldPlay = Instance.new("Sound").Play
    -- Gun kill: GunFired fires client-side when a bullet connects"""
    
    if "playGunSound()" not in content:
        content = content.replace(gunshot_hook, gunshot_hook_new)
        
        # We also need to hook where the gun is actually fired, usually when GunDrop is clicked or tool is activated
        # For a quick implementation, we can hook Sound.Play if the sound is the revolver shot.
        # Revolver sound id is usually rbxassetid://... but hooking metamethod is complex.
        # Instead, we just check for ChildAdded on Gun part.
        sound_hook = """    ws.ChildAdded:Connect(function(child)
        if child.Name == "GunDrop" then"""
        sound_hook_new = """    ws.ChildAdded:Connect(function(child)
        if child:IsA("Sound") and child.SoundId:match("5387431201") then
            if S.CustomGunSoundId and S.CustomGunSoundId ~= "" then
                child.SoundId = S.CustomGunSoundId
            end
        end
        if child.Name == "GunDrop" then"""
        content = content.replace(sound_hook, sound_hook_new)
    
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(content)
    print(f"Patched {filepath}")

patch_file("mm2.lua")
patch_file("mm2_mobile.lua")
