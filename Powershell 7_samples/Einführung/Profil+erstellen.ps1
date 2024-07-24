# Profildatei erstellen
New-Item $PROFILE –ItemType File -Force
# Wo ist die Datei ?
$PROFILE

# Welche Profile gibt es?
$PROFILE.

# Achtung! Profil ist ps1 Datei, kann nur geladen werden wenn die Executionpolicy dies zulässt!
Get-ExecutionPolicy # muss remotesigned oder unrestricted sein
Set-ExecutionPolicy RemoteSigned # optional

# Datei öffnen
notepad $PROFILE

# Beispielprofil (in $PROFILE kopieren)
Set-Location -Path C:\
Clear-Host
Write-Host "User: $env:userdomain\$env:username`nPowerShell $($PSVersiontable.psversion.major) at your service."
Get-Date
