# Requires PowerShell 5.1 or 7
# Endless Ping with Error Reporting

# Provide Hostname or IP-Address for Testing
$Comp   = '172.16.0.100'
$Report = "$home\ping $comp.txt"

# PowerShell 7
If (($PSVersionTable.PSVersion.Major -notlike '5*')) {
    Start-Job -Name PS7Ping -ScriptBlock {
    Add-Content -Path $using:Report -Value "Monitoring started: $(Get-Date -Format "dddd dd/MM/yyyy HH:mm:ss")"
    while ($true) {
            If ((Test-Connection $using:Comp -Count 1).Status -ne 'Success') {
            $date  = Get-Date -Format "dddd dd/MM/yyyy HH:mm:ss"    
                Add-Content `
                -Path $using:Report `
                -Value "$date : Ping Error. Reported from $($env:computername) in PowerShell $($PSVersionTable.PSVersion.Major)."
            }
        }
}
}
else {
# PowerShell 5
Start-Job -Name PS5Ping -ScriptBlock {
Add-Content -Path $using:Report -Value "Monitoring started: $(Get-Date -Format "dddd dd/MM/yyyy HH:mm:ss")"
    while ($true) {
        Try {
            Test-Connection $using:Comp -Count 1 -ErrorAction Stop | Out-Null
        }
        Catch {
            $date  = Get-Date -Format "dddd dd/MM/yyyy HH:mm:ss"
            Add-Content `
            -Path $using:Report `
            -Value "$date : Ping Error. Reported from $($env:computername) in PowerShell $($PSVersionTable.PSVersion.Major)."
            }
    }
    }
}