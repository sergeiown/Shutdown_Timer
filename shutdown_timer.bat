@echo off
setlocal enabledelayedexpansion

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Running with administrator rights...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:input
cls
set "isnumber=false"
set /p minutes=Enter the number of minutes until the shutdown: 

if "%minutes%"=="" (
    echo Input cannot be empty. Please enter a number.
    timeout /t 2 /nobreak >nul
    goto input
)

for /f "delims=0123456789" %%a in ("%minutes%") do set "isnumber=true"
if "%isnumber%" == "true" (
    echo Invalid input. Please enter a number.
    timeout /t 2 /nobreak >nul
    goto input
)

set /a seconds=%minutes%*60
set /a hh=%seconds%/3600
set /a mm=(%seconds% %% 3600) / 60

if %hh% EQU 1 (
    set hourText=hour
) else (
    set hourText=hours
)

if %mm% EQU 1 (
    set minuteText=minute
) else (
    set minuteText=minutes
)

powershell -command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('The shutdown timer has been set for %hh% %hourText% %mm% %minuteText% and is now running.', 'Timer Started'); $shell = New-Object -ComObject Shell.Application; $shell.minimizeall()"

:countdown
cls
set /a hh=%seconds%/3600
set /a mm=(%seconds% %% 3600) / 60
set /a ss=%seconds% %% 60

if %hh% lss 10 set hh=0%hh%
if %mm% lss 10 set mm=0%mm%
if %ss% lss 10 set ss=0%ss%

echo Time remaining before shutdown: %hh%:%mm%:%ss%
timeout /t 1 /nobreak >nul
set /a seconds=%seconds%-1
if %seconds% gtr 0 goto countdown

shutdown /s /f /t 0
