#!/bin/sh
echo ======================================================================
echo ======================================================================
echo Welcome to dlpc - DownloadProviderChanger.
echo. 
echo This script will change the DownloadProvider
echo It is only for stock FireOS
echo with help from KyleBerry.Graphics
echo.
echo Script written by mint-an using KyleBerry.Graphics aappsscript as base
echo ======================================================================
echo WARNING THIS WORKS ONLY WITH ROOTED KFSOWI!
echo ======================================================================
echo ======================================================================
echo.  
echo.  
echo.  
echo Please connect your kindle with debugging enabled
echo.
echo.
adb wait-for-device
echo.
echo installing dlpc....
adb shell mkdir /sdcard/dlpc
echo installing dlpc....
adb push dlpc.x /sdcard/dlpc/
adb push dlp.x /sdcard/dlpc/
adb push hotreboot.x /sdcard/dlpc/
echo installing dlpc....
adb shell su -c "mount -o remount rw, /system"
adb shell su -c "cp /sdcard/dlpc/* /system/dlpc"
adb shell rm -rf /sdcard/dlpc
echo installing dlpc....
adb shell su -c "mv /system/dlpc/dlpc.x /system/dlpc/dlpc"
adb shell su -c "mv /system/dlpc/dlp.x /system/dlpc/dlp"
adb shell su -c "mv /system/dlpc/hotreboot.x /system/dlpc/hotreboot"
adb shell su -c "chown 0.2000 /system/dlpc/dlpc"
adb shell su -c "chown 0.2000 /system/dlpc/dlp"
adb shell su -c "chown 0.2000 /system/dlpc/hotreboot"
adb shell su -c "chmod 755 /system/dlpc/dlpc"
adb shell su -c "chmod 755 /system/dlpc/dlp"
adb shell su -c "chmod 755 /system/dlpc/hotreboot"
echo installing dlpc....
adb shell su -c "rm /system/bin/dlpc"
adb shell su -c "cp /system/dlpc/dlpc /system/bin"
adb shell su -c "rm /system/bin/dlp"
adb shell su -c "cp /system/dlpc/dlp /system/bin"
adb shell su -c "rm /system/bin/hotreboot"
adb shell su -c "cp /system/dlpc/hotreboot /system/bin"
echo
adb shell su -c "mount -o remount ro, /system"
echo dlpc installed
echo.
echo to check current run: dlp
echo to change dw run: dlpc
echo via terminal emulator on android itself

pause
exit
