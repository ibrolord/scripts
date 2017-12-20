find . -iname "*.vbs" | xargs sed -i '47a WshNetwork.MapNetworkDrive "V:", strRemotePath & "\" & "strVIS"'
