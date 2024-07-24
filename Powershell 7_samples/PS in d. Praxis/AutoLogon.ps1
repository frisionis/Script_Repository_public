### The code below configures Auto-Logon on Windows computers ###
<#
Author: Patrick Gruenauer | Microsoft MVP on PowerShell
Web: https://sid-500.com
#>

# Enter username
$Username = Read-Host 'Enter username for Auto-Logon (f.e. contoso\user1)'
$Pass = Read-Host "Enter password for $Username"

# Configure Auto-Logon
$RegistryPath = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon'
Set-ItemProperty $RegistryPath 'AutoAdminLogon' -Value "1" -Type String 
Set-ItemProperty $RegistryPath 'DefaultUsername' -Value "$Username" -type String 
Set-ItemProperty $RegistryPath 'DefaultPassword' -Value "$Pass" -type String
Write-Warning "Auto-Login for $username configured. Please restart computer."

# Ask for restart
$restart = Read-Host 'Do you want to restart your computer now for testing autologon? (Y/N)'
If ($restart -eq 'Y') {
    Restart-Computer -Force
} else {
    'Operation completed. To apply settings, restart your computer.'
}
