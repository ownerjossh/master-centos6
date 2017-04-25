#!/bin/bash
#Script auto create trial user SSH
#yg akan expired setelah 1 hari
#JoSSH TEAM - 087802844588

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=`dig +short myip.opendns.com @resolver1.opendns.com`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Informasi SSH"
echo -e "=========-account-=========="
echo -e "Host: $IP" 
echo -e "OpenSSH Port: 22,143"
echo -e "Dropbear Port: 443, 110, 109,22507"
echo -e "Squid Proxy: 80, 8080, 3128"
echo -e "OpenVPN Config: http://$IP/1194-client.ovpn"
echo -e "Username: $Login "
echo -e "Password: $Pass"
echo -e "-----------------------------"
echo -e "Akun Aktif s/d: $exp"
echo -e "==========================="
echo -e "create by \e[1;21;40mJoSSH TEAM\e[0m"
