@echo off
title IMG files flasher
color 5f

:IMG
cls
ECHO 1 - Flash system.img
ECHO 2 - Flash boot.img
ECHO 3 - Flash userdata.img
ECHO 4 - Go to main menu.
ECHO.
SET /P M=Type your choice then press ENTER:
IF %M%==1 GOTO SYSIMG
IF %M%==2 GOTO KERIMG
IF %M%==3 GOTO DATIMG
IF %M%==4 GOTO MENU
GOTO IMG

:SYSIMG
cls
ECHO Booting in fastboot mode.
ECHO.
adb reboot-bootloader
ECHO Press Enter when blue led shows up.
ECHO.
PAUSE
ECHO Please keep your system.img file in /IMG/SYSTEM/.
PAUSE
cls
for %%x in (IMG/SYSTEM/*.img) do (
  set /a count=count+1
  set choice[!count!]=%%x
)
echo.
for /l %%x in (1,1,!count!) do (
   echo %%x] !choice[%%x]!
)
set /p Select=Select the system.img you want to flash.
echo.
echo.
ECHO Flashing system...
ECHO.
fastboot flash system IMG/SYSTEM/!choice[%select%]!
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
ECHO Done flashing the system. Please check the above log and if there are no errors, then continue.
ECHO.
PAUSE
adb kill-server
GOTO IMG

:KERIMG
cls
ECHO Booting in fastboot mode.
ECHO.
adb reboot-bootloader
ECHO Press Enter when blue led shows up.
ECHO.
PAUSE.
ECHO Please keep your boot.img file in /IMG/KERNEL/
PAUSE
cls
for %%x in (IMG/KERNEL/*.img) do (
  set /a count=count+1
  set choice[!count!]=%%x
)
echo.
for /l %%x in (1,1,!count!) do (
   echo %%x] !choice[%%x]!
)
set /p Select=Select the boot.img you want to flash.
echo.
PAUSE
ECHO.
ECHO Flashing kernel...
ECHO.
fastboot flash boot IMG/KERNEL/!choice[%select%]!
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
ECHO Done flashing the kernel. Please check the above log and if there are no errors, then continue.
ECHO.
PAUSE
adb kill-server
GOTO IMG

:DATIMG
cls
ECHO.
ECHO Booting in fastboot mode.
ECHO.
adb reboot-bootloader
ECHO Press Enter when blue led shows up.
ECHO.
PAUSE.
ECHO Please keep your userdata.img file in /IMG/DATA/
PAUSE
cls
for %%x in (IMG/DATA/*.img) do (
  set /a count=count+1
  set choice[!count!]=%%x
)
echo.
for /l %%x in (1,1,!count!) do (
   echo %%x] !choice[%%x]!
)
set /p Select=Select the data.img you want to flash.

ECHO Flashing data.
ECHO.
fastboot flash data IMG/DATA/!choice[%select%]!
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
ECHO Done flashing the user data. Please check the above log and if there are no errors, then continue.
ECHO.
PAUSE
adb kill-server
GOTO IMG

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