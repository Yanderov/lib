# Launch Roblox straight into Murder Mystery 2.
#
# Roblox has no "open place N" CLI: the desktop client is driven by a roblox-player:
# deep link, and the only variant that works without a launch ticket is the one the
# website itself emits for a plain play button. Everything here is that one URI plus
# the waiting around it, because the client exits and relaunches itself once mid-start
# and a naive "did it open" check passes on the process that is about to die.
#
#   .\launch_mm2.ps1                 join any public server
#   .\launch_mm2.ps1 -JobId <guid>   join one specific server
#   .\launch_mm2.ps1 -Restart        kill a running client first

param(
    [string]$JobId = "",
    [switch]$Restart
)

$ErrorActionPreference = 'Stop'
$PlaceId = 142823291   # Murder Mystery 2

function Write-Step($msg) { Write-Host "[launch] $msg" }

if ($Restart) {
    $existing = Get-Process RobloxPlayerBeta -ErrorAction SilentlyContinue
    if ($existing) {
        Write-Step "closing running client..."
        $existing | Stop-Process -Force
        Start-Sleep -Seconds 3
    }
}

$already = Get-Process RobloxPlayerBeta -ErrorAction SilentlyContinue
if ($already -and -not $Restart) {
    Write-Step "Roblox is already running (pass -Restart to force a fresh client)."
    exit 0
}

# placeId + a launch mode is the minimum the protocol handler accepts; gameInstanceId
# is what pins the join to one server rather than matchmaking.
$uri = "roblox://placeId=$PlaceId"
if ($JobId -ne "") {
    $uri = "roblox://placeId=$PlaceId`&gameInstanceId=$JobId"
    Write-Step "joining server $JobId"
} else {
    Write-Step "joining a public server"
}

Write-Step "opening $uri"
Start-Process $uri

# The client relaunches itself during startup, so the first process to appear is not
# the one that ends up in the game. Wait for the window title instead: it only turns
# into the place name once the join actually succeeded.
Write-Step "waiting for the game window (up to 120s)..."
$deadline = (Get-Date).AddSeconds(120)
$joined = $false
while ((Get-Date) -lt $deadline) {
    Start-Sleep -Seconds 3
    $p = Get-Process RobloxPlayerBeta -ErrorAction SilentlyContinue |
         Where-Object { $_.MainWindowTitle -ne "" } |
         Select-Object -First 1
    if ($p) {
        Write-Step "window up: '$($p.MainWindowTitle)' (pid $($p.Id))"
        $joined = $true
        break
    }
}

if (-not $joined) {
    Write-Step "no game window after 120s - Roblox may be updating, or the login expired."
    exit 1
}

Write-Step "done. Inject when the map has loaded."
