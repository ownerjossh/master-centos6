#!/bin/bash
# Script by JoSSH TEAM - 087802844588
echo "-------------------------- TAMBAH MASA AKTIF AKUN SSH --------------------------"
echo "                        Installer Script by : JoSSH TEAM                        "
echo "                https://www.facebook.com/www.sutriez,087802844588               "

echo "-------------------------------"
echo "USERNAME        TANGGAL EXPIRED"
echo "-------------------------------"
while read JoSSH
do
        AKUN="$(echo $JoSSH | cut -d: -f1)"
        ID="$(echo $JoSSH | grep -v nobody | cut -d: -f3)"
        exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
        if [[ $ID -ge 500 ]]; then
        printf "%-17s %2s\n" "$AKUN" "$exp"
		fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 500 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo "-------------------------------"
read -p "Username : " Login
read -p "Berapa hari akun [$Login] aktif: " masaaktif
echo -e "passwd: password expiry information changed."

IP=`dig +short myip.opendns.com @resolver1.opendns.com`
date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
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
