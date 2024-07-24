# Speed Comparison foreach vs. Foreach-Object

Clear-Variable a,b # Vorbereitung

# Foreach-Object
Measure-Command {
    $a = 0..10000000 
    $a | Foreach-Object $_
} | Select-Object -Property Seconds

# foreach
Measure-Command {
    $b = 0..10000000
    foreach ($i in $b) {
        $i
    }
} | Select-Object -Property Seconds

