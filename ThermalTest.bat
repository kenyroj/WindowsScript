@ECHO OFF

SET SLEEP_SEC=10
SET SYSLOAD_NAME=SysloadWithLog.log
SET THERMAL_NAME=ThermalWithLog.log

:WHILE_BEGIN

echo ========
time /t


adb -s No_Serial_Number shell "echo $(cat /proc/uptime | cut -d ' ' -f 1) `uptime | tr -s ' ' | cut -d ',' -f 3-5 | cut -d ':' -f 2 | tr -d ','`" >> %SYSLOAD_NAME%
::echo. >> %SYSLOAD_NAME%

adb -s No_Serial_Number shell "echo $(cat /proc/uptime | cut -d ' ' -f 1) `cat /sys/class/thermal/thermal_zone38/temp  /sys/class/power_supply/bms/temp | tr -s '\n' ' '`" >> %THERMAL_NAME%
::echo. >> %THERMAL_NAME%

timeout %SLEEP_SEC% /nobreak > nul
GOTO :WHILE_BEGIN
