@echo off
rem Wrapper for sync-main.ps1; forwards all arguments.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0sync-main.ps1" %*
exit /b %errorlevel%
