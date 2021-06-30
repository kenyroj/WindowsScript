SET ADBDEV=-s No_Serial_Number

adb %ADBDEV% wait-for-device

adb %ADBDEV% shell dumpsys alarm > Dumsys_Alarm_After.log

adb %ADBDEV% shell "cat /sys/power/system_sleep/stats" > SleepStats_After.log
adb %ADBDEV% shell "cat /sys/power/rpmh_stats/master_stats" > MasterStats_After.log
adb %ADBDEV% shell dmesg > DMesg_After.log

adb %ADBDEV% bugreport BugReportAfter
adb %ADBDEV% shell logcat -v threadtime > Logcat_After.log
