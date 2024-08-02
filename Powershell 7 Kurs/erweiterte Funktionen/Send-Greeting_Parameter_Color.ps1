function Send-Greeting
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $Name,

        [Parameter()]
        [string] $Color = 'DarkRed'
    )

    Process
    {
        Write-Host ("Hello " + $Name + "!") -ForegroundColor $Color
    }
}
