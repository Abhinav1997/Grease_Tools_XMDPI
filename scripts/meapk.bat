@echo off
title APK Installer
color 5f

:MEAPK
echo   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo   Please select one of the following options you want to do :
echo.
echo   1.Extract apk file.
echo   2.Make files and folders an apk.
echo   3.Return to main menu
echo.
echo.
set /p se=Select your decision 
if %se%==1 (goto apkext)
if %se%==2 (goto apkmake)
if %se%==3 (goto MENU)

:apkext
cls
echo.
echo Please place the apk file, i.e. the apk you want to extract in /MEAPK/EXTRACT/INPUT directory.
echo.
pause
echo Extracting...
echo.
mkdir %cd%\MEAPK\EXTRACT\OUT
if exist "%cd%\MEAPK\EXTRACT\INPUT\*.apk" (call %cd%\zip\7za.exe x "%cd%\MEAPK\EXTRACT\INPUT\*" -o"%cd%\MEAPK\EXTRACT\OUT")
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
echo All done! Congrats. You can find the extracted files in /MEAPK/EXTRACT/OUT directory.
echo.
pause
goto MENU

:apkmake
cls
echo.
echo Please place the files and folder you want to make apk of in /MEAPK/MAKEAPK/INPUT directory.
echo.
pause
echo Making...Please wait until the other window closes.
echo.
mkdir %cd%\MEAPK\MAKEAPK\OUT
start %cd%\zip\7za a -mx9 -tzip "%cd%\MEAPK\MAKEAPK\OUT\NEW.apk" "%cd%\MEAPK\MAKEAPK\INPUT\*"
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
echo All done! Congrats. You can find the compressed zip in /MEAPK/MAKEAPK/OUT directory.
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