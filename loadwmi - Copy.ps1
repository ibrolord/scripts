[void][system.reflection.assembly]::loadwithpartialname("System.Windows.Forms")

Add-Type -AssemblyName System.Windows.Forms

function loadWMIClasses()
{
   #this line should be nested in your $radClassNum20.Checked condition
   #note: you needed to add in that you were getting only wmi-objects
   #with names -like "*win_32*"
   $cboWMIClass1 =  Get-WmiObject -List | select -first 20 | sort -Descending

 #this loop needs to be at the end of the function, after your decision
 #structure because the if statement determines how many wmi object classes 
 # are being output
 foreach($i in $cboWMIClass1){
    $cboWMIClass.Items.Add($i)
 }
 
 #place code inside blocks to catch the text/set a variable to 20/40/60 etc
 if($radClassNum20.Checked -eq $true){
    
 }
 #this should be an elseif
 if($radClassNum40.Checked -eq $true){
    
 }

elseif($radClassNum60.Checked -eq $true){
    
 }

 else{
    
 }



}
  


function loadProperties()
{
        #these have to be outside of loadproperties; otherwise the events will never
        #be registered (see lines 122 and 134 below)
        $cboWMIClass.add_SelectedIndexChanged({loadproperties})
      $cboWMIClass2 = $cboWMIClass.add_SelectedIndexChanged({loadproperties})

        
     $cboWMIClass = New-Object System.Collections.ArrayList
     $cboWMIClass = Get-WmiObject Get-Member $cboWMIClass2
	$cboWMIClass | ForEach-Object {
    	$cboWMIClass.Items.Add($_.Name) | Out-Null
	}



      #   foreach($i in $cboWMIClass){
    #$cboWMIClass.Items.Add($i)
 }

     

#build form
#$form1.Add_Load($myForm1)
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
$radClassNum20.Checked =$true

#build radio button - for 40 classes to show
$radClassNum40 = New-Object System.Windows.Forms.RadioButton
$radClassNum40.size = New-Object System.Drawing.Size (180, 40)
$radClassNum40.location = New-Object System.Drawing.Size (20, 60)
$radClassNum40.Text = "40"


#build radio button - for 60 classes to show
$radClassNum60 = New-Object System.Windows.Forms.RadioButton
$radClassNum60.size = New-Object System.Drawing.Size (180, 40)
$radClassNum60.location = New-Object System.Drawing.Size (20, 90)
$radClassNum60.Text = "60"

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
#$cboWMIClass.Items.Add($cboWMIClass1)
#add selectedindex changed event here (calls loadWMIClasses)

$propLabel = New-Object System.Windows.Forms.Label
$propLabel.Text = "Property:"
$propLabel.size = New-Object System.Drawing.Size (120, 40)
$propLabel.location = New-Object System.Drawing.Size (200, 80)

#Build Property Values Combo Box
$cboProp = New-Object System.Windows.Forms.ComboBox
$cboProp.Size = New-Object System.Drawing.size(400,60)
$cboProp.Location = New-Object System.Drawing.size(320,80)
$cboProp.Enabled = $false
#add selectedindex changed event here (calls loadproperties)

#$myForm.controls.add($richTextBox1)
$myForm.controls.add($wmiLabel)
$myForm.controls.add($propLabel)
$myForm.controls.add($cboWMIClass)
$myForm.controls.add($gBox)
$myForm.controls.add($cboProp)
####
$myForm.Add_Load({loadWMIClasses})

$myForm.ShowDialog()
