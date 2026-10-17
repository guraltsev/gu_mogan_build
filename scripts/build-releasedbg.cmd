@echo off
rem Release with debug info (opens a console window with logs)
rem -> <mogan>\build\dist-releasedbg
call "%~dp0_build.cmd" releasedbg dist-releasedbg
set "RC=%errorlevel%"
pause
exit /b %RC%
