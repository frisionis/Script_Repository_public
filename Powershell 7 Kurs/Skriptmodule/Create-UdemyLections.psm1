function New-UdemyLections {

# Parameter
[CmdletBinding()]
param
(
[Parameter(Position=0)]
$Name
)
# Create Lections
$Lektionen = 1..100
$Ordner = "$home\$Name"

foreach ($i in $Lektionen) {
    New-Item -Path $Ordner -Name ('{0:d2}' -f $i) -ItemType Directory
}

New-Item -Path $Ordner -Name "_Promotion" -ItemType Directory
New-Item -Path $Ordner -Name "Z_Ende" -ItemType Directory
}