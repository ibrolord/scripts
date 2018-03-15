#string array
[string[]]$workstation = "L1", "L2", "L3", "L4"

$workstation[3]

$numbers = (1..5)

$numbers2 = (6..10)

$allnumbers = $numbers + $numbers2

$allnumbers

$nmitems = $workstation.Count

for($i = 0; $i -lt $nmitems; $i++)
{
    Write-Host $workstation[$i]

}

#---------------------

$starttim = 20
$perComplete = 0

for($i = 10; $i -gt 0; $i -= 2)
{

    cls
    $perComplete = $i/$starttim * 100

    #Write-Host "Shutting down in $i secs"
   # Start-Sleep -Seconds 2
     #or
    Write-Progress -Activity "Shutting own in $i secs"
     Start-Sleep -Seconds 2

}

for($i = 10; $i -gt 0; $i -= 2)
{

    cls
   

    $processes = gps -Name "notepad"
    $count = $processes | measure
    if($count.Count -ge 5)
    {
        $processes | Stop-Process
        Write-Host "Killed processes"
    }

    cls
    Write-Host "searching for notepad"
   Start-Sleep -Seconds 2

}