@echo off
title SIN files flasher
color 5f

:SIN
cls
ECHO 1 - Flash system.sin
ECHO 2 - Flash boot.sin
ECHO 3 - Flash userdata.sin
ECHO 4 - Go to main menu.
ECHO.
SET /P M=Type your choice then press ENTER:
IF %M%==1 GOTO SYSSIN
IF %M%==2 GOTO KERSIN
IF %M%==3 GOTO DATSIN
IF %M%==4 GOTO MENU
GOTO SIN

:SYSSIN
cls
ECHO Booting in fastboot mode.
ECHO.
adb reboot-bootloader
ECHO Press Enter when blue led shows up.
ECHO.
PAUSE
ECHO Please keep your system.sin file in /SIN/SYSTEM/.
PAUSE
cls
for %%x in (SIN/SYSTEM/*.sin) do (
  set /a count=count+1
  set choice[!count!]=%%x
)
echo.
for /l %%x in (1,1,!count!) do (
   echo %%x] !choice[%%x]!
)
set /p Select=Select the system.sin you want to flash.
ECHO.
ECHO Flashing system....
ECHO.
fastboot flash system SIN/SYSTEM/!choice[%select%]!
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
ECHO Done flashing the system. Please check the above log and if there are no errors, then continue.
ECHO.
PAUSE
adb kill-server
GOTO SIN

:KERSIN
cls
ECHO.
ECHO Booting in fastboot mode.
ECHO.
adb reboot-bootloader
ECHO Press Enter when blue led shows up.
ECHO.
PAUSE
ECHO Please keep your kernel.sin file in /SIN/KERNEL/
PAUSE
cls
for %%x in (SIN/KERNEL/*.sin) do (
  set /a count=count+1
  set choice[!count!]=%%x
)
echo.
for /l %%x in (1,1,!count!) do (
   echo %%x] !choice[%%x]!
)
set /p Select=Select the kernel.sin you want to flash.
echo.
ECHO Flashing kernel....
ECHO.
fastboot flash boot SIN/KERNEL/!choice[%select%]!
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
ECHO Done flashing the kernel. Please check the above log and if there are no errors, then continue.
echo.
PAUSE
adb kill-server
GOTO SIN

:DATSIN
cls
ECHO.
ECHO Booting in fastboot mode.
ECHO.
adb reboot-bootloader
ECHO Press Enter when blue led shows up.
ECHO.
PAUSE
ECHO Please keep your userdata.sin file in /SIN/DATA/
PAUSE
cls
for %%x in (SIN/DATA/*.sin) do (
  set /a count=count+1
  set choice[!count!]=%%x
)
echo.
for /l %%x in (1,1,!count!) do (
   echo %%x] !choice[%%x]!
)
set /p Select=Select the data.sin you want to flash.
echo.
ECHO Flashing data.
ECHO.
fastboot flash data SIN/DATA/!choice[%select%]!
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
ECHO Done flashing the user data. Please check the above log and if there are no errors, then continue.
ECHO.
PAUSE
adb kill-server
GOTO SIN

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