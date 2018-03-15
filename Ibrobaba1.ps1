param
(
    $path = "c:\windows",
    $extension = $input
 
)

clear-host

$input = Read-Host -Prompt 'Chose FileTypes Log, Xml, Ini'
$input = $input.ToUpper()
$mesureme = Get-ChildItem $path\*.$input| Measure-Object -Property length -Sum


$sum = $mesureme.Sum

if ($sum -ge 1MB)
{
    $filelength = "{0:N2}" -f ($sum / 1MB)
    $Unit = "MB"
}


elseif($sum -ge 1KB)
{ 
    $filelength = "{0:N2}" -f ($sum / 1KB)
    $Unit = "KB"
}

else 
{
    $filelength = "{0:N2}" -f $sum
    $Unit = "Bytes"
}






clear-host

$input
Write-Host ***********************************`n
write-host $input Files found in: `t`t$path
Write-Host Total `# $input files: `t`t `t $mesureme.Count
Write-Host Total of $input file lengths: `t $filelength $Unit