@echo off

resources\tools\adb start-server

echo Prepairing directories...>resources\console.txt
resources\tools\adb shell mkdir /sdcard/hosts

echo Copying files...>resources\console.txt
resources\tools\adb push resources\scripts\mods\hosts\package\hosts.x /sdcard/hosts

echo Installing and setting permissions...>resources\console.txt
resources\tools\adb shell su -c "mount -o remount,rw /system"
resources\tools\adb shell su -c "cp /sdcard/hosts/hosts.x /system/etc/hosts"
#resources\tools\adb shell su -c "chown 0.0 /system/etc/hosts"
#resources\tools\adb shell su -c "chmod 644 /system/etc/hosts"

echo Cleaning up...>resources\console.txt
resources\tools\adb shell rm -rf /sdcard/hosts
resources\tools\adb shell su -c "mount -o remount,ro /system"
echo Successfull installed>resources\console.txt

echo Hostfile updated. Happy surfing...>resources\console.txt

resources\tools\adb kill-server

pause
exit
