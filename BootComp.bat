@ECHO OFF
SET ADB=adb wait-for-device
SET LOG_HOME=/sdcard/logs

%ADB% shell "grep -rn 'Boot comple' %LOG_HOME% | grep dme"
