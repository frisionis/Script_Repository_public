function Send-Greeting {
    [CmdletBinding(SupportsShouldProcess = $true)]

    Param(
        [Parameter(Mandatory=$true)]
        [string] $Name
    )
    Begin {}
    Process {
       if($PSCmdlet.ShouldProcess($Name,"Nachricht erstellen"))
       {
       Write-Host ("Hello " + $Name + "!")
                }   
    }
    End {}
}

