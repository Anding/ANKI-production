# Install the Narakeet CLI and its Node.js dependency on Windows.

$ErrorActionPreference = 'Stop'

$node = Get-Command node.exe -ErrorAction SilentlyContinue
$npm = Get-Command npm.cmd -ErrorAction SilentlyContinue
if (-not $node -or -not $npm -or
    [int]((& $node.Source --version) -replace '^v(\d+).*', '$1') -lt 12 -or
    [int]((& $npm.Source --version) -replace '^(\d+).*', '$1') -lt 6) {
    winget install --id OpenJS.NodeJS.LTS --exact --accept-package-agreements --accept-source-agreements
    $env:Path = [Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' +
        [Environment]::GetEnvironmentVariable('Path', 'User') + ';' + $env:Path
}

$npmPath = (npm.cmd config get prefix).Trim()
$userPath = [Environment]::GetEnvironmentVariable('Path', 'User')
$machinePath = [Environment]::GetEnvironmentVariable('Path', 'Machine')
if (($userPath + ';' + $machinePath -split ';') -notcontains $npmPath) {
    [Environment]::SetEnvironmentVariable('Path', ($userPath.TrimEnd(';') + ';' + $npmPath).TrimStart(';'), 'User')
}
if (($env:Path -split ';') -notcontains $npmPath) {
    $env:Path += ';' + $npmPath
}

npm.cmd install --global @narakeet/api-client
