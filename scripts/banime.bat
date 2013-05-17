@echo off
title Bootanimation Flasher
color 5f
setlocal enabledelayedexpansion
set count=0

:BOOTANIME
cls
ECHO Please place the bootanimation.zip in the /BOOTANIMATION folder.
ECHO.
PAUSE
for %%x in (BOOTANIMATION/*.zip) do (
  set /a count=count+1
  set choice[!count!]=%%x
)
echo.
for /l %%x in (1,1,!count!) do (
   echo %%x] !choice[%%x]!
)
set /p Select=Select the bootanimation you want to flash.
echo.
echo.
ECHO Flashing bootanimation.zip.
ECHO.
adb push BOOTANIMATION/!choice[%select%]! /system/media
adb shell chmod 644 /system/media/bootanimation.zip
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
ECHO Done!
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