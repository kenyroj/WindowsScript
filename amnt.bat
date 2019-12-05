@ECHO OFF

SET ADB=adb

SET ADB_CMD=%ADB% root
ECHO ADB CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=%ADB% wait-for-device
ECHO ADB CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=%ADB% disable-verity
ECHO ADB CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=%ADB% wait-for-device
ECHO ADB CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=%ADB% reboot
ECHO ADB CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=%ADB% wait-for-device
ECHO ADB CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=%ADB% root
ECHO ADB CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=%ADB% wait-for-device
ECHO ADB CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=%ADB% remount
ECHO ADB CMD=%ADB_CMD%
%ADB_CMD%

:: Following no use since adb always return 0
IF %RET% EQU 0 (
	GOTO:EOF
) ELSE (
	ADB disable-verity
	ADN reboot
)
