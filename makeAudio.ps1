# Generate .mp3 audio files from an ANKI import file using the Narakeet API

param(
    [Parameter(Mandatory, Position = 0)]
    [string]$FileName
)

# Load Narakeet API key from Git ignored local file, and load the Narakeet voices

$rootPath = Get-Location
$apiKeyFile = Join-Path $rootPath "narakeet.api"

$narakeetApiKey = (Get-Content -Path $apiKeyFile -Raw).Trim()
$voices = Get-Content -Path (Join-Path $rootPath "voices.dat") | Where-Object { $_ -and $_[0] -ne '#' }

$sourcePath = "E:\ai-work\French\production-sources"
$audioPath = Join-Path $sourcePath "audio"
New-Item -ItemType Directory -Force -Path $audioPath | Out-Null

# Load the named ANKI import file (must be UTF-8 without BOM)

$inputFile = Join-Path $sourcePath $FileName
$lines = Get-Content -Path $inputFile -Encoding UTF8

# Generate one MP3 for each French word or phrase, taking the second pipe-separated field
# from the named ANKI import file in production-sources

foreach ($line in $lines) {
    # take the second tab separate value, the French
    $french = ($line -split "|", 0, 'SimpleMatch')[1]
    # create an ASII safe form of the French for the filename
    $safe = ($french.Normalize([Text.NormalizationForm]::FormD).ToCharArray() |
        Where-Object { [Globalization.CharUnicodeInfo]::GetUnicodeCategory($_) -ne 'NonSpacingMark' }) -join '' `
        -replace ' ', '_' `
        -replace '[^a-zA-Z0-9_]', ''
    Write-Host "$safe.mp3"
    # Use a randomly selected voice from those listed in voices.dat
    $voice = Get-Random -InputObject $voices
    # Call Narakeet
    narakeet-api-client `
        --api-key $narakeetApiKey `
        --project-type audio `
        --script "$french" `
        --voice $voice `
        --output-type mp3 `
        --output (Join-Path $audioPath "$safe.mp3")
}
