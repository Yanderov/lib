param(
    [long]$PlaceId = 142823291,
    [string]$JobId = "",
    [int]$GraceSeconds = 6,
    [int]$PollSeconds  = 3
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

        if (-not (Test-RobloxAlive)) {
            Start-Process $launch
            Write-Host ("[{0}] Relaunched into place $PlaceId." -f (Get-Date -Format HH:mm:ss)) -ForegroundColor Green
            Start-Sleep -Seconds 20
        }
    }
    Start-Sleep -Seconds $PollSeconds
}
