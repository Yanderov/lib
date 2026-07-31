# relog_mm2.ps1 — auto-rejoin MM2 if the Roblox client crashes / closes.
# Watches for RobloxPlayerBeta; when it disappears, relaunches straight back into the same place
# (and job/VIP server if you pass one). Runs until you close this window.
#
# Usage:
#   powershell -ExecutionPolicy Bypass -File relog_mm2.ps1
#   powershell -ExecutionPolicy Bypass -File relog_mm2.ps1 -PlaceId 142823291
#   powershell -ExecutionPolicy Bypass -File relog_mm2.ps1 -PlaceId 142823291 -GraceSeconds 8
#
# Notes:
# - Roblox can only be launched from OUTSIDE the game, so this is a Windows watchdog, not in-game code.
# - It joins via the roblox-player:// URI (the same handler the website uses), so no credentials are
#   touched here — you must already be signed in to the Roblox app.

param(
    [long]$PlaceId = 142823291,          # Murder Mystery 2
    [string]$JobId = "",                 # optional specific server (gameInstanceId)
    [int]$GraceSeconds = 6,              # wait this long after a crash before relaunching
    [int]$PollSeconds  = 3               # how often to check whether the client is alive
)

$launch = "roblox-player://experiences/start?placeId=$PlaceId"
if ($JobId -ne "") { $launch += "^&gameInstanceId=$JobId" }

function Test-RobloxAlive {
    $p = Get-Process -Name "RobloxPlayerBeta" -ErrorAction SilentlyContinue
    return ($null -ne $p)
}

Write-Host "MM2 relog watchdog started. PlaceId=$PlaceId  (Ctrl+C to stop)" -ForegroundColor Cyan
if (-not (Test-RobloxAlive)) {
    Write-Host "Roblox not running - launching now..." -ForegroundColor Yellow
    Start-Process $launch
    Start-Sleep -Seconds 15
}

while ($true) {
    if (-not (Test-RobloxAlive)) {
        Write-Host ("[{0}] Client gone - waiting {1}s then rejoining..." -f (Get-Date -Format HH:mm:ss), $GraceSeconds) -ForegroundColor Yellow
        Start-Sleep -Seconds $GraceSeconds
        # double-check it didn't come back on its own (e.g. a normal teleport between places)
        if (-not (Test-RobloxAlive)) {
            Start-Process $launch
            Write-Host ("[{0}] Relaunched into place $PlaceId." -f (Get-Date -Format HH:mm:ss)) -ForegroundColor Green
            Start-Sleep -Seconds 20   # give it time to boot so we don't double-launch
        }
    }
    Start-Sleep -Seconds $PollSeconds
}
