# foreach

$a = 5,8,9,11
foreach ($item in $a) {
    $item+5
}

$a = 1..100 
foreach ($i in $a) { 
    New-Item -ItemType Directory -Name Schularbeit$i -Path (Join-Path $home \documents)
}


$a = 1..99 
foreach ($i in $a) {
    If ($i -lt 10) {
        New-Item -ItemType Directory -Name Schularbeit0$i -Path $home\Schularbeit
    } 
    else {
        New-Item -ItemType Directory -Name Schularbeit$i -Path $home\Schularbeit
    }
}

# Praxisbeispiel

$y = 2012..2020 
$m = 1..12

New-Item -ItemType Directory -Name Jahre -Path C:\ -Force

Foreach ($e in $y) {
        New-Item -ItemType Directory -Name $e -Path C:\Jahre
        
        Foreach ($i in $m) {
            New-Item -ItemType Directory -Name $i -Path C:\Jahre\$e
        }
}
