@echo off

resources\tools\adb start-server

echo Updating updater...>resources\console.txt
del resources\scripts\mods\hosts\updater\update.cmd
resources\tools\wget -P resources/scripts/mods/hosts/updater https://raw.githubusercontent.com/secretdevwork/KindleSuite/master/resources/scripts/mods/hosts/updater/update.cmd

echo Starting updater...>resources\console.txt
start resources\scripts\mods\hosts\updater\update.cmd

resources\tools\adb kill-server

pause
exit
