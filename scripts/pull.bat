@echo off
title ADB Puller
color 5f

:PULL
cls
ECHO 1 - Pull SystemUI from /system/app
ECHO 2 - Pull framework-res.apk from /system/framework
ECHO 3 - Pull SemcGenericUxpRes.apk from /system/framework
ECHO 4 - Pull all system apks.
ECHO 5 - Pull all installed apks.
ECHO 6 - Return to main menu.
ECHO.
SET /P M=Type your choice then press ENTER:
IF %M%==1 GOTO PULLSUI
IF %M%==2 GOTO PULLFRA
IF %M%==3 GOTO PULLSGU
IF %M%==4 GOTO PULLSYS
IF %M%==5 GOTO PULLDAP
IF %M%==6 GOTO MENU

:PULLSUI
cls
ECHO Press ENTER if you want to pull SystemUI from your device. You can find it in /PULL/SUI/ directory.
ECHO.
PAUSE
ECHO Pulling
ECHO.
adb pull /system/app/SystemUI.apk PULL/SUI
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
ECHO Done. Press any key to return to previous menu.
ECHO.
PAUSE
adb kill-server
GOTO PULL

:PULLFRA
cls
ECHO Press ENTER if you want to pull framework-res.apk from your device. You can find it in /PULL/FRA/ directory.
ECHO.
PAUSE
ECHO Pulling
ECHO.
adb pull /system/framework/framework-res.apk PULL/FRA
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
ECHO Done. Press any key to return to previous menu.
ECHO.
PAUSE
adb kill-server
GOTO PULL

:PULLSGU
cls
ECHO Press ENTER if you want to pull SemcGenericUxpRes.apk from your device. You can find it in /PULL/SGU/ directory.
ECHO.
PAUSE
ECHO Pulling
ECHO.
adb pull /system/framework/SemcGenericUxpRes.apk PULL/SGU
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
ECHO Done. Press any key to return to previous menu.
ECHO.
PAUSE
adb kill-server
GOTO PULL

:PULLSYS
cls
ECHO Press ENTER if you want to pull all system apps from your device. You can find it in /PULL/SYS/ directory.
ECHO.
PAUSE
ECHO Pulling
ECHO.
adb pull /system/app/ PULL/SYS
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
ECHO Done. Press any key to return to previous menu.
ECHO.
PAUSE
adb kill-server
GOTO PULL

:PULLDAP
cls
ECHO Press ENTER if you want to pull all installed apps from your device. You can find it in /PULL/DAP/ directory.
ECHO.
PAUSE
ECHO Pulling
ECHO.
adb pull /data/app/ PULL/DAP
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
ECHO Done. Press any key to return to previous menu.
ECHO.
PAUSE
adb kill-server
GOTO PULL

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