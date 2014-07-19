@echo off
echo Prepairing directories...>resources\console.txt
if not exist resources\scripts\gapps mkdir resources\scripts\gapps
if not exist resources\scripts\gapps\installer mkdir resources\scripts\gapps\installer
if not exist resources\scripts\gapps\checksums mkdir resources\scripts\gapps\checksums
if not exist resources\scripts\gapps\package mkdir resources\scripts\gapps\package

echo Updating installer...>resources\console.txt
del resources\scripts\gapps\gapps.cmd
resources\tools\wget -P resources/scripts/gapps/installer https://raw.githubusercontent.com/secretdevwork/KindleSuite/master/resources/scripts/gapps/gapps.cmd


echo Prepairing Gapps...>resources\console.txt
if not exist resources\scripts\gapps\package\gapps.zip resources\tools\wget -P resources/scripts/gapps/package http://d-h.st/udB
del resources\scripts\gapps\checksums\MD5
del resources\scripts\gapps\checksums\MD5local
del resources\scripts\gapps\checksums\MD5server
resources\tools\wget -P resources/scripts/gapps/checksums https://raw.githubusercontent.com/secretdevwork/KindleSuite/master/updater/gapps/MD5
if not exist resources\scripts\gapps\checksums\MD5local resources\tools\md5sums -u resources\scripts\gapps\package\gapps.zip > resources\scripts\gapps\checksums\MD5local
set /p md5=<resources\scripts\gapps\checksums\MD5
set /p md5local=<resources\scripts\gapps\checksums\MD5local
if not "%md5%" == "%md5local%" (
echo. Update avaible. Please run the installer again...>resources\console.txt
rmdir resources\scripts\gapps\package /s /q
exit )

echo Extracting Gapps...>resources\console.txt
if not exist resources\scripts\gapps\package\gapps resources\tools\FBZip -e resources\scripts\gapps\package\gapps.zip resources\scripts\gapps\package\

