@echo off

echo Plug Kindle into regular cable with ADB Debugging enabled...>resources\console.txt
resources\tools\adb wait-for-device

echo Starting Gapps installer...>resources\console.txt
start resources\scripts\gapps\installer\gapps.cmd
pause
echo Starting Appstore changer installer...>resources\console.txt
start resources\scripts\dlpc\installer\dlpc.cmd
pause
exit
