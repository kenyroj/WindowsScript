
adb -s No_Serial_Number shell am broadcast -a com.mitac.kusabiCDR.SIMULATE --es command "SET_PARK_REC_INTERVAL" --ei value 0

::adb -s No_Serial_Number shell "echo 12 > /proc/sys/kernel/printk"
::adb -s No_Serial_Number shell "echo '1'> /sys/module/msm_show_resume_irq/parameters/debug_mask"

::adb -s No_Serial_Number shell "cat /proc/sys/kernel/printk"
::adb -s No_Serial_Number shell "cat /sys/module/msm_show_resume_irq/parameters/debug_mask"


adb -s No_Serial_Number shell "echo 8 > /proc/sys/kernel/printk"
adb -s No_Serial_Number shell "echo 1 > /sys/module/msm_show_resume_irq/parameters/debug_mask"
adb -s No_Serial_Number shell "echo 0 > /sys/module/qpnp_rtc/parameters/poweron_alarm"
adb -s No_Serial_Number shell "echo 1 > /sys/kernel/debug/clk/debug_suspend"

adb -s No_Serial_Number shell "cat /proc/sys/kernel/printk"
adb -s No_Serial_Number shell "cat /sys/module/msm_show_resume_irq/parameters/debug_mask"
adb -s No_Serial_Number shell "cat /sys/module/qpnp_rtc/parameters/poweron_alarm"
adb -s No_Serial_Number shell "cat /sys/kernel/debug/clk/debug_suspend"
