@echo off

echo Updating updater...>resources\console.txt
del resources\scripts\gapps\updater\update.cmd
resources\tools\wget -P resources/scripts/gapps/updater https://raw.githubusercontent.com/secretdevwork/KindleSuite/master/resources/scripts/gapps/updater/update.cmd

echo Starting updater...>resources\console.txt
start resources\scripts\gapps\updater\update.cmd

pause
exit
