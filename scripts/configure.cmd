@echo off
rem Wrapper for configure.ps1; forwards all arguments.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0configure.ps1" %*
exit /b %errorlevel%
