#!/bin/bash

# text colors
# yellow for warnings
Green=$'\e[1;32m'
Red=$'\e[1;31m'
Blue=$'\e[1;34m'
Yellow=$'\e[1;33m'
while true
do
clear
echo "$Red"
figlet 0n3
echo " "
echo "    $Green[1] nmap         -> port scanning and script enginee"
echo "    $Green[2] dig          -> extracting information from DNS"
echo "    $Green[3] metagoofil   -> extracting metadata from seach enginees"
echo "    $Green[4] theHarvester -> catalog emails, subdomains"
echo "    $Green[9] Quit         -> Exit the Script"

echo " "
read -p "$Blue --->>> " choice
clear

if [ $choice -eq 1 ]
then
	while true
	do
		clear
		echo " "
		echo "    $Green[1] SYN Scan"
		echo "    $Green[2] TCP Scan"
		echo "    $Green[3] UDP Scan"
		echo "    $Green[4] Xmas Scan"
		echo "    $Green[5] Null Scan"
		echo "    $Green[6] Nmap Script Enginee"
		echo "    $Green[9] Back to Main Menu"
		echo " "
		read -p "$Blue --->>> " i
		echo " "
		if [ $i -eq 1 ]
		then
			read -p "$Blue IP address to destroy: " ip
			echo
			nmap -sV -Pn $ip | grep -e tcp -e udp
		elif [ $i -eq 2 ]
		then
			read -p "$Blue IP address to scan: " ip
			echo
			nmap -sTV -Pn $ip | grep -e tcp -e udp -e PORT
		elif [ $i -eq 3 ]
		then
			read -p "$Blue IP address to scan: " ip
			echo
			nmap -sUV -Pn $ip | grep -e tcp -e udp -e PORT
		elif [ $i -eq 4 ]
		then
			read -p "$Blue IP address to scan: " ip
			echo
			nmap -sXV -Pn $ip | grep -e tcp -e udp -e PORT
		elif [ $i -eq 5 ]
		then
			read -p "$Blue IP address to scan: " ip
			echo
			nmap -sNV -Pn $ip | grep -e tcp -e udp -e PORT
		elif [ $i -eq 9 ]
		then
			break
		else
			echo "$Yellow Wrong Choice!"
		fi
		echo " "
		read -p "$Blue Do you want to continue with nmap? (y/n) " choice
		if [ $choice = "y" ]
		then
			continue
		elif [ $choice = "n" ]
		then
			break
		fi
	done

elif [ $choice -eq 2 ]
then
	while true
	do
		clear
		read -p "$Blue Enter Domain Name: " name
		clear
		dig $name -t AXFR
		echo " "
		read -p "$Blue Do You want to continue with dig? (y/n) " choice
		if [ $choice = "y" ]
		then
			continue
		elif [ $choice = "n" ]
		then
			break
		fi
	done

elif [ $choice -eq 3 ]
then
	while true
	do
		clear
		read -p "$Blue Enter Domain Name: " domain
		read -p "$Blue Enter Limit of Downloaded Files: " limit
		read -p "$Blue Enter File Types (pdf,jpg): " typ
		clear
		metagoofil -d $domain -t $typ -l 200 -n $limit -o meta -f meta.html
		echo " "
		read -p "$Blue Do You want to continue with metagoofil? (y/n) " choice
		if [ $choice = "y" ]
		then
			continue
		elif [ $choice = "n" ]
		then
			break
		fi
	done

elif [ $choice -eq 4 ]
then
	while true
	do
		clear
		read -p "$Blue Enter Domain Name: " name
		read -p "$Blue Enter Limit of Downloaded Files: " limit
		read -p "$Blue Enter Search Engine: " engine
		clear
		theHarvester -d $name -l $limit -b $engine
		echo " "
		read -p "$Blue Do You want to continue with theHarvester? (y/n) " choice
		if [ $choice = "y" ]
		then
			continue
		elif [ $choice = "n" ]
		then
			break
		fi
	done
elif [ $choice -eq 9 ]
then
	exit
else
	echo "$Yellow Wrong Choice!"
fi

done
