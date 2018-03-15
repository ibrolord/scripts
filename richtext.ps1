[void][system.reflection.assembly]::loadwithpartialname("System.Windows.Forms")

function showItems()
{

$richTextBox1.Clear()

  if($radVS.Checked -eq $true){
        $searchitem = "Visual Studio"
  
  }

  elseif($radSQL.Checked -eq $true){
        $searchitem = "SQL Server"
  }

  elseif($radSecurity.Checked){
          $searchitem = "Security Updates"
  }

  else {
  
          $searchitem = ""
  }

  
  $searchitem1 = Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* | select DisplayName | ? DisplayName -Like "*$searchitem*"


  foreach($i in $searchitem1){
    $richTextBox1.AppendText([string] $i.DisplayName + "`r")
  
  }

}

#build form
$myForm = New-Object System.Windows.Forms.Form
$myForm.ClientSize = "650,500"
$myForm.Text = "Lab 5 Exercise"
$myForm.StartPosition = "CenterScreen"
$myForm.MinimizeBox = $False
$myForm.MaximizeBox = $False
$Font = New-Object System.Drawing.Font("Tahoma",12)
$myForm.Font = $Font

#build radio button for Visual Studio
$radVS = New-Object System.Windows.Forms.RadioButton
$radVS.size = New-Object System.Drawing.Size (180, 40)
$radVS.location = New-Object System.Drawing.Size (20, 30)
$radVS.Text = "Visual Studio"

#build radio button for Security Updates
$radSecurity = New-Object System.Windows.Forms.RadioButton
$radSecurity.size = New-Object System.Drawing.Size (180, 40)
$radSecurity.location = New-Object System.Drawing.Size (20, 80)
$radSecurity.Text = "Security Updates"

#build radio button for SQL Server
$radSQL = New-Object System.Windows.Forms.RadioButton
$radSQL.size = New-Object System.Drawing.Size (180, 40)
$radSQL.location = New-Object System.Drawing.Size (20, 130)
$radSQL.Text = "SQL Server"

#build radio button for All
$radAll = New-Object System.Windows.Forms.RadioButton
$radAll.size = New-Object System.Drawing.Size (180, 40)
$radAll.location = New-Object System.Drawing.Size (20, 180)
$radAll.Text = "All Items"
$radAll.Checked = $true


#build radio button group
$gBoxLogs = New-Object System.Windows.Forms.GroupBox
$gBoxLogs.size = New-Object System.Drawing.Size (220, 220)
$gBoxLogs.location = New-Object System.Drawing.Size (10, 10)
$gBoxLogs.Text = "Installed Items"
$gBoxLogs.Controls.Add($radVS)
$gBoxLogs.Controls.Add($radSecurity)
$gBoxLogs.Controls.Add($radSQL)
$gBoxLogs.Controls.Add($radAll)


#build button
$btnGo = New-Object System.Windows.Forms.button
$btnGo.size = New-Object System.Drawing.Size (60, 40)
$btnGo.location = New-Object System.Drawing.Size (550, 460)
$btnGo.Text = "GO"
$btnGo.Add_Click({showItems})

#Rich Text Box Control
$richTextBox1 = New-Object System.Windows.Forms.RichTextBox
$richTextBox1.Location = New-Object System.Drawing.Size(10,240)
$richTextBox1.Size = New-Object System.Drawing.Size(600,220)

$myForm.controls.add($btnGo)
$myForm.controls.add($richTextBox1)
$myForm.controls.add($gBoxLogs)
$myForm.Add_Load({showItems})

$myForm.ShowDialog()
