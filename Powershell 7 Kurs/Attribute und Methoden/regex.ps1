# Does this string contains digits?

'patrick.gruenauer1298@outlook.com' -match '\d'
'patrick.gruenauer@outlook.com' -match '\d'

# Does this string contains german umlauts?

'patrick.grünauer' -match '[^a-zA-Z]'

# Alle Zahlen entfernen (RegEx) und Domäne ändern 
# Achtung: -replace verwenden, .replace unterstützt kein RegEx

$a = 'patrick.gruenauer1298@outlook.com'

$pattern = '\d+'

$a -replace $pattern,"" -replace "outlook.com","gmail.com"

### Eine Liste ...

$array = @(
'patrick.gruenauer@outlook.com'
'patrick.gruenauer@.com'
'.patrick.gruenauer@outlook.com'
'-patrick.gruenauer@.com'
'-patrick.gruenauer@@outlook.com'
'herbert.huber@gmail.comcom'
'hansi'
'123'
'@#9'
)

### Simple statements

$array | Select-String -Pattern '@'


### Regex E-Mail Adressen suchen

<# 

(^) Beginnt mit keinem Sonderzeichen, dann beliebig, endet mit keinem Sonderzeichen, gefolgt von einem @, danach kein Sonderzeichen,
dann beliebig, vor dem Punkt kein Sonderzeichen, dann Punkt und nach Punkt 2-? Zeichen (Top-Level Domain)

#> 

# Thanks to ristl.IT !

$regmail2 = '^[a-zA-Z0-9][a-zA-Z0-9._-]+[a-zA-Z0-9]@[a-zA-Z0-9][a-zA-Z0-9._-]+[a-zA-Z0-9]\.[a-zA-Z]{2,4}$'
$array | Select-String -Pattern $regmail2

