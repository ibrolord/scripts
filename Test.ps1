$mystring = "Random text"

$mystring.Length

$bruh = "Bruh Brh"

$bruh1 = $bruh.Length

if($bruh -le 20)
{
    $msg = "lies bruh"
    $color = "green"
}

else 
{
    $msg = "text outside of range"
    $color = "red"
}

write-host $img 

cls
$mystring = "***************Random text****"
$mystring = $mystring.Trim()
#Trim can als ve a value in it ie "*" tp remeve he * skeps
#Mehods come in bracst as oppose Proerties
$mystring = $mystring.Trim()

cls
$mystring = "Randomize"
$userstring = "RANDM TEX"

$isEqual = $mystring.CompareTo($userstring)

$isEqual

$mystring


$string.Substring(0,$string.Length-4)
#To stat from 0 then take out the 1st 4)

$string.Substring($string.Length-4)
#To gt the last 4
