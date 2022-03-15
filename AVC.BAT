@ECHO OFF
SET ADB=adb wait-for-device

if "%1" == "" (
	ECHO EMPTY Params. Maybe:
	%ADB% shell ls /logsave
) else (
	%ADB% shell "grep avc /logsave/%1/events* 
	REM | grep -i logsave | grep -v audio_prop | grep -v bluetooth_prop | grep -v bootloader_boot_reason_prop | grep -v system_prop"
)

