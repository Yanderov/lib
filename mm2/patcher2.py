import os
import re

def build_fetcher_code():
    asset_data = open("asset_data.lua", "r").read()
    return """
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

-- Pre-fill CustomCrosshairs table with Roblox IDs
local CustomCrosshairs = {
    "rbxassetid://358650771", -- Neon Cyan
    "rbxassetid://10891594364", -- Electric Purple
    "rbxassetid://2130621557", -- Precision Dot
    "rbxassetid://311756276", -- Aim Cross
    "rbxassetid://11759193017", -- Blue Spec
    "rbxassetid://13763954073", -- Circle Dot
    "rbxassetid://2827093428", -- Green Hit
    "rbxassetid://2130621557" -- Simple Dot
}

local cursorPaths = {}
for _, cursor in ipairs(CustomAssets.Cursors) do
    table.insert(cursorPaths, cursor.Path)
end

local skyPaths = {}
for _, sky in ipairs(CustomAssets.Skyboxes) do
    table.insert(skyPaths, sky)
end

local bgPaths = {}
for _, bg in ipairs(CustomAssets.Backgrounds) do
    table.insert(bgPaths, bg)
end

local gunPaths = {}
for _, gs in ipairs(CustomAssets.GunSounds) do
    table.insert(gunPaths, gs.Path)
end

local originalTrans = {}
local function setGlobalOpacity(v)
    local opacity = v / 100
    for _, obj in ipairs(SG:GetDescendants()) do
        if obj:IsA("Frame") or obj:IsA("ScrollingFrame") or obj:IsA("TextLabel") or obj:IsA("TextButton") then
            if obj:GetAttribute("ThemeColorRole_BackgroundColor3") then
                if not originalTrans[obj] then
                    originalTrans[obj] = obj.BackgroundTransparency
                end
                local base = originalTrans[obj]
                obj.BackgroundTransparency = base + (1 - base) * (1 - opacity)
            end
        end
    end
end
-- ==========================================================
"""

def patch_file(filepath):
    with open(filepath, "r", encoding="utf-8") as f:
        content = f.read()

    # 1. Inject Fetcher Code before `local secCrosshair = mkSection...`
    # Wait, we need it before we create the Customs section.
    # We will create `secCustoms = mkSection(Pages.Visuals, "Custom Assets", 4)`
    # Let's inject fetcher code right before `local secEnv = mkSection...`
    
    target_anchor = 'local secCrosshair = mkSection(Pages.Visuals, "Custom Crosshair", 0.5)'
    if target_anchor not in content:
        print(f"Error: Could not find anchor in {filepath}")
        return False
    
    # 2. Add Customs sub-tab to Visuals
    # In mm2.lua, find where subtabs are created
    subtab_pattern = re.compile(
        r'local espStroke = mkSubTabBtn\(visualsSubTabBar, espBtn, "ESP", 1, 1/3, -6\).*?bindLocalizedText\(shaderBtn, "Shaders", "Shaders", false\)',
        re.DOTALL
    )
    new_subtabs = """local customBtn = Instance.new("TextButton")
    
    local espStroke = mkSubTabBtn(visualsSubTabBar, espBtn, "ESP", 1, 1/4, -6)
    local envStroke = mkSubTabBtn(visualsSubTabBar, envBtn, "Environment", 2, 1/4, -6)
    local shaderStroke = mkSubTabBtn(visualsSubTabBar, shaderBtn, "Shaders", 3, 1/4, -6)
    local customStroke = mkSubTabBtn(visualsSubTabBar, customBtn, "Customs", 4, 1/4, -6)
    bindLocalizedText(espBtn, "ESP", "ESP", false)
    bindLocalizedText(envBtn, "Environment", "Environment", false)
    bindLocalizedText(shaderBtn, "Shaders", "Shaders", false)
    bindLocalizedText(customBtn, "Customs", "Customs", false)
"""
    content = subtab_pattern.sub(new_subtabs, content)
    
    # Remove old secCrosshair from Visuals > ESP (Wait, it's not sub-tabbed natively, it's just in Visuals).
    # Actually, all sections in Visuals are bound to sub-tabs using group IDs. ESP=1, Env=2, Shader=3, Customs=4.
    
    fetcher_code = build_fetcher_code()
    content = content.replace(target_anchor, fetcher_code + target_anchor)
    
    # Let's replace secCrosshair entirely
    crosshair_pattern = re.compile(
        r'local secCrosshair = mkSection\(Pages\.Visuals, "Custom Crosshair", 0\.5\).*?mkCycle\(secCrosshair, "Crosshair Style", \{.*?\}.*?end, 2\)',
        re.DOTALL
    )
    
    new_customs_ui = """local secCustoms = mkSection(Pages.Visuals, "Custom Assets (GitHub)", 4)
    mkToggle(secCustoms, "Enable Custom Crosshair", false, function(v) S.CustomCrosshair = v end, 1)
    
    -- Slider for custom crosshairs
    mkSlider(secCustoms, "Crosshair ID", 1, #cursorPaths, 1, function(v)
        S.CrosshairStyle = "Custom"
        local path = cursorPaths[v]
        task.spawn(function()
            local fetchedId = fetchCustomAsset(path, "cursors")
            if fetchedId ~= "" then
                S.CrosshairAssetId = fetchedId
            end
        end)
    end, 2)
    
    mkSlider(secCustoms, "Custom Skybox ID", 0, #skyPaths, 0, function(v)
        if v == 0 then
            local lighting = game:GetService("Lighting")
            local skyboxObj = lighting:FindFirstChild("CustomSkyboxUI")
            if skyboxObj then skyboxObj:Destroy() end
        else
            task.spawn(function()
                local sky = skyPaths[v]
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
        end
    end, 3)
    
    mkSlider(secCustoms, "Custom Gun Sound ID", 0, #gunPaths, 0, function(v)
        if v == 0 then
            S.CustomGunSoundId = nil
        else
            task.spawn(function()
                local soundPath = gunPaths[v]
                S.CustomGunSoundId = fetchCustomAsset(soundPath, "gun_sounds")
            end)
        end
    end, 4)
"""
    content = crosshair_pattern.sub(new_customs_ui, content)

    # 3. Add Custom Background UI to Settings
    bg_anchor = 'local secColors = mkSection(Pages.Settings, "Theme Colors", 2)'
    new_bg_ui = """local secColors = mkSection(Pages.Settings, "Theme Colors", 2)
    
    mkSlider(secColors, "UI Frame Opacity", 0, 100, 100, function(v)
        setGlobalOpacity(v)
    end, 0.4)

    mkSlider(secColors, "UI Background ID", 0, #bgPaths, 0, function(v)
        if v == 0 then
            local bgImg = SG:FindFirstChild("CustomUIBg", true)
            if bgImg then bgImg:Destroy() end
        else
            task.spawn(function()
                local bgPath = bgPaths[v].Path
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
        end
    end, 0.5)
"""
    content = content.replace(bg_anchor, new_bg_ui)

    # 4. Hook Gunshot sound
    gunshot_hook = """-- Gun kill: GunFired fires client-side when a bullet connects"""
    gunshot_hook_new = """-- Gunshot: 
    local ws = workspace
    local oldPlay = Instance.new("Sound").Play
    
    -- We can hook into gun shooting by detecting sounds.
    ws.ChildAdded:Connect(function(child)
        if child:IsA("Sound") and child.SoundId:match("5387431201") then
            if S.CustomGunSoundId and S.CustomGunSoundId ~= "" then
                child.SoundId = S.CustomGunSoundId
            end
        end
    end)
    -- Gun kill: GunFired fires client-side when a bullet connects"""
    
    if "ws.ChildAdded:Connect" not in content:
        content = content.replace(gunshot_hook, gunshot_hook_new)
        
    # 5. Fix crosshair rebuilding logic
    rebuild_crosshair_pattern = re.compile(
        r'if S\.CustomCrosshair and S\.CrosshairStyle then\s+local customId = CustomCrosshairs\[S\.CrosshairStyle\]\s+if customId then\s+mouse\.Icon = customId\s+return\s+end\s+end'
    )
    rebuild_crosshair_new = """if S.CustomCrosshair then
        if S.CrosshairAssetId and S.CrosshairAssetId ~= "" then
            mouse.Icon = S.CrosshairAssetId
            return
        end
    end"""
    content = rebuild_crosshair_pattern.sub(rebuild_crosshair_new, content)
    
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(content)
    print(f"Patched {filepath}")

patch_file("mm2.lua")
patch_file("mm2_mobile.lua")
