@echo off
rem Wrapper for update-fork-readme.ps1; forwards all arguments.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0update-fork-readme.ps1" %*
exit /b %errorlevel%
