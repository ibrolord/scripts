function fixFileName($filnam) 
{ 


$error = '\', '/', ':', '*', '?', '"', '<', '>', '|'
#$check = $error | where {$_ -like "*$error*"}
foreach ($e in $error){
if ($filnam -like $e){
   
    $filnam = $filnam.replace($e, "")
    Write-Host "bad"
}

else{
    Write-Host "good"
}

}

return $filnam
}
$catch = fixFileName 'C:\Auto:CAD.reg'
Write-Host $catch