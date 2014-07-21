@echo off
echo Backup beginning. Please confirm on Kindle's screen...>resources\console.txt
resources\tools\adb backup -apk -shared -all -nosystem -f resources\scripts\backup\backup.ab
echo Backup complete>resources\console.txt
exit