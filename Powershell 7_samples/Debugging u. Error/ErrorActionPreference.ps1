# ErrorActionPreference

# ErrorActionPreference (Session)
$ErrorActionPreference      # Continue = Standard 
Get-ChildItem hklm:
$ErrorActionPreference = "SilentlyContinue"
Get-ChildItem hklm:

# ErrorActionPreference Parameter
Get-ChildItem hklm: -ErrorAction SilentlyContinue
Get-ChildItem hklm: -ErrorAction Suspend
Get-ChildItem hklm: -ErrorAction Break
Get-ChildItem hklm: -ErrorAction Inquire

# ErrorAction im Try-Catch-Block
$error.Clear()
$ErrorActionPreference="Stop" # neccessary, because of upcoming Non-terminating error

Try {
 Get-ChildItem -Path C:\notthere
 }
Catch {
 Write-Host "Ein Ordner existiert nicht" -ForegroundColor Red
 }
Finally {
 Write-Host "Test durchgeführt"
 } 

<#
Break - Enter the debugger when an error occurs or when an exception is raised.
Continue: (Default) Displays the error message and continues executing.
Ignore: Suppresses the error message and continues to execute the command. 
The Ignore value is intended for per-command use, not for use as saved preference. 
Ignore isn't a valid value for the $ErrorActionPreference variable.
Inquire: Displays the error message and asks you whether you want to continue.
SilentlyContinue: No effect. The error message isn't displayed and execution continues without interruption.
Stop: Displays the error message and stops executing. 
In addition to the error generated, the Stop value generates an ActionPreferenceStopException object to the error stream.
Suspend: Automatically suspends a workflow job to allow for further investigation. 
After investigation, the workflow can be resumed. The Suspend value is intended for per-command use, not for use as saved preference. 
Suspend isn't a valid value for the $ErrorActionPreference variable.
Quelle: learn.microsoft.com
#>