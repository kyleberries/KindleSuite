@echo off

echo Plug Kindle into regular cable with ADB Debugging enabled...>resources\console.txt
resources\tools\adb wait-for-device

echo Preparing Gapps...>resources\console.txt
start resources/scripts/gappsdlpc/updategapps.cmd
pause
exit
