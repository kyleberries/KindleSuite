@echo off
echo This will restore the ENTIRE device, so be prepared for a long wait. this screen will inform you when the restore is complete
adb restore resources\backup\backup.ab
echo restore complete
rmdir resources\backup /s /q
pause
exit