# Module suchen

Find-Module
Find-Module -Name *VMWare*
Find-Module | Where-Object Author -like "*Gruenauer*"

# Module installieren

Install-Module -Name Get-AntiMalwareStatus -Force -AllowClobber
Get-AntimalwareStatus -Scope AllServer | Out-GridView