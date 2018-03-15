<# 

Author: Bolaji Agunbiade
Title: Assignment #2
Date: 9/28/2016

Purose: This shows a top 5 nsummary of Error Events, and Warning Events

#>

clear
write-host `n

#Output Date
$start = (get-date).AddDays(-7).ToString("yyyy-MM-dd 00:00")

#Output User
$user = $env:USERNAME


write-host "Report By: $user for date starting ( $start )" `n

Write-Host "*********************************************" `n "Top 5 System Log Summary Report" `n 
           "*********************************************"

Get-EventLog System -After $start | group-object source | select-Object count, name | Sort-Object count -Descending | select -First 5 | Format-Table -AutoSize


Write-Host "*********************************************" `n "Top 5 System Log ERROR Summary Report" `n 
           "*********************************************"

Get-EventLog System -EntryType error -After $start | group-object source | select-Object count, name | Sort-Object count -Descending | select -First 5 | Format-Table -AutoSize



Write-Host "*********************************************" `n "Top 5 System Log WARNING Summary Report" `n 
           "*********************************************"

Get-EventLog System -EntryType Warning -After $start | group-object source | select-Object count, name | Sort-Object count -Descending | select -First 5 | Format-Table -AutoSize