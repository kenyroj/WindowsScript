@adb wait-for-device
adb root
@adb wait-for-device
adb remount
@adb wait-for-device

:: ======== QSEE LOG ========
:: adb shell cat /d/tzdbg/qsee_log > D:\QSeeLog.log

:: ======== Camera flags ========
::adb shell setprop persist.vendor.camera.hal.debug 5
::adb shell setprop persist.camera.hal.debug 5
::adb shell setprop persist.vendor.camera.stats.aec.debug 5
::adb shell setprop persist.camera.stats.aec.debug 5
::adb shell getprop persist.vendor.camera.hal.debug
::adb shell getprop persist.camera.hal.debug
::adb shell getprop persist.vendor.camera.stats.aec.debug
::adb shell getprop persist.camera.stats.aec.debug

@adb shell dmesg > D:\DMesg.log

adb logcat -v threadtime -b all > D:\Logcat.log
