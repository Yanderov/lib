$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

$builds = @(
    @{ Source = 'pressure/pressure.lua';        Target = 'pressure/pressure_mobile.lua';       Name = 'PRESSURE HUB' },
    @{ Source = 'demonology/demonology.lua';    Target = 'demonology/demonology_mobile.lua';   Name = 'DEMONOLOGY' },
    @{
        Source = 'mm2/mm2.lua'
        Target = 'mm2/mm2_mobile.lua'
        SourceText = 'mm2/mm2.txt'
        TargetText = 'mm2/mm2_mobile.txt'
        Name = 'MURDER MYSTERY 2'
    }
)

foreach ($build in $builds) {
    $lines = Get-Content -LiteralPath $build.Source -Encoding UTF8

    $strict = @()
    if ($lines.Count -gt 0 -and $lines[0].Trim() -eq '--!strict') {
        $strict = @('--!strict')
        $lines = $lines[1..($lines.Count - 1)]
    }

    $header = $strict + @(
        "-- $($build.Name) - MOBILE BUILD (generated, do not edit by hand).",
        "-- Identical source to $($build.Source) with the build flag forced on.",
        '-- Regenerate after ANY edit to the source:   .\build_mobile.ps1',
        '_G.INERTIA_MOBILE = true'
    )

    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    $target = (Join-Path (Get-Location) $build.Target)
    [System.IO.File]::WriteAllLines($target, [string[]]($header + $lines), $utf8NoBom)
    Write-Host ("{0,-34} -> {1} ({2} lines)" -f $build.Source, $build.Target, ($header.Count + $lines.Count))

    if ($build.SourceText) {
        Copy-Item -LiteralPath $build.Source -Destination $build.SourceText -Force
        Write-Host ("{0,-34} -> {1} (alias)" -f $build.Source, $build.SourceText)
    }

    if ($build.TargetText) {
        Copy-Item -LiteralPath $build.Target -Destination $build.TargetText -Force
        Write-Host ("{0,-34} -> {1} (alias)" -f $build.Target, $build.TargetText)
    }
}
