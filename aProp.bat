@ECHO OFF

SET ADB=adb

SET ADB_CMD=%ADB% shell "getprop | grep %1"
ECHO ADB CMD=%ADB_CMD%
%ADB_CMD%
