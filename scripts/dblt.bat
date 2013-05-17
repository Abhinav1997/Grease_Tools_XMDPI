@echo off
title Debloater
color 5f

:DBLT
cls
ECHO 1 - Remove Sony bloatware apps.
ECHO 2 - Remove Facebook related apps.
ECHO 3 - Remove Timescape related apps.
ECHO 4 - Remove Widgets.
ECHO 5 - Remove All.
ECHO 6 - Go to main menu.
ECHO.
SET /P M=Type your choice then press ENTER:
IF %M%==1 GOTO SBA
IF %M%==2 GOTO FRA
IF %M%==3 GOTO TRA
IF %M%==4 GOTO WID
IF %M%==5 GOTO BLT
IF %M%==6 GOTO MENU
GOTO DBLT

:SBA
cls
ECHO Press ENTER only if you are completely sure.
ECHO.
PAUSE
ECHO Rebooting in recovery.
ECHO.
adb reboot recovery
ECHO Press ENTER once in recovery.
ECHO.
PAUSE
ECHO Mounting system.
ECHO.
adb shell mount /system
ECHO Removing all the stock bloatware apps.
ECHO.
adb shell rm /system/app/AccessoryKeyDispatcher.apk
adb shell rm /system/app/CdfInfoAccessor.apk
adb shell rm /system/app/chinesetextinput.apk
adb shell rm /system/app/com.sonyericsson.androidapp.foursquare_ext_ts3.apk
adb shell rm /system/app/com.sonyericsson.androidapp.timescapefeedsplugin.a pk
adb shell rm /system/app/com.whatsapp.apk
adb shell rm /system/app/CoreNotificationPublisher.apk
adb shell rm /system/app/CrashSMS.apk
adb shell rm /system/app/GenieWidget.apk
adb shell rm /system/app/GoogleFeedback.apk
adb shell rm /system/app/GooglePartnerSetup.apk
adb shell rm /system/app/GoogleQuickSearchBox.apk
adb shell rm /system/app/HTMLViewer.apk
adb shell rm /system/app/IddAgent.apk
adb shell rm /system/app/JapaneseIME.apk
adb shell rm /system/app/LearningClient.apk
adb shell rm /system/app/letsgolf_A_353.apk
adb shell rm /system/app/LiveWallpapers.apk
adb shell rm /system/app/LivewareManager.apk
adb shell rm /system/app/MagicSmokeWallpapers.apk
adb shell rm /system/app/MediaUploader.apk
adb shell rm /system/app/NotificationProvider.apk
adb shell rm /system/app/officesuite.apk
adb shell rm /system/app/OmaDatasyncService.apk
adb shell rm /system/app/playnowclientarvato.apk
adb shell rm /system/app/playnowappinstaller.apk
adb shell rm /system/app/playnowclient.apk
adb shell rm /system/app/POBoxSknPink.apk
adb shell rm /system/app/POBoxSknWood.apk
adb shell rm /system/app/Protips.apk
adb shell rm /system/app/qcsemcservice.apk
adb shell rm /system/app/Radio.apk
adb shell rm /system/app/retaildemo.apk
adb shell rm /system/app/SecureClockJava.apk
adb shell rm /system/app/SemcCrashMonitor.apk
adb shell rm /system/app/SemcDlna.apk
adb shell rm /system/app/SEMCFacebookService.apk
adb shell rm /system/app/SEMCSetupWizard.apk
adb shell rm /system/app/SemcVideoEdit.apk
adb shell rm /system/app/Stk.apk
adb shell rm /system/app/Street.apk
adb shell rm /system/app/SyncWizard.apk
adb shell rm /system/app/touchnote.apk
adb shell rm /system/app/trackid.apk
adb shell rm /system/app/UnsupportedHeadsetNotification.apk
adb shell rm /system/app/usersupport.apk
adb shell rm /system/app/VisualizationWallpapers.apk
adb shell rm /system/app/WallpaperPicker.apk
ECHO Done! Press any key to return to previous menu.
ECHO.
PAUSE
adb kill-server
GOTO DBLT

:FRA
cls
ECHO Press ENTER only if you are completely sure.
ECHO.
PAUSE
ECHO Rebooting in recovery.
ECHO.
adb reboot recovery
ECHO Press ENTER once in recovery.
ECHO.
PAUSE
ECHO Mounting system.
ECHO.
adb shell mount /system
ECHO Removing all the facebook related apps.
ECHO. 
adb shell rm /system/app/facebook.apk
adb shell rm /system/app/FBCalendarSync.apk
adb shell rm /system/app/FBMediaDiscovery.apk
adb shell rm /system/app/FBMusicLike.apk
adb shell rm /system/app/FBNotificationPublisher.apk
adb shell rm /system/app/FBSetupwizard.apk
ECHO Done! Press any key to return to previous menu.
ECHO.
PAUSE
adb kill-server
GOTO DBLT

:TRA
cls
ECHO Press ENTER only if you are completely sure.
ECHO.
PAUSE
ECHO Rebooting in recovery.
ECHO.
adb reboot recovery
ECHO Press ENTER once in recovery.
ECHO.
PAUSE
ECHO Mounting system.
ECHO.
adb shell mount /system
ECHO Removing all the timescape related apps.
ECHO. 
adb shell rm /system/app/EventStream.apk
adb shell rm /system/app/EventStreamPluginCallLog.apk
adb shell rm /system/app/EventStreamPluginFacebook.apk
adb shell rm /system/app/EventStreamPluginTelephony.apk
adb shell rm /system/app/EventStreamPluginTwitter.apk
adb shell rm /system/app/timescapelegacywrapper.apk
adb shell rm /system/app/TimescapeSpline.apk
adb shell rm /system/app/TimescapeWidget.apk
ECHO Done! Press any key to return to previous menu.
ECHO.
PAUSE
adb kill-server
GOTO DBLT

:WID
cls
ECHO Press ENTER only if you are completely sure.
ECHO.
PAUSE
ECHO Rebooting in recovery.
ECHO.
adb reboot recovery
ECHO Press ENTER once in recovery.
ECHO.
PAUSE
ECHO Mounting system.
ECHO.
adb shell mount /system
ECHO Removing all the widgets.
ECHO. 
adb shell rm /system/app/datatrafficswitch.apk
adb shell rm /system/app/DigitalClockWidget.apk
adb shell rm /system/app/GenieWidget.apk
adb shell rm /system/app/MediaWidget.apk
adb shell rm /system/app/MusicWidget.apk
adb shell rm /system/app/PhotoWidget.apk
adb shell rm /system/app/widgetdigitalclock.apk
adb shell rm /system/app/widgetonoff.apk
adb shell rm /system/app/StatusSwitch.apk
ECHO Done! Press any key to return to previous menu.
ECHO.
PAUSE
adb kill-server
GOTO DBLT

:BLT
cls
ECHO Press ENTER only if you are completely sure.
ECHO.
PAUSE
ECHO Rebooting in recovery.
ECHO.
adb reboot recovery
ECHO Press ENTER once in recovery.
ECHO.
PAUSE
ECHO Mounting system.
ECHO.
adb shell mount /system
ECHO Removing complete bloatwares. This may take time.
ECHO.
adb shell rm /system/app/AccessoryKeyDispatcher.apk
adb shell rm /system/app/CdfInfoAccessor.apk
adb shell rm /system/app/chinesetextinput.apk
adb shell rm /system/app/com.sonyericsson.androidapp.foursquare_ext_ts3.apk
adb shell rm /system/app/com.sonyericsson.androidapp.timescapefeedsplugin.a pk
adb shell rm /system/app/com.whatsapp.apk
adb shell rm /system/app/CoreNotificationPublisher.apk
adb shell rm /system/app/CrashSMS.apk
adb shell rm /system/app/GenieWidget.apk
adb shell rm /system/app/GoogleFeedback.apk
adb shell rm /system/app/GooglePartnerSetup.apk
adb shell rm /system/app/GoogleQuickSearchBox.apk
adb shell rm /system/app/HTMLViewer.apk
adb shell rm /system/app/IddAgent.apk
adb shell rm /system/app/JapaneseIME.apk
adb shell rm /system/app/LearningClient.apk
adb shell rm /system/app/letsgolf_A_353.apk
adb shell rm /system/app/LiveWallpapers.apk
adb shell rm /system/app/LivewareManager.apk
adb shell rm /system/app/MagicSmokeWallpapers.apk
adb shell rm /system/app/MediaUploader.apk
adb shell rm /system/app/NotificationProvider.apk
adb shell rm /system/app/officesuite.apk
adb shell rm /system/app/OmaDatasyncService.apk
adb shell rm /system/app/playnowclientarvato.apk
adb shell rm /system/app/playnowappinstaller.apk
adb shell rm /system/app/playnowclient.apk
adb shell rm /system/app/POBoxSknPink.apk
adb shell rm /system/app/POBoxSknWood.apk
adb shell rm /system/app/Protips.apk
adb shell rm /system/app/qcsemcservice.apk
adb shell rm /system/app/Radio.apk
adb shell rm /system/app/retaildemo.apk
adb shell rm /system/app/SecureClockJava.apk
adb shell rm /system/app/SemcCrashMonitor.apk
adb shell rm /system/app/SemcDlna.apk
adb shell rm /system/app/SEMCFacebookService.apk
adb shell rm /system/app/SEMCSetupWizard.apk
adb shell rm /system/app/SemcVideoEdit.apk
adb shell rm /system/app/Stk.apk
adb shell rm /system/app/Street.apk
adb shell rm /system/app/SyncWizard.apk
adb shell rm /system/app/touchnote.apk
adb shell rm /system/app/trackid.apk
adb shell rm /system/app/UnsupportedHeadsetNotification.apk
adb shell rm /system/app/usersupport.apk
adb shell rm /system/app/VisualizationWallpapers.apk
adb shell rm /system/app/WallpaperPicker.apk
adb shell rm /system/app/facebook.apk
adb shell rm /system/app/FBCalendarSync.apk
adb shell rm /system/app/FBMediaDiscovery.apk
adb shell rm /system/app/FBMusicLike.apk
adb shell rm /system/app/FBNotificationPublisher.apk
adb shell rm /system/app/FBSetupwizard.ap
adb shell rm /system/app/EventStream.apk
adb shell rm /system/app/EventStreamPluginCallLog.apk
adb shell rm /system/app/EventStreamPluginFacebook.apk
adb shell rm /system/app/EventStreamPluginTelephony.apk
adb shell rm /system/app/EventStreamPluginTwitter.apk
adb shell rm /system/app/timescapelegacywrapper.apk
adb shell rm /system/app/TimescapeSpline.apk
adb shell rm /system/app/TimescapeWidget.apk
adb shell rm /system/app/datatrafficswitch.apk
adb shell rm /system/app/DigitalClockWidget.apk
adb shell rm /system/app/GenieWidget.apk
adb shell rm /system/app/MediaWidget.apk
adb shell rm /system/app/MusicWidget.apk
adb shell rm /system/app/PhotoWidget.apk
adb shell rm /system/app/widgetdigitalclock.apk
adb shell rm /system/app/widgetonoff.apk
adb shell rm /system/app/StatusSwitch.apk
ECHO Done! Press any key to return to previous menu.
ECHO.
PAUSE
adb kill-server
GOTO DBLT

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