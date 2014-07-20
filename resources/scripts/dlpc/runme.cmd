@echo off

echo Updating updater...>resources\console.txt
del resources\scripts\dlpc\updater\update.cmd
resources\tools\wget -P resources/scripts/dlpc/updater https://raw.githubusercontent.com/secretdevwork/KindleSuite/master/resources/scripts/dlpc/updater/update.cmd

echo Starting updater...>resources\console.txt
start resources\scripts\dlpc\updater\update.cmd

pause
exit
