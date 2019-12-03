@echo off

rem Doskey Alias
@doskey ls=ls --color -F
@doskey DevMgr=start devmgmt.msc
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

