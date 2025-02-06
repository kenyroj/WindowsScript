
# 避免重複導入自定義模塊 (先不要)
#if (-not (Test-Path -Path Function:\Prompt)) {
    function Prompt {
		$currentTime = (Get-Date).ToString("HH:mm")
		$currentPath = Get-Location
		return "$currentPath [`e[1;33m$currentTime`e[m] "
    }
#}

Function StartAdbDevices {
	adb devices
}
Set-Alias adev StartAdbDevices

Function StartAdbEDL {
	adb wait-for-device reboot edl
}
Set-Alias aedl StartAdbEDL

Function GotoParentDir {
	cd ..
}
Set-Alias .. GotoParentDir

Function NotePadpp {
	D:\NonSetup\NotePad++\notepad++.exe $($args[0])
}
Set-Alias np NotePadpp

# Ensure the PSReadLine module is imported
Import-Module PSReadLine
Write-Host Define the key binding for Ctrl-D to exit
Set-PSReadLineKeyHandler -Chord Ctrl+d -Function ViExit

# Write-Host "PowerShell 已啟動，歡迎使用！" -ForegroundColor Green
$SrcPsProfile="D:\WindowsScript\Microsoft.PowerShell_profile.ps1"
$DstPsProfile="D:\AKen.Hsu\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
cp -v $SrcPsProfile $DstPsProfile
Write-Host "`e[1;32mOK.`e[m"
