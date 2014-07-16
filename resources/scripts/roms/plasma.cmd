@echo off
if not exist resources\rom mkdir resourcre\rom
if not exist resources\rom\plasma\MD5 mkdir resources\rom\plasma
echo Downloading plasma...>resources\console.txt
if not exist resources\rom\plasma\plasma.zip resources\tools\wget -P resources/rom/plasma http://dl.kfsowi.com/roms/plasma/latest/plasma.zip
del resources\rom\plasma\MD5*
resources\tools\wget -P resources/rom/plasma http://dl.kfsowi.com/roms/plasma/latest/MD5
if not exist resources\rom\plasma\MD5local resources\tools\md5sums -u resources\rom\plasma\plasma.zip > resources\rom\plasma\MD5local
set /p md5=<resources\rom\plasma\MD5
set /p md5local=<resources\rom\plasma\MD5local
if not "%md5%" == "%md5local%" (
echo. There was a problem with the download. Please close program and try again.>resources\console.txt
rmdir resources\rom\plasma /s /q
exit )
echo.
echo.
echo Unzipping plasma...>resources\console.txt
if not exist resources\rom\plasma\*.img resources\tools\FBZip -e resources\rom\plasma\plasma.zip resources\rom\plasma\
rename resources\rom\plasma\plasma*.img resources\rom\plasma\plasma.img
cd resources\rom\plasma
rename *.img plasma.img
del resources\rom\plasma\MD5*
del resources\rom\plasma\*.zip
cd ..\..\..\
echo.
echo.
echo Moving plasma to Kindle (Be patient, takes ~5 mins)>resources\console.txt
echo Make sure kindle is plugged into >resources\console.txt
echo regular cable with ADB enabled>resources\console.txt
resources\tools\adb wait-for-device
echo moving...>resources\console.txt
resources\tools\adb wait-for-device push resources\rom\plasma\plasma.img /sdcard/
echo.
echo.
echo Installing plasma (takes ~5 mins)...>resources\console.txt
resources\tools\adb shell su -c "dd if=/sdcard/plasma.img of=/dev/block/mmcblk0p9"
echo.
echo.
echo plasma Installed, Wiping Data Now>resources\console.txt
resources\tools\adb shell su -c "rm -rf /data/*"
resources\tools\adb shell su -c "rm -rf /cache/*"
resources\tools\adb reboot
exit
