@echo off
IF EXIST resources\scripts\backup\backup.ab (
echo Restoring Backup. Please confirm on Kindle's screen...>resources\console.txt
resources\tools\adb restore resources\scripts\backup\backupdata.ab
echo Restore complete.>resources\console.txt
exit
) ELSE (
echo No Backup Available...>resources\console.txt
exit )
