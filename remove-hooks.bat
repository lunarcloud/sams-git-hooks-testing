@echo off
setlocal
cd %~dp0

:: Copies the hooks to the git folder
CALL :uninstall pre-commit-prevent-large-files
CALL :uninstall pre-commit-prevent-directly-committing-main
CALL :uninstall pre-commit-prevent-nonascii-files
CALL :uninstall pre-commit

echo Uninstall complete

GOTO :EOF

:uninstall
IF NOT EXIST "%~dp0\..\.git\hooks\%1" GOTO :EOF

echo Removing "%1"
del "%~dp0\..\.git\hooks\%1"
GOTO :EOF
