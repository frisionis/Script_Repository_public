# Mehrere Funktionen in einem Modul erstellen

# Modul Ordner erstellen: Patrick
New-Item -Path ($env:PSModulePath -split ';')[0] -ItemType Directory -Name FindFiles -Force

# Modul Manifest Datei erstellen
# Manifest Datei erstellen
$paramHash = @{
    Path = ($env:PSModulePath -split ';')[0] + '\FindFiles\findfiles.psd1'
    RootModule = "findfiles.psm1"
    Author = "Patrick Gruenauer"
    CompanyName = "sid-500.com"
    ModuleVersion = "1.0"
    Guid = '56f62aec-33ca-4d8a-8685-c6a87ac9a002'
    PowerShellVersion = "7.0"
    Description = "Testmodul"
    FormatsToProcess = ""
    FunctionsToExport = @('Get-BigFiles', 'Get-SmallFiles')
    AliasesToExport = ""
    VariablesToExport = ""
    CmdletsToExport = ""
   }
   
   New-ModuleManifest @paramHash

# Funktionen erstellen

# psm1 Datei erstellen
New-Item -Path (($env:PSModulePath -split ';')[0] + '\FindFiles') -ItemType File -Name findfiles.psm1 -Force

# Datei befuellen: Get-BigFiles, Get-SmallFiles
Add-Content -Path (($env:PSModulePath -split ';')[0] + '\FindFiles\findfiles.psm1') `
-Value 'function Get-BigFiles {Get-ChildItem -Path $home -File -Recurse | Where-Object Length -gt (1MB)}; 
function Get-SmallFiles {Get-ChildItem -Path $home -File -Recurse | Where-Object Length -lt (1MB)}'
   
