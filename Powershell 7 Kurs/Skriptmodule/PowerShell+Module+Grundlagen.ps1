# PowerShell Module 
Get-Module -ListAvailable       # alle Module anzeigen
$env:PSModulePath -split ';'    # zeigt alle Modulpfade
Get-InstalledModule             # Welche Module wurden installiert?
Get-Module                      # Welche Module sind derzeit geladen?

# Wie werden Module geladen?
Get-Module                      # Am Beispiel des Windows Defenders: Das Modul ist nicht da  
Get-MpPreference                # nun wird das Modul im Hintergrund geladen

# Der Ablauf ...        
Trace-Command CommandDiscovery -Expression {Get-MpThreatCatalog} -PSHost | Out-Host -Paging
Remove-Module ConfigDefender

# Automatisches Laden ausschalten (PowerShell vorher neu starten)
$PSModuleAutoLoadingPreference = "none"
Get-MpPreference
Import-Module ConfigDefender    # Lösung: Importieren des Moduls

# Ein bekanntes Modul: Active Directory
$PSModuleAutoLoadingPreference = "All"
Get-Command -Module ActiveDirectory
(Get-Command -Module ActiveDirectory).Count