@echo off
rem Windowless release build -> <mogan>\build\dist-release
call "%~dp0_build.cmd" release dist-release
set "RC=%errorlevel%"
pause
exit /b %RC%
