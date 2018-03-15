[void][system.reflection.assembly]::loadwithpartialname("System.Windows.Forms")
$msgbox = [System.Windows.Forms.MessageBox]

function loadWMIClasses()
{
	#clear class combo box
    $cboWMIClass.items.clear()

	#loop through group box to refer to all of its radio buttons
    foreach($control in $gBox.controls)
    {
        if($control.checked -eq $true)	#find checked one
        {
            $limit = $control.text		#get its text, which holds limit number
        }
    }

    if($limit -eq "Show All")			#don't restrict list of classes
    {
        $classList = Get-WmiObject -list|? name -like win32*|sort Name
    }
    else								#restrict limit to radio button selection
    {
        $classList = Get-WmiObject -list|? name -like win32*|Select -first $limit|sort name
    }

	#populate combo box
    foreach($class in $classList)
    {
        $cboWMIClass.items.add($class.name)
    }
}

function loadProperties()
{
	#get class selection
    $class = $cboWMIClass.SelectedItem
	
	#build property list (used unique flag to suppress sub class results)
    $propList = Get-WmiObject -list |gm -ErrorAction SilentlyContinue|select name, memberType -unique|? memberType -eq property
	
	#clear property combo box
    $cboProp.items.Clear()
    
	#were there any items to output??
    if($propList.Count -gt 0)
    {
        #populate property combo box
        foreach($prop in $propList)
        {
            $cboProp.items.add($prop.name)
        } 
        $cboProp.Enabled = $true
    }
    else
    {
        $cboProp.Enabled = $false
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
$radClassNum20.checked = $true
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
#$radClassNumALL.checked = $true

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
$cboProp.Enabled = $false


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
$myForm.add_load({loadWMIClasses})

$myForm.ShowDialog()
