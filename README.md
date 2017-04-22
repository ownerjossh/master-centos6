Script auto installer vps Centos6 by JoSSH
yum install -y wget && wget https://raw.githubusercontent.com/ownerjossh/master-centos6/master/centos6.sh && chmod +x centos6.sh && ./centos6.sh



Informasi Penggunaan SSH" 
===============================================
Layanan yang diaktifkan
--------------------------------------
echo "OpenVPN : TCP 1194 (client config : http://$MYIP/1194-client.ovpn)" 
echo "Port OS : 22, 143"  
echo "Port Dropbear : 109, 110, 443 , 22507"
echo "SquidProxy    : 8080 ,8000 , 3128 (limit to IP SSH)" 
echo "badvpn   : badvpn-udpgw port 7300"
echo "Webmin   : http://$MYIP:10000/"  
echo "vnstat   : http://$MYIP/vnstat/" 
echo "MRTG     : http://$MYIP/mrtg/"  
echo "Timezone : Asia/Jakarta" 
echo "Fail2Ban : [on]"  
echo "IPv6     : [off]" 

Perintah VPS ANDA
speedtest   : untuk cek speed vps"  
user-login  : untuk melihat user yang sedang login"  
trial       : untuk membuat akun trial selama 1 hari" 
user-add    : untuk membuat akun baru"  
user-list   : untuk melihat daftar akun beserta masa aktifnya" 
