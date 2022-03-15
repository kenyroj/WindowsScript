@ECHO OFF
SET ADB=adb wait-for-device
SET LOG_HOME=/sdcard/logs


if "%1" == "" (
	ECHO EMPTY Params. Maybe:
	%ADB% shell ls %LOG_HOME%
) else (
	%ADB% shell "grep avc %LOG_HOME%/%1/events* 
	REM | grep -i logsave | grep -v audio_prop | grep -v bluetooth_prop | grep -v bootloader_boot_reason_prop | grep -v system_prop"
)

