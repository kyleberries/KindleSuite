@echo off
echo Downloading Bin from Amazon...
if not exist resources\scripts\restore\minisystem.img resources\tools\wget --no-check-certificate -P resources/scripts/restore/ https://gmf.dabbleam.com/KFSOWI/minisystem.img
if not exist resources/scripts/rstore/update.zip resources\tools\wget --no-check-certificate -P resources/scripts/restore https://s3.amazonaws.com/kindle-fire-updates/update-kindle-11.3.2.4_user_324002520.bin
echo.
cd resources/scripts/restore
rename *.bin update.zip
cd ..\..\..\
start resources\scripts\restore\restore.bat
exit