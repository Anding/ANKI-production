# Generate one .mp3 per Narakeet voice using a line from French.txt and voices from voices.dat
# for testing voices for preference

$rootPath = Get-Location
$ankiPath = Join-Path $rootPath "anki"

$narakeetApiKey = (Get-Content -Path (Join-Path $rootPath "narakeet.api") -Raw).Trim()
$french = Get-Content -Path (Join-Path $ankiPath "French.txt") -Encoding UTF8 -TotalCount 1
$voices = Get-Content -Path (Join-Path $rootPath "voices.dat") | Where-Object { $_ -and $_[0] -ne '#' }

foreach ($voice in $voices) {
    Write-Host "$voice.mp3"

    narakeet-api-client `
        --api-key $narakeetApiKey `
        --project-type audio `
        --script "$french" `
        --voice $voice `
        --output-type mp3 `
        --output (Join-Path $ankiPath "$voice.mp3")
}
