Import-Csv C:\temp\sample_manufacturer.csv,C:\temp\sample_manufacturer_2.csv |
Where-Object {$_.Manufacturer -eq 'Microsoft' -and $_.BiosVersion -like '13.*' `
-and $_.CanUpDate -eq 'true'} | 
Export-Csv C:\temp\microsoft_13_canupdate.csv -NoTypeInformation


