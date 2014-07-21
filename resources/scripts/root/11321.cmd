@echo off
echo Please power Kindle OFF and plug into fastboot cable.>resources/console.txt
resources\tools\fastboot -i 0x1949 flash boot resources/kernel/11310-boot.img
echo Downgrading Kernel...>resources/console.txt
resources\tools\fastboot -i 0x1949 continue
echo Continuing Boot...>resources/console.txt
resources\tools\adb wait-for-device
echo Device connected. Pushing files...>resources/console.txt
resources\tools\adb push resources/root/su /data/local/tmp/
resources\tools\adb push resources/root/exploit /data/local/tmp/
resources\tools\adb push resources/root/rootme.sh /data/local/tmp/
echo Changing permissions...>resources/console.txt
resources\tools\adb shell chmod 755 /data/local/tmp/*
echo Executing Exploit (could take some time, be patient!) >resources/console.txt
resources\tools\adb shell /data/local/tmp/exploit -c "/data/local/tmp/rootme.sh"
echo rebooting fastboot...>resources/console.txt
resources\tools\adb reboot
resources\tools\fastboot -i 0x1949 wait-for-device devices
echo Upgrading Kernel...>resources/console.txt
resources\tools\fastboot -i 0x1949 flash boot resources/kernel/11321-boot.img
resources\tools\fastboot -i 0x1949 continue
echo Device Rooted! >resources/console.txt