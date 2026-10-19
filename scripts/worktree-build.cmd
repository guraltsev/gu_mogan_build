@echo off
rem Wrapper for worktree-build.ps1; forwards all arguments.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0worktree-build.ps1" %*
exit /b %errorlevel%
