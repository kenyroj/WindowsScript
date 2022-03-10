@ECHO OFF

SET ADB=adb wait-for-device

SET ADB_CMD=%ADB% reboot bootloader
ECHO CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=fastboot oem adb_enable
ECHO CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=fastboot oem uart_enable
ECHO ADB CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=fastboot reboot
ECHO CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=%ADB% shell "echo 12 > /proc/sys/kernel/printk"
ECHO CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=%ADB% shell "echo '1'> /sys/module/msm_show_resume_irq/parameters/debug_mask"
ECHO CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=%ADB% shell "echo 0 > /sys/module/qpnp_rtc/parameters/poweron_alarm"
ECHO CMD=%ADB_CMD%
%ADB_CMD%

SET ADB_CMD=%ADB% shell "echo 1 > /sys/kernel/debug/clk/debug_suspend"
ECHO CMD=%ADB_CMD%
%ADB_CMD%

