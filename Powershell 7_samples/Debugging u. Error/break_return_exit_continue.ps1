#################### break (terminates loop) ####################

    $i = 0
    Clear-Host
    while ($true)
    {
        if (($i+=1) -ge 3) {
            break # exits the loop and passes over to line 12
        }
        Write-Output $i
    }
    Write-Output "Finished Testing break." # is displayed - out of loop


#################### return (terminates current function) ####################

    # Example 1
    Clear-Host
    $i = 0

    while ($true) {
        if (($i += 1) -ge 3) {
            return # terminates entire code
        }
        Write-Output $i ### is NOT displayed if 3 or higher
    }
    Write-Output "Finished Testing return." # is NOT displayed - out of code

    # Example 2
    $a = 'Ende'

    For ($i=0; $i -le 10; $i++) {   
    $i
        If ($i -eq 7) {
        return $a
        }
    }


#################### exit (terminates session in powershell.exe, pwsh.exe ONLY) ####################

    Clear-Host
    $i = 0

    while ($true) {
        if (($i += 1) -ge 3) {
            Start-Sleep -Seconds 3
            exit # exits the session
        }
        Write-Output $i
    }

# Tipp: [System.Environment]::Exit('0') terminates ISE
# Tipp: Get-Process code | Stop-Process exits VS Code

#################### continue (exits current block, but continues execution)  ####################

    Clear-Host
    $a = 1..6

    foreach ($i in $a) {
        If($i -eq 3) {
            continue
        }
    $i
    }

    # Continue labeled

    :labelA for ($a = 0; $a -le 3; $a++) {   
        if ($a -eq '1') {
            continue labelB
        }         
        "a: $a"     
          
    :labelB for ($b = 1; $b -le 3; $b++) { 
            "b: $b"
        }
           
    }
        
   