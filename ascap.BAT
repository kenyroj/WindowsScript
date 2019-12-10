@ECHO OFF

SET ADB=adb

SET CMD=%ADB% root
ECHO %CMD%
%CMD%

SET CMD=%ADB% shell screencap -p /sdcard/Download/ScreenCap.png
ECHO %CMD%
%CMD%

SET CMD=%ADB% pull /sdcard/Download/ScreenCap.png .
ECHO %CMD%
%CMD%

SET CMD=%ADB% shell rm /sdcard/Download/ScreenCap.png
ECHO %CMD%
%CMD%
