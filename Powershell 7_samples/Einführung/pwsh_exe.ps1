<#
Anmerkung: 
noExit, noProfile und NoLogo sind positional, müssen an vorderster Stelle stehen 
#> 

pwsh.exe -noExit -NoProfile -NoLogo -Command "Get-EventLog -LogName Application -Newest 5 | Format-Table -AutoSize -Wrap"



