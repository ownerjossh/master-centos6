#!/bin/bash
# Script by JoSSH TEAM - 087802844588
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
echo "Jumlah akun: $JUMLAH user"
echo "-------------------------------"
echo -e "create by \e[1;21;40mJoSSH TEAM\e[0m"
