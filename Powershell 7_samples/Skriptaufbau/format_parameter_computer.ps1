$comp = Read-Host "How many computers?"
$range = 1..$comp
Foreach ($r in $range) {
    If ($range.length -lt 100) {
        'Computer' + '{0:d2}' -f $r
    }
    ElseIf ($range.length -lt 1000) {
        'Computer' + '{0:d3}' -f $r
    }
    ElseIf ($range.length -lt 10000) {
        'Computer' + '{0:d4}' -f $r
    }
}


