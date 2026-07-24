# Rebuild every <game>_mobile.txt from its desktop source.
#
# There is no separate mobile UI codebase to keep in sync: a mobile build is the
# SAME script with _G.INERTIA_MOBILE forced on, which each hub reads to pick its
# layout, its control sizes and whether keybinds or floating buttons exist.
# These files exist only because the repo serves a standalone <game>_mobile.lua
# that loaders can fetch directly; the launcher sets the flag itself and can run
# the desktop file as-is.
#
# Run from this folder:   .\build_mobile.ps1

$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

$builds = @(
    @{ Source = 'pressure/pressure.txt';               Target = 'pressure/pressure_mobile.txt';       Name = 'PRESSURE HUB' },
    @{ Source = 'demonology/demonology.txt';    Target = 'demonology/demonology_mobile.txt';   Name = 'DEMONOLOGY' },
    @{ Source = 'mm2/mm2.txt';                  Target = 'mm2/mm2_mobile.txt';                 Name = 'MURDER MYSTERY 2' }
)

foreach ($build in $builds) {
    $lines = Get-Content -LiteralPath $build.Source

    # `--!strict` only counts on the very first line, so it has to stay there:
    # carry it over and drop it from the body instead of pushing it down.
    $strict = @()
    if ($lines.Count -gt 0 -and $lines[0].Trim() -eq '--!strict') {
        $strict = @('--!strict')
        $lines = $lines[1..($lines.Count - 1)]
    }

    $header = $strict + @(
        "-- $($build.Name) — MOBILE BUILD (generated, do not edit by hand).",
        "-- Identical source to $($build.Source) with the build flag forced on.",
        '-- Regenerate after ANY edit to the source:   .\build_mobile.ps1',
        '_G.INERTIA_MOBILE = true'
    )

    Set-Content -LiteralPath $build.Target -Value ($header + $lines) -Encoding utf8NoBOM
    Write-Host ("{0,-34} -> {1} ({2} lines)" -f $build.Source, $build.Target, ($header.Count + $lines.Count))
}
