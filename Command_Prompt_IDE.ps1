Add-Type -AssemblyName System.Windows.Forms

$OutputPane_Content = ""

$Form = New-Object System.Windows.Forms.Form
$Form.Size = New-Object System.Drawing.Size(500,400)

#File New Button

#File Open Button

#File Save Button

#Output For Programs Go Here
$OutputPane = New-Object System.Windows.Forms.TextBox
$OutputPane.size = New-Object System.Drawing.Size(425,100)
$OutputPane.text = "No Code has been run yet!"
$OutputPane.Location = New-Object System.Drawing.Point(25,50)
$OutputPane.Multiline = $TRUE
$OutputPane.Enabled = $FALSE

#Program Run Label
$RunProg_Label = New-Object System.Windows.Forms.Label
$RunProg_Label.Text = "Run Program"
$RunProg_Label.Size = New-Object System.Drawing.Size(100,25)
$RunProg_Label.Location = New-Object System.Drawing.Point(25,150)

#Program Run Button
$RunProg = New-Object System.Windows.Forms.Button
$RunProg.Text = ">"
$RunProg.Size = New-Object System.Drawing.Size(100,25)
$RunProg.Location = New-Object System.Drawing.Point(25,175)

#Program Editing Pane
$EditingPane = New-Object System.Windows.Forms.TextBox
$EditingPane.size = New-Object System.Drawing.Size(425,100)
$EditingPane.text = ""
$EditingPane.Location = New-Object System.Drawing.Point(25,200)
$EditingPane.Multiline = $TRUE

#Adds Controls to Form
$Form.controls.add($RunProg)
$Form.controls.add($RunProg_Label)
$Form.controls.add($OutputPane)
$Form.controls.add($EditingPane)

$RunProg.add_click({
$EditingPane.Text > ~\tmpoutfile.bat
cmd.exe ~\tmpoutfile.bat >> ~\tmpoutput.txt
$OutputPane.text = ~\tmpoutput.txt
})

$Form.showdialog()