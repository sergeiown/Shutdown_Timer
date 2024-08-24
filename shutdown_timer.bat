:: Copyright (c) 2024 Serhii I. Myshko
:: https://github.com/sergeiown/Shutdown_Timer/blob/main/LICENSE

@echo off
setlocal enabledelayedexpansion

:: Check if the script is running with administrator rights.
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Running with administrator rights...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:input
cls
set "isnumber=false"
set minMinutes=1
set maxMinutes=1440
set /a maxHours=%maxMinutes%/60
set /p minutes=Enter the number of minutes until the shutdown (between %minMinutes% and %maxMinutes% corresponding to %maxHours% hours): 

:: Check if the input is empty.
if "%minutes%"=="" (
    echo Input cannot be empty. Please enter a number.
    timeout /t 2 /nobreak >nul
    goto input
)

:: Validate if the input is a number.
for /f "delims=0123456789" %%a in ("%minutes%") do set "isnumber=true"
if "%isnumber%" == "true" (
    echo Invalid input. Please enter a number.
    timeout /t 2 /nobreak >nul
    goto input
)

:: Check if the input is within the allowed range.
if %minutes% lss %minMinutes% (
    echo The number of minutes cannot be less than %minMinutes%. Please enter a valid number.
    timeout /t 2 /nobreak >nul
    goto input
)

if %minutes% gtr %maxMinutes% (
    echo The number of minutes cannot exceed %maxMinutes%. Please enter a valid number.
    timeout /t 2 /nobreak >nul
    goto input
)

set /a seconds=%minutes%*60
set /a hh=%seconds%/3600
set /a mm=(%seconds% %% 3600) / 60

:: Set singular or plural text.
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

:: Display a message box with the countdown details and minimize open windows.
powershell -command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('The shutdown timer is set to %hh% %hourText% %mm% %minuteText% and will start after clicking OK.', 'Confirmation'); $shell = New-Object -ComObject Shell.Application; $shell.minimizeall()"

:countdown
cls
set /a hh=%seconds%/3600
set /a mm=(%seconds% %% 3600) / 60
set /a ss=%seconds% %% 60

:: Ensure double digits are displayed for hours, minutes and seconds.
if %hh% lss 10 set hh=0%hh%
if %mm% lss 10 set mm=0%mm%
if %ss% lss 10 set ss=0%ss%

:: Display the remaining time before shutdown.
echo Time remaining before shutdown: %hh%:%mm%:%ss%
timeout /t 1 /nobreak >nul
set /a seconds=%seconds%-1
if %seconds% gtr 0 goto countdown

:: Shutdown the system immediately after the countdown reaches zero.
shutdown /s /f /t 0
