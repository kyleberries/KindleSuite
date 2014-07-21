@echo off
echo Make sure ADB Debugging is ENABLED and plug kindle into REGULAR cable.>resources/console.txt
resources\tools\adb wait-for-device
echo Device connected. Pushing files...>resources/console.txt
resources\tools\adb push resources/root/su /data/local/tmp/
resources\tools\adb push resources/root/exploit /data/local/tmp/
resources\tools\adb push resources/root/rootme.sh /data/local/tmp/
echo Changing permissions...>resources/console.txt
resources\tools\adb shell chmod 755 /data/local/tmp/*
echo Executing Exploit. This could take some time, be patient! >resources/console.txt
resources\tools\adb shell /data/local/tmp/exploit -c "/data/local/tmp/rootme.sh"
echo Root achieved, rebooting now...>resources/console.txt
resources\tools\adb reboot
echo Kindle Rooted! >resources/console.txt
exit