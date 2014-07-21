@echo off
if exist resources\scripts\backup\backup.ab goto backup
if NOT exist resources\scripts\backup\backup.ab goto restore

:restore
echo No backup found! Backup beginning. >resources\console.txt
resources\tools\adb start-server
resources\tools\adb wait-for-device backup -apk -shared -all -nosystem -f resources\scripts\backup\backup.ab 
echo Backup complete>resources\console.txt 
resources\tools\adb kill-server
exit

:backup
echo Backup Found! Restoring Backup. >resources\console.txt 
resources\tools\adb start-server
resources\tools\adb wait-for-device restore resources\scripts\backup\backupdata.ab 
echo Restore complete>resources\console.txt 
resources\tools\adb kill-server
exit 