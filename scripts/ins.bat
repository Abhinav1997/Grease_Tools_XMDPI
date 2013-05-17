@echo off
title APK Installer
color 5f

:IAPK
cls
ECHO Post all your apks you want to install in /INSTALL folder and press enter.
ECHO.
PAUSE
ECHO Installing...
ECHO.
FOR /r INSTALL/ %%f in (*.apk) DO adb install "%%f"
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
ECHO DONE! Press any key to return to main menu.
ECHO.
PAUSE
adb kill-server
GOTO MENU

:err
cls
echo.
echo  ___________________________________________________________________________
echo.
echo                         Failed. Press Any key to exit.
echo  ___________________________________________________________________________
echo.
pause
exit

:MENU
call GRT.bat