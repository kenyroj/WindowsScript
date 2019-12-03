@ECHO OFF

SET FB_CMD=fastboot flash boot boot.img
echo %FB_CMD%
%FB_CMD%

SET FB_CMD=fastboot flash vbmeta vbmeta.img
echo %FB_CMD%
%FB_CMD%

fastboot reboot