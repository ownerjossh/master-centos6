#!/bin/bash
#Script Perpanjang User SSH

read -p "Username : " Login
read -p "Penambahan Masa Aktif (hari): " masaaktif
userdel $Login
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "-----------------------------"
echo -e "DATA LENGKAP AKUN :"
echo -e "-----------------------------"
echo -e "Host/IP: $IP"
echo -e "Dropbear Port: 443, 110, 109,22507"
echo -e "OpenSSH Port: 22,143"
echo -e "Squid Proxy: 80, 8080, 3128"
echo -e "OpenVPN Config: http://$IP/1194-client.ovpn"
echo -e "Username: $Login "
echo -e "Akun Aktif s/d: $exp"
echo -e "==========================="
echo -e "create by \e[1;21;40mJoSSH TEAM\e[0m"
