﻿#Requires -Version 5.0
# Requires -Modules VMware.VimAutomation.Core

<#
    .SYNOPSIS
        Retrieves the PCI devices on the specified hosts

    .DESCRIPTION

    .NOTES
        This PowerShell script was developed and optimized for ScriptRunner. The use of the scripts requires ScriptRunner. 
        The customer or user is authorized to copy the script from the repository and use them in ScriptRunner. 
        The terms of use for ScriptRunner do not apply to this script. In particular, ScriptRunner Software GmbH assumes no liability for the function, 
        the use and the consequences of the use of this freely available script.
        PowerShell is a product of Microsoft Corporation. ScriptRunner is a product of ScriptRunner Software GmbH.
        © ScriptRunner Software GmbH

    .COMPONENT
        Requires Module VMware.VimAutomation.Core

    .LINK
        https://github.com/scriptrunner/ActionPacks/tree/master/VMware/Host

    .Parameter VIServer
        [sr-en] IP address or the DNS name of the vSphere server to which you want to connect
        [sr-de] IP Adresse oder DNS des vSphere Servers

    .Parameter VICredential
        [sr-en] PSCredential object that contains credentials for authenticating with the server
        [sr-de] Benutzerkonto für die Ausführung

    .Parameter HostName
        [sr-en] Host for which you want to retrieve the devices
        [sr-de] Hostname

    .Parameter ClassName
        [sr-en] Limits results to devices of the specified class
        [sr-de] Klassenname

    .Parameter DeviceName
        [sr-en] Filters the PCI devices by name. Note: This parameter is not case-sensitive.
        [sr-de] Gerätename
#>

[CmdLetBinding()]
Param(
    [Parameter(Mandatory = $true)]
    [string]$VIServer,
    [Parameter(Mandatory = $true)]
    [pscredential]$VICredential,
    [string]$HostName,
    [string]$ClassName,
    [string]$DeviceName
)

Import-Module VMware.VimAutomation.Core

try{
    if([System.String]::IsNullOrWhiteSpace($DeviceName) -eq $true){
        $DeviceName = "*"
    }
    
    $Script:vmServer = Connect-VIServer -Server $VIServer -Credential $VICredential -ErrorAction Stop

    if([System.String]::IsNullOrWhiteSpace($ClassName) -eq $true){
        $Script:Output = Get-VMHostPciDevice -Server $Script:vmServer -VMHost $HostName -Name $DeviceName -ErrorAction Stop | Select-Object *   
    }
    else {
        $Script:Output = Get-VMHostPciDevice -Server $Script:vmServer -DeviceClass $ClassName -VMHost $HostName -Name $DeviceName -ErrorAction Stop | Select-Object *          
    }
    
    if($SRXEnv) {
        $SRXEnv.ResultMessage = $Script:Output 
    }
    else{
        Write-Output $Script:Output
    }
}
catch{
    throw
}
finally{    
    if($null -ne $Script:vmServer){
        Disconnect-VIServer -Server $Script:vmServer -Force -Confirm:$false
    }
}