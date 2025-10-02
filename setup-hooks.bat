@echo off
setlocal
cd %~dp0

:: Copies the hooks to the git folder
CALL :install pre-commit-prevent-large-files
CALL :install pre-commit-prevent-directly-committing-main
CALL :install pre-commit-prevent-nonascii-files
CALL :install pre-commit

echo Setup complete
GOTO :EOF

:install
IF EXIST "%~dp0\..\.git\hooks\%1" (
    echo Updating "%1"
) else (
    echo Installing "%1"
)

:: ensure the script exists
IF NOT EXIST "%~dp0\%1.sh" (
    echo Script "%1.sh" doesn\'t exist in %~dp0/hooks! 1>&2
    GOTO :EOF
)

:: put it in the right folder without the extension
copy /Y "%~dp0\%1.sh" "%~dp0\..\.git\hooks\%1"
