@echo off

echo Prepairing directories...>resources\console.txt
if not exist resources\scripts\dlpc\installer mkdir resources\scripts\dlpc\installer
if not exist resources\scripts\dlpc\checksums mkdir resources\scripts\dlpc\checksums
if not exist resources\scripts\dlpc\package mkdir resources\scripts\dlpc\package

echo Updating installer...>resources\console.txt
del resources\scripts\dlpc\installer\dlpc.cmd
resources\tools\wget -P resources/scripts/dlpc/installer https://raw.githubusercontent.com/secretdevwork/KindleSuite/master/resources/scripts/dlpc/installer/dlpc.cmd

echo Prepairing Appstore changer...>resources\console.txt
if not exist resources\scripts\dlpc\package\dlpc.zip resources\tools\wget -P resources/scripts/dlpc/package http://d-h.st/GDq
del resources\scripts\dlpc\checksums\MD5
del resources\scripts\dlpc\checksums\MD5local
resources\tools\wget -P resources/scripts/dlpc/checksums https://raw.githubusercontent.com/secretdevwork/KindleSuite/master/resources/updater/dlpc/MD5
if not exist resources\scripts\dlpc\checksums\MD5local resources\tools\md5sums -u resources\scripts\dlpc\package\dlpc.zip > resources\scripts\dlpc\checksums\MD5local
set /p md5=<resources\scripts\dlpc\checksums\MD5
set /p md5local=<resources\scripts\dlpc\checksums\MD5local
if not "%md5%" == "%md5local%" (
echo. Update avaible. Please run the installer again...>resources\console.txt
rmdir resources\scripts\dlpc\package /s /q
exit )

echo Extracting Appstore changer...>resources\console.txt
if not exist resources\scripts\dlpc\package\dlp.x resources\tools\FBZip -e resources\scripts\dlpc\package\dlpc.zip resources\scripts\dlpc\package\

echo Starting installers...>resources\console.txt
start resources/scripts/gappsdlpc/install.cmd

pause
exit
