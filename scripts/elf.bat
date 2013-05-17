@echo off
title ELF files flasher
color 5f

:ELF
cls
ECHO 1 - Flash system.elf
ECHO 2 - Flash kernel.elf
ECHO 3 - Flash userdata.elf
ECHO 4 - Go to main menu.
ECHO.
SET /P M=Type your choice then press ENTER:
IF %M%==2 GOTO SYSELF
IF %M%==2 GOTO KERELF
IF %M%==2 GOTO DATELF
IF %M%==4 GOTO MENU
GOTO ELF

:SYSELF
cls
ECHO.
ECHO Booting in fastboot mode.
ECHO.
adb reboot-bootloader
ECHO Press Enter when blue led shows up.
ECHO.
ECHO Please keep your system.elf file in /ELF/SYSTEM/
pause
cls
for %%x in (ELF/SYSTEM/*.elf) do (
  set /a count=count+1
  set choice[!count!]=%%x
)
echo.
for /l %%x in (1,1,!count!) do (
   echo %%x] !choice[%%x]!
)
set /p Select=Select the system.elf you want to flash.
echo.
echo.
PAUSE.
ECHO Flashing system...
ECHO.
fastboot flash system ELF/SYSTEM/!choice[%select%]!
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
ECHO Done flashing the system. Please check the above log and if there are no errors, then continue.
ECHO.
PAUSE
adb kill-server
GOTO ELF

:KERELF
cls
ECHO.
ECHO Booting in fastboot mode.
ECHO.
adb reboot-bootloader
ECHO Press Enter when blue led shows up.
ECHO.
ECHO Please keep your system.elf file in /ELF/KERNEL/
pause
cls
for %%x in (ELF/KERNEL/*.elf) do (
  set /a count=count+1
  set choice[!count!]=%%x
)
echo.
for /l %%x in (1,1,!count!) do (
   echo %%x] !choice[%%x]!
)
set /p Select=Select the kernel.elf you want to flash.
echo.
echo.
PAUSE.
ECHO Flashing kernel...
ECHO.
fastboot flash boot ELF/KERNEL/!choice[%select%]!
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
ECHO Done flashing the kernel. Please check the above log and if there are no errors, then continue.
ECHO.
PAUSE
adb kill-server
GOTO ELF

:DATELF
cls
ECHO.
ECHO Booting in fastboot mode.
ECHO.
adb reboot-bootloader
ECHO Press Enter when blue led shows up.
ECHO.
ECHO Please keep your data.elf file in /ELF/DATA/
pause
cls
for %%x in (ELF/DATA/*.elf) do (
  set /a count=count+1
  set choice[!count!]=%%x
)
echo.
for /l %%x in (1,1,!count!) do (
   echo %%x] !choice[%%x]!
)
set /p Select=Select the data.elf you want to flash.
echo.
echo.
PAUSE.
ECHO Flashing data...
ECHO.
fastboot flash data ELF/DATA/!choice[%select%]!
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
ECHO Done flashing the data. Please check the above log and if there are no errors, then continue.
ECHO.
PAUSE
adb kill-server
GOTO ELF

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