SET ADBDEV=-s No_Serial_Number

adb %ADBDEV% pull /proc/config.gz
adb %ADBDEV% shell "getprop ro.build.display.id" > VerDisplayID.txt

adb %ADBDEV% bugreport BugReportBefore
adb %ADBDEV% shell dumpsys alarm > Dumsys_Alarm_Before.log

adb %ADBDEV% shell "cat /sys/power/system_sleep/stats" > SleepStats_Before.log
adb %ADBDEV% shell "cat /sys/power/rpmh_stats/master_stats" > MasterStats_Before.log
adb %ADBDEV% shell dmesg -c > DMesg_Before.log
adb %ADBDEV% shell logcat -v threadtime > Logcat_Before.log
