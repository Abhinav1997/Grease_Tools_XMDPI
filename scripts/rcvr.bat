@echo off
title APK Installer
color 5f

:RCY
cls
echo Please place the recovery.img in /RECOVERY directory.
echo.
pause
echo Rebooting in fastboot mode.
echo.
adb reboot-bootloader
echo Press any key one the blue LED lights up.
echo.
pause
echo Flashing..
echo.
fastboot flash recovery recovery.img
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
echo Done!
echo.
pause
goto MENU

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