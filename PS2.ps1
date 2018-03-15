$f = ForEach ($number in 1..100 ) { $number * 10} 
Write-Host $f -NoNewline



$ara = (1..100) 

for($i = 0; $i -lt 100; $i++)
{
    if ($ara[100] % 10 -eq 0){
    Write-Host $ara[$i] ', ' -NoNewline 
      #Write-Host $ara[$i] 
      }
}