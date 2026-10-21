@echo off
rem Wrapper for prune-merged.ps1; forwards all arguments.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0prune-merged.ps1" %*
exit /b %errorlevel%
