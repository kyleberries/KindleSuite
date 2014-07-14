@echo off
mkdir resources\gapps
echo Downloading ROM...
if not exist resources\scripts\gapps\gapps.zip wget -P resources/gapps http://dl.kfsowi.com/tools/kindlesuite/gapps.zip
echo.
echo.
echo Unzipping ROM...
if not exist resources\scripts\gapps\files\Lucky-Patcher-v4.1.9.apk FBZip -e -p resources/scripts/gapps/gapps.zip resources/scripts/gapps/files/
del resourcs\scripts\*.zip
echo Plug kindle into regular cable with ADB Debugging enabled...
resources\tools\adb wait-for-device
echo.
echo Installing Lucky Patcher...
resources\tools\adb install resources\scripts\gapps\files\Lucky-Patcher-v4.1.9.apk
resources\tools\adb install resources\scripts\gapps\files\amazon_appstore.apk
echo.
echo Making temporary directories...
resources\tools\adb shell mkdir /sdcard/gapps
resources\tools\adb shell mkdir /sdcard/lib
resources\tools\adb shell mkdir /sdcard/framework
resources\tools\adb shell mkdir /sdcard/etc
resources\tools\adb shell mkdir /sdcard/etc/permissions 
echo.
echo Pushing files to SD...
resources\tools\adb push resources\scripts\gapps\files\gapps /sdcard/gapps
resources\tools\adb push resources\scripts\gapps\files\lib /sdcard/lib
resources\tools\adb push resources\scripts\gapps\files\framework /sdcard/framework
resources\tools\adb push resources\scripts\gapps\files\etc\permissions /sdcard/etc/permissions
echo.
echo.
echo Copying files to System...
resources\tools\adb shell su -c "mount -o remount rw, /system"
resources\tools\adb shell su -c "rm /system/app/DownloadProvider*.*"
resources\tools\adb shell su -c "cp /sdcard/gapps/* /system/app/"
resources\tools\adb shell su -c "cp /sdcard/lib/* /system/lib/"
resources\tools\adb shell su -c "cp /sdcard/framework/* /system/framework/"
resources\tools\adb shell su -c "cp /sdcard/etc/permissions/* /system/etc/permissions/"
echo.
echo.
echo removing temp files...
resources\tools\adb shell rm -rf /sdcard/gapps
resources\tools\adb shell rm -rf /sdcard/lib
resources\tools\adb shell rm -rf /sdcard/framework
resources\tools\adb shell rm -rf /sdcard/etc
resources\tools\adb shell rm -rf /sdcard/etc/permissions

echo.
echo.
echo File copy complete, open Lucky Patcher on kindle and select toolbox at bottom.
echo Select patch to android. 
echo Select disable signature verification in pkg manager.
echo Congratulations, You now have Google Play Store!
echo In order to use the included Amazon Appstore, please do not update the app.
pause
exit
