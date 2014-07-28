@echo off

resources\tools\adb start-server

echo Prepairing directories...>resources\console.txt
resources\tools\adb shell mkdir /sdcard/dlpc

echo Copying files...>resources\console.txt
resources\tools\adb push resources\scripts\dlpc\package\dlpc.x /sdcard/dlpc/
resources\tools\adb push resources\scripts\dlpc\package\dlp.x /sdcard/dlpc/
resources\tools\adb push resources\scripts\dlpc\package\hotreboot.x /sdcard/dlpc/

echo Installing and setting permissions...>resources\console.txt
resources\tools\adb shell su -c "mount -o remount,rw /system"
resources\tools\adb shell su -c "mv /sdcard/dlpc/dlpc.x /system/bin/dlpc"
resources\tools\adb shell su -c "mv /sdcard/dlpc/dlp.x /system/bin/dlp"
resources\tools\adb shell su -c "mv /sdcard/dlpc/hotreboot.x /system/bin/hotreboot"
resources\tools\adb shell su -c "chown 0.2000 /system/bin/dlpc"
resources\tools\adb shell su -c "chown 0.2000 /system/bin/dlp"
resources\tools\adb shell su -c "chown 0.2000 /system/binc/hotreboot"
resources\tools\adb shell su -c "chmod 755 /system/bin/dlpc"
resources\tools\adb shell su -c "chmod 755 /system/bin/dlp"
resources\tools\adb shell su -c "chmod 755 /system/bin/hotreboot"

echo Cleaning up...>resources\console.txt
resources\tools\adb shell rm -rf /sdcard/dlpc
resources\tools\adb shell su -c "mount -o remount,ro /system"
echo Successfull installed>resources\console.txt

echo Check working Appstore with: dlp; to change Appstore run: dlpc...inside a terminal on android...>resources\console.txt

resources\tools\adb kill-server

pause
exit
