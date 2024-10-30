# WarningPreference

$WarningPreference

Write-Warning 'Das ist eine Warnung.'

$WarningPreference = "SilentlyContinue"
$m = "This action can delete data."
Write-Warning -Message $m

$WarningPreference = "Continue"

Get-ChildItem C:\Temp -WarningAction SilentlyContinue # nur als Beispiel

<#
Stop: Displays the warning message and an error message and then stops executing.
Inquire: Displays the warning message and then prompts for permission to continue.
Continue: (Default) Displays the warning message and then continues executing.
SilentlyContinue: Doesn't display the warning message. Continues executing.
Quelle: learn.microsoft.com
#>