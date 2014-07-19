@echo off

echo Prepairing directories...>resources\console.txt
resources\tools\adb shell mkdir /sdcard/dlpc

echo Copying files...>resources\console.txt
resources\tools\adb push resources\scripts\dlpc\package\dlpc.x /sdcard/dlpc/
resources\tools\adb push resources\scripts\dlpc\package\dlp.x /sdcard/dlpc/
resources\tools\adb push resources\scripts\dlpc\package\hotreboot.x /sdcard/dlpc/

echo Installing and setting permissions...>resources\console.txt
resources\tools\adb shell su -c "mount -o remount rw, /system"
resources\tools\adb shell su -c "cp /sdcard/dlpc/* /system/dlpc"
resources\tools\adb shell su -c "mv /system/dlpc/dlpc.x /system/dlpc/dlpc"
resources\tools\adb shell su -c "mv /system/dlpc/dlp.x /system/dlpc/dlp"
resources\tools\adb shell su -c "mv /system/dlpc/hotreboot.x /system/dlpc/hotreboot"
resources\tools\adb shell su -c "chown 0.2000 /system/dlpc/dlpc"
resources\tools\adb shell su -c "chown 0.2000 /system/dlpc/dlp"
resources\tools\adb shell su -c "chown 0.2000 /system/dlpc/hotreboot"
resources\tools\adb shell su -c "chmod 755 /system/dlpc/dlpc"
resources\tools\adb shell su -c "chmod 755 /system/dlpc/dlp"
resources\tools\adb shell su -c "chmod 755 /system/dlpc/hotreboot"

echo Cleaning up...>resources\console.txt
resources\tools\adb shell rm -rf /sdcard/dlpc
resources\tools\adb shell su -c "rm /system/bin/dlpc"
resources\tools\adb shell su -c "cp /system/dlpc/dlpc /system/bin"
resources\tools\adb shell su -c "rm /system/bin/dlp"
resources\tools\adb shell su -c "cp /system/dlpc/dlp /system/bin"
resources\tools\adb shell su -c "rm /system/bin/hotreboot"
resources\tools\adb shell su -c "cp /system/dlpc/hotreboot /system/bin"
resources\tools\adb shell su -c "mount -o remount ro, /system"
echo Successfull installed>resources\console.txt

echo to check current run: dlp...>resources\console.txt
echo to change dw run: dlpc...>resources\console.txt
echo via a terminal emulator on Android itself...>resources\console.txt

pause
exit
