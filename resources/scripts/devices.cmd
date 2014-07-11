@echo off
resources\tools\adb start-server
resources\tools\adb devices
resources\tools\adb kill-server
timeout 3
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
echo complete
exit