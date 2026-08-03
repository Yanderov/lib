param(
    [string]$JobId = "",
    [switch]$Restart
)

$ErrorActionPreference = 'Stop'
$PlaceId = 142823291

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

$uri = "roblox://placeId=$PlaceId"
if ($JobId -ne "") {
    $uri = "roblox://placeId=$PlaceId`&gameInstanceId=$JobId"
    Write-Step "joining server $JobId"
} else {
    Write-Step "joining a public server"
}

Write-Step "opening $uri"
Start-Process $uri

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
