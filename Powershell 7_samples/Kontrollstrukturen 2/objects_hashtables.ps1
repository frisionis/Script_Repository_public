# Einfaches PowerShell Object
$obj = New-Object PSObject -Property ([ordered]@{ 
                Ordner = '1'
                OrdnerName = 'Windows' 
                LetzterZugriff = '10.10.2022'
})
$obj.GetType()
Write-Output $obj
Write-Host $obj # !!!

# Objects aus mehreren Quellen zusammenstellen
$op = Get-CimInstance Win32_operatingsystem
$co = Get-CimInstance Win32_computersystem

$objectProperty = [ordered]@{
    ComputerName        = $co.Name
    Serialnumber        = $op.Serialnumber
    User                = $op.RegisteredUser
    RAM                 = [math]::Round($co.TotalPhysicalMemory/1GB)
}

$obj = New-Object -TypeName psobject -Property $objectProperty
Write-Output $obj
# Retrieve single item 
$obj.ComputerName

# Hash Tables (Key - Value Pair)
$table = @{
        'Peter' =  3;
        'Hans' =  3;
        'Markus' =  6;
        'Michael' = 12;
        'Bettina' =  3
    }
$table.GetType()
# 3 durch 4 ersetzen
$change = $table.GetEnumerator() | Where-Object {$_.Value -eq 3}
$change | ForEach-Object { $table[$_.Key]=4 }
$table
# Retrieve single value
$table.GetEnumerator() | Where-
Object Name -EQ 'Peter' | Select-Object -ExpandProperty Value 


# Advanced 

# Objects in Arrays speichern
$list.Clear()
$list = @()

$list += New-Object PSObject -Property ([ordered]@{ Number = 1; Player = "Peter Wright"; Value = "150.000"; Country = "SCO"})
$list += New-Object PSObject -Property ([ordered]@{ Number = 2; Player = "Gerwyn Price"; Value = "120.000"; Country = "WAL"})
$list += New-Object PSObject -Property ([ordered]@{ Number = 3; Player = "Michael van Gerwyn"; Value = "110.000"; Country = "BEL"})
$list += New-Object PSObject -Property ([ordered]@{ Number = 4; Player = "Mensur Suljovic"; Value = "100.000"; Country = "AUT"})
$list += New-Object PSObject -Property ([ordered]@{ Number = 5; Player = "Michael Smith"; Value = "90.000"; Country = "UK"})

Write-Output $list
$list | Out-GridView

# Retrieve Files
$filesarray.Clear()
$filesarray = @()
$files = Get-ChildItem $home
$i = 0

foreach ($f in $files) {
        $i ++
        $filesarray += New-Object PSObject -Property ([ordered]@{ 
                        Ordner = $i;
                        OrdnerName = $f.Name; 
                        LetzterZugriff = $f.LastWriteTime
})

}
Write-Output $filesarray
