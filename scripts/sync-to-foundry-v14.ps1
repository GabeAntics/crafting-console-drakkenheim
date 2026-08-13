param()

$ErrorActionPreference = 'Stop'

$moduleId = 'crafting-console-drakkenheim'
$sourceDir = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$sourcePacksDir = Join-Path $sourceDir 'packs'
$modulesRoot = 'N:\local-ttrpg\foundry\userData\v14\Data\modules'
$destinationDir = Join-Path $modulesRoot $moduleId
$destinationPacksDir = Join-Path $destinationDir 'packs'

if (-not (Test-Path $modulesRoot)) {
    throw "Foundry modules path does not exist: $modulesRoot"
}

New-Item -ItemType Directory -Path $destinationDir -Force | Out-Null

# Mirror non-pack content first so module.json and folder changes land even if Foundry has compendium files open.
$rootArguments = @(
    $sourceDir,
    $destinationDir,
    '/MIR',
    '/R:1',
    '/W:1',
    '/XD',
    '.git',
    'packs',
    'ignored',
    'releases'
)

& robocopy @rootArguments
$rootExitCode = $LASTEXITCODE

if ($rootExitCode -ge 8) {
    throw "Root sync failed with robocopy exit code $rootExitCode"
}

New-Item -ItemType Directory -Path $destinationPacksDir -Force | Out-Null

$packWarnings = @()
$packDirectories = Get-ChildItem -Path $sourcePacksDir -Directory -ErrorAction SilentlyContinue

foreach ($packDirectory in $packDirectories) {
    $sourcePackDir = $packDirectory.FullName
    $destinationPackDir = Join-Path $destinationPacksDir $packDirectory.Name

    New-Item -ItemType Directory -Path $destinationPackDir -Force | Out-Null

    $packArguments = @(
        $sourcePackDir,
        $destinationPackDir,
        '/E',
        '/R:1',
        '/W:1',
        '/XF',
        'LOCK',
        'LOG',
        'LOG.old'
    )

    & robocopy @packArguments
    $packExitCode = $LASTEXITCODE

    if ($packExitCode -ge 8) {
        $packWarnings += "Pack sync warning for $($packDirectory.Name) (exit code $packExitCode). Close Foundry before syncing if you changed compendium database files."
    }
}

Write-Host "Synced $moduleId to Foundry v14: $destinationDir"

if ($packWarnings.Count -gt 0) {
    $packWarnings | ForEach-Object { Write-Warning $_ }
}