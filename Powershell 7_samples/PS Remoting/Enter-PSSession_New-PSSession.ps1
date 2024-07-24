# Enter-PSSession
Enter-PSSession -ComputerName mb01
hostname
Exit-PSSession

# New-PSSession
New-PSSession -ComputerName dc01
Enter-PSSession -Id 2 # Achtung auf ID
Exit-PSSession
Get-PSSession
Get-PSSession | Remove-PSSession
New-PSSession -ComputerName dc01,mb01

# Mit Credentials
Enter-PSSession -ComputerName mb01 -Credential pagr\administrator
Enter-PSSession -ComputerName mb01 -Credential (Get-Credential)
New-PSSession -ComputerName dc01,mb01 -Credential pagr\administrator
New-PSSession -ComputerName dc01,mb01 -Credential (Get-Credential)

# Automatisierung
$session = New-PSSession -ComputerName dc01,mb01 -Credential pagr\administrator
Invoke-Command -Session $session -ScriptBlock {Install-WindowsFeature -Name Windows-Server-Backup}