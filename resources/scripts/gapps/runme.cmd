@echo off

resources\tools\adb start-server

echo Updating updater...>resources\console.txt
del resources\scripts\gapps\updater\update.cmd
resources\tools\wget -P resources/scripts/gapps/updater https://raw.githubusercontent.com/secretdevwork/KindleSuite/master/resources/scripts/gapps/updater/update.cmd

echo Starting updater...>resources\console.txt
start resources\scripts\gapps\updater\update.cmd

resources\tools\adb kill-server

pause
exit
