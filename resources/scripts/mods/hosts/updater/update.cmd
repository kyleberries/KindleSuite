@echo off

resources\tools\adb start-server

echo Plug kindle into regular cable with ADB Debugging enabled...>resources\console.txt
resources\tools\adb wait-for-device

echo Prepairing directories...>resources\console.txt
if not exist resources\scripts\mods\hosts\installer mkdir resources\scripts\mods\hosts\installer
if not exist resources\scripts\mods\hosts\checksums mkdir resources\scripts\mods\hosts\checksums
if not exist resources\scripts\mods\hosts\package mkdir resources\scripts\mods\hosts\package

echo Updating installer...>resources\console.txt
del resources\scripts\mods\hosts\installer\hosts.cmd
resources\tools\wget -P resources/scripts/mods/hosts/installer https://raw.githubusercontent.com/secretdevwork/KindleSuite/master/resources/scripts/mods/hosts/installer/hosts.cmd

echo Prepairing Hosts...>resources\console.txt
if not exist resources\scripts\mods\hosts\package\hosts.x resources\tools\wget -P resources/scripts/mods/hosts/package http://d-h.st/gLR
del resources\scripts\mods\hosts\checksums\MD5
del resources\scripts\mods\hosts\checksums\MD5local
resources\tools\wget -P resources/scripts/gapps/checksums https://raw.githubusercontent.com/secretdevwork/KindleSuite/master/resources/scripts/mods/hosts/updater/MD5
if not exist resources\scripts\mods\hosts\checksums\MD5local resources\tools\md5sums -u resources\scripts\mods\hosts\package\gapps.zip > resources\scripts\mods\hosts\checksums\MD5local
set /p md5=<resources\scripts\mods\hosts\checksums\MD5
set /p md5local=<resources\scripts\mods\hosts\checksums\MD5local
if not "%md5%" == "%md5local%" (
echo. Update avaible. restarting updater...>resources\console.txt
rmdir resources\scripts\mods\hosts\package /s /q
start resources/scripts/mods/hosts/runme.cmd
resources\tools\adb kill-server
pause
exit )

#echo Extracting Hosts...>resources\console.txt
#if not exist resources\scripts\mods\hosts\package\gapps resources\tools\FBZip -e resources\scripts\mods\hosts\package\hosts.zip resources\scripts\mods\hosts\package\

echo Starting installer...>resources\console.txt
start resources\scripts\mods\hosts\installer\hosts.cmd

resources\tools\adb kill-server

pause
exit
