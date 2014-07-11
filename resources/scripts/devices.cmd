@echo off
resources\tools\adb start-server >/NUL
resources\tools\adb devices
resources\tools\adb kill-server
choice /d y /t 5 > nul
exit