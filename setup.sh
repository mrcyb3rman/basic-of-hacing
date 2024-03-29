#!/bin/bash
clear
echo
echo "[!] Updating..."
apt-get update > install.log
echo
echo "[!] Installing Dependencies..."
echo
echo '    [+] dnsutils'
apt-get install dnsutils&>> install.log
echo "    [+] nmap"
apt-get install nmap&>> install.log
echo "    [+] theharvester"
apt-get install theharvester&>> install.log
echo "    [+] metagoofil"
apt-get install metagoofil&>> install.log
echo '    [+] figlet'
apt-get install figlet&>> install.log
echo
echo "[!] Setting Permissions..."
chmod 777 0n3.sh
echo -e "\n[+] You are Good to go!\n"
echo
read -p "Start 0n3? (y/n): " answer
if [ $answer == "y" ]
then
	./0n3.sh
else
	exit
fi
