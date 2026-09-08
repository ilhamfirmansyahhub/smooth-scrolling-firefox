$ErrorActionPreference = 'Stop'

$source = Join-Path $PSScriptRoot 'user.js'
if (-not (Test-Path -LiteralPath $source -PathType Leaf)) {
    Write-Error 'Error: user.js not found.'
}

$baseDirs = @(
    (Join-Path $env:APPDATA 'Mozilla\Firefox\Profiles'),
    (Join-Path $env:LOCALAPPDATA 'Mozilla\Firefox\Profiles')
)

$profiles = @()
foreach ($base in $baseDirs) {
    if (Test-Path -LiteralPath $base -PathType Container) {
        $profiles += Get-ChildItem -LiteralPath $base -Directory -ErrorAction SilentlyContinue |
            Where-Object { Test-Path -LiteralPath (Join-Path $_.FullName 'prefs.js') }
    }
}

$profiles = $profiles | Sort-Object FullName -Unique

if (-not $profiles) {
    Write-Host 'No Firefox profiles found.'
    Write-Host 'Start Firefox once, close it, then run this script again.'
    exit 1
}

foreach ($profile in $profiles) {
    $target = Join-Path $profile.FullName 'user.js'
    Copy-Item -LiteralPath $source -Destination $target -Force
    Write-Host "Installed: $target"
}

Write-Host ''
Write-Host 'Firefox smooth scrolling preset installed.'
Write-Host 'Restart Firefox for the preferences to take effect.'
