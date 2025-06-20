@ECHO OFF

SET ADB=adb wait-for-device
SET FB=fastboot
SET QPST_BIN="C:\Program Files (x86)\Qualcomm\QPST\bin\"
SET FH=%QPST_BIN%fh_loader.exe
SET QS=%QPST_BIN%QSaharaServer.exe
SET FIREHOSE_ELF=prog_firehose_ddr.elf

if "%1"=="" (
	ECHO NULL param1
) else (
	GOTO %1%
)
GOTO:EOF

:T
	powershell -ExecutionPolicy Bypass -File "D:\pCloud\WinScript\ChkFileMod.ps1" "D:\text.txt"
	pause
	GOTO:EOF

:ChkRst
	SET SPMI_REG=python D:\WindowsScript\spmi_reg.py
	CALL:RunCmd %ADB% root
	CALL:RunCmd %ADB% root
	CALL:MsgY "Check S3 Setting"
	%SPMI_REG% -b 0874 -c
	%SPMI_REG% 0 0875

	CALL:MsgY "Check S2 KPDPWR Setting"
	%SPMI_REG% -b 0840 -c
	%SPMI_REG% 0 0841
	%SPMI_REG% 0 0842
	%SPMI_REG% 0 0843

	CALL:MsgY "Check S2 RESIN Setting"
	%SPMI_REG% -b 0844 -c
	%SPMI_REG% 0 0845
	%SPMI_REG% 0 0846
	%SPMI_REG% 0 0847

	GOTO:EOF

:aLED
	CALL:RunCmd %ADB% root
	GOTO:EOF

:aPSd
	SET SD_SN=0BCE-0AF1
	SET SD_PATH=/storage/%SD_SN%/sdupdate
	CALL:RunCmd %ADB% push %2 %SD_PATH%
	GOTO:EOF

:aMnt
	CALL:RunCmd %ADB% root
	CALL:RunCmd %ADB% disable-verity
	CALL:RunCmd %ADB% reboot
	CALL:RunCmd %ADB% root
	CALL:RunCmd %ADB% remount
	GOTO:EOF

:aPush
	CALL:RunCmd %ADB% root
	CALL:RunCmd %ADB% remount

	GOTO:EOF

:aLog
	CALL:RunCmd %ADB% shell dmesg > D:\DMesg.log
	CALL:RunCmd START /B %ADB% logcat -v threadtime -b all > D:\Logcat.log
	ECHO   - Logcat started and wait for 10 sec.
	timeout /t 10
	taskkill /F /IM adb.exe & echo Logcat stopped.
	GOTO:EOF

:aOem
	CALL:RunCmd %ADB% reboot bootloader
	CALL:RunCmd %FB% oem adb_enable
	CALL:RunCmd %FB% oem uart_enable
	CALL:RunCmd %FB% reboot
	GOTO:EOF

:aPcba
	CALL:RunCmd %ADB% shell "getprop | grep -e hw_ver -e sku_id"
	GOTO:EOF

:aSet
	CALL:RunCmd %ADB% shell am start -a android.settings.SETTINGS
	GOTO:EOF

:aVer
	CALL:RunCmd %ADB% shell "getprop ro.build.display.id"
	GOTO:EOF

:aProp
	CALL:RunCmd %ADB% shell "getprop | grep %2"
	GOTO:EOF

:aMeta
	CALL:RunCmd %ADB% root
	CALL:RunCmd %ADB% shell "cat /vendor/firmware_mnt/verinfo/ver_info.txt"
	GOTO:EOF

:aCrsh
	CALL:RunCmd %ADB% root
	CALL:RunCmd %ADB% shell "echo c > /proc/sysrq-trigger"
	GOTO:EOF

:aShll
	if "%2"=="" (
		CALL:RunCmd %ADB% shell
	) else (
		CALL:RunCmd %ADB% shell "%2"
	)
	GOTO:EOF

:aRoot
	CALL:RunCmd %ADB% root
	GOTO:EOF

:aLdr
	CALL:RunCmd %ADB% reboot bootloader
	GOTO:EOF

:aEdl
	CALL:RunCmd %ADB% reboot edl
	GOTO:EOF

:aRbt
	CALL:RunCmd %ADB% reboot
	GOTO:EOF

:aKs
	CALL:RunCmd adb kill-server
	GOTO:EOF

:aDev
	CALL:RunCmd adb devices
	GOTO:EOF

:fDev
	CALL:RunCmd %FB% devices
	GOTO:EOF

:fSN
	CALL:RunCmd %FB% oem flash_sn %2
	CALL:RunCmd %FB% reboot
	GOTO:EOF

:fRbt
	CALL:RunCmd %FB% reboot
	GOTO:EOF

:fEdl
	CALL:RunCmd %FB% oem force-allow-update
	CALL:RunCmd %FB% erasr xbl_a
	CALL:RunCmd %FB% erasr xbl_b
	CALL:RunCmd %FB% reboot
	GOTO:EOF

:fRg
	CALL:RunCmd %FB% oem force-allow-update
	CALL:RunCmd %FB% flash oem_a %2
	CALL:RunCmd %FB% flash oem_b %2
	CALL:RunCmd %FB% reboot
	GOTO:EOF

:fFX
	CALL:RunCmd %FB% oem force-allow-update
	CALL:RunCmd %FB% flash xbl_a xbl.elf
	CALL:RunCmd %FB% flash xbl_b xbl.elf
	CALL:RunCmd %FB% flash xbl_config_a xbl_config.elf
	CALL:RunCmd %FB% flash xbl_config_b xbl_config.elf
	CALL:RunCmd %FB% reboot
	GOTO:EOF

:fFA
	CALL:RunCmd %FB% flash abl_a abl.elf
	CALL:RunCmd %FB% flash abl_b abl.elf
	CALL:RunCmd %FB% reboot
	GOTO:EOF

:fFB
	REM CALL:RunCmd %FB% oem flashimage_enable
	
	CALL:RunCmd %FB% flash boot_a boot.img
	CALL:RunCmd %FB% flash boot_b boot.img
	CALL:RunCmd %FB% flash dtbo_a dtbo.img
	CALL:RunCmd %FB% flash dtbo_b dtbo.img

	IF EXIST vendor_boot.img (
		CALL:RunCmd %FB% flash vendor_boot_a vendor_boot.img
		CALL:RunCmd %FB% flash vendor_boot_b vendor_boot.img
	) ELSE (
		ECHO No vendor_boot.img
	)
	CALL:RunCmd %FB% reboot
	GOTO:EOF

:Qf610Img
	SET COM_PORT=%2
	if '%COM_PORT%'=='' (
		REM GOTO :HELP
		MsgY "Need a param as COM port of EDL like COM21"
		GOTO:EOF
	)
	SET IMG_PATH=%3
	if '%IMG_PATH%'=='' (
		SET IMG_PATH=.\
	)
	REM Prepare Sahara protocol
	CALL:RunCmd %QS% -p \\.\%COM_PORT% -s 13:%FIREHOSE_ELF% -b %IMG_PATH%
	REM Download Flat images
	SET FH_PARAM=--sendxml=rawprogram0.xml,patch0.xml
	SET FH_PARAM=%FH_PARAM% --memoryname=emmc
	SET FH_PARAM=%FH_PARAM% --reset
	SET FH_PARAM=%FH_PARAM% --noprompt
	SET FH_PARAM=%FH_PARAM% --port=\\.\%COM_PORT%
	SET FH_PARAM=%FH_PARAM% --loglevel=0
	SET FH_PARAM=%FH_PARAM% --showpercentagecomplete
	SET FH_PARAM=%FH_PARAM% --search_path=%IMG_PATH%
	SET FH_PARAM=%FH_PARAM% --porttracename=FH_%COM_PORT%.log

	CALL:RunCmd %FH% %FH_PARAM%
	GOTO:EOF

:QfDL_uE
	SET COM_PORT=%2
	if '%COM_PORT%'=='' (
		REM GOTO :HELP
		MsgY "Need a param as COM port of EDL like COM21"
		GOTO:EOF
	)
	SET IMG_PATH=%3
	if '%IMG_PATH%'=='' (
		SET IMG_PATH=.\
	)

	REM Prepare Sahara protocol
	CALL:RunCmd %QS% -p \\.\%COM_PORT% -s 13:%FIREHOSE_ELF% -b %IMG_PATH%
	REM Download Flat images
	SET FH_PARAM=--sendxml=rawprogram_unsparse0_ufs_EM.xml,rawprogram1_ufs.xml,rawprogram2_ufs.xml,rawprogram3_ufs.xml,rawprogram4_ufs_EM.xml,rawprogram5_ufs.xml,patch0_ufs.xml,patch1_ufs.xml,patch2_ufs.xml,patch3_ufs.xml,patch4_ufs.xml,patch5_ufs.xml
	SET FH_PARAM=%FH_PARAM% --memoryname=ufs
	SET FH_PARAM=%FH_PARAM% --reset
	SET FH_PARAM=%FH_PARAM% --noprompt
	SET FH_PARAM=%FH_PARAM% --port=\\.\%COM_PORT%
	SET FH_PARAM=%FH_PARAM% --loglevel=0
	SET FH_PARAM=%FH_PARAM% --showpercentagecomplete
	SET FH_PARAM=%FH_PARAM% --search_path=%IMG_PATH%
	SET FH_PARAM=%FH_PARAM% --porttracename=FH_%COM_PORT%.log

	CALL:RunCmd %FH% %FH_PARAM%
	GOTO:EOF


:NP
	SET NP_PATH=D:\NonSetup\NotePad++\notepad++.exe %2
	CALL:RunCmd %NP_PATH% %2
	GOTO:EOF

:MsgY
	PowerShell -Command "Write-Host ' - AKen: %*' -ForegroundColor Yellow"
	GOTO:EOF

:RunCmd
	PowerShell -Command "Write-Host '  ==> %*' -ForegroundColor Yellow"
	%*
	GOTO:EOF
