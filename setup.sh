#!/bin/bash
clear
echo
echo "[!] Updating..."
apt update -y > install.log
echo
echo "[!] Installing Dependencies..."
echo '    [+] dnsutils'
apt install dnsutils & >> install.log
echo "    [+] nmap"
apt install nmap & >> install.log
echo "    [+] theharvester"
apt install theharvester & >> install.log
echo "    [+] metagoofil"
apt install metagoofil & >> install.log
echo
echo "[!] Setting Permissions..."
chmod 777 allinone.sh
echo -e "\n[+] You are Good to go!\n"
