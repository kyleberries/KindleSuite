@echo off
if not exist resources\rom mkdir resources\rom
if not exist resources\rom\hellfire\MD5 mkdir resources\rom\hellfire
echo Downloading HellFire...>resources\console.txt
if not exist resources\rom\hellfire\hellfire.zip resources\tools\wget -P resources/rom/hellfire http://dl.kfsowi.com/roms/hellfire/latest/hellfire.zip
del resources\rom\hellfire\MD5
del resources\rom\hellfire\MD5local
resources\tools\wget -P resources/rom/hellfire http://dl.kfsowi.com/roms/hellfire/latest/MD5
if not exist resources\rom\hellfire\MD5local resources\tools\md5sums -u resources\rom\hellfire\hellfire.zip > resources\rom\hellfire\MD5local
set /p md5=<resources\rom\hellfire\MD5
set /p md5local=<resources\rom\hellfire\MD5local
if not "%md5%" == "%md5local%" (
echo. There was a problem with the download. Please close program and try again.>resources\console.txt
rmdir resources\rom\hellfire /s /q
exit )
echo.
echo.
echo Unzipping HellFire...>resources\console.txt
if not exist resources\rom\hellfire\*.img resources\tools\FBZip -e resources\rom\hellfire\hellfire.zip resources\rom\hellfire\
cd resources\rom\hellfire
rename *.img hellfire.img
del resources\rom\hellfire\*.zip
del resources\rom\hellfire\MD5*
cd ..\..\..\
echo.
echo.
echo Please Power Kindle OFF and plug into fastboot cable>resources\console.txt
resources\tools\fastboot -i 0x1949 wait-for-device devices
resources\tools\fastboot -i 0x1949 flash system resources\rom\hellfire\hellfire.img
echo.
echo.
echo Hellfire installed>resources\console.txt
echo Please plug Kindle into REGULAR cable now.>resources\console.txt
echo Kindle will now factory reset to finish install>resources\console.txt
resources\tools\fastboot -i 0x1949 continue
resources\tools\adb wait-for-device shell su -c "rm -rf /data/*"
resources\tools\adb wait-for-device shell su -c "rm -rf /cache/*"
echo.
echo.
exit