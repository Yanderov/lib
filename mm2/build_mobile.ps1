$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$desktopPath = Join-Path $root "mm2.lua"
$mobilePath = Join-Path $root "mm2_mobile.lua"
$desktopAliasPath = Join-Path $root "mm2.txt"
$mobileAliasPath = Join-Path $root "mm2_mobile.txt"

$desktop = [IO.File]::ReadAllText($desktopPath)
$prefix = @(
    "-- MURDER MYSTERY 2 - MOBILE BUILD (generated, do not edit by hand)."
    "-- Identical source to mm2/mm2.lua with the build flag forced on."
    "-- Regenerate after ANY edit to the source:   .\build_mobile.ps1"
    "_G.INERTIA_MOBILE = true"
) -join "`r`n"
$mobile = $prefix + "`r`n" + $desktop
$utf8NoBom = [Text.UTF8Encoding]::new($false)

[IO.File]::WriteAllText($mobilePath, $mobile, $utf8NoBom)
[IO.File]::WriteAllText($desktopAliasPath, $desktop, $utf8NoBom)
[IO.File]::WriteAllText($mobileAliasPath, $mobile, $utf8NoBom)

Write-Host "Generated mm2_mobile.lua and synchronized .txt aliases."
