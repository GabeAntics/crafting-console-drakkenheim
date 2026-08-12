param()

$ErrorActionPreference = 'Stop'

$moduleId = 'crafting-console-drakkenheim'
$sourceDir = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$modulesRoot = 'N:\local-ttrpg\foundry\userData\v14\Data\modules'
$destinationDir = Join-Path $modulesRoot $moduleId

if (-not (Test-Path $modulesRoot)) {
    throw "Foundry modules path does not exist: $modulesRoot"
}

New-Item -ItemType Directory -Path $destinationDir -Force | Out-Null

# Mirror source to destination and skip development-only folders.
$arguments = @(
    $sourceDir,
    $destinationDir,
    '/MIR',
    '/R:1',
    '/W:1',
    '/NFL',
    '/NDL',
    '/NP',
    '/XD',
    '.git',
    'ignored',
    'releases'
)

& robocopy @arguments | Out-Null
$exitCode = $LASTEXITCODE

if ($exitCode -ge 8) {
    throw "robocopy failed with exit code $exitCode"
}

Write-Host "Synced $moduleId to Foundry v14: $destinationDir"