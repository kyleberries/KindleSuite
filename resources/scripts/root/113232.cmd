@echo off
echo Make sure you power Kindle OFF and plug into resources\tools\fastboot cable
echo.
echo.
echo.
echo Downgrading Boot Image...
resources\tools\fastboot -i 0x1949 flash boot resources/kernel/11310-boot.img
resources\tools\fastboot -i 0x1949 continue
resources\tools\adb wait-for-device
echo Device connected. Pushing files...
resources\tools\adb push resources/root/su /data/local/tmp/
resources\tools\adb push resources/root/exploit /data/local/tmp/
resources\tools\adb push resources/root/rootme.sh /data/local/tmp/
echo Changing permissions...
resources\tools\adb shell chmod 755 /data/local/tmp/*
echo Executing Exploit (could take some time, be patient!)
pause
resources\tools\adb shell /data/local/tmp/exploit -c "/data/local/tmp/rootme.sh"
echo.
echo.
echo rebooting resources\tools\fastboot...
resources\tools\adb reboot
resources\tools\fastboot -i 0x1949 wait-for-device devices
resources\tools\fastboot -i 0x1949 flash boot resources/kernel/113232-boot.img
resources\tools\fastboot -i 0x1949 continue