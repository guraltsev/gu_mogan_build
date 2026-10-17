# Configure Mogan on Windows. Run from PowerShell (NOT Git Bash: xmake then
# picks the mingw platform and fails to find the Windows SDK).
Set-Location (Split-Path $PSScriptRoot -Parent | Split-Path -Parent)
xmake f -c --yes -p windows -a x64 -m releasedbg --loro=yes --qt="$env:LOCALAPPDATA\Qt\6.8.3\msvc2022_64"
# then: xmake build --yes stem

