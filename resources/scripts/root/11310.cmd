@echo off
echo Make sure ADB Debugging is ENABLED!
echo Plug kindle into REGULAR cable
echo.
echo.
echo.
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
resources\tools\adb reboot