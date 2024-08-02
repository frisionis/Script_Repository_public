## Not Global (Scriptblock only)
function Ping-Homepage {
    $hp = 'sid-500.com'
    Test-Connection $hp -Count 1
}
$hp # weg 

# $global ==> Lokale Variable im Skriptblock als Global definieren
function Ping-Homepage {
    $global:hp = 'sid-500.com'
    Test-Connection $hp -Count 1
}
$hp # hier

# $using ==> Zugriff auf Globale Variable in einem Skriptblock
$liste = '8.8.8.8','sid-500.com'
Invoke-Command -ComputerName localhost -ScriptBlock {Test-Connection $liste}        # funktioniert nicht!
Invoke-Command -ComputerName localhost -ScriptBlock {Test-Connection $using:liste}  # funktioniert

