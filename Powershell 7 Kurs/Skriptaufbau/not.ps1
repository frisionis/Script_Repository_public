# Etwas verneinen mit -not oder !

$a = 'Patrick Gruenauer'
$b = ''
!$a
!$b   
-not $b

$fwrule = Get-NetFirewallRule -Name FPS-SMB-In-TCP | Select-Object -ExpandProperty Enabled
'True' -notin $fwrule
'True' -in $fwrule

Get-ADUser -Filter '-not City -like "*"' -Properties City | Select-Object Name,City
Get-ADUser -Filter 'City -notlike "*"' -Properties City | Select-Object Name,City # dasselbe



