@echo off
SET ADB=adb wait-for-device shell am start -a android.settings.SETTINGS
echo %ADB%
%ADB%

:EOF