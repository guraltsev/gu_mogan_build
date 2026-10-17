@echo off
rem Shared worker. Usage: _build.cmd <xmake-mode> <dist-folder-name>
rem Example: _build.cmd release dist-release   -> <mogan>\build\dist-release
rem Prereqs and gotchas: gu_mogan_build\_docs\windows-build-setup.md
rem Run from cmd or PowerShell, not Git Bash (xmake would pick mingw there).

setlocal
set "MODE=%~1"
set "DIST=%~2"
if "%MODE%"=="" goto :usage
if "%DIST%"=="" goto :usage

rem scripts -> gu_mogan_build -> mogan checkout
pushd "%~dp0..\.."

set "QTDIR=%LOCALAPPDATA%\Qt\6.8.3\msvc2022_64"
if not exist "%QTDIR%\bin\qmake.exe" (
  echo Qt not found at %QTDIR%
  echo Install: aqt install-qt windows desktop 6.8.3 win64_msvc2022_64 -m qtnetworkauth qtlottie -O "%LOCALAPPDATA%\Qt"
  popd & exit /b 1
)

rem Each mode has its own object dir (build\windows\x64\<mode>), so switching
rem modes reconfigures but does not discard the other mode's compiled objects.
call xmake f -c --yes -p windows -a x64 -m %MODE% --loro=yes --qt="%QTDIR%" || goto :fail
call xmake build --yes stem || goto :fail
call xmake install --yes -o build\%DIST% stem || goto :fail

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
echo Usage: %~nx0 ^<xmake-mode^> ^<dist-folder-name^>
exit /b 2
