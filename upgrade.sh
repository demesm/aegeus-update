#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'

pause(){
	read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'
}

print_status() {
    echo -e "## $1"
}

wget https://github.com/AegeusCoin/aegeus/releases/download/1.2/Aegeus-1.2-Linux-64-bit.tar.gz
tar -zxvf Aegeus-1.2-Linux-64-bit.tar.gz
systemctl stop Aegeus.service
cp ./Aegeus-1.2-Linux-64-bit/* /usr/local/bin/

systemctl start Aegeus.service
clear
print_status "{$RED}start alias in wallet, then hit enter to continue{$NC}"
pause

print_status "sleeping 30s before restarting service"
sleep 30

systemctl restart Aegeus.service
sleep 5

watch -n2 'aegeus-cli masternode status && aegeus-cli getinfo'
