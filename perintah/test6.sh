#!/bin/bash


echo "------------------------------- BANNED AKUN SSH --------------------------------"
echo "                            ALL SUPPORTED BY JoSSH                               "
echo "                       https://facebook.com/www.sutriez                          "
echo "                                 087802844588                                    "
echo -e "                        Script Installer by \e[1;21;40mJoSSH TEAM\e[0m        "                      

# begin of user-list
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
echo "-----------------------------------"
echo ""
# end of user-list

read -p "Isikan username: " username

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	echo ""
	read -p "Apakah Anda benar-benar ingin mem-banned akun [$username] [y/n]: " -e -i y BANNED
	if [[ "$BANNED" = 'y' ]]; then
		passwd -l $username
		echo ""
		echo "Akun [$username] berhasil dibanned!"
	else
		echo ""
		echo "Banned akun [$username] dibatalkan!"
	fi
else
	echo "Username [$username] belum terdaftar!"
	exit 1
fi

cd ~/
rm -f /root/IP
