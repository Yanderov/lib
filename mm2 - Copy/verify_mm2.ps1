$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$desktopPath = Join-Path $root "mm2.lua"
$mobilePath = Join-Path $root "mm2_mobile.lua"
$presencePath = Join-Path $root "InertiaPresence.server.lua"
$compiler = "C:\Users\sadhasdkfj\AppData\Local\Temp\codex-luau-audit-0.732\bin\luau-compile.exe"

$desktop = [IO.File]::ReadAllText($desktopPath)
$mobile = [IO.File]::ReadAllText($mobilePath)
$presence = [IO.File]::ReadAllText($presencePath)
$failures = [Collections.Generic.List[string]]::new()

function Assert-True([bool]$condition, [string]$message) {
    if (-not $condition) { $script:failures.Add($message) }
}

function Assert-NoMatch([string]$text, [string]$pattern, [string]$message) {
    Assert-True (-not [regex]::IsMatch($text, $pattern, [Text.RegularExpressions.RegexOptions]::Multiline)) $message
}

function Assert-Match([string]$text, [string]$pattern, [string]$message) {
    Assert-True ([regex]::IsMatch($text, $pattern, [Text.RegularExpressions.RegexOptions]::Multiline)) $message
}

Assert-NoMatch $desktop 'Themes\.Custom\s*=\s*\{\s*\}\s*\r?\nend\s*\r?\npcall\(function\(\)' "fresh install empties Themes.Custom and crashes the Custom swatch"
Assert-NoMatch $desktop '\bWorkspace[\.:]' "bare uppercase Workspace remains"
Assert-NoMatch $desktop 'local function doFling\(' "dead nested fling scope remains"
Assert-Match $desktop 'S\._HooksActive\s*=\s*true' "silent-aim hooks are not registered behind a gate"
Assert-Match $desktop 'cleanup\(function\(\) S\._HooksActive = false end\)' "silent-aim hooks have no unload cleanup"
Assert-NoMatch $desktop 'InertiaConfigs/MM2_Config\.json' "legacy config system remains"
Assert-NoMatch $desktop 'AIChatAPIKey\s*=\s*boxAPI\.Text' "AI API key is still stored in serializable S"
Assert-NoMatch $desktop 'DefaultChatSystemChatEvents' "legacy chat presence remains"
Assert-True (([regex]::Matches($desktop, 'mkSection\(Pages\.[^,]+,\s*"Desync"')).Count -le 1) "duplicate Desync cards remain"
Assert-True (([regex]::Matches($desktop, 'mkSection\(Pages\.[^,]+,\s*"Auto Roles"')).Count -le 1) "duplicate Auto Roles cards remain"
Assert-NoMatch $desktop 'while\s+task\.wait\(0\.5\)\s+do' "uncancellable Auto Roles loop remains"
Assert-NoMatch $desktop 'RunService\.RenderStepped:Connect\(function\(\)\s*\r?\n\s*if S\.StretchEnabled' "untracked Stretch RenderStepped remains"
Assert-NoMatch $desktop 'RunService\.Heartbeat:Connect\(function\(\)\s*\r?\n\s*if S\.FastAutofarm and S\.AutofarmLay' "untracked Autofarm Lay heartbeat remains"
Assert-NoMatch $desktop 'p\.CharacterAdded:Connect\(connectChar\)' "untracked kill-feed CharacterAdded remains"
Assert-NoMatch $desktop 'mkToggle\([^\n]+"Gun Chams"' "Gun Chams UI remains"
Assert-NoMatch $desktop 'S\.AutoDodgeKnife' "hidden Auto Dodge implementation remains"
Assert-NoMatch $desktop 'S\.HandShader' "hidden Self Chams/Hand Shader implementation remains"
Assert-NoMatch $desktop 'deepseek-chat' "retired DeepSeek model remains"
Assert-NoMatch $desktop 'gemini-2\.0-flash' "retired Gemini model remains"
Assert-NoMatch $desktop 'text:match\("40"\)' "coin bag fullness still uses substring matching"
Assert-NoMatch $desktop 'SoundId\s*=\s*"rbxassetid://5410086218"' "Downpour still points at Crab Dance"
Assert-NoMatch $desktop 'S\.KnifePredictMode' "dead knife prediction state remains"
Assert-NoMatch $desktop 'S\.InvisHeight' "dead Invisible Height control remains"
Assert-NoMatch $desktop 'S\.FlingDuration' "dead Fling Duration control remains"
Assert-NoMatch $desktop 'local startInvisibleFE, stopInvisibleFE, toggleInvisible, toggleBlink' "uninitialized toggleBlink remains"
Assert-NoMatch $desktop 'S\.GuiTransparency\s*=\s*0\s*\r?\n\s*S\.HudTransparency\s*=\s*0' "transparency settings are still forcibly reset"
Assert-NoMatch $desktop '\bupdateGuiTransparency\b|\bGuiTransparency\b|\bHudTransparency\b' "retired global transparency override remains"
Assert-NoMatch $desktop 'Parent\.Absolute(?:Position|Size)' "a ScreenGui drag path still reads unavailable parent absolute geometry"
Assert-NoMatch $desktop 'local\s+d\s*=\s*i\.Position\s*-\s*startInput[\s\S]{0,240}?startCenter\s*\+\s*d' "Theme Editor drag mixes Vector2 window geometry with Vector3 input positions"
Assert-NoMatch $desktop 'local Crosshair\s*=|\bS\.Crosshair\b|CrosshairShape|CrosshairThickness|CrosshairGap' "legacy duplicate crosshair system remains"
Assert-NoMatch $desktop 'for\s+k,\s*v\s+in\s+pairs\(dat\.S\)\s+do\s+S\[k\]\s*=\s*v\s+end' "config loader still accepts arbitrary stale state keys"
Assert-Match $desktop 'rawget\(S,\s*k\)' "config state whitelist is missing"
Assert-Match $desktop 'cleanup\(restoreFOV\)' "custom FOV does not restore on unload"
Assert-Match $desktop 'clampFloatPosition' "mobile floating controls are not clamped to the viewport"
Assert-Match $desktop 'S\._ClampHUDFrame' "HUD viewport clamping is missing"
Assert-Match $desktop 'UIWallpaper\s*=\s*"None"\s*,\s*UIWallpaperOpacity\s*=\s*0\.2' "wallpaper defaults are not serializable"
Assert-Match $desktop 'S\._RefreshWallpaper\s*=\s*function' "saved wallpaper cannot be rehydrated"
Assert-Match $desktop 'S\._RefreshNotifySoundSetting\s*=\s*function' "saved notification sound cannot refresh its UI"
Assert-Match $desktop 'S\._ReloadSelectedCursor\s*=\s*function' "saved custom cursor cannot be rehydrated"
Assert-Match $desktop 'S\._ApplySelectedSkybox\s*=\s*function' "saved skybox cannot be reapplied"
Assert-Match $desktop 'S\._ReloadSelectedGunSound\s*=\s*function' "saved gun sound cannot be rehydrated"
Assert-Match $desktop 'mkPage\("Combat"\)' "Combat page is missing"
Assert-Match $desktop 'mkSBItem\("Combat",\s*"combat",\s*Pages\.Combat' "Combat navigation item is missing"
Assert-Match $desktop 'LineSegment' "Motion Graph still has no connected time-series line"
Assert-Match $desktop 'segment\.Rotation\s*=\s*math\.deg\(math\.atan2' "Motion Graph segments are not oriented between samples"
Assert-Match $desktop 'add\("ForceDay"' "ForceDay shader is missing"
Assert-Match $desktop 'add\("ForceNight"' "ForceNight shader is missing"
Assert-Match $desktop 'if forceProfile then\s*\r?\n\s*Lighting\.ClockTime' "ForceDay/ForceNight can be overwritten by sky presets"
Assert-Match $desktop 'Browse Custom Presets' "custom shader library picker is missing"
Assert-Match $desktop 'Editor Page' "shader editor categories are missing"
$shaderPresetCount = ([regex]::Matches($desktop, '(?m)^\s*add\("[^"]+",\s*"[^"]+",\s*\{')).Count
Assert-True ($shaderPresetCount -ge 15) "custom shader library has fewer than 15 presets"
Assert-Match $desktop 'shaderStudioReady\s*=\s*true' "Shader Studio controls never leave initialization mode"
Assert-Match $desktop 'S\._RefreshShaderStudioControls\s*=\s*refreshShaderStudioControls' "shader presets do not refresh Studio controls"
Assert-Match $desktop 'pcall\(S\._RefreshShaderStudioControls\)' "shader profile application does not synchronize Studio controls"
Assert-Match $desktop 'local requestedShader\s*=\s*type\(dat\.S\)' "config loading can lose the selected shader to Studio callbacks"
Assert-Match $desktop 'local function renderRolePreview' "Theme Editor has no per-element preview renderer"
Assert-Match $desktop 'SelectionBorder' "Theme Editor selection border is not inset"
Assert-NoMatch $desktop 'pcall\(S\._BuildThemeEditor\)' "obsolete embedded Theme Editor is still built"
Assert-NoMatch $desktop 'S\._BuildThemeEditor\s*=\s*function' "obsolete embedded Theme Editor is still registered"
Assert-True (([regex]::Matches($desktop, 'S\._OpenThemeEditor\s*=\s*function')).Count -eq 1) "multiple Theme Editor open handlers remain"
Assert-Match $desktop 'local visualObjects\s*=\s*\{\s*obj\s*\}' "standalone Trail/Beam attachment repair is missing"
Assert-Match $desktop 'actionButton\.Activated:Connect' "knife effect cards do not support touch activation"
Assert-Match $desktop 'scanFallback\(LP\.Character,\s*true\)' "knife FX has no fallback for held skin-named tools"
Assert-Match $desktop 'addKey\(effect and effect\.Id\)' "knife FX sources are not searched by effect id"
Assert-NoMatch $desktop 'RS:WaitForChild\("Database"\):WaitForChild\("Sync"\)' "knife FX catalog can wait forever for Database.Sync"
Assert-Match $desktop 'TargetEmptyState' "Motion Targets has no empty state"
Assert-NoMatch $desktop 'Right-click\s*=\s*Whitelist' "Motion Targets still describes removed offensive actions"
Assert-Match $desktop 'BuiltinScalarDefaults' "Reset Everything has no immutable scalar defaults"
Assert-Match $desktop 'configHudDefaults' "Reset Everything has no HUD position defaults"
Assert-Match $desktop 'table\.remove\(S\.Tasks' "completed tracked tasks accumulate forever"
Assert-Match $presence 'requestGeneration|presenceGeneration|requestToken' "presence badge creation has no cancellation generation"
Assert-Match $desktop 'S:Destroy\(\)' "central destroy entry point is missing"
Assert-Match $desktop 'S\._NoBlackoutToken' "No Blackout loop has no lifecycle generation guard"

$sections = [regex]::Matches($desktop, 'mkSection\(Pages\.([A-Za-z0-9_]+),\s*"([^"]+)"') |
    ForEach-Object { "$($_.Groups[1].Value)|$($_.Groups[2].Value)" } |
    Group-Object |
    Where-Object Count -gt 1
Assert-True ($null -eq $sections) "duplicate section cards remain"

$createdPages = @([regex]::Matches($desktop, 'mkPage\("([A-Za-z0-9_]+)"\)') | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique)
$referencedPages = @([regex]::Matches($desktop, 'Pages\.([A-Za-z0-9_]+)') | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique)
$unknownPages = @($referencedPages | Where-Object { $_ -notin $createdPages })
Assert-True ($unknownPages.Count -eq 0) ("unknown page references remain: " + ($unknownPages -join ", "))

$longLabels = @([regex]::Matches($desktop, 'mk(?:Toggle|Action|Slider|Cycle)\([^\r\n]*?,\s*"([^"]+)"') |
    ForEach-Object { $_.Groups[1].Value } |
    Where-Object { $_.Length -gt 24 } |
    Sort-Object -Unique)
Assert-True ($longLabels.Count -eq 0) ("control labels likely to truncate: " + ($longLabels -join ", "))

$desktopLines = [IO.File]::ReadAllLines($desktopPath)
$mobileLines = [IO.File]::ReadAllLines($mobilePath)
Assert-True ($mobileLines.Length -eq $desktopLines.Length + 4) "mobile file is not desktop plus four-line prefix"
if ($mobileLines.Length -eq $desktopLines.Length + 4) {
    for ($i = 0; $i -lt $desktopLines.Length; $i++) {
        if ($desktopLines[$i] -cne $mobileLines[$i + 4]) {
            $failures.Add("mobile body diverges from desktop at desktop line $($i + 1)")
            break
        }
    }
}

if (Test-Path -LiteralPath $compiler) {
    foreach ($path in @($desktopPath, $mobilePath, $presencePath)) {
        foreach ($optimization in 0, 1, 2) {
            & $compiler "-O$optimization" $path *> $null
            if ($LASTEXITCODE -ne 0) {
                $failures.Add("Luau compile failed at O${optimization}: $path")
                break
            }
        }
    }
} else {
    $failures.Add("Luau compiler missing: $compiler")
}

if ($failures.Count -gt 0) {
    $failures | ForEach-Object { Write-Host "FAIL: $_" -ForegroundColor Red }
    Write-Host "REGRESSION_FAIL=$($failures.Count)" -ForegroundColor Red
    exit 1
}

Write-Host "REGRESSION_OK" -ForegroundColor Green
