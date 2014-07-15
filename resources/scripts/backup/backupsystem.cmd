@echo off
echo This will backup system partition, so be prepared for a long wait. this screen will inform you when the backup is complete
resources\tools\adb backup -system -f resources\scripts\backup\backupsystem.ab
echo backup complete
pause
exit
