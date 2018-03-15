[void][system.reflection.assembly]::loadwithpartialname("System.Windows.Forms")

function loadLogTypes()
{
    #code logic here that will add valid log type items to
    #the log dropdown list 
   $log = get-eventlog -List 

    foreach ($i in $log.Log){
        $cboLogName.Items.Add($i)
    }

}


function getEventLog()
{
    #here is how you access dropdown list values
    $logName = $cboLogName.SelectedItem
    $recentNo = $cboNewest.SelectedItem

    <#add code here to get the newest X number of event log details 
    (time generated and message) for the log type that the user selected.
    The output should be appended to the rich text box #>
    
    $event = get-eventlog -LogName Application -Newest 5 | select timegenerated, message |  sort timegenerated

    foreach($q in $event){
      #  $richTextBox1.Text = $q
      $richTextBox1.AppendText([string]$q.timegenerated + "`r")
      $richTextBox1.AppendText("*********************************** `r")
    }
     
}

function clearText()
{
    $richTextBox1.clear()
}


#build form
$myForm = New-Object System.Windows.Forms.Form
$myForm.ClientSize = "600,420"
$myForm.Text = "Event Log Demo"
$myForm.StartPosition = "CenterScreen"
$myForm.MinimizeBox = $False
$myForm.MaximizeBox = $False
$Font = New-Object System.Drawing.Font("Tahoma",12)
$myForm.Font = $Font

#build log label
$logLabel = New-Object System.Windows.Forms.Label
$loglabel.Text = "Log:"
$logLabel.Size = New-Object System.Drawing.size(100,40)
$logLabel.Location = New-Object System.Drawing.size(10,10)

#build combo box for log name
$cboLogName = New-Object System.Windows.Forms.ComboBox
$cboLogName.Size = New-Object System.Drawing.size(400,60)
$cboLogName.Location = New-Object System.Drawing.size(120,10)

#build newest combo box label
$newestLabel = New-Object System.Windows.Forms.Label
$newestLabel.Text = "Newest:"
$newestLabel.Size = New-Object System.Drawing.size(100,60)
$newestLabel.Location = New-Object System.Drawing.size(10,60)


#Build Newest Values Combo Box
$cboNewest = New-Object System.Windows.Forms.ComboBox
$cboNewest.Size = New-Object System.Drawing.size(200,60)
$cboNewest.Location = New-Object System.Drawing.size(120,60)
$cboNewest.Items.Add(5)
$cboNewest.Items.Add(10)
$cboNewest.Items.Add(15)
$cboNewest.Items.Add(20)


#Rich Text Box Control
$richTextBox1 = New-Object System.Windows.Forms.RichTextBox
$richTextBox1.Location = New-Object System.Drawing.Size(10,120)
$richTextBox1.Size = New-Object System.Drawing.Size(520,290)


#build GO button
$btnGO = New-Object System.Windows.Forms.Button
$btnGO.Text = "GO"
$btnGO.Size = New-Object System.Drawing.size(80,30)
$btnGO.Location = New-Object System.Drawing.size(330,60)
#Assign click event to GO button here
$btnGO.Add_Click({getEventLog})


#build CLEAR button
$btnClear = New-Object System.Windows.Forms.Button
$btnClear.Text = "CLEAR"
$btnClear.Size = New-Object System.Drawing.size(100,30)
$btnClear.Location = New-Object System.Drawing.size(420,60)
$btnClear.Add_Click({clearText})

#Add controls to form
$myForm.Controls.Add($logLabel)
$myForm.Controls.Add($cboLogName)
$myForm.Controls.Add($btnGO)
$myForm.Controls.Add($btnClear)
$myForm.Controls.Add($newestLabel)
$myForm.Controls.Add($cboNewest)
$myForm.Controls.Add($richTextBox1)
#Assign add_load event to form here
$myForm.Add_Load({loadLogTypes})

cls

$myForm.ShowDialog()

