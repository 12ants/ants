#!/bin/bash
########### [ants.sh] - bash installer
########### 
## About: antsinstaller
############# 12ants.github.com
tput cup 0; tput ed; echo -e "\n\n\t\t$blink ¯\(ツ)/¯$re ";
alias "ee"='echo ';
export bold=$(tput bold) dim=$(tput dim) so=$(tput smso) noso=$(tput rmso) rev=$(tput rev) re=$(tput sgr0) normal=$(tput sgr0) \
redb=$(tput setab 1) greenb=$(tput setab 2) yellowb=$(tput setab 3) blueb=$(tput setab 4) purpleb=$(tput setab 5) cyanb=$(tput setab 6) \
grayb=$(tput setab 7) red=$(tput setaf 1) green=$(tput setaf 2) yellow=$(tput setaf 3) blue=$(tput setaf 4) purple=$(tput setaf 5) \
cyan=$(tput setaf 6) gray=$(tput setaf 7) white=$(tput setaf 7 bold) pink=$(tput setaf 5 bold) darkblue=$(tput setab 5 bold) blink=$(tput blink) \
left2=$(tput cub 2) up1=$(tput cuu1) 
export dddd=$(echo -e ""$pink"--------------------------------$re") c2=""$cyan"--"$re""; ants="$_"; ll=$(echo -e " \t "); 
###########
if [ $UID != 0 ]; then echo -e " \n\n $ll This script must be run as root... try command: [ sudo -s ] \n\n " 1>&2; 
read -ep "$ll K" "k7"; exit 0 ; fi;
sudo sed -i 's/#$nrconf{restart} = '"'"'i'"'"';/$nrconf{restart} = '"'"'a'"'"';/g' /etc/needrestart/needrestart.conf 2>/dev/null;
echo "%sudo ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/10-installer; echo -e "$SUDO_USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ants;
###########
## pro - task loading animation
pro() {
tf() {
tput setaf $((RANDOM%16));
}
tb() {
tput setab $((RANDOM%16));
}
c2=""$cyan"--"$re""; tput civis; tput sgr0; 
$pro &>x & disown; tput cuu1; PROC_ID=$!; while kill -0 "$PROC_ID" &>/dev/null; 
do for X in "[        ]" "[$(tf)=$re       ]" "[$(tf)=$(tf)=$re      ]" "[$(tf)=$(tf)=$(tf)=$re     ]" "[$(tf)=$(tf)=$(tf)=$(tf)=    $re]"  \
"[ $(tf)=$(tf)=$(tf)=$(tf)=   $re]" "[  $(tf)=$(tf)=$(tf)=$(tf)=$re  ]" "[   $(tf)=$(tf)=$(tf)=$(tf)= $re]" "[    $(tf)=$(tf)=$(tf)=$(tf)=$re]" \
"[     "$(tf)"=$(tf)=$(tf)=$re]" "[      "$(tf)"=$(tf)="$re"]" "[       $(tf)=]" "[        ]" "[        ]" "[        ]"; 
do echo -e "    $dim[$(tb)  $re$dim]$re "$c2" Executing $rev $pro $re $c2$c2$c2$c2$c2"; tput cuu1; tput sgr0;
echo -e "\t\t\t\t\t $X"; tput cuu1; sleep 0.08; tput sc; tput cup $((LINES-4)) 0; echo -e "\t$rev $(tail -n2 x|head -n1) $re"; 
echo -e "\t$rev $(tail -n1 x) $re"; tput cuu 2;
tput rc; done; done;
echo -e "\t\t\t\t\t"$dim" [$re  "$green"DONE"$re" $dim ]$re "; tput cnorm; echo;
}
##
tput cup 9;
pro='apt update'; pro; sleep 1;
pro='apt upgrade'; pro; sleep 1;
##
## Welcome to ... 		########
echo -e "\t $dddd\n\t Welcome to$cyan 12ants$re bash-improver! \n\t $dddd"; 
## Proceed ... 			########
read -n1 -ep "$ll""$c2"" Do you wish to proceed? "$dim"["$re$bold"Y"$dim"/"$re$bold"n"$re$dim"] $re" "yn"; 
if [ "$yn" != "${yn#[Nn]}" ]; then echo "$c2 nope";exit 1; else echo "$ll$c2 OK"; fi ;
## Github folder... 	########
read -ep "$ll$c2 Folder for$cyan$bold Github? $re" -i "$PWD/gh/" "gh"; 
install 
mkdir $gh -p -m 775; chown $SUDO_USER: $gh; cd $gh; mkdir ants -p -m 775;
cd ants; echo;echo;
pro='git stash'; pro; sleep 1; pro='git pull'; pro; sleep 1; cd ..; sleep 1; echo -ne " $re ";
pro="git clone https://github.com/12ants/ants"; pro; sleep 1;
cd ants; read -n1 -ep "$ll""$c2"" Install Improvments? "$dim"["$re$bold"Y"$dim"/"$re$bold"n"$re$dim"] $re" "yn"; 
if [ "$yn" != "${yn#[Nn]}" ]; then echo "$c2 nope"; return 2>/dev/null; else echo "$ll$c2 OK";
##
tput dim; sudo cp sh/aaaa.sh /etc/aaaa.sh -bv; sudo cp sh/bbbb.sh /etc/bbbb.sh -bv; sudo cp sh/cccc.sh /etc/cccc.sh -bv; 
sudo cp sh/etc_profile.sh /etc/profile -bv; sudo cp sh/etc_bash.sh /etc/bash.bashrc -bv; sudo cp sh/ssss.sh /bin/ssss -bv;
echo " $re "; sleep 1; pro='chmod 775 /bin/ssss'; pro; sleep 1; pro="chown "$SUDO_USER": /etc/*.sh"; pro; 
pro='chmod 755 /etc/*.sh -v'; pro; sleep 1; fi;
sleep 1; tput sgr0; 
echo -e "\n\n\n\n    $ll $c2$blink Bash is now better! $re$c2 \n\n\n\n"; sleep 1;
source multi.sh
rm ./x;