$name = 'Patrick . Gruenauer @ outlook.com    '

$name | Get-Member

# Ziel: patrick.gruenauer@contoso.com

$resultat = $name.Trim().Replace(' ','').Replace('outlook.com','contoso.com').ToLower()

# Wurden die letzten Zeichen mit Trim auch entfernt?

$resultat.Length

# Gegeben: patrick.gruenauer@contoso.com 
# Ziel: Patrick Gruenauer

$index = $resultat.IndexOf('@')

$nameneu = $resultat.Substring(0,$index)

$split = $nameneu.Split('.')

$split -join ',' # Exkurs -join

$split[0].Substring(0,1).ToUpper() + $split[0].Substring(1) + ' ' `
+ $split[1].Substring(0,1).ToUpper() + $split[1].Substring(1)

# Ziel: Sub-Domain auslesen (contoso)

$name1 = 'patrick.gruenauer@contoso.com'

$index1 = $name1.IndexOf('@')                     # Ankerpunkt 1 = Position 17
$index2 = $name1.LastIndexOf('.')                 # Ankerpunkt 2 = Position 25

$name1.Substring($index1,$index2)                 # ??? 
$name1.Length

$name1.Substring($index1+1,$index2-$index1-1)    # OK

# Ziel: Bei mehreren Namen nur den Nachnamen erhalten

$liste = @(
'Patrick Gruenauer'
'Franz Bizeps'
)

foreach ($l in $liste) {
    ($l -split ' ')[1]
}