echo Waiting For Device...>resources\console.txt
resources\tools\adb wait-for-device reboot
resources\tools\adb kill-server
echo Reboot Complete.>resources\console.txt
exit