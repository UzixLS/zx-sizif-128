param(
    [ValidateSet('run', 'build', 'test', 'lint', 'clean')]
    [string]$Target = 'run',
    [string]$MsysRoot,
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$SimulatorArgs = @()
)

$ErrorActionPreference = 'Stop'
$roots = if ($MsysRoot) { $MsysRoot } else { 'C:\msys64', 'C:\dev\msys64' }
$MsysRoot = $roots | Where-Object {
    Test-Path -LiteralPath (Join-Path $_ 'usr\bin\bash.exe') -PathType Leaf
} | Select-Object -First 1
if (-not $MsysRoot) {
    throw "MSYS2 bash (usr\bin\bash.exe) not found under: $($roots -join ', ')"
}
$bash = Join-Path $MsysRoot 'usr\bin\bash.exe'

$savedPath = $env:PATH
$savedMsysRoot = $env:MSYS2_ROOT
Push-Location $PSScriptRoot
try {
    $env:MSYS2_ROOT = $MsysRoot
    $makeTarget = if ($Target -eq 'run') {
        'build'
    } else {
        $Target
    }

    & $bash --noprofile --norc -c "export PATH=/ucrt64/bin:/usr/bin:`$PATH; exec make $makeTarget"
    $result = $LASTEXITCODE
    if ($result -eq 0 -and $Target -eq 'run') {
        $env:PATH = (Join-Path $MsysRoot 'ucrt64\bin') + ';' + $savedPath
        & (Join-Path $PSScriptRoot 'obj_dir\Vsizif.exe') @SimulatorArgs
        $result = $LASTEXITCODE
    }
} finally {
    $env:PATH = $savedPath
    $env:MSYS2_ROOT = $savedMsysRoot
    Pop-Location
}

exit $result
