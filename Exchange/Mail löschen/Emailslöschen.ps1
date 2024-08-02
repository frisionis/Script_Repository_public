<#
    Removes old messages older than x days from message folder of specific mailbox
#>

# --------- Variables ----------------
# Mailbox to process
$MAILBOX = 'Mailbox'
# Subfolder in mailbox
$SUBFOLDER = "Posteingang"
# Credentials to use
$CREDENTIAL = (new-Object PSCredential('USERNAME',(ConvertTo-SecureString 'PASSWORD' -AsPlainText -Force)))
# Exchange Server FQDN
$SERVER = 'EXCHANGESERVER'
# Messages older than x days will be deleted from specified mailbox folder
$OLDERTHANDAYS = 28


$localpath = "C:\Program Files\Microsoft\Exchange Server\V15\Bin\"
# ------------------------------------

if ($PSVersionTable.PSVersion.Major -lt 3){write-host "ERROR: Minimum Powershell Version 3.0 is required!" -F Yellow; return}
# stop on error
$ErrorActionPreference = 'Stop'
# Accept all TLS protocols
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::GetNames([System.Net.SecurityProtocolType]) 

function ConnectTo-EWS {
    param(
        [parameter(mandatory=$true)][bool]$UseScriptCredentials = $true,
        [parameter(mandatory=$false)][pscredential]$Credential,
        [parameter(mandatory=$true)][string]$server
    )

    # Allen Zertifikaten vertrauen
    try{
        Add-Type '
            using System.Net;
            using System.Security.Cryptography.X509Certificates;
            public class TrustAllCertsPolicy : ICertificatePolicy {
                public bool CheckValidationResult(
                    ServicePoint srvPoint, X509Certificate certificate,
                    WebRequest request, int certificateProblem) {
                    return true;
                }
            }
        '
        # Trust all certs policy dem ServicePointManager zuweisen
        [System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
    }catch{}

    # EWS DLL laden
    #Load-EWSLibrary
    [string]$EwsApiDll = "C:\Program Files\Microsoft\Exchange Server\V15\Bin\Microsoft.Exchange.WebServices.dll"
    Import-Module -Name $EwsApiDll

    # EWS-Service Objekt erstellen
    $ews = new-object Microsoft.Exchange.WebServices.Data.ExchangeService([Microsoft.Exchange.WebServices.Data.ExchangeVersion]::Exchange2010)
    $ews.Url = "https://$server/ews/exchange.asmx"
    $ews.UseDefaultCredentials = $true #AUF TRUE gesetzt
    $ews.ImpersonatedUserId = New-Object Microsoft.Exchange.WebServices.Data.ImpersonatedUserId([Microsoft.Exchange.WebServices.Data.ConnectingIdType]::SmtpAddress, [string]$mailbox) #EINGEFÜGT

    if (!$UseScriptCredentials){
        $ews.Credentials = $Credential.GetNetworkCredential()
    }
    return $ews
}
# Funktion zum Laden des EWS Assemblies
#function Load-EWSLibrary {
 #   if ($psscriptroot -eq ''){
 #        $localpath = Join-Path $env:TEMP "Microsoft.Exchange.WebServices.dll"
 #   }else{
 #        $localpath = Join-Path $PSScriptRoot "Microsoft.Exchange.WebServices.dll"
 #   }
 #   $tmp = "$env:TEMP\$([IO.Path]::GetRandomFileName())"
 #   try{
 #       if(!(Test-Path $localpath )){
 #           Add-Type -A System.IO.Compression.FileSystem
 #           write-host "Downloading and extracting required 'Microsoft.Exchange.WebServices.dll' ... " -F Green -NoNewline
        
#            (New-Object System.Net.WebClient).DownloadFile('https://www.nuget.org/api/v2/package/Exchange.WebServices.Managed.Api/2.2.1.2', $tmp)
            
            
            
            
            
            
         #   $zip = [System.IO.Compression.ZipFile]::OpenRead($tmp)
        #    $zip.Entries | ?{$_.Fullname -eq 'lib/net35/Microsoft.Exchange.WebServices.dll'} | %{
       #         [System.IO.Compression.ZipFileExtensions]::ExtractToFile($_,$localpath)
      #      }
     #       write-host "OK" -F Green
    #    }
    #    Add-Type -Path $localpath -EA Stop
   # }catch{
   #     throw "Error: $($_.Exception.Message)"
  #  }finally{
  #      if ($zip){$zip.Dispose()}
  #      del $tmp -Force -EA SilentlyContinue
 #   } 
#}

function Get-EWSFolder{
    param(
        [parameter(mandatory=$true)][Microsoft.Exchange.WebServices.Data.FolderId]$storeroot,
        [parameter(mandatory=$false)][string]$path = "",
        [parameter(mandatory=$true)][ValidateNotNullOrEmpty()][Microsoft.Exchange.WebServices.Data.ExchangeService]$service
    )
    # rekusiver Skriptblock zum Suchen eines Ordnerpfades
    $findfolder = {
        param(
            $id,
            [string]$subpath
        )
        if ($subpath -ne ""){
            $parts = $subpath.Split("\")
            $view = New-Object Microsoft.Exchange.WebServices.Data.FolderView(1)
            $view.Traversal = [Microsoft.Exchange.WebServices.Data.FolderTraversal]::Shallow
            $view.PropertySet = New-Object Microsoft.Exchange.WebServices.Data.PropertySet([Microsoft.Exchange.WebServices.Data.BasePropertySet]::FirstClassProperties)
 
            $f = New-Object Microsoft.Exchange.WebServices.Data.SearchFilter+IsEqualTo([Microsoft.Exchange.WebServices.Data.FolderSchema]::DisplayName,$parts[0])
            $result = $service.FindFolders($id,$f,$view)
            
            if ($result.TotalCount -gt 0){
                if ($parts.Count -gt 1 ){
                    & $findfolder -id $result.Folders[0].Id -subpath $subpath.Split("\",2)[-1]
                }else{
                    return $result.Folders[0]
                }        
            }else{
                throw "Search returned no results for path subpart '$($parts[0])'."
            }
        }else{
            return ([Microsoft.Exchange.WebServices.Data.Folder]::Bind($service,$id))
        }

    }
    return (& $findfolder -id $storeroot -subpath $path)
}

function Get-EWSFolderItems{
    param(
        [parameter(mandatory=$true,ValueFromPipelineByPropertyName=$true)]$id,
        [parameter(mandatory=$false)][int]$maxitems = 10000,
        [parameter(mandatory=$false)][Microsoft.Exchange.WebServices.Data.PropertySet]$propset = $null,
        [parameter(mandatory=$false)][Hashtable]$filter = $null,
        [parameter(mandatory=$false)][ValidateSet('And','Or')][Microsoft.Exchange.WebServices.Data.LogicalOperator]$filterLogicalOperator = 'And',
        [parameter(mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)][ValidateNotNullOrEmpty()][Microsoft.Exchange.WebServices.Data.ExchangeService]$service
    )
    $result = $null
    $moreItems = $true
    $resultSet = @()

    $view = New-Object Microsoft.Exchange.WebServices.Data.ItemView($maxitems)
    if ($propset -ne $null){
        $view.PropertySet = $propset
    }else{
        $view.PropertySet = New-Object Microsoft.Exchange.WebServices.Data.PropertySet([Microsoft.Exchange.WebServices.Data.BasePropertySet]::FirstClassProperties)
    }
    if ($filter -ne $null){
        $filterCollection = New-Object Microsoft.Exchange.WebServices.Data.SearchFilter+SearchFilterCollection
        $filterCollection.LogicalOperator = $filterLogicalOperator
        $filter.GetEnumerator() | %{
            $itm = $_
            if ($itm.Value -is [hashtable]){
                switch($itm.Value.Operator){
                    ">" {$filterCollection.Add((New-Object Microsoft.Exchange.WebServices.Data.SearchFilter+IsGreaterThan($itm.Key,$itm.Value.Value)))}
                    "<" {$filterCollection.Add((New-Object Microsoft.Exchange.WebServices.Data.SearchFilter+IsLessThan($itm.Key,$itm.Value.Value)))}
                    "<=" {$filterCollection.Add((New-Object Microsoft.Exchange.WebServices.Data.SearchFilter+IsLessThanOrEqualTo($itm.Key,$itm.Value.Value)))}
                    ">=" {$filterCollection.Add((New-Object Microsoft.Exchange.WebServices.Data.SearchFilter+IsGreaterThanOrEqualTo($itm.Key,$itm.Value.Value)))}
                    "!=" {$filterCollection.Add((New-Object Microsoft.Exchange.WebServices.Data.SearchFilter+IsNotEqualTo($itm.Key,$itm.Value.Value)))}
                    "=" {$filterCollection.Add((New-Object Microsoft.Exchange.WebServices.Data.SearchFilter+IsEqualTo($itm.Key,$itm.Value.Value)))}
                    "contains" {$filterCollection.Add((New-Object Microsoft.Exchange.WebServices.Data.SearchFilter+ContainsSubstring($itm.Key,$itm.Value.Value)))}
                }
            }else{
                $filterCollection.Add((New-Object Microsoft.Exchange.WebServices.Data.SearchFilter+IsEqualTo($_.Key,$_.Value)))
            }
        }
        while($moreItems){
            $result = $service.FindItems($id,$filterCollection,$view)
            if ($result.TotalCount -gt 0){
                $resultSet += $result.Items
            }
            $view.Offset = $result.NextPageOffset
            $moreItems = $result.MoreAvailable
        }
    }else{
        while($moreItems){
            $result = $service.FindItems($id,$view)
            if ($result.TotalCount -gt 0){
                $resultSet += $result.Items
            }
            $view.Offset = $result.NextPageOffset
            $moreItems = $result.MoreAvailable
        }
    }
    
    if ($resultSet.Count -gt 0){
        return $resultSet
    }else{
        return $null
    }
}

# Mit Service verbinden
$svc = ConnectTo-EWS -Server $SERVER -UseScriptCredentials $true -Credential $CREDENTIAL #auf TRUE gesetzt
# get shared mailbox inbox folder
$msgroot = [Microsoft.Exchange.WebServices.Data.Folder]::Bind($svc,(New-Object Microsoft.Exchange.WebServices.Data.FolderId ([Microsoft.Exchange.WebServices.Data.WellKnownFolderName]::MsgFolderRoot),$MAILBOX))
# search subfolder
$subfolder = Get-EWSFolder -storeroot $msgroot.id -path $SUBFOLDER -service $svc
# filter items in folder older than x days
$subfolder | Get-EWSFolderItems -filter @{[Microsoft.Exchange.WebServices.Data.ItemSchema]::DateTimeReceived = @{Operator="<";Value=(get-date).AddDays(-$OLDERTHANDAYS)}} -filterLogicalOperator And | %{
    try{
        write-host "Deleting message with subject: '$($_.Subject)' received on $($_.DateTimeReceived.toString('G'))." -F Green
        $_.Delete([Microsoft.Exchange.WebServices.Data.DeleteMode]::HardDelete)
    }catch{
        Write-host $_.Exception.Message -F Red
    }
}