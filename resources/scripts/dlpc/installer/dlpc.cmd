@echo off
echo Plug kindle into regular cable with ADB Debugging enabled...
echo.
echo You need to have Gapps already installed
echo.
resources\tools\adb wait-for-device
echo.
echo pushing to sdcard....
resources\tools\adb shell mkdir /sdcard/dlpc
resources\tools\adb push resources\scripts\dlpc\dlpc.x /sdcard/dlpc/
resources\tools\adb push resources\scripts\dlpc\dlp.x /sdcard/dlpc/
resources\tools\adb push resources\scripts\dlpc\hotreboot.x /sdcard/dlpc/
echo installing dlpc....
resources\tools\adb shell su -c "mount -o remount rw, /system"
resources\tools\adb shell su -c "cp /sdcard/dlpc/* /system/dlpc"
resources\tools\adb shell rm -rf /sdcard/dlpc
resources\tools\adb shell su -c "mv /system/dlpc/dlpc.x /system/dlpc/dlpc"
resources\tools\adb shell su -c "mv /system/dlpc/dlp.x /system/dlpc/dlp"
resources\tools\adb shell su -c "mv /system/dlpc/hotreboot.x /system/dlpc/hotreboot"
resources\tools\adb shell su -c "chown 0.2000 /system/dlpc/dlpc"
resources\tools\adb shell su -c "chown 0.2000 /system/dlpc/dlp"
resources\tools\adb shell su -c "chown 0.2000 /system/dlpc/hotreboot"
resources\tools\adb shell su -c "chmod 755 /system/dlpc/dlpc"
resources\tools\adb shell su -c "chmod 755 /system/dlpc/dlp"
resources\tools\adb shell su -c "chmod 755 /system/dlpc/hotreboot"
echo cleaning up....
resources\tools\adb shell su -c "rm /system/bin/dlpc"
resources\tools\adb shell su -c "cp /system/dlpc/dlpc /system/bin"
resources\tools\adb shell su -c "rm /system/bin/dlp"
resources\tools\adb shell su -c "cp /system/dlpc/dlp /system/bin"
resources\tools\adb shell su -c "rm /system/bin/hotreboot"
resources\tools\adb shell su -c "cp /system/dlpc/hotreboot /system/bin"
echo unmounting
resources\tools\adb shell su -c "mount -o remount ro, /system"
echo successfull unmounted
echo.
echo dlpc installed
echo.
echo to check current run: dlp
echo to change dw run: dlpc
echo via terminal emulator on android itself

pause
exit
