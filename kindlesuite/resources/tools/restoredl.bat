@echo off
mkdir resources\update
echo Downloading Bin from Amazon...
if not exist resources\update\minisystem.img wget --no-check-certificate -P resources/update https://gmf.dabbleam.com/KFSOWI/minisystem.img
if not exist resources\update\update.zip wget --no-check-certificate -P resources/update https://s3.amazonaws.com/kindle-fire-updates/update-kindle-11.3.2.4_user_324002520.bin
echo.
cd resources/update
rename upd* update.zip
cd ..\..\
start resources\tools\restore.bat
exit