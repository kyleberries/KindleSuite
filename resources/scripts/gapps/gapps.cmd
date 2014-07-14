@echo off
mkdir resources\gapps
echo Downloading ROM...
if not exist resources\scripts\gapps\gapps.zip wget -P resources/gapps http://d-h.st/udB
echo.
echo.
echo Unzipping ROM...
if not exist resources\scripts\gapps\files\Lucky-Patcher-v4.4.3.apk FBZip -e -p resources/scripts/gapps/gapps.zip resources/scripts/gapps/files/
del resourcs\scripts\*.zip
echo Plug kindle into regular cable with ADB Debugging enabled...
resources\tools\adb wait-for-device
echo.
echo Installing Lucky Patcher...
resources\tools\adb install resources\scripts\gapps\files\Lucky-Patcher-v4.4.3.apk
echo.
echo Making temporary directories...
resources\tools\adb shell mkdir /sdcard/appstore
resources\tools\adb shell mkdir /sdcard/bin
resources\tools\adb shell mkdir /sdcard/gapps
resources\tools\adb shell mkdir /sdcard/lib
resources\tools\adb shell mkdir /sdcard/framework
resources\tools\adb shell mkdir /sdcard/etc
resources\tools\adb shell mkdir /sdcard/etc/permissions 
echo.
echo Pushing files to SD...
resources\tools\adb push resources\scripts\gapps\files\appstore /sdcard/appstore
resources\tools\adb push resources\scripts\gapps\files\bin /sdcard/bin
resources\tools\adb push resources\scripts\gapps\files\gapps /sdcard/gapps
resources\tools\adb push resources\scripts\gapps\files\lib /sdcard/lib
resources\tools\adb push resources\scripts\gapps\files\framework /sdcard/framework
resources\tools\adb push resources\scripts\gapps\files\etc\permissions /sdcard/etc/permissions
echo.
echo.
echo Copying files to System and set permissions...
resources\tools\adb shell su -c "mount -o remount rw, /system"
resources\tools\adb shell su -c "mkdir /system/dlpc"
resources\tools\adb shell su -c "cp /system/app/DownloadProvider*.* /system/dlpc"
resources\tools\adb shell su -c "rm /system/app/DownloadProvider*.*"
resources\tools\adb shell su -c "cp /sdcard/bin/* /system/bin/"
resources\tools\adb shell su -c "chown 0.2000 /system/bin/asi"
resources\tools\adb shell su -c "chmod 755 /system/bin/asi"
resources\tools\adb shell su -c "cp /sdcard/gapps/* /system/app/"
resources\tools\adb shell su -c "chown 0.0 /system/app/*"
resources\tools\adb shell su -c "chmod 644 /system/app/*"
resources\tools\adb shell su -c "cp /sdcard/lib/* /system/lib/"
resources\tools\adb shell su -c "chown 0.0 /system/lib/*"
resources\tools\adb shell su -c "chmod 644 /system/lib/*"
resources\tools\adb shell su -c "cp /sdcard/framework/* /system/framework/"
resources\tools\adb shell su -c "chown 0.0 /system/framework/*"
resources\tools\adb shell su -c "chmod 644 /system/framework/*"
resources\tools\adb shell su -c "cp /sdcard/etc/permissions/* /system/etc/permissions/"
resources\tools\adb shell su -c "chown 0.0 /system/etc/permissions/*"
resources\tools\adb shell su -c "chmod 644 /system/etc/permissions/*"
echo.
echo.
echo wait
resources\tools\adb shell su -c "/system/bin/asi"
echo.
echo removing temp files...
resources\tools\adb shell rm -rf /sdcard/appstore
resources\tools\adb shell rm -rf /sdcard/gapps
resources\tools\adb shell rm -rf /sdcard/lib
resources\tools\adb shell rm -rf /sdcard/framework
resources\tools\adb shell rm -rf /sdcard/etc
resources\tools\adb shell rm -rf /sdcard/etc/permissions
resources\tools\adb shell su -c "rm -f /system/bin/asi"
echo.
echo unmounting
resources\tools\adb shell su -c "mount -o remount ro, /system"
echo successfull unmounted
echo.
echo.
echo File copy complete, open Lucky Patcher on Kindle and select toolbox at bottom.
echo Select patch to android. 
echo Select disable signature verification in pkg manager.
echo Congratulations, You now have Google Play Store!
echo ONLY NOT STOCK ROM: In order to use the included Amazon Appstore, please do not update the app.
pause
exit
