Import-Module ActiveDirectory
#Get-ADComputer -filter "SAMAccountName -notlike "SWS-SR*""| Select -expand name | ForEach-Object { (Get-WmiObject Win32_operatingsystem -ComputerName $_).win32shutdown(4) | Out-Null }
Get-ADComputer -filter {CN -notlike "SWS-SRVDOM01"}| Select -expand name | ForEach-Object { (Get-WmiObject Win32_operatingsystem -ComputerName $_).win32shutdown(4) | Out-Null }
#Get-ADComputer -Filter * -SearchBase 'DC=SWS,DC=HOME' | ? {($_.commonnamme -notlike "SWS-SRVDOM01*")} | Select -expand name | ForEach-Object { (Get-WmiObject Win32_operatingsystem -ComputerName $_).win32shutdown(4) | Out-Null }
