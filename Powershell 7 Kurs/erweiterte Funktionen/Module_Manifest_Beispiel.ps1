# Modul Ordner erstellen: Patrick
New-Item -Path ($env:PSModulePath -split ';')[0] -ItemType Directory -Name Patrick -Force

# Manifest Datei erstellen
$paramHash = @{
 Path = ($env:PSModulePath -split ';')[0] + '\Patrick\patrick.psd1'
 RootModule = "patrick.psm1"
 Author = "Patrick Gruenauer"
 CompanyName = "sid-500.com"
 ModuleVersion = "1.0"
 Guid = '56f62aec-33ca-4d8a-8685-c6a87ac9a002'
 PowerShellVersion = "7.0"
 Description = "Testmodul"
 FormatsToProcess = ""
 FunctionsToExport = "Get-BigFiles,Get-SmallFiles"
 AliasesToExport = ""
 VariablesToExport = ""
 CmdletsToExport = ""
}

New-ModuleManifest @paramHash
