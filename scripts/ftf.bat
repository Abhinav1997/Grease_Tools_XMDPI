@echo off
title FTF Maker and Extractor
color 5f

:ftf
cls
echo.
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
echo   Please select one of the following options you want to do :
echo.
echo   1.Extract files from ftf.
echo   2.Compress files as ftf
echo   3.Back to main menu.
echo.
echo.
set /p se=Select your decision 
if %se%==1 (goto eftf)
if %se%==2 (goto mftf)
if %se%==3 (goto MENU)

:eftf
cls
echo.
echo Please place the ftf file, i.e. the ftf you want to extract in /FTF/EXTRACT/INPUT directory.
echo.
pause
echo Extracting...
echo.
mkdir %cd%\FTF\EXTRACT\OUT
if exist "%cd%\FTF\EXTRACT\INPUT\*.ftf" (call %cd%\zip\7za.exe x "%cd%\FTF\EXTRACT\INPUT\*" -o"%cd%\FTF\EXTRACT\OUT")
if errorlevel 1 (
echo There's something wrong.
PAUSE
goto err
)
echo All done! Congrats. You can find the extracted files in /FTF/EXTRACT/OUT directory.
echo.
pause
goto ftf

:mftf
cls
echo.
echo Please place the files and folder you want to make ftf in /FTF/COMPRESS/INPUT directory.
echo.
pause
echo COMPRESSING...Please wait until the 7zip other window closes.
echo.
mkdir %cd%\FTF\COMPRESS\OUT
start %cd%\zip\7za a -mx9 -tzip "%cd%\FTF\COMPRESS\OUT\ftfout.ftf" "%cd%\FTF\COMPRESS\INPUT\*"
echo All done! Congrats. You can find the ftf in /FTF/COMPRESS/OUT folder named as ftfout
echo.
pause
goto ftf

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