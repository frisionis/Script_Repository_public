<# Ziel: 
Alle Benutzer der Gruppe spooler_admins duerfen sich auf den Server per PowerShell 7 WinRM verbinden 
und den Spooler Dienst neu starten und whoami ausfuehren. Sonst ist nichts weiteres erlaubt.
Lösung:
Just Enough Administration (JEA) 
#>

# Pfad erstellen
$jeapath = 'C:\Program Files\PowerShell'

# Gruppe Spooler Admins erstellen
New-ADGroup -Name spooler_admins -GroupCategory Security -GroupScope Universal

# Creating a PS Session Configuration File for the Spooler Admins Group (pssc file)
New-PSSessionConfigurationFile -Path "$jeapath\spooler_conf.pssc"
notepad "$jeapath\spooler_conf.pssc" 
<# Hier bei (# entfernen)
SessionType = 'RestrictedRemoteServer'
RunAsVirtualAccount = $true
RoleDefinitions = @{ 'pagr.inet\spooler_admins' = @{ 'RoleCapabilities' = 'spooler_admins' }} 
#>


# Creating a folder for JEA
New-Item -Path "$jeapath\Modules\JEA\RoleCapabilities" -ItemType Directory

# Creating the PS Role Capability File for the Spooler Admins (psrc file)
New-PSRoleCapabilityFile -Path "$jeapath\Modules\JEA\RoleCapabilities\spooler_admins.psrc"
notepad "$jeapath\Modules\JEA\RoleCapabilities\spooler_admins.psrc"
<# Hier eintragen:
VisibleCmdlets = @{Name = 'Restart-Service';
			     Parameters = @{Name = 'Name'; ValidateSet = 'Spooler'}}
VisibleExternalCommands = 'C:\Windows\system32\whoami.exe'
#>

# Registering the Configuration
Enable-PSRemoting
Register-PSSessionConfiguration -Name Spooler_Admins_JEA -Path "$jeapath\spooler_conf.pssc"
Restart-Service WinRM

# Testing the configuration (from Remote-Host)
Enter-PSSession -ComputerName dc01 -ConfigurationName spooler_admins