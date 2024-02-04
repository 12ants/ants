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
alias "ee"='echo '
export bold=$(tput bold) dim=$(tput dim) so=$(tput smso) noso=$(tput rmso) rev=$(tput rev) re=$(tput sgr0) normal=$(tput sgr0) \
redb=$(tput setab 1) greenb=$(tput setab 2) yellowb=$(tput setab 3) blueb=$(tput setab 4) purpleb=$(tput setab 5) cyanb=$(tput setab 6) \
grayb=$(tput setab 7) red=$(tput setaf 1) green=$(tput setaf 2) yellow=$(tput setaf 3) blue=$(tput setaf 4) purple=$(tput setaf 5) \
cyan=$(tput setaf 6) gray=$(tput setaf 7) white=$(tput setaf 7 bold) pink=$(tput setaf 5 bold) darkblue=$(tput setab 5 bold) blink=$(tput blink) \
left2=$(tput cub 2) up1=$(tput cuu1) 
export dddd=$(echo -e "$pink  --------------------------------$re ") c2="$cyan --$re" ll=$(echo -e " \t\t ") 2>/dev/null \
##
ants="$_"
##
## LOADING-ANIMATION
pro() {
$pro &>/dev/null & disown; tput cuu 8; tput ed; tput cud 2; PROC_ID=$!; while kill -0 "$PROC_ID"&>/dev/null; 
do for X in "[        ]" "[$green=$re       ]" "[$yellow==$re      ]" "[$red===$re     ]" "[=$pink===    $re]"  "[ ==$cyan==   $re]" \
"[   =$white===$re ]" "[     =$blue==$re]" "[      "$rev"=$re$green=$re]" "[       "$red"="$re"]" "[        ]" "[        ]" "[        ]" "[        ]"; 
do echo -e "Executing $rev$pro$re"$c2" $X"; tput cuu1; sleep 0.08; done; echo -ne "oo"; done 
echo -ne " [  "$green"DONE"$re"  ] \n\n\n\n\n";
}
##
##
echo -e "\n\n"; ll=$(echo -e " \t\t "); 
if [ $UID != 0 ]; then echo -e " \n\n $ll This script must be run as root... try command: [ sudo -s ] \n\n " 1>&2; read -ep "$ll k" "k7"; exit 0 ; fi 
## Autorestart as needed
sudo sed -i 's/#$nrconf{restart} = '"'"'i'"'"';/$nrconf{restart} = '"'"'a'"'"';/g' /etc/needrestart/needrestart.conf 2>/dev/null;
## - Auto root login for admins
echo "%sudo ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/10-installer;
echo -e "$SUDO_USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ants;
##
# snap install lolcat &>/dev/null & disown; tput cuu 2; tput ed
# apt update|lolcat -F .01 -s 111 -p 11 -d 22; apt upgrade -y --install-recommends|lolcat -F .001 -s 111 -p 11 -d 22;
## 
pro='apt update';
pro;

pro='sleep 2';

pro;
sleep 1;
##
##
pro='apt upgrade -y'; pro; sleep 1;
##
##
tput cup 0; tput ed; echo -e "\n\n\t$blink ¯\(ツ)/¯$re ";
#
# Welcome to ...
#
echo -e "\n\n\n\n\n\n\t\t$dddd\n\t\t  Welcome to$cyan 12ants$re bash-improver! \n\t\t$dddd"; 
####
###
###       USE FUNCTION ONLY ONCE!!!!
##
## Do you wish to proceed?
##
read -n1 -ep "$ll""$c2"" Do you wish to proceed? "$dim"["$re$bold"Y"$dim"/"$re$bold"n"$re$dim"] $re" "yn"; 
if [ "$yn" != "${yn#[Nn]}" ]; then echo "$c2 nope";exit 1; else echo "$ll$c2 OK"; fi ;
##
read -ep "$ll""$c2"" Folder for Github? $re" -i "$PWD/gh" "gh"; 
mkdir $gh -p -m 775
chown $SUDO_USER: $gh
cd $gh
mkdir ants -p -m 775
cd ants
##
## LOAD ANIMATION
pro='git stash'
pro
##
####
## LOAD ANIMATION
pro='git pull'
pro
##
##

cd ..
##
sleep 1
####
## LOAD ANIMATION
pro='git clone https://github.com/12ants/ants'
pro
sleep 1
##
##
cd ants;
read -n1 -ep "$ll""$c2"" Install Improvments? "$dim"["$re$bold"Y"$dim"/"$re$bold"n"$re$dim"] $re" "yn"; 
if [ "$yn" != "${yn#[Nn]}" ]; then echo "$c2 nope"; return 2>/dev/null; else echo "$ll$c2 OK";
##
tput cuu 18 ed; tput dim;
sudo cp sh/aaaa.sh /etc/aaaa.sh -bv
sudo cp sh/bbbb.sh /etc/bbbb.sh -bv
sudo cp sh/cccc.sh /etc/cccc.sh -bv
sudo cp sh/etc_profile.sh /etc/profile -bv
sudo cp sh/etc_bash.sh /etc/bash.bashrc -bv
sudo cp sh/ssss.sh /bin/ssss -bv
echo "$re"; sleep 1;
##
pro='chmod 775 /bin/ssss';
pro;
##
##
pro='chown "$SUDO_USER": /etc/*.sh';
pro;
##
##
pro='chmod 755 /etc/*.sh -v'; pro; sleep 1;
##
fi;
sleep 1; tput sgr0; 
echo -e "\n\n\n\n    $ll $c2$blink Bash is now better! \n\n\n\n\n\n";



