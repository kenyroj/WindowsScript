@echo off

rem Doskey Alias
@doskey ls=ls --color -F $*
@doskey grep=grep --color=always $*
@doskey DevMgr=start devmgmt.msc
@doskey SndCtl=control.exe mmsys.cpl
@doskey np=E:\NonSetup\NotePad++\notepad++.exe $*
@doskey ..=cd ..

@doskey adev=adb devices
@doskey aks=adb kill-server
@doskey arbt=adb wait-for-device reboot
@doskey aldr=adb wait-for-device reboot bootloader
@doskey aedl=adb wait-for-device reboot edl
@doskey aroot=adb wait-for-device root
@doskey ashll=adb wait-for-device shell $*
@doskey aver=adb wait-for-device shell "getprop ro.build.display.id"
@doskey acrsh=adb wait-for-device shell "echo c > /proc/sysrq-trigger"
@doskey fb_rbt=fastboot reboot

SET PATH=%PATH%;E:\WindowsScript;E:\NonSetup\AndroidPlatformTools;E:\NonSetup\GnuWin32\bin

::PROMPT $E[m$E[32m$E]9;8;"USERNAME"$E\@$E]9;8;"COMPUTERNAME"$E\$S
SET PROMPT_PATH=$E[1;36m$P$E[m
if "%ConEmuIsAdmin%" == "ADMIN" (
	SET PROMPT_TAIL=$E[1;31m#$E[m$S$E]9;12$E\
) else (
	SET PROMPT_TAIL=$E[1;33m$G$E[m$S$E]9;12$E\
)
PROMPT %PROMPT_PATH%%PROMPT_TAIL%

E: