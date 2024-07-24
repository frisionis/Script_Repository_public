#powershell_7
#
#Automatisierung Programm Deinstallation mittels WMI
#
#erstellt 20240724 - Daniel Frisardi
#
# Version 1.0
#
#freigegeben - 20240724 - Daniel Frisardi
##########################################################
#keine weiteren Kommentare und Infos
# 
###########################################################

# Name des Programms, das deinstalliert werden soll
$programName = "Name des Programms"

# Funktion zum Deinstallieren eines Programms
function Uninstall-Program {
    param (
        [string]$programName
    )

    # Abrufen der installierten Programme
    $installedPrograms = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq $programName }

    if ($installedPrograms) {
        foreach ($program in $installedPrograms) {
            Write-Host "Deinstalliere $($program.Name)..."
            $program.Uninstall() | Out-Null
            Write-Host "$($program.Name) wurde deinstalliert."
        }
    } else {
        Write-Host "Programm $programName wurde nicht gefunden."
    }
}

# Aufrufen der Funktion zur Deinstallation
Uninstall-Program -programName $programName