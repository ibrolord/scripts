' commented out the running of update.bat per Vince's request. doh/jul19/11
' Updated for new Visual 7 envir. doh/vp/jul18/11
' VBScript to map network drives and printers.
' -----------------------------------------------------------------'
Option Explicit
Dim objNetwork
Dim WshNetwork
Dim strDriveLetter, strRemotePath, strUserName
Dim WshShell
Dim clDrives, i
Dim objShell, oExec, strOutput, strPS1Cmd, logscript, printscript, objShell1

logscript = "Get-WmiObject -Class Win32_MappedLogicalDisk | select Name, ProviderName >> \\192.168.22.6\files$\$env:computername$env:username.txt"
printscript = "Get-WMIObject -Class Win32_Printer | Select Name,DriverName,PortName,Shared,ShareName,Default | ft -auto | Out-String -Width 5096 >> \\192.168.22.6\files$\print$env:computername$env:username.txt"

Set objShell = CreateObject("Wscript.Shell")
objShell.Run("powershell.exe -command " & logscript & ";" & printscript &"")
strDriveLetter = "H:"
strRemotePath = "\\file-store"

Set objNetwork = WScript.CreateObject("WScript.Network")

'Gets the UserName
strUserName = objNetwork.UserName

'Maps the users home drive
objNetwork.MapNetworkDrive strDriveLetter, strRemotePath & "\" & strUserName & "$"

'Maps the rest of the drives

Set WshNetwork = CreateObject("WScript.Network")
WshNetwork.MapNetworkDrive "S:", "\\file-store\officeshare"


' maps visual share
WshNetwork.MapNetworkDrive "V:", "\\VDELL1\Visual"



'Adds printers.
WshNetwork.AddWindowsPrinterConnection "\\file-store\RICOHAficioMP5001PCL6"
'WshNetwork.AddWindowsPrinterConnection "\\file-store\RICOH1027"
WshNetwork.AddWindowsPrinterConnection "\\VDELL1\RICOH3352"

'Sets the Default Printer
WshNetwork.SetDefaultPrinter "\\VDELL1\RICOH3352"

'This section adds the necessary Reg keys for Visual to work properly on a computer 
'that the user has not logged onto before.
Set WshShell = WScript.CreateObject("WScript.Shell")
'WshShell.RegWrite "HKCU\Software\Infor Global Solutions\Visual Manufacturing\Configuration\InstallDirectory", "V:\VMFG"
'WshShell.RegWrite "HKCU\Software\Infor Global Solutions\Visual Manufacturing\Configuration\Local Directory", "C:\Visual"
'WshShell.RegWrite "HKCU\Software\Lilly Software\VISUAL Manufacturing\Configuration\Local Directory", "C:\Visual"
'WshShell.RegWrite "HKCU\Software\Lilly Software\VISUAL Quality\Configuration\Local Directory", "C:\Visual"

' runs the Visual update script 
'WshShell.run("%comspec% /c V:\install\update.bat"), 7
set WshShell=nothing 

