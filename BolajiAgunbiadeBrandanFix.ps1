function fixFileName($filnam) 
{ 


$error = '\', '/', ':', '*', '?', '"', '<', '>', '|'
#$check = $error | where {$_ -like "*$error*"}
foreach ($e in $error){
if ($filnam -like ("*{0}*" -f $e)){
   
    $filnam = $filnam.replace($e, "")
    Write-Host "bad"
}

else{
    Write-Host "good"
}

}

return $filnam
}
Write-Host (fixFileName 'C:\Auto:CAD.reg')