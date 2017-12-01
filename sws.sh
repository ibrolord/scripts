#!/bin/bash
while true; do
echo "lines to change "
readarray -t lines
echo "name of file "
read name
#read -p "Default Printer ? " defaultprinter
#echo $name 
#declare -p lines
cat script.vbs > "$name".vbs
for fn in "${lines[@]}" ; do 
	echo $fn;
 	sed -i "$fn s/^/REM /" "$name".vbs 
done
#if [ ! -z  "$defaultprinter" ]; then 
#	sed -i "s/defPrinter = ""/defPrinter = "$defaultprinter" /" "$name".vbs
#fi
done
