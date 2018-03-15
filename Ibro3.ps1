param(
    $path = "C:\Windows",
    $ext = "log"
)

$length = gci $path\*.$ext | measure length -sum
$sum = $length.Sum
$count = $length.Count
$ext = $ext.ToUpper()

if($sum -ge 1MB){
    $sum = "{0:N2}" -f ($sum/1MB) + " MB "
}

elseif($sum -ge 1KB){
    $sum = "{0:N2}" -f ($sum/1KB) + " KB "
}

else
{
    $sum = "{0:N2}" -f $sum + " Bytes "
}

cls
Write-Host "$ext Files found in: `t`t`t $path"
Write-Host "Total # $ext files: `t`t`t $count"
Write-Host "Total of $ext file lengths: `t`t`t $sum"