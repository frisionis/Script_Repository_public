
$HKU = Get-PSDrive HKU -ea silentlycontinue 

if (!$HKU ) { 
	
	New-PSDrive -Name HKU -PsProvider Registry HKEY_USERS | out-null 
	Set-Location HKU: 
} 


$regProfiles = Get-ChildItem -Path HKU: | ? { ($_.PSChildName.Length -gt 8) -and ($_.PSChildName -notlike "*.DEFAULT") -and ($_.PSChildName -notlike "*_Classes") } 


ForEach ($profile in $regProfiles ) { 

set-ItemProperty -Path $profile\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarMn -value "0"
} 



Remove-PSDrive -Name HKU 


Get-AppxPackage -AllUsers *MicrosoftTeams* | Remove-AppxPackage -AllUsers