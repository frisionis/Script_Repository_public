function Test-ADServerReachability {
    $server = (Get-ADComputer -Filter 'operatingsystem -like "*server*"').Name
    Test-Connection $server
}

