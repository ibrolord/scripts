[void][system.reflection.assembly]::loadwithpartialname("System.Windows.Forms")
 $msgBox = [System.Windows.Forms.MessageBox]

function loadWMIClasses()
{
    $cboProp.Items.Clear()
     $see = Get-WmiObject -List | ? name -Like win32* 

    if($radClassNum20.Checked -eq $true){
        $see = $see | select -First 20 | sort
    }

    elseif($radClassNum40.Checked -eq $true){
          $see = $see | select -First 40 | sort
    }

    elseif($radClassNum60.Checked -eq $true){
          $see = $see | select -First 60 | sort
    }

    elseif($radClassNumALL.Checked -eq $true){
          $see = $see | select | sort
    }

   # Get-WmiObject -List | ? name -Like win32* | sort | select -First 20
    
    foreach($i in $see){
        $cboWMIClass.Items.Add($i.Name)
    }

}

function loadProperties()
{

    $cboProp.Items.Clear()
   $take = $cboWMIClass.SelectedItem
   #$see1 = Get-WmiObject $take|gm -ErrorAction SilentlyContinue|select name, memberType -unique|? memberType -eq property
   $see1 = Get-WmiObject $take | gm | select name, membertype -Unique | ? memberType -eq property | sort

if($see1.Count -gt 0){
   foreach($o in $see1){
    $cboProp.Items.Add($o.name)
   }

   $cboProp.Enabled = $true
   }

   else{ 
        $cboProp.Enabled = $False
          $msgbox::show('Win32 class does not return any results', 'No matches','OK', 'Information')
   }

}

#build form
$myForm = New-Object System.Windows.Forms.Form
$myForm.ClientSize = "800,600"
$myForm.Text = "Assignment 6"
$myForm.StartPosition = "CenterScreen"
$myForm.MinimizeBox = $False
$myForm.MaximizeBox = $False
$Font = New-Object System.Drawing.Font("Tahoma",12)
$myForm.Font = $Font

#build radio button - for 20 classes to show
$radClassNum20 = New-Object System.Windows.Forms.RadioButton
$radClassNum20.size = New-Object System.Drawing.Size (180, 40)
$radClassNum20.location = New-Object System.Drawing.Size (20, 30)
$radClassNum20.Text = "20"
$radClassNum20.Checked = $true
$radClassNum20.Add_Click({loadWMIClasses})

#build radio button - for 40 classes to show
$radClassNum40 = New-Object System.Windows.Forms.RadioButton
$radClassNum40.size = New-Object System.Drawing.Size (180, 40)
$radClassNum40.location = New-Object System.Drawing.Size (20, 60)
$radClassNum40.Text = "40"
$radClassNum40.Add_Click({loadWMIClasses})

#build radio button - for 60 classes to show
$radClassNum60 = New-Object System.Windows.Forms.RadioButton
$radClassNum60.size = New-Object System.Drawing.Size (180, 40)
$radClassNum60.location = New-Object System.Drawing.Size (20, 90)
$radClassNum60.Text = "60"
$radClassNum60.Add_Click({loadWMIClasses})

#build radio button - for ALL classes to show
$radClassNumALL = New-Object System.Windows.Forms.RadioButton
$radClassNumALL.size = New-Object System.Drawing.Size (180, 40)
$radClassNumALL.location = New-Object System.Drawing.Size (20, 120)
$radClassNumALL.Text = "Show All"
$radClassNumALL.Add_Click({loadWMIClasses})

$gBox = New-Object System.Windows.Forms.GroupBox
$gBox.Text = "Limit # Classes To"
$gBox.Location = New-Object System.Drawing.Size (10,10)
$gBox.size = New-Object System.Drawing.Size (160, 180)

$gBox.controls.Add($radClassNum20)
$gBox.controls.Add($radClassNum40)
$gBox.controls.Add($radClassNum60)
$gBox.controls.Add($radClassNumALL)

#combo box label for service
$wmiLabel = New-Object System.Windows.Forms.Label
$wmiLabel.Text = "WMI Class:"
$wmiLabel.size = New-Object System.Drawing.Size (120, 40)
$wmiLabel.location = New-Object System.Drawing.Size (200, 30)

$cboWMIClass = New-Object System.Windows.Forms.ComboBox
$cboWMIClass.Size = New-Object System.Drawing.size(400,60)
$cboWMIClass.Location = New-Object System.Drawing.size(320,30)
#
$cboWMIClass.Add_SelectedIndexChanged({loadProperties})

$propLabel = New-Object System.Windows.Forms.Label
$propLabel.Text = "Property:"
$propLabel.size = New-Object System.Drawing.Size (120, 40)
$propLabel.location = New-Object System.Drawing.Size (200, 80)

#Build Property Values Combo Box
$cboProp = New-Object System.Windows.Forms.ComboBox
$cboProp.Size = New-Object System.Drawing.size(400,60)
$cboProp.Location = New-Object System.Drawing.size(320,80)
#
$cboProp.Enabled = $False


#$myForm.controls.add($richTextBox1)
$myForm.controls.add($wmiLabel)
$myForm.controls.add($propLabel)
$myForm.controls.add($cboWMIClass)
$myForm.controls.add($gBox)
$myForm.controls.add($cboProp)
#
$myForm.Add_Load({loadWMIClasses})
$myForm.ShowDialog()
