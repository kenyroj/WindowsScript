@echo off
set INTERVAL=180
SET REBOOT_COUNT=0

:Again
SET /A REBOOT_COUNT=%REBOOT_COUNT%+1
echo [%DATE% %TIME%] Reboot android device Times: %REBOOT_COUNT%
adb wait-for-device reboot

echo [%DATE% %TIME%] Waiting for %INTERVAL% seconds
ping 127.0.0.1 -n %INTERVAL% -w 1000 > nul
goto:Again