'Option Explicit
On error resume next
Dim WshNetwork, strRemotePath, strUserName, strPrintSrv, WshShell, objshell, logscript, printscript, hpColPrinter, ricohAfiMP201, strInfoCRM, defPrinter

set WshNetwork = CreateObject("WScript.Network")
'defPrinter = ""
strRemotePath = "\\SWS-SRVFLS01"
strPrintSrv = "\\SWS-SRVDOM01"
strInfoCRM = "\\SWS-SRVCRM01\InforCRM"
strVIS = "\\SWS-SRVVIS01\Visual800$"
strOffShare = "\\SWS-SRVFLS01\OfficeShare"

'ricohAfiMP201 = "RICOHMFP201"

'Gets the UserName
strUserName = WshNetwork.UserName


'Remove existing drive mappings
Dim oldDrives, i
Set oldDrives = WshNetwork.EnumNetworkDrives
For i = 0 to oldDrives.Count -1
	WshNetwork.RemoveNetworkDrive oldDrives.Item(i),True,True
Next


'Remove printers
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
Set colInstalledPrinters =  objWMIService.ExecQuery _
    ("Select * from Win32_Printer Where Network = TRUE")

For Each objPrinter in colInstalledPrinters
    objPrinter.Delete_
Next


'Maps the users home drive
WshNetwork.MapNetworkDrive "H:", strRemotePath & "\" & strUserName & "$"

'Maps the rest of the drives
WshNetwork.MapNetworkDrive "P:", strRemotePath & "\" & "Purchasing"
WshNetwork.MapNetworkDrive "S:", strRemotePath & "\" & "officeshare"
WshNetwork.MapNetworkDrive "U:", strRemotePath & "\" & "eng_data"
WshNetwork.MapNetworkDrive "E:", strRemotePath & "\" & "eng"
WshNetwork.MapNetworkDrive "M:", strRemotePath & "\" & "Marketing"

'Adds printers.
WshNetwork.AddWindowsPrinterConnection  strPrintSrv & "\" & "RICOH3352"
WshNetwork.AddWindowsPrinterConnection  strPrintSrv & "\" & "HPLaserJet4250PCL5e"
WshNetwork.AddWindowsPrinterConnection  strPrintSrv & "\" & "RICOHAficioMP5001PCL6"
WshNetwork.AddWindowsPrinterConnection  strPrintSrv & "\" & "RICOHC5100S"
WshNetwork.AddWindowsPrinterConnection  strPrintSrv & "\" & "HPColorLaserJetMFPM476dw"
WshNetwork.AddWindowsPrinterConnection  strPrintSrv & "\" & "RICOHMFP201"

'Sets the Default Printer
'WshNetwork.SetDefaultPrinter defPrinter
































