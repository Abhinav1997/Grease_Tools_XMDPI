@echo off
title Zipper/Unzipper
color 5f

:uz
cls
echo.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo   Please select one of the following options you want to do :
echo.
echo   1.Unzip/Extract zip file.
echo   2.Compress/Zip/Archieve files and folders.
echo   3.Back to main menu.
echo.
echo.
set /p se=Select your decision 
if %se%==1 (goto unzip)
if %se%==2 (goto zip)
if %se%==3 (goto MENU)

:unzip
cls
echo.
echo Please place the zip file, i.e. the zip you want to extract in /ZU/EXTRACT/INPUT directory.
echo.
pause
echo Extracting...
echo.
mkdir %cd%\ZU\EXTRACT\OUT
if exist "%cd%\ZU\EXTRACT\INPUT\*.zip" (call %cd%\zip\7za.exe x "%cd%\ZU\EXTRACT\INPUT\*" -o"%cd%\ZU\EXTRACT\OUT")
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
echo All done! Congrats. You can find the extracted files in /ZU/EXTRACT/OUT directory.
echo.
pause
goto uz

:zip
cls
echo.
echo Please place the files and folder you want to compress in /ZU/COMPRESS/INPUT directory.
echo.
pause
echo COMPRESSING...Please wait until the 7zip other window closes.
echo.
mkdir %cd%\ZU\COMPRESS\OUT
start %cd%\zip\7za a -mx9 -tzip "%cd%\ZU\COMPRESS\OUT\compressed.zip" "%cd%\ZU\COMPRESS\INPUT\*"
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
echo All done! Congrats. You can find the compressed zip in /ZU/COMPRESS/OUT directory.
echo.
pause
goto uz

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