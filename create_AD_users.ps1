


import-module activedirectory
Import-Csv "C:\Users\admin\Desktop\file.csv" | ForEach-Object {
$userPrincinpal = $_."samAccountName" + "@bzy.local"
New-ADUser `
-Name $_."user" `
-Givenname $_."name" `
-Surname $_."surname" `
-SamAccountName  $_."samaccountname" `
-Path  $_."path" `
-UserPrincipalName  $userPrincinpal `
-AccountPassword (ConvertTo-SecureString $_."Password" -AsPlainText -Force) `
-ChangePasswordAtLogon $true  `
-Enabled $true `
-EmailAddress ($_."samaccountname"+"@bzy.local") `

 }

