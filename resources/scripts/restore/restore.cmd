@echo off
echo.
echo Power kindle OFF and plug into FASTBOOT cable>resources\console.txt
echo.
resources\tools\fastboot -i 0x1949 flash boot resources\kernels\11322-boot.img
resources\tools\fastboot -i 0x1949 flash system resources\scripts\restore\minisystem.img
resources\tools\fastboot -i 0x1949 continue 
adb wait-for-device
echo.
echo Moving update to Kindle (be patient, can take ~5 mins)...>resources\console.txt
echo.
resources\tools\adb shell su -c "chmod 777 /cache"
resources\tools\adb push resources\scripts\restore\update.zip /cache/
echo.
echo.
echo Setting up restore (be patient)...>resources\console.txt
echo.
resources\tools\adb shell su -c "echo --update_package=/cache/update.zip > /cache/recovery/command"
echo.
echo.
echo Unplug Kindle and plug into REGULAR cable>resources\console.txt
echo.
pause
resources\tools\adb wait-for-device reboot recovery
echo Device upgrading to 11.3.2.4 now.>resources\console.txt
exit