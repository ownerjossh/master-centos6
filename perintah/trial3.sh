#!/bin/bash

if [[ $USER != 'root' ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

MYIP=$(wget -qO- ipv4.icanhazip.com)


echo "----------------------------- Buat AKUN SSH Trial ------------------------------"
echo "                            ALL SUPPORTED BY JoSSH "
echo "                       https://facebook.com/www.sutriez "
echo "                                 087802844588 "
echo -e "                        Script Installer by \e[1;21;40mJoSSH TEAM\e[0m  " 
echo ""

read -p "Berapa jumlah akun trial yang akan dibuat: " JUMLAH
read -p "Berapa hari akun trial aktif: " AKTIF

today="$(date +"%Y-%m-%d")"
expire=$(date -d "$AKTIF days" +"%Y-%m-%d")

echo ""
echo "-----------------------------------"
echo "Data Login:"
echo "-----------------------------------"
echo "Host/IP: $MYIP"
echo "Dropbear Port: 443, 110, 109, 22507, 80"
echo "OpenSSH Port: 22, 143"
echo "Squid Proxy: 8000, 8080, 3128"
echo "OpenVPN Config: http://$MYIP:81/client.ovpn"

for (( i=1; i <= $JUMLAH; i++ ))
do
	username=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 6 | head -n 1`;
	useradd -M -N -s /bin/false -e $expire $username
	#password=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 6 | head -n 1`;
	echo $username:$username | chpasswd
	
	echo "$i. Username/Password: $username"
done

echo "Valid s/d: $(date -d "$AKTIF days" +"%d-%m-%Y")"
echo "-----------------------------------"

cd ~/
rm -f /root/IP
