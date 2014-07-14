@echo off
echo This will backup the ENTIRE device (except system), so be prepared for a long wait. this screen will inform you when the backup is complete
resources\tools\adb backup -apk -shared -all -nosystem -f resources\scripts\backup\backupdata.ab
echo backup complete
pause
exit
