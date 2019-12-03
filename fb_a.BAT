@ECHO OFF

:: fastboot flash aboot emmc_appsboot.mbn
fastboot flash boot boot.img
fastboot flash system system.img
fastboot flash vendor vendor.img
fastboot flash vbmeta vbmeta.img
:: fastboot flash userdata userdata.img

fastboot reboot