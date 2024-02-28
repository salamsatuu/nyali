#!/bin/bash
######################################
MYIP=$(curl -sS ipv4.icanhazip.com)
######################################
IPVPS=$(curl -s ipv4.icanhazip.com)
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
echo ""
clear
######################################
# // INSTALL UDP CUSTOM
UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
######################################
green="\033[0;32m"
red="\033[1;31m"
WH="\033[97m"
# // Gettings Info

domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
######################################
# // USERNAME IZIN IPP
rm -f /usr/bin/user
username=$(curl -sS https://raw.githubusercontent.com/salamsatuu/psby/main/daftar | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
rm -f /usr/bin/e
valid=$(curl -sS https://raw.githubusercontent.com/salamsatuu/psby/main/daftar | grep $MYIP | awk '{print $3}')
echo "$valid" > /usr/bin/e
######################################
# // DETAIL ORDER IZIN IP
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
######################################
clear
# // DAYS LEFT
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
######################################
# // VPS INFORMATION
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""
######################################
# // AKTIVATED & EXPIRED
Info="\033[0;32mACTIVED\033[0m"
Eror="\033[91mEXPIRED\033[0m"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl -sS https://raw.githubusercontent.com/salamsatuu/psby/main/daftar | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Eror}"
fi
######################################
echo -e "\e[32mloading...\e[0m"
clear
######################################
# // GETTINGS SYSTEM
uptime="$(uptime -p | cut -d " " -f 2-10)"
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${coREDiilik:-1}))"
cpu_usage+=" %"
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_service=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

clear
######################################
# // RUNNING SSH
######################################
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${green}ON${NC}"
else
   status_ssh="${red}OFF${NC} "
fi
######################################
# // RUNNING WEBSOCKET
######################################
ssh_ws=$( systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="${green}ON${NC}"
else
    status_ws_epro="${red}OFF${NC} "
fi
######################################
# RUNNING HAPROXY
######################################
if [[ $haproxy_service == "running" ]]; then 
   status_haproxy="${green}ON${NC}"
else
   status_haproxy="${red}OFF${NC} "
fi
######################################
# RUNNING XRAY
######################################
if [[ $xray_service == "running" ]]; then 
   status_xray="${green}ON${NC}"
else
   status_xray="${red}OFF${NC} "
fi
######################################
# RUNNING NGINX
######################################
if [[ $nginx_service == "running" ]]; then 
   status_nginx="${green}ON${NC}"
else
   status_nginx="${red}OFF${NC} "
fi
######################################
# RUNNING DROPBEAR
######################################
if [[ $dropbear_service == "running" ]]; then 
   status_dropbear="${green}GOOD${NC}"
else
   status_dropbear="${red}ERROR${NC} "
fi

# \\ Vless account //
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
# \\ Vmess account //
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
# \\ Trojan account //
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let trb=$trx/2
# \\ shadowsocks account //
ssx=$(grep -c -E "^#!# " "/etc/xray/config.json")
let ssa=$ssx/2

######################################

# // ───>>> BACKGROUND
BG_GRN="\033[42;1m" # BG HIJAU
BG_RED="\033[41;1;97;1m" # BG MERAH
BG_CYN="\033[46;1m" # BG CYANN
BG_BLU="\033[44;1m" # BG BIRU
BG_PUR="\033[43;1m" # BG KUNING
BG_WHT="\033[47;1m" # BG PUTIH
GREN="\033[0;32m"
WHITE="\033[1;37m"
Orange='\033[0;33m'
Yellow="\033[1;33m"
CYAN="\033[96;1m"
BLUE="\033[4;34m"
RED='\033[0;31m'
NC='\033[0m'
White="\033[97;1m"
WhiteBe="\033[5;37m"
BlueCyan="\033[5;36m"
Green="\033[0;32m"
Yellow="\033[93;1m"
Xark="\033[0m"
ACC="ACCOUNT"
vers="3.1 LTS"
# // ───>>> COLOR UNDER LINE
function Lunatic_Banner() {
clear
echo -e "\033[97;1m┌─────────────────────────────────────────────────┐\033[0m "
echo -e "\e[97;1m│\e[0m \033[41;1;97;1m                SEKENCOIS X CODE               \033[0m \e[97;1m│\e[0m"
echo -e "\033[97;1m└─────────────────────────────────────────────────┘\033[0m "
}



function Service_System_Operating() {
echo -e "\033[97;1m┌─────────────────────────────────────────────────┐\033[0m "
echo -e "\033[97;1m│ SYSTEM          : $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g')     \033[0m "
echo -e "\033[97;1m│ RAM             : $(free -m | awk 'NR==2 {print $2}')    \033[0m "
echo -e "\033[97;1m│ UPTIME          : $(uptime -p | cut -d " " -f 2-10)\033[0m "
echo -e "\033[97;1m│ IP VPS          : $(curl -s ipv4.icanhazip.com)     \033[0m "
echo -e "\033[97;1m│ ISP             : $(cat /etc/xray/isp)    \033[0m "
echo -e "\033[97;1m│ DOMAIN          : $(cat /etc/xray/domain)    \033[0m "
echo -e "\033[97;1m└─────────────────────────────────────────────────┘\033[0m"

}



function Service_Status() {
echo -e "\033[97;1m┌─────────────────────────────────────────────────┐\033[0m "
echo -e "\033[97;1m|\033[0m\033[33m PROXY \033[0m  $status_haproxy  \e[0m|\e[33m NGINX  \e[0m $status_nginx  \e[0m|\033[33m SSHWS  \033[0m $status_ws_epro \033[0m|  $status_dropbear  \033[97;1m| \033[0m "
echo -e "\033[97;1m└─────────────────────────────────────────────────┘\033[0m "
}




function List_All_Account() {
echo -e "\033[97;1m     ┌───────────────────────────────────────┐\033[0m "
echo -e "\033[97;1m              SSH OPENVPN    :     $ssh1         \033[0m " 
echo -e "\033[97;1m              VLESS XRAY     :     $vla          \033[0m " 
echo -e "\033[97;1m              VMESS XRAY     :     $vma          \033[0m " 
echo -e "\033[97;1m              TRJAN XRAY     :     $trb          \033[0m " 
echo -e "\033[97;1m              SSR-LIBEV      :     $ssa          \033[0m "   
echo -e "\033[97;1m     └───────────────────────────────────────┘\033[0m "
}



function Details_Clients_Name() {
echo -e "\033[97;1m   ┌───────────────────────────────────────────┐\033[0m "
echo -e "\033[97;1m   │   VERSION      :  FREE VERSION  \033[0m "
echo -e "\033[97;1m   │   OWNER        :  XLORD GANTENG  \033[0m "
echo -e "\033[97;1m   │   SUPPORT ME   :  0881036683241/DANA    \033[0m "
echo -e "\033[97;1m   │   CLIENTS      : \033[0m\033[91;1m $(cat /usr/bin/user)      \033[0m "
echo -e "\033[97;1m   │   Expiry       : \033[0m\033[91;1m $(((d1 - d2) / 86400)) Day \033[0m "
echo -e "\033[97;1m   └───────────────────────────────────────────┘\033[0m "
}



function Acces_Use_Command() {
echo -e "\033[97;1m ————————————————————————————————————————————————— \033[0m "
echo -e "\033[97;1m             acces use\033[0m \033[93;1m☞\033[0m \033[92;1mmenu\033[0m \033[97;1m command \033[0m " 
echo -e "\033[97;1m ————————————————————————————————————————————————— \033[0m "
}



Lunatic_Banner
Service_System_Operating
Service_Status
List_All_Account
Details_Clients_Name
Acces_Use_Command
