# Install the Narakeet CLI and its Node.js dependency on Windows.

$ErrorActionPreference = 'Stop'

$node = Get-Command node.exe -ErrorAction SilentlyContinue
$npm = Get-Command npm.cmd -ErrorAction SilentlyContinue
if (-not $node -or -not $npm -or
    [int]((& $node.Source --version) -replace '^v(\d+).*', '$1') -lt 12 -or
    [int]((& $npm.Source --version) -replace '^(\d+).*', '$1') -lt 6) {
    if (-not (Get-Command winget.exe -ErrorAction SilentlyContinue)) {
        throw 'Install Windows Package Manager (winget) to install Node.js LTS.'
    }

    winget install --id OpenJS.NodeJS.LTS --exact --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -ne 0) { throw 'Node.js installation failed.' }

    $env:Path = [Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' +
        [Environment]::GetEnvironmentVariable('Path', 'User') + ';' + $env:Path
    $node = Get-Command node.exe -ErrorAction SilentlyContinue
    $npm = Get-Command npm.cmd -ErrorAction SilentlyContinue
    if (-not $node -or -not $npm) {
        throw 'Node.js or npm was not found after installation. Restart PowerShell and run this script again.'
    }
}

$npmPath = (& $npm.Source config get prefix).Trim()
if ($LASTEXITCODE -ne 0) { throw 'Could not determine the npm global directory.' }

$userPath = [Environment]::GetEnvironmentVariable('Path', 'User')
$machinePath = [Environment]::GetEnvironmentVariable('Path', 'Machine')
if (($userPath + ';' + $machinePath -split ';') -notcontains $npmPath) {
    [Environment]::SetEnvironmentVariable('Path', ($userPath.TrimEnd(';') + ';' + $npmPath).TrimStart(';'), 'User')
}
if (($env:Path -split ';') -notcontains $npmPath) {
    $env:Path += ';' + $npmPath
}

& $npm.Source install --global @narakeet/api-client
if ($LASTEXITCODE -ne 0) { throw 'Narakeet CLI installation failed.' }

if (-not (Get-Command narakeet-api-client.cmd -ErrorAction SilentlyContinue)) {
    throw 'Narakeet CLI was installed but was not found on PATH.'
}
Write-Host 'Narakeet CLI installed. Open a new PowerShell window to use the updated PATH.'
