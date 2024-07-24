Get-ExecutionPolicy
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned

Get-ExecutionPolicy -List

Get-Content "C:\Users\admin\Downloads\delete_camtasia_files.ps1" -Stream Zone.Identifier

[enum]::GetValues([System.Security.SecurityZone]) + [enum]::GetValues([System.Security.SecurityZone]).value__

&"C:\Users\admin\Downloads\delete_camtasia_files.ps1"

Unblock-File "C:\Users\admin\Downloads\delete_camtasia_files.ps1"