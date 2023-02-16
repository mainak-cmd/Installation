Write-Host "Put your folder path" -ForegroundColor Green
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$testform = New-Object System.Windows.Forms.Form
$testform.Text = 'R&Python instaallation scripts'
$testform.Size = New-Object System.Drawing.Size(400,300)
$testform.StartPosition = 'CenterScreen'
$okb = New-Object System.Windows.Forms.Button
$okb.Location = New-Object System.Drawing.Point(85,130)
$okb.Size = New-Object System.Drawing.Size(75,25)
$okb.Text = 'Add'
$okb.DialogResult = [System.Windows.Forms.DialogResult]::OK
$testform.AcceptButton = $okb
$testform.Controls.Add($okb)
$cb = New-Object System.Windows.Forms.Button
$cb.Location = New-Object System.Drawing.Point(170,130)
$cb.Size = New-Object System.Drawing.Size(75,25)
$cb.Text = 'Remove'
$cb.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$testform.CancelButton = $cb
$testform.Controls.Add($cb)
$test = New-Object System.Windows.Forms.Button
$test.Location = New-Object System.Drawing.Point(270,130)
$test.Size = New-Object System.Drawing.Size(75,25)
$test.Text = 'close'
$test.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$testform.AcceptButton = $test
$testform.Controls.Add($test)
$lb = New-Object System.Windows.Forms.Label
$lb.Location = New-Object System.Drawing.Point(20,40)
$lb.Size = New-Object System.Drawing.Size(240,20)
$lb.Text = 'Please enter the folder path in text box:'
$testform.Controls.Add($lb)
$tb = New-Object System.Windows.Forms.TextBox
$tb.Location = New-Object System.Drawing.Point(40,80)
$tb.Size = New-Object System.Drawing.Size(240,20)
$testform.Controls.Add($tb)
$testform.Topmost = $true
$testform.Add_Shown({$tb.Select()})
$rs = $testform.ShowDialog()
if ($rs -eq [System.Windows.Forms.DialogResult]::OK)
{
$y = $tb.Text
Write-Host "Entered text is" -ForegroundColor Green
$NAME=$y
$dir=New-Item -Path $NAME -Name "logfiles" -ItemType "directory" -Force
$python=New-Item -Path $dir -Name "Python" -ItemType "directory"-Force
$R=New-Item -Path $dir -Name "R" -ItemType "directory"-Force
#set folders
Set-Location $python
Set-Location $R
$wcR = New-Object System.Net.WebClient
#Application Path
$urlpython = "https://www.python.org/ftp/python/3.9.11/python-3.9.11-amd64.exe"
$urlR = "https://cran.r-project.org/bin/windows/base/old/3.5.2/R-3.5.2-win.exe"
$urlRStudio = "https://download1.rstudio.org/RStudio-1.1.463.exe"
#Application

$outputpython = "$python\python-3.9.11-amd64.exe"
$outputR = "$R\R-win.exe"
$outputRStudio = "$R\RStudio.exe"

#download Application
$wcR.DownloadFile($urlpython,$outputpython)
Start-Sleep -Seconds 5
$wcR.DownloadFile($urlR,$outputR)
Start-Sleep -Seconds 5
$wcR.DownloadFile($urlRStudio,$outputRStudio)
Start-Sleep -Seconds 5
Write-Output "Download completed"
Start-Sleep -Seconds 5
}
