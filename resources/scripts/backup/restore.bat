@echo off
echo This will restore the ENTIRE device, so be prepared for a long wait. this screen will inform you when the restore is complete
resources\tools\adb restore resources\scripts\backup\backup.ab
echo restore complete
del resources\scripts\backup\backup.ab
pause
exit