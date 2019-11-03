#!/bin/bash
Green=$'\e[1;32m'
Red=$'\e[1;31m'
Blue=$'\e[1;34m'
Yellow=$'\e[1;33m'
while true
do
clear
echo " "
echo "    $Green[1] nmap         -> port scanning and script enginee"
echo "    $Green[2] dig          -> extracting information from DNS"
echo "    $Green[3] metagoofil   -> extracting metadata from seach enginees"
echo "    $Green[4] theHarvester -> catalog emails, subdomains"
echo "    $Green[9] Quit         -> Exit the Script"

echo " "
read -p "$Blue What is Your Choice: " choice
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
		read -p "$Blue You are selecting ... " i
		echo " "
		if [ $i -eq 1 ]
		then
			read -p "$Blue IP address to destroy: " ip
			nmap -sV -Pn $ip
		elif [ $i -eq 2 ]
		then
			read -p "$Blue IP address to scan: " ip
			nmap -sTV -Pn $ip
		elif [ $i -eq 3 ]
		then
			read -p "$Blue IP address to scan: " ip
			nmap -sUV -Pn $ip
		elif [ $i -eq 4 ]
		then
			read -p "$Blue IP address to scan: " ip
			nmap -sXV -Pn $ip
		elif [ $i -eq 5 ]
		then
			read -p "$Blue IP address to scan: " ip
			nmap -sNV -Pn $ip
		elif [ $i -eq 9 ]
		then
			break
		else
			echo "$Yellow Wrong Choice!"
		fi
		echo " "
		read -p "$Blue Do You want to continue with nmap? (y/n) " choice
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
		read -p "$Blue Enter Name Server IP: " ip
		read -p "$Blue Enter Domain Name: " name
		clear
		dig @$ip $name -t AXFR
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