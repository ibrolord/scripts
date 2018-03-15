function fixFileName($filnam) 
{ 


$error = '\', '/', ':', '*', '?', '"', '<', '>', '|'
#$check = $error | where {$_ -like "*$error*"}
$a = $filnam
foreach ($e in $error){
    $filnam = $filnam.replace($e, "")
}

if ($filnam -eq $a) {
 return $false
}
else {

    return $filnam
    }
}
Write-Host (fixFileName 'AutoCAD.reg')