Add-Type -AssemblyName Microsoft.VisualBasic

$computer = [Microsoft.VisualBasic.Interaction]::InputBox("Enter a computer name", "Computer")
$Test = Test-Connection -ComputerName $computer -Count 1 -ErrorAction SilentlyContinue

If ($Test.Status -eq 'Success') {
    [Microsoft.VisualBasic.Interaction]::MsgBox("Test for $computer successful.", "OKOnly,SystemModal,Information", "Success")
}
else {
[Microsoft.VisualBasic.Interaction]::MsgBox("Test for $computer failed.", "OKOnly,SystemModal,Critical", "Error")
}
