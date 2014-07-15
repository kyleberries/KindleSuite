@echo off
echo This will restore your data , so be prepared for a long wait. this screen will inform you when the restore is complete
resources\tools\adb restore resources\scripts\backup\backupdata.ab
echo restore complete
del resources\scripts\backup\backupdata.ab
pause
exit
