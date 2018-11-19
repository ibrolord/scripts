#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
#echo "${red}red text ${green}green text${reset}"


echo "####################"
echo "Test switches"
echo "####################"
read -p "What is the store #?: " STORE
ping "m"$STORE"sps01.unix.ctcwest.ctc" -c 2 && echo ${green} "LBO1 is up" ${reset} || echo ${red} "LBO1 is down" ${reset}
stor="m"$STORE"sps01.unix.ctcwest.ctc"
stor1=`getent hosts $stor | awk {'print $1'}`
stor3=`echo "$stor1" | cut -d "." -f1-3`
ping $stor3.8 -c 2 && echo ${green} "LBO2 is up" ${reset} || echo ${red} "LBO2 is down" ${reset}
echo
echo -n "######"
echo "IP is $stor3"
while true; do
	echo
	echo "Testing switches and whatnot"
	echo "1) Ping the store blades"
	echo "2) Hammer the switches"
	echo 
	read sup
	
	case $sup in 
		1)	echo "Testing switches and whatnot"
			echo 
			echo "will ping the blades and whatnat"
			echo "pinging blade 1"
			pinga(){
				ping $stor3.228 -c 2 && echo ${green} "Blade 1 SIMC works" ${reset} || echo "Blde 1 SIMC failed" ${reset} ; ping $stor3.229 -c 2 && echo ${green}  "Blade 2 SIMC works" ${reset} || echo ${red} "Blade 2 SIMC failed" ${reset} ; ping $stor3.253 -c 2 && echo ${green} "Blade 1 ESX works" ${reset} || echo ${red} "Blade 1 ESX failed" ${reset} ; ping $stor3.254 -c 2 && echo ${green} "Blade 2 ESX works" ${reset} || echo ${red} "Blade 2 ESX failed" ${reset}

echo
echo "if SIMC is down, send to Network team, if ESX is down send to Windows team"

}


pinga	
;;
		2) 	echo "Hammer the switch"
			echo "Make sure that the PL/TL knows"	
			echo "Dont log into the switch/router directly"    
		        sleep 4
			read -r -p "Are you sure you know whats up? " HUH
		
			if [[ $HUH =~ y|Y(es)?$ ]]; then 
				swit(){
					sudo hammer host status --name=$stor 
					if [[ ! $(echo $?) == 0 ]]; then
						echo "the command failed"
					elif [[ $(sudo hammer host status --name=$stor) != *Power:*on* ]]; then
						echo "Hammering the store $stor"
						#sudo hammer stop --name=$stor --force 
						sleep 1
					fi

}
			
				echo  "*********************"
				swit
				echo  "*********************"
			else
				echo "Yeah thats what i thought" 
				sleep 2
				break	
			fi


;;
esac
done
