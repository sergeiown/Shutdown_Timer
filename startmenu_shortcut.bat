:: Copyright (c) 2024 Serhii I. Myshko
:: https://github.com/sergeiown/Shutdown_Timer/blob/main/LICENSE

@echo off
set shortcutName=Shutdown Timer
set shortcutTargetDescription=Run Shutdown Timer
set targetPath=%CD%\shutdown_timer.bat
set folderPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs
set shortcutPath=%folderPath%\%shortcutName%.lnk
set iconPath=%SystemRoot%\System32\SHELL32.dll,27
set workingDirectory=%CD%
set hotKey=Ctrl+Alt+T

if exist "%shortcutPath%" (
    echo The shortcut "%shortcutPath%" exists. & echo. & echo Deleting the shortcut. & echo.
    del "%shortcutPath%"
) else (
    echo Creating the shortcut %shortcutPath% & echo.
    powershell -Command "$WScript=New-Object -ComObject WScript.Shell; $Shortcut=$WScript.CreateShortcut('%shortcutPath%'); $Shortcut.TargetPath='%targetPath%'; $Shortcut.IconLocation='%iconPath%'; $Shortcut.WorkingDirectory='%workingDirectory%'; $Shortcut.Description='%shortcutTargetDescription%'; $Shortcut.Hotkey='%hotKey%'; $Shortcut.WindowStyle=1; $Shortcut.Save()"
)

echo The operation is complete. & echo. & pause
