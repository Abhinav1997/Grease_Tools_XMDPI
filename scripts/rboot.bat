@echo off
title Reboot Menu
color 5f

:RBOOT
cls
ECHO 1 - Normal Reboot.
ECHO 2 - Reboot to recovery.
ECHO 3 - Reboot to fastboot mode.
ECHO 4 - Power off the device.
ECHO 5 - Go to main menu.
ECHO.
SET /P M=Type your choice then press ENTER:
IF %M%==1 GOTO NBOOT
IF %M%==2 GOTO RRBOOT
IF %M%==3 GOTO FBOOT
IF %M%==4 GOTO POFF
IF %M%==5 GOTO MENU
GOTO RBOOT

:NBOOT
cls
ECHO Press ENTER if you want to reboot normally.
ECHO.
PAUSE
ECHO Rebooting...
ECHO.
adb reboot
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
PAUSE
adb kill-server
GOTO RBOOT

:RRBOOT
cls
ECHO Press ENTER if you want to reboot in recovery.
ECHO.
PAUSE
ECHO Rebooting in recovery....
ECHO.
adb reboot recovery
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
PAUSE
adb kill-server
GOTO RBOOT

:FBOOT
cls
ECHO Press ENTER if you want to reboot in fastboot/bootloader mode, i.e. when blue led lights up.
ECHO.
PAUSE
ECHO Rebooting in fastboot mode.
ECHO.
adb reboot-bootloader
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
PAUSE
adb kill-server
GOTO RBOOT

:POFF
cls
ECHO Press ENTER to power off your device.
ECHO.
PAUSE
ECHO Turning off.
ECHO.
adb shell reboot -p
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
PAUSE
adb kill-server
GOTO RBOOT

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