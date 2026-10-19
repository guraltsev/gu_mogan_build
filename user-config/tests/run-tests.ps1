# Runs every test-*.scm in this folder headless against the INSTALLED user config
# (%APPDATA%\moganlab), using a Mogan dist build.
#
#   .\run-tests.ps1                    all tests, dist-releasedbg of the main checkout
#   .\run-tests.ps1 -Install           copy ..\moganlab\* to %APPDATA%\moganlab first
#   .\run-tests.ps1 -Name oper,lga     only test-oper.scm and test-lga.scm
#   .\run-tests.ps1 -Exe <path>        another MoganSTEM.exe
#
# Exit code: 0 if every check passed, 1 otherwise.
param(
  [string]$Exe,
  [string[]]$Name,
  [switch]$Install,
  [int]$TimeoutSeconds = 90
)

$tests = $PSScriptRoot
if (-not $Exe) {
  $repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..\..')).Path
  $Exe = Join-Path $repo 'build\dist-releasedbg\bin\MoganSTEM.exe'
}
if (-not (Test-Path $Exe)) { Write-Error "Mogan executable not found: $Exe"; exit 2 }

if ($Install) {
  $src = Join-Path $PSScriptRoot '..\moganlab'
  foreach ($sub in 'progs', 'packages') {
    $dst = Join-Path $env:APPDATA "moganlab\$sub"
    New-Item -ItemType Directory -Force $dst | Out-Null
    Copy-Item (Join-Path $src "$sub\*") $dst -Force
  }
  Write-Host "Installed user config to $env:APPDATA\moganlab"
}

$files = Get-ChildItem $tests -Filter 'test-*.scm'
if ($Name) { $files = $files | Where-Object { $Name -contains ($_.BaseName -replace '^test-', '') } }

$env:UC_TESTS = ($tests -replace '\\', '/')
$out = Join-Path $env:TEMP 'uc-test-out.txt'
$err = Join-Path $env:TEMP 'uc-test-err.txt'
$failed = 0

foreach ($f in $files) {
  $path = $f.FullName -replace '\\', '/'
  $p = Start-Process $Exe -ArgumentList '-headless', '-x', "`"(load \`"$path\`")`"" `
         -RedirectStandardOutput $out -RedirectStandardError $err -PassThru -NoNewWindow
  if (-not $p.WaitForExit($TimeoutSeconds * 1000)) { $p.Kill(); Write-Host "FAIL  $($f.BaseName): timed out"; $failed++; continue }
  $text = Get-Content $out -Raw
  if ($text -match 'checks \*\*\* : (\d+) correct, (\d+) failed') {
    $ok = [int]$Matches[1]; $bad = [int]$Matches[2]
    if ($bad -eq 0 -and $ok -gt 0) { Write-Host "ok    $($f.BaseName): $ok checks" }
    else {
      Write-Host "FAIL  $($f.BaseName): $ok correct, $bad failed"
      $text -split "`n" | Select-String 'failed \*\*\*' -Context 0, 2 | ForEach-Object { Write-Host "      $($_.Line.Trim())"; $_.Context.PostContext | ForEach-Object { Write-Host "      $($_.Trim())" } }
      $failed++
    }
  } else {
    Write-Host "FAIL  $($f.BaseName): no check report (script error?)"
    ($text -split "`n" | Select-Object -Last 8) | ForEach-Object { Write-Host "      $_" }
    $failed++
  }
}
if ($failed -eq 0) { Write-Host "All test files passed." } else { Write-Host "$failed test file(s) failed." }
exit ([int]($failed -ne 0))
