@echo off
echo Please wait...>resources\console.txt
resources\tools\adb start-server
resources\tools\adb devices >resources\console.txt
resources\tools\adb kill-server
exit