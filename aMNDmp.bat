@ECHO OFF

SET ADB=adb wait-for-device

SET ADB_CMD=%ADB% reboot bootloader
ECHO CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=fastboot oem adb_enable
ECHO CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=fastboot reboot
ECHO CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=%ADB% shell "echo 1 > /sys/kernel/dload/emmc_dload"
ECHO CMD=%ADB_CMD%
%ADB_CMD%

::SET ADB_CMD=%ADB% wait-for-device shell "echo full > /sys/kernel/dload/dload_mode"
::SET ADB_CMD=%ADB% wait-for-device shell "echo mini > /sys/kernel/dload/dload_mode"
SET ADB_CMD=%ADB% shell "echo both > /sys/kernel/dload/dload_mode"
ECHO CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=%ADB% shell "echo c > /proc/sysrq-trigger"
ECHO CMD=%ADB_CMD%
%ADB_CMD%
