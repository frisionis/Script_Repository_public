# Defender
Get-Command -Module Defender

# Anzeigen
Get-MpComputerStatus 
Invoke-Command -ComputerName mb01 -ScriptBlock {Get-MpComputerStatus}
Get-MpThreatCatalog
Get-MpThreatCatalog | Select-Object ThreatName
Get-MpThreatCatalog | Select-Object ThreatName | Out-File $home\threats.txt
Get-MpPreference

# Aendern und Ueberpruefen
Start-MpScan -Verbose
Update-MpSignature -Verbose
Add-MpPreference -ExclusionPath "C:\Temp" # Ordner zur AusschlussListe hinzufuegen
Get-MpPreference | Select-Object -ExpandProperty ExclusionPath

# AntiMalware Settings von allen Computern abrufen
$comp = Get-ADComputer -Filter * | Select-Object -ExpandProperty Name 
$result = @()
foreach ($c in $comp) {
    If ((Test-Connection $c).Status -eq 'Success') {
            $s = Invoke-Command -ComputerName $c -ScriptBlock {
            Get-MpComputerStatus | 
            Select-Object -Property Antivirusenabled, `
            AMServiceEnabled,AntispywareEnabled, `
            BehaviorMonitorEnabled,IoavProtectionEnabled,  
            NISEnabled,OnAccessProtectionEnabled,RealTimeProtectionEnabled, `
            AntivirusSignatureLastUpdated
        } -ErrorAction SilentlyContinue
    
    $result+=New-Object -TypeName PSObject -Property ([ordered]@{
                'Server'=$s.PSComputername
                'Anti-Virus'=$s.AntivirusEnabled
                'AV Update'=$s.AntivirusSignatureLastUpdated
                'Anti-Malware'=$s.AMServiceEnabled
                'Anti-Spyware'=$s.AntispywareEnabled
                'Behavior Monitor'=$s.BehaviorMonitorEnabled
                'Office-Anti-Virus'=$s.IoavProtectionEnabled
                'NIS'=$s.NISEnabled
                'Access Prot'=$s.OnAccessProtectionEnabled
                'R-T Prot'=$s.RealTimeProtectionEnabled
         })
    }
}
Write-Output $result | Format-Table -AutoSize -Wrap

