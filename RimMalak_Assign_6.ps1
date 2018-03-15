[void][system.reflection.assembly]::loadwithpartialname("System.Windows.Forms")
$msgBox = [System.Windows.Forms.MessageBox]

function loadWMIClasses()
{      
    if($radClassNum20.Checked -eq $true)
    { 
        $wmiClass = Get-WmiObject -list | ? name -like "win32*" | sort name |  Select-Object name -First 20
    }
    elseif($radClassNum40.Checked -eq $true)
    { 
        $wmiClass = Get-WmiObject -list | ? name -like "win32*" | sort name |  Select-Object name -First 40 
    }
    elseif($radClassNum60.Checked -eq $true)
    { 
        $wmiClass = Get-WmiObject -list | ? name -like "win32*" | sort name |  Select-Object name -First 60
    }
    else
    { 
        $wmiClass = Get-WmiObject -list | ? name -like "win32*" |sort name |  Select-Object name 
    }

    $cboWMIClass.Items.Clear()
    foreach($wmi in $wmiClass)
    {
        $cboWMIClass.Items.add($wmi.name)
    }
}

function loadProperties()
{
    $cboProp.items.Clear()
    $cboProp.Enabled = $true
    $wmiItem = $cboWMIClass.SelectedItem
    $prop = Get-WmiObject $wmiItem | Get-Member -MemberType Property -ErrorAction SilentlyContinue
    $measure = $prop |measure
    $count = $measure.Count
    
    if($count -eq 0)
    {
        $msgbox::show("Win32 class does not return any result", "No matches", "OK", "information") 
    }
    else
    {
        foreach($p in $prop)
        {
            $cboProp.Items.add($p.name)
        }
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
$radClassNum20.location = New-Object System.Drawing.Size (20, 70)
$radClassNum20.Text = "20"
$radClassNum20.checked = $true
#$radClassNum20.CheckedChanged({loadWMIClasses})
$radClassNum20.add_click({loadWMIClasses})

#build radio button - for 40 classes to show
$radClassNum40 = New-Object System.Windows.Forms.RadioButton
$radClassNum40.size = New-Object System.Drawing.Size (180, 40)
$radClassNum40.location = New-Object System.Drawing.Size (20, 100)
$radClassNum40.Text = "40"
#$radClassNum40.CheckedChanged({loadWMIClasses})
$radClassNum40.add_click({loadWMIClasses})

#build radio button - for 60 classes to show
$radClassNum60 = New-Object System.Windows.Forms.RadioButton
$radClassNum60.size = New-Object System.Drawing.Size (180, 40)
$radClassNum60.location = New-Object System.Drawing.Size (20, 130)
$radClassNum60.Text = "60"
#$radClassNum60.checkedChanged({loadWMIClasses})
$radClassNum60.add_click({loadWMIClasses})

#build radio button - for ALL classes to show
$radClassNumALL = New-Object System.Windows.Forms.RadioButton
$radClassNumALL.size = New-Object System.Drawing.Size (180, 40)
$radClassNumALL.location = New-Object System.Drawing.Size (20, 160)
$radClassNumALL.Text = "Show All"
#$radClassNumALL.CheckedChanged({loadWMIClasses})
$radClassNumALL.add_click({loadWMIClasses})
    
$gBox = New-Object System.Windows.Forms.GroupBox
$gBox.Text = "Limit # Classes To"
$gBox.Location = New-Object System.Drawing.Size (10,10)
$gBox.size = New-Object System.Drawing.Size (160, 200)

$gBox.controls.Add($radClassNum20)
$gBox.controls.Add($radClassNum40)
$gBox.controls.Add($radClassNum60)
$gBox.controls.Add($radClassNumALL)

#combo box label for service
$wmiLabel = New-Object System.Windows.Forms.Label
$wmiLabel.Text = "WMI Class:"
$wmiLabel.size = New-Object System.Drawing.Size (120, 55)
$wmiLabel.location = New-Object System.Drawing.Size (200, 30)

$cboWMIClass = New-Object System.Windows.Forms.ComboBox
$cboWMIClass.Size = New-Object System.Drawing.size(400,60)
$cboWMIClass.Location = New-Object System.Drawing.size(320,60)
$cboWMIClass.add_SelectedIndexChanged({loadProperties})

$propLabel = New-Object System.Windows.Forms.Label
$propLabel.Text = "Property:"
$propLabel.size = New-Object System.Drawing.Size (120, 40)
$propLabel.location = New-Object System.Drawing.Size (200, 120)

#Build Property Values Combo Box
$cboProp = New-Object System.Windows.Forms.ComboBox
$cboProp.Size = New-Object System.Drawing.size(400,60)
$cboProp.Location = New-Object System.Drawing.size(320,120)
$cboProp.Enabled = $false


#$myForm.controls.add($richTextBox1)
$myForm.controls.add($wmiLabel)
$myForm.controls.add($propLabel)
$myForm.controls.add($cboWMIClass)
$myForm.controls.add($gBox)
$myForm.controls.add($cboProp)


cls

$myForm.add_load({loadWMIClasses})
$myForm.ShowDialog()
