
Connect-VIServer -Server "xyz" -User "xyz" -Password test123

$date = Get-Date -Format G

## Auslesen via Tag (Berechtigungen fehlen derzeit)
Get-VM -Tag xyz | New-Snapshot -Name "VM-Snapshot $date SCCM" -Description "Windows Updates" -Quiesce
