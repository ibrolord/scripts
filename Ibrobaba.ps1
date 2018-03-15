cls
$profile = $env:USERPROFILE
$startdir = $profile+ "\Downloads"

Write-Host "Download Items Menu: `n"
Write-Host "1. Music"
Write-Host "2. Videos"
Write-Host "3. Documents"

Write-Host "Which files do you want to move?: "
$choice = Read-Host


switch($choice) {
    1{
        $ext = "mp3"
        $dest = $profile+ "\Music"
    }

    2{
        $ext = "mp4"
        $dest = $profile+ "\Videos"
    }

    3{ 
        $ext = "docx"
        $dest = $profile+ "\Documents"
    }
}

sl $startdir
$files = gci | ? name -Like *.$ext
$count = $files.Count

if($count -gt 0){
    $files | move -Destination $dest
    Write-Host "Moved $count $ext files `n"
}

else{
    Write-Host "No more $ext in downloads to move `n"
}
