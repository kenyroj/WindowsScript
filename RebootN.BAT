@ECHO off
SET INTERVAL=100
SET REBOOT_COUNT=0


IF "%1" == "" (
	SET MAX_COUNT=6
) ELSE (
	SET MAX_COUNT=%1
)

ECHO ==== Test reboot for %MAX_COUNT% Times ====

:Again
SET /A REBOOT_COUNT=%REBOOT_COUNT%+1
ECHO [%DATE% %TIME%] Reboot android device Times: %REBOOT_COUNT%
adb wait-for-device reboot

IF %MAX_COUNT% == %REBOOT_COUNT% (
	GOTO:EOF
)

ECHO [%DATE% %TIME%] Waiting for %INTERVAL% seconds
ping 127.0.0.1 -n %INTERVAL% -w 1000 > nul
GOTO:Again