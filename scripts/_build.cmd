@echo off
rem Shared worker. Usage: _build.cmd <xmake-mode> <dist-folder-name> [checkout-dir]
rem Example: _build.cmd release dist-release   -> <mogan>\build\dist-release
rem Prereqs and gotchas: gu_mogan_build\_docs\windows-build-setup.md
rem Run from cmd or PowerShell, not Git Bash (xmake would pick mingw there).

setlocal
set "MODE=%~1"
set "DIST=%~2"
if "%MODE%"=="" goto :usage
if "%DIST%"=="" goto :usage

rem Default checkout: scripts -> gu_mogan_build -> mogan. Override with arg 3 (worktrees).
set "ROOT=%~3"
if "%ROOT%"=="" set "ROOT=%~dp0..\.."
pushd "%ROOT%" || exit /b 1

set "QTDIR=%LOCALAPPDATA%\Qt\6.8.3\msvc2022_64"
if not exist "%QTDIR%\bin\qmake.exe" (
  echo Qt not found at %QTDIR%
  echo Install: aqt install-qt windows desktop 6.8.3 win64_msvc2022_64 -m qtnetworkauth qtlottie -O "%LOCALAPPDATA%\Qt"
  popd & exit /b 1
)

rem Each mode has its own object dir (build\windows\x64\<mode>), so switching
rem modes reconfigures but does not discard the other mode's compiled objects.
(for /l %%i in (1,1,50) do @echo y) | xmake f -P . -c -y --yes -p windows -a x64 -m %MODE% --loro=yes --qt="%QTDIR%" || goto :fail
(for /l %%i in (1,1,50) do @echo y) | xmake build -P . -y --yes stem || goto :fail
call xmake install -P . -y --yes -o build\%DIST% stem || goto :fail

echo.
echo Done (%MODE%). Run: %CD%\build\%DIST%\bin\MoganSTEM.exe
popd
exit /b 0

:fail
echo.
echo Build failed (see output above).
popd
exit /b 1

:usage
echo Usage: %~nx0 ^<xmake-mode^> ^<dist-folder-name^> [checkout-dir]
exit /b 2


