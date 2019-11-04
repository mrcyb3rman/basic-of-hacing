#!/bin/bash
clear
echo
echo "[!] Updating..."
apt update -y > install.log
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
echo
echo "[!] Setting Permissions..."
chmod 777 allinone.sh
echo -e "\n[+] You are Good to go!\n"
