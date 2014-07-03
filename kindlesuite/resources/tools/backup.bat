@echo off
mkdir resources\backup
echo This will backup the ENTIRE device (except system), so be prepared for a long wait. this screen will inform you when the backup is complete
adb backup -apk -shared -all -nosystem -f .\resources\backup\backup.ab
echo backup complete
pause
exit