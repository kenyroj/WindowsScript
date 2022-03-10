@ECHO OFF

SET ADB=adb wait-for-device

SET ADB_CMD=%ADB% shell "getprop | grep %1"
ECHO ADB CMD=%ADB_CMD%
%ADB_CMD%
