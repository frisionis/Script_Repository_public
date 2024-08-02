# -AsJob

Get-Command -ParameterName AsJob
Invoke-Command -ComputerName localhost -ScriptBlock {Get-Hotfix} -AsJob
Get-Job
Receive-Job -Id 1