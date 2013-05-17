@echo off
title ADB Pusher
color 5f

:PUSH
cls
ECHO 1 - Push apk to /system/app as system app.
ECHO 2 - Push framework-res.apk to /system/framework
ECHO 3 - Push SemcGenericUxpRes.apk to /system/framework
ECHO 4 - Return to main menu.
ECHO.
SET /P M=Type your choice then press ENTER:
IF %M%==1 GOTO PUSHSYS
IF %M%==2 GOTO PUSHFRA
IF %M%==3 GOTO PUSHSGU
IF %M%==4 GOTO MENU

:PUSHSYS
cls
ECHO Please keep your apk in /PUSH/SYS/ directory, then press ENTER to continue.
ECHO.
PAUSE
adb remount
FOR /r PUSH/SYS/ %%f in (*.apk) DO adb push "%%f" /system/app/
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
adb shell chmod 644 /system/app/*.*
ECHO Done! Press any key to reboot.
ECHO.
PAUSE
ECHO Rebooting...
ECHO.
adb reboot
adb kill-server
GOTO PUSH

:PUSHFRA
cls
ECHO Please keep the framework-res.apk in /PUSH/FRA/ directory, then press ENTER to continue.
ECHO.
PAUSE
adb remount
adb push PUSH/FRA/framework-res.apk /system/framework/
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
adb shell chmod 644 /system/framework/framework-res.apk
ECHO Done! Press any key to reboot.
ECHO.
PAUSE
ECHO Rebooting...
ECHO.
adb reboot
adb kill-server
GOTO PUSH

:PUSHSGU
cls
ECHO Please keep the SemcGenericUxpRes.apk in /PUSH/SGU/ directory, then press ENTER to continue.
ECHO.
PAUSE
adb remount
adb push PUSH/SGU/SemcGenericUxpRes.apk /system/framework/
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
adb shell chmod 644 /system/framework/SemcGenericUxpRes.apk.apk
ECHO Done! Press any key to reboot.
ECHO.
PAUSE
ECHO Rebooting...
ECHO.
adb reboot
adb kill-server
GOTO PUSH

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