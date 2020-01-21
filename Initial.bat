@echo off

rem Doskey Alias
@doskey ls=ls --color -F
@doskey DevMgr=start devmgmt.msc
@doskey SndCtl=control.exe mmsys.cpl
@doskey np=D:\NonSetup\NotePad++\notepad++.exe $*
@doskey ..=cd ..

@doskey adev=adb devices
@doskey aks=adb kill-server
@doskey arbt=adb reboot
@doskey aldr=adb reboot bootloader
@doskey aedl=adb reboot edl
@doskey aroot=adb root
@doskey ashll=adb shell
@doskey acrsh=adb shell "echo c > /proc/sysrq-trigger"
@doskey ameta=adb shell cat /firmware/verinfo/ver_info.txt
@doskey fb_rbt=fastboot reboot

SET PATH=%PATH%;D:\WindowsScript

::PROMPT $E[m$E[32m$E]9;8;"USERNAME"$E\@$E]9;8;"COMPUTERNAME"$E\$S
SET PROMPT_PATH=$E[1;36m$P$E[m
if "%ConEmuIsAdmin%" == "ADMIN" (
	SET PROMPT_TAIL=$E[1;31m#$E[m$S$E]9;12$E\
) else (
	SET PROMPT_TAIL=$E[1;33m$G$E[m$S$E]9;12$E\
)
PROMPT %PROMPT_PATH%%PROMPT_TAIL%
