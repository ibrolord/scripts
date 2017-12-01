foreach ($ComputerName in $ComputerList) {
    invoke-command -AsJob -ScriptBlock {
        params($ComputerName)
        shutdown /m $ComputerName /r /f /t 0
    } -ArgumentList $ComputerName
}
