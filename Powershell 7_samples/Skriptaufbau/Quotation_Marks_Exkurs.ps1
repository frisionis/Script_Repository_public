<#
Regel:
1. Komplexe Dinge (wo etwas passiert) in ""
2. Strings in ''
#>

'Patrick, heute ist der Get-Date' # Gibt den Ausdruck so aus, wie er geschrieben ist

"Patrick, heute ist der Get-Date" # Gibt den Ausdruck so aus, wie er geschrieben ist

"Patrick, heute ist der $(Get-Date)" <# Hier hilft $() NUR bei "" weil Befehle in runden Klammern sofort ausgeführt werden, das Datum ist bereits da wenn der String ausgegeben wird #>

'Patrick, heute ist der $(Get-Date)' # da kann ich machen was ich will, es funktioniert mit '' nicht

<# Sub-Expression Operator kann bei Variablen weggelassen werden, 
aber auch hier gilt: Strings in '' und komplexere Dinge in ""
#>

$date = Get-Date

'Patrick, heute ist der $date'

"Patrick, heute ist der $date"

### Ausnahme: Verwendung des Format -f Parameters bei ''

$date = Get-Date
$username = $env:USERNAME

'Patrick, heute ist der {0} und du bist angemeldet als {1}' -f $date,$username
# oder
"Patrick, heute ist der $date und du bist angemeldet als $username"
