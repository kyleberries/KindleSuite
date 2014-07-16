@echo off
if not exist resources\rom mkdir resources\rom
if not exist resources\rom\ice\MD5 mkdir resources\rom\ice
echo Downloading ice...>resources\console.txt
if not exist resources\rom\ice\ice.zip resources\tools\wget -P resources/rom/ice http://dl.kfsowi.com/roms/ice/latest/ice.zip
del resources\rom\ice\MD5*
resources\tools\wget -P resources/rom/ice http://dl.kfsowi.com/roms/ice/latest/MD5
if not exist resources\rom\ice\MD5local resources\tools\md5sums -u resources\rom\ice\ice.zip > resources\rom\ice\MD5local
set /p md5=<resources\rom\ice\MD5
set /p md5local=<resources\rom\ice\MD5local
if not "%md5%" == "%md5local%" (
echo. There was a problem with the download. Please close program and try again.
rmdir resources\rom\ice /s /q
exit )
echo.
echo.
echo Unzipping ice...>resources\console.txt
if not exist resources\rom\ice\*.img resources\tools\FBZip -e resources\rom\ice\ice.zip resources\rom\ice\
rename resources\rom\ice\ice*.img resources\rom\ice\ice.img
cd resources\rom\ice
rename *.img ice.img
del MD5*
del *.zip
cd ..\..\..\
echo.
echo.
echo Moving ice to Kindle (Be patient, takes ~5 mins)>resources\console.txt
echo Make sure kindle is plugged into >resources\console.txt
echo regular cable with ADB enabled>resources\console.txt
resources\tools\adb wait-for-device 
echo moving...
resources\tools\adb wait-for-device push resources\rom\ice\ice.img /sdcard/
echo.
echo.
echo Installing ice (takes ~5 mins)...>resources\console.txt
resources\tools\adb shell su -c "dd if=/sdcard/ice.img of=/dev/block/mmcblk0p9"
echo.
echo.
echo Ice Installed, Wiping Data>resources\console.txt
resources\tools\adb shell su -c "rm -rf /data/*"
resources\tools\adb shell su -c "rm -rf /cache/*"
echo Install Complete>resources\console.txt
exit