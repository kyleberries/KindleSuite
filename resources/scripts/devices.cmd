@echo off
resources\tools\adb start-server >/NUL
resources\tools\adb devices
resources\tools\adb kill-server
timeout 5
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