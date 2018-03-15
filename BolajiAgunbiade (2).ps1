<#

Author: Bolaji Agunbiade OG
Title: Assignment 3
Date: 10/7/2016

Purpose: this shows a count and sum of XML Log and ini filetype distribution

Enjoyy
Sorry I have some codes left in, I need them to pickup and continue when after grading thanks
#>

##Parameter
param
(
    $path = "c:\windows",
    $extension = $input
    #$extension2 = "Xml",
    #$extension3 = "Ini"

)

clear-host
##Formatting
$input = Read-Host -Prompt 'Chose FileTypes Log, Xml, Ini'
$input = $input.ToUpper()
$mesureme = Get-ChildItem $path\*.$input| Measure-Object -Property length -Sum

###$measureme2 = Get-ChildItem $path\*.$extension2 | Measure-Object -Property length -Sum
####$measureme3 = Get-ChildItem $path\*.$extension3 | Measure-Object -Property length -Sum

$sum = $mesureme.Sum

##SWITCH
####sum2 = $mesureme2.Sum
####$sum3 = $mesureme3.Sum

####write-host $sum

####switch ($sum2)
#{
 #  ($sum -ge 1MB) {$filelength = "{0:N2}" -f ($sum / 1MB)
  #  $Unit = "MB"
   # } {Break}

#    2{($sum -ge 1KB)
 #   {
  #      $filelength = "{0:N2}" -f ($sum / 1KB)
   #     $Unit = "KB" 
   # }
    #} {Break}

   # 3{
    #   $filelength = "{0:N2}" -f $sum
     #  $Unit = "Bytes"
   # } {Break}
#}
###################


##LOGIC
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

##SOrry I tried using Switches and doing all, wasnt working out as I expected