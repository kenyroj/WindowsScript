@ECHO OFF

SET ADB=adb wait-for-device

SET CMD=%ADB% shell cat /vendor/firmware_mnt/verinfo/ver_info.txt
ECHO %CMD%
%CMD%
