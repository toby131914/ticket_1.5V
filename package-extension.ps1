$ErrorActionPreference = 'Stop'
$sourceDirectory = $PSScriptRoot
$outputDirectory = Join-Path $sourceDirectory 'downloads'
$manifest = Get-Content -LiteralPath (Join-Path $sourceDirectory 'manifest.json') -Raw | ConvertFrom-Json
$files = @('manifest.json', $manifest.background.service_worker, $manifest.action.default_popup, 'popup.js')
$paths = foreach ($file in $files) {
    $path = Join-Path $sourceDirectory $file
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw "Missing extension file: $file" }
    $path
}
New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null
$archive = Join-Path $outputDirectory 'Google-Forms-Sniper-Extension.zip'
Compress-Archive -LiteralPath $paths -DestinationPath $archive -Force
Write-Output "Packaged extension v$($manifest.version): $archive"
