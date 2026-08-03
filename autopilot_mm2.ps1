param(
    [long]$PlaceId    = 142823291,
    [string]$JobId    = "",
    [int]$PollSeconds = 4,
    [int]$GraceSeconds = 6,
    [switch]$Once
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

while ($true) {
    if (-not (Test-Alive)) {
        Write-Step "client gone - waiting ${GraceSeconds}s then rejoining..."
        Start-Sleep -Seconds $GraceSeconds
        if (-not (Test-Alive)) {
            if (Start-Game) { Write-Step "rejoined. Re-run your executor/MCP inject if needed." }
            Start-Sleep -Seconds 20
        }
    }
    Start-Sleep -Seconds $PollSeconds
}
