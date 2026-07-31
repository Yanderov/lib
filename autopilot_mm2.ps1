# autopilot_mm2.ps1 — hands-off Roblox + Murder Mystery 2.
# Launches the game if it isn't running, then stays up and relaunches it whenever the client
# crashes or closes. You run this once and never touch Roblox again; Ctrl+C to stop.
#
#   powershell -ExecutionPolicy Bypass -File autopilot_mm2.ps1
#   powershell -ExecutionPolicy Bypass -File autopilot_mm2.ps1 -JobId <guid>   # pin one server
#   powershell -ExecutionPolicy Bypass -File autopilot_mm2.ps1 -Once           # launch, don't watch
#
# Notes:
# - Uses the roblox:// deep link, the same one the website's Play button emits. You must already be
#   signed in to the Roblox desktop app; no credentials are handled here.
# - Roblox launching is a Windows action, so this is a watchdog, not in-game code. It cannot re-run
#   your executor / MCP inject — if your setup needs that, do it once after each (re)launch.

param(
    [long]$PlaceId    = 142823291,   # Murder Mystery 2
    [string]$JobId    = "",
    [int]$PollSeconds = 4,
    [int]$GraceSeconds = 6,          # wait after a crash before relaunching
    [switch]$Once                    # launch once and exit instead of babysitting
)

function Write-Step($m) { Write-Host ("[autopilot {0}] {1}" -f (Get-Date -Format HH:mm:ss), $m) -ForegroundColor Cyan }

function Test-Alive {
    return $null -ne (Get-Process RobloxPlayerBeta -ErrorAction SilentlyContinue)
}

function Get-LaunchUri {
    $u = "roblox://placeId=$PlaceId"
    if ($JobId -ne "") { $u = "roblox://placeId=$PlaceId`&gameInstanceId=$JobId" }
    return $u
}

function Start-Game {
    $uri = Get-LaunchUri
    Write-Step "launching $uri"
    Start-Process $uri
    # The client relaunches itself once during startup, so wait for a window rather than the first pid.
    $deadline = (Get-Date).AddSeconds(120)
    while ((Get-Date) -lt $deadline) {
        Start-Sleep -Seconds 3
        $p = Get-Process RobloxPlayerBeta -ErrorAction SilentlyContinue |
             Where-Object { $_.MainWindowTitle -ne "" } | Select-Object -First 1
        if ($p) { Write-Step "game window up (pid $($p.Id))"; return $true }
    }
    Write-Step "no game window after 120s (Roblox updating, or login expired?)"
    return $false
}

Write-Step "MM2 autopilot starting. PlaceId=$PlaceId  (Ctrl+C to stop)"
if (-not (Test-Alive)) {
    Start-Game | Out-Null
} else {
    Write-Step "Roblox already running - leaving it alone."
}

if ($Once) { Write-Step "-Once set, done."; exit 0 }

# Babysit: relaunch whenever the client disappears.
while ($true) {
    if (-not (Test-Alive)) {
        Write-Step "client gone - waiting ${GraceSeconds}s then rejoining..."
        Start-Sleep -Seconds $GraceSeconds
        if (-not (Test-Alive)) {
            if (Start-Game) { Write-Step "rejoined. Re-run your executor/MCP inject if needed." }
            Start-Sleep -Seconds 20   # let it settle so we don't double-launch
        }
    }
    Start-Sleep -Seconds $PollSeconds
}
