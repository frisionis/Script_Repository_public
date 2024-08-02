function Send-Greeting
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        [string] $Name,

        [Parameter()]
        [string] $Color = 'DarkRed'
    )

    Begin {}

    Process {
        Write-Host ("Hello " + $Name + "!") -ForegroundColor $Color
    }

    End {}    
}
