#!/bin/bash
########### [ants.sh] - bash installer
########### 
###########
echo hello
##
##
## About: antsinstaller
############# 12ants.github.com
#
#
echo -e "\n\n"; ll=$(echo -e " \t\t "); 
if [ $UID != 0 ]; then echo -e " \n\n $ll This script must be run as root... try command: [ sudo -s ] \n\n " 1>&2; read -ep "$ll k" "k7"; exit 0 ; fi 
## Autorestart as needed
sudo sed -i 's/#$nrconf{restart} = '"'"'i'"'"';/$nrconf{restart} = '"'"'a'"'"';/g' /etc/needrestart/needrestart.conf; 
## - Auto root login for admins
echo "%sudo ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/10-installer;
echo -e "$SUDO_USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ants;
##
# snap install lolcat &>/dev/null & disown; tput cuu 2; tput ed
# apt update|lolcat -F .01 -s 111 -p 11 -d 22; apt upgrade -y --install-recommends|lolcat -F .001 -s 111 -p 11 -d 22;
##
## ADDING COLOR-CODES -- (Need to run inside other command.)
# apt install -y git needrestart &>/dev/null & disown; tput cuu 2; tput ed ###### pu back
## 
alias ee="echo "
export bold=$(tput bold) dim=$(tput dim) so=$(tput smso) noso=$(tput rmso) rev=$(tput rev) re=$(tput sgr0) normal=$(tput sgr0) \
redb=$(tput setab 1) greenb=$(tput setab 2) yellowb=$(tput setab 3) blueb=$(tput setab 4) purpleb=$(tput setab 5) cyanb=$(tput setab 6) \
grayb=$(tput setab 7) red=$(tput setaf 1) green=$(tput setaf 2) yellow=$(tput setaf 3) blue=$(tput setaf 4) purple=$(tput setaf 5) \
cyan=$(tput setaf 6) gray=$(tput setaf 7) white=$(tput setaf 7 bold) pink=$(tput setaf 5 bold) darkblue=$(tput setab 5 bold) blink=$(tput blink) \
left2=$(tput cub 2) up1=$(tput cuu1) 
export dddd=$(echo $pink  --------------------------------$re ) c2="$cyan --$re" ll=$(echo -e " \t\t") 2>/dev/null \  
##
##
apt update 2>/dev/null; 
apt -y -qq upgrade 2>/dev/null;
apt apt -qq -y autoremove 2>/dev/null;
apt apt -qq -y autoclean 2>/dev/null;
echo tput cup 0; tput ed; echo -e "$(ls -n ./ants.sh 2>/dev/null)\n\n\t$blink ¯\(ツ)/¯$re 
\n\n\n\n\n\n\t\t$dddd\n\t\t Welcome to$cyan 12ants$re bash-improver! \n\t\t$dddd"; 
####
##
##
read -n1 -ep "$ll""$c2"" Do you wish to proceed? "$dim"["$re$bold"Y"$dim"/"$re$bold"n"$re$dim"] $re" "yn"; 
if [ "$yn" != "${yn#[Nn]}" ]; then echo "$c2 nope";exit 1; else echo "$ll$c2 OK"; fi ;
##
sleep 2
git clone https://github.com/12ants/ants
cd ants 
read -n1 -ep "$ll""$c2"" New ants install script? "$dim"["$re$bold"Y"$dim"/"$re$bold"n"$re$dim"] $re" "yn"; 
if [ "$yn" != "${yn#[Nn]}" ]; then echo "$c2 nope"; exit 0; else echo "$ll$c2 OK"; fi ;
sudo cp sh/aaaa.sh /etc/aaaa.sh -bv
sudo cp sh/bbbb.sh /etc/bbbb.sh -bv
sudo cp sh/cccc.sh /etc/cccc.sh -bv
sleep 2
chown $SUDO_USER: /etc/*.sh -v
chmod 755 /etc/*.sh -v
sleep 2
echo -e "$ll $c2 bash is now better!"



