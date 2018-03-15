[void][system.reflection.assembly]::loadwithpartialname("System.Windows.Forms")
$msgbox = [System.Windows.Forms.MessageBox]

function loadWMIClasses()
{
#clear cpmbo
  $cboWMIClass.Items.Clear()

  #loop through group box and radios
  foreach($control in $gBox.Controls){
  

  
    if($control.checked -eq $true){
        $limit = $control.text
    }
}
    if($limit -eq "Show All"){
        $class = Get-WmiObject -List | ? name -Like win32* | sort name
    }

    else{
        $class = Get-WmiObject -List | ? name -Like win32* | select -First $limit | sort name
    }

    #populate combo
    foreach($classy in $class){
        $cboWMIClass.Items.Add($classy.name)
    }

    }
  


function loadProperties()
{
#clear cbo

#get sel
  $classy = $cboWMIClass.SelectedItem

#build prop list
$prop = Get-WmiObject -List | gm -ErrorAction SilentlyContinue | select name, membertype -Unique | ? membertype -eq property


$cboProp.Items.Clear()

if($prop.count -gt 0){
    
    foreach($pro in $prop){
        $cboProp.Items.Add($pro.name)
    }

    $cboProp.Enabled = $true
    
    }


    else{
        $cboProp.Enabled = $False
        $msgbox::Show('win32 did not show', 'no matches', 'ok', 'cancel')
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
$radClassNum20.add_checkedChanged({loadWMIClasses})

#build radio button - for 40 classes to show
$radClassNum40 = New-Object System.Windows.Forms.RadioButton
$radClassNum40.size = New-Object System.Drawing.Size (180, 40)
$radClassNum40.location = New-Object System.Drawing.Size (20, 60)
$radClassNum40.Text = "40"
$radClassNum40.add_checkedChanged({loadWMIClasses})


#build radio button - for 60 classes to show
$radClassNum60 = New-Object System.Windows.Forms.RadioButton
$radClassNum60.size = New-Object System.Drawing.Size (180, 40)
$radClassNum60.location = New-Object System.Drawing.Size (20, 90)
$radClassNum60.Text = "60"
$radClassNum60.add_checkedChanged({loadWMIClasses})

#build radio button - for ALL classes to show
$radClassNumALL = New-Object System.Windows.Forms.RadioButton
$radClassNumALL.size = New-Object System.Drawing.Size (180, 40)
$radClassNumALL.location = New-Object System.Drawing.Size (20, 120)
$radClassNumALL.Text = "Show All"


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
$cboWMIClass.add_SelectedIndexChanged({loadProperties})

$propLabel = New-Object System.Windows.Forms.Label
$propLabel.Text = "Property:"
$propLabel.size = New-Object System.Drawing.Size (120, 40)
$propLabel.location = New-Object System.Drawing.Size (200, 80)

#Build Property Values Combo Box
$cboProp = New-Object System.Windows.Forms.ComboBox
$cboProp.Size = New-Object System.Drawing.size(400,60)
$cboProp.Location = New-Object System.Drawing.size(320,80)
$cboProp.Enabled = $False


#Rich Text Box Control
$richTextBox1 = New-Object System.Windows.Forms.RichTextBox
$richTextBox1.Location = New-Object System.Drawing.Size(10,220)
$richTextBox1.Size = New-Object System.Drawing.Size(600,200)


#$myForm.controls.add($richTextBox1)
$myForm.controls.add($wmiLabel)
$myForm.controls.add($propLabel)
$myForm.controls.add($cboWMIClass)
$myForm.controls.add($gBox)
$myForm.controls.add($cboProp)
$myForm.Add_Load({loadWMIClasses})

$myForm.ShowDialog()
