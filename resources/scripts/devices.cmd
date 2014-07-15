@echo off
echo Please wait...>resources\console.txt
resources\tools\adb start-server
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
resources\tools\adb devices >resources\console.txt
resources\tools\adb kill-server
exit