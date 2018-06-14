#!/bin/bash

pause(){
	read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'
}

print_status() {
    echo "## $1"
}

wget https://github.com/demesm/aegeus-update/releases/download/1.2/Aegeus-1.2-Linux-64-bit.tar.gz
tar -zxvf Aegeus-1.2-Linux-64-bit.tar.gz
systemctl stop Aegeus.service
cp ./Aegeus-1.2-Linux-64-bit/* /usr/local/bin/

print_status "start alias in wallet, then hit enter to continue"
pause

print_status "sleeping 30s before restarting service"
sleep 30

systemctl start Aegeus.service
watch -n2 'aegeus-cli masternode status && aegeus-cli getinfo'
