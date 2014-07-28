@echo off

resources\tools\adb start-server

echo Installing Lucky Patcher...>resources\console.txt
resources\tools\adb install resources\scripts\gapps\package\gapps\Lucky-Patcher-v4.4.3.apk

echo Prepairing directories...>resources\console.txt
resources\tools\adb shell mkdir /sdcard/gapps
resources\tools\adb shell mkdir /sdcard/lib
resources\tools\adb shell mkdir /sdcard/framework
resources\tools\adb shell mkdir /sdcard/etc
resources\tools\adb shell mkdir /sdcard/etc/permissions 

echo Copying files...>resources\console.txt
resources\tools\adb push resources\scripts\gapps\package\gapps\gapps /sdcard/gapps
resources\tools\adb push resources\scripts\gapps\package\gapps\lib /sdcard/lib
resources\tools\adb push resources\scripts\gapps\package\gapps\framework /sdcard/framework
resources\tools\adb push resources\scripts\gapps\package\gapps\etc\g.prop /sdcard/etc/
resources\tools\adb push resources\scripts\gapps\package\gapps\etc\permissions /sdcard/etc/permissions

echo Installing and setting permissions...>resources\console.txt
resources\tools\adb shell su -c "mount -o remount,rw /system"
resources\tools\adb shell su -c "cp /system/app/DownloadProvider.apk /system/app/DownloadProvider.apkama"
resources\tools\adb shell su -c "cp /system/app/DownloadProvider.odex /system/app/DownloadProvider.odexama"
resources\tools\adb shell su -c "cp /system/app/DownloadProviderUi.apk /system/app/DownloadProviderUi.apkama"
resources\tools\adb shell su -c "cp /system/app/DownloadProviderUi.odex /system/app/DownloadProviderUi.odexama"
resources\tools\adb shell su -c "cp /sdcard/gapps/* /system/app/"
resources\tools\adb shell su -c "chown 0.0 /system/app/*"
resources\tools\adb shell su -c "chmod 644 /system/app/*"
resources\tools\adb shell su -c "cp /sdcard/lib/* /system/lib/"
resources\tools\adb shell su -c "chown 0.0 /system/lib/*"
resources\tools\adb shell su -c "chmod 644 /system/lib/*"
resources\tools\adb shell su -c "cp /sdcard/framework/* /system/framework/"
resources\tools\adb shell su -c "chown 0.0 /system/framework/*"
resources\tools\adb shell su -c "chmod 644 /system/framework/*"
resources\tools\adb shell su -c "cp /sdcard/etc/g.prop /system/etc/"
resources\tools\adb shell su -c "chown 0.0 /system/etc/g.prop"
resources\tools\adb shell su -c "chmod 644 /system/etc/g.prop"
resources\tools\adb shell su -c "cp /sdcard/etc/permissions/* /system/etc/permissions/"
resources\tools\adb shell su -c "chown 0.0 /system/etc/permissions/*"
resources\tools\adb shell su -c "chmod 644 /system/etc/permissions/*"

echo Cleaning up...>resources\console.txt
resources\tools\adb shell rm -rf /sdcard/gapps
resources\tools\adb shell rm -rf /sdcard/lib
resources\tools\adb shell rm -rf /sdcard/framework
resources\tools\adb shell rm -rf /sdcard/etc
resources\tools\adb shell su -c "mount -o remount,ro /system"
echo Successfull installed>resources\console.txt

echo Open Lucky Patcher on Kindle and select toolbox at bottom; select patch to android; select disable signature verification in pkg manager...>resources\console.txt

resources\tools\adb kill-server

pause
exit
