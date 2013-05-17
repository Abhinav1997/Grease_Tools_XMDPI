@echo off
ECHO OFF
color 5f

:MENU
CLS
ECHO.
echo                        -------------------------------
echo                        -        Grease Tools         -
echo                        -          Abhinav2           -
echo                        -------------------------------
ECHO.
ECHO 1 - Flash img files. Includes kernel, system and userdata.
ECHO 2 - Flash sin files. Include kernel, system and userdata.
ECHO 3 - Flash elf files. Includes kernel, system and userata.
ECHO 4 - Reboot and power-off menu.
ECHO 5 - Install APKs.
ECHO 6 - Debloat 4.1.B.0.587 firmware Menu
ECHO 7 - Flash Bootanimation.
ECHO 8 - APK Push Menu.
ECHO 9 - APK Pull Menu
ECHO 10 - Zip/Unzip files.
ECHO 11 - FTF Maker
ECHO 12 - APK Maker and Extractor
ECHO 13 - Exit this tool.
ECHO.
SET /P M=Type your choice then press ENTER:
IF %M%==1 call scripts\img.bat
IF %M%==2 call scripts\sin.bat
IF %M%==3 call scripts\elf.bat
IF %M%==4 call scripts\rboot.bat
IF %M%==5 call scripts\ins.bat
IF %M%==6 call scripts\dblt.bat
IF %M%==7 call scripts\banime.bat
IF %M%==8 call scripts\push.bat
IF %M%==9 call scripts\pull.bat
IF %M%==10 call scripts\uz.bat
IF %M%==11 call scripts\ftf
IF %M%==12 call scripts\meapk.bat
IF %M%==13 GOTO EOF

:EOF
exit
