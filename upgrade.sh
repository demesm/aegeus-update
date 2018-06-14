#!/bin/bash

pause(){
	read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'
}

print_status() {
    echo "## $1"
}

wget https://github.com/AegeusCoin/aegeus/releases/download/1.2/Aegeus-1.2-Linux-64-bit.tar.gz && tar -zxvf Aegeus-1.2-Linux-64-bit.tar.gz
systemctl stop Aegeus.service
mv /root/Aegeus-1.2-Linux-64-bit/aegeus-cli /usr/local/bin/aegeus-cli
mv /root/Aegeus-1.2-Linux-64-bit/aegeusd /usr/local/bin/aegeusd

print_status "start alias in wallet, then hit enter to continue"
pause

systemctl start Aegeus.service
systemctl status Aegeus.service
