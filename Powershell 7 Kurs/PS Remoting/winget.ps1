# Installation of winget version 1.2.10271

# Download winget
Start-BitsTransfer `
-Source 'https://github.com/microsoft/winget-cli/releases/download/v1.2.10271/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle' `
-Destination (Join-Path -Path $home -ChildPath Downloads)

# App Installation
Import-Module Appx -UseWindowsPowerShell # PS7!
Add-AppxPackage (Join-Path -Path $home -ChildPath Downloads\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle)

# Playing around ...
winget search adobe --accept-source-agreements
winget install Adobe.Acrobat.Reader.64-bit --accept-source-agreements
winget search PowerShell --accept-source-agreements
winget install Microsoft.WindowsTerminal --accept-source-agreements
winget install Microsoft.PowerShell --accept-source-agreements --accept-package-agreements

# Remote-Computer Installation
Enter-PSSession computer01 -Credential admin 
# oder
Invoke-Command -ComputerName computer01 -Credential admin -ScriptBlock {winget install powershell}