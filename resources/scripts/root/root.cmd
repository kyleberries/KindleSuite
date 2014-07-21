@echo off
echo Make sure ADB debugging is ENABLED and plug kindle in with REGULAR cable >resources/console.txt
resources\tools\adb wait-for-device
echo Device connected, reading current FireOS version...>resources/console.txt
resources\tools\adb shell grep incremental /system/build.prop>resources/scripts/root/kernelver
set Build=<resources\scripts\root\kernelver
set kernel=%Build:~29,8%
goto %kernel%

:11.3.1.0
start resources\scripts\root\11310.cmd
exit

:11.3.2.1
open 11321 root
start resources\scripts\root\11321.cmd
exit

:11.3.2.3
start resources\scripts\root\11323.cmd
exit

:11.3.2.3.2
start resources\scripts\root\113232.cmd
exit

:11.3.2.4
start resources\scripts\root\11324.cmd
exit
