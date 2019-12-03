@ECHO OFF

ADB root
ADB wait-for-device
ADB remount

SET RET=%ERRORLEVEL%
ECHO %RET%

:: Following no use since adb always return 0
IF %RET% EQU 0 (
	GOTO:EOF
) ELSE (
	ADB disable-verity
	ADN reboot
)
