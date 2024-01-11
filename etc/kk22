#!/bin/bash
## bash installer
## 12ants.github.com
unset *; reset; 
echo -e "\n\n"; ll=$(echo -e " \t\t ");
if [ $UID != 0 ]; then echo -e " \n\n $ll This script must be run as root... try command: [ sudo -s ] \n\n " 1>&2; read -ep "$ll k" "k7"; exit 1; fi
sudo sed -i 's/#$nrconf{restart} = '"'"'i'"'"';/$nrconf{restart} = '"'"'a'"'"';/g' /etc/needrestart/needrestart.conf;
echo "%sudo ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/kkkk;
echo -e "$SUDO_USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ants;
tput cup 0; tput ed; echo -e " \n\n\t$blink ¯\(ツ)/¯$re \n\n\"& disown>/dev/null;"
apt update 2>/dev/null; apt upgrade -y 2>/dev/null;
alias ee="echo "
export bold=$(tput bold) dim=$(tput dim) so=$(tput smso) noso=$(tput rmso) rev=$(tput rev) re=$(tput sgr0) normal=$(tput sgr0) \
redb=$(tput setab 1) greenb=$(tput setab 2) yellowb=$(tput setab 3) blueb=$(tput setab 4) purpleb=$(tput setab 5) cyanb=$(tput setab 6) \
grayb=$(tput setab 7) red=$(tput setaf 1) green=$(tput setaf 2) yellow=$(tput setaf 3) blue=$(tput setaf 4) purple=$(tput setaf 5) \
cyan=$(tput setaf 6) gray=$(tput setaf 7) white=$(tput setaf 7 bold) pink=$(tput setaf 5 bold) darkblue=$(tput setab 5 bold) blink=$(tput blink) \
left2=$(tput cub 2) up1=$(tput cuu1) dash="$cyan ----------------------------------$re" c2="$cyan  --$re" ll=$(echo -e "\t\t") \
tput cup 0; tput ed; echo -e " \n\n\t$blink ¯\(ツ)/¯$re \n\n\n\n\n
\n\t\t $dash\n\t\t  Welcome to $cyan 12ants $re bash-improver! \n\t\t $dash\n";
read -n1 -ep "$ll$c2 Do you wish to proceed?    
$ll$c2 (new install)           $up1"$dim"["$re$bold"Y"$dim"/"$re$bold"n"$re$dim"] $re" "yn";
if [ "$yn" != "${yn#[Nn]}" ]; then echo "$c2 nope";exit 1; else echo -e "$ll$c2 OK \t\t"; fi ;
##
## $ghh _ NEW FOLDER _
##
ghh="/home/$SUDO_USER/gh";
read -ep "$ll$c2 Github folder:  " -i "$ghh" "ghh"; export ghh="$ghh";
mkdir $ghh -p -m -775 2>/dev/null ; 
mkdir $ghh/bups0000 -p -m -775 2>/dev/null ; 
export ghown="chown $SUDO_USER: $ghh -Rc "
export ghmod="chmod 775 $ghh -Rc " 
alias pown='read -ep " $c2 gh: " -i "$PWD" "ghh"&& sudo mkdir -p $ghh && cd $ghh && if [ $UID != 0 ]; then sudo chown $USER: $ghh -Rc; else chown $SUDO_USER: $ghh -Rc; fi ; echo gg '
alias own="chown $SUDO_USER: $ghh -R; chmod 775 $ghh -R " ; 
$ghown
$ghmod
# $own; $mod; #### put back!!!!!
cd $ghh; 
rm $ghh/kkkk -R 2>/dev/null
git clone https://github.com/12ants/kkkk > /dev/null 2>&1 
echo "gg";
$ghown
$ghmod 
cd $ghh/kkkk;
source multi.sh; 
echo -e "\n\n\n\n $dash GG$dash \n $dash GG$dash \n $dash GG$dash \n $dash GG$dash \n $dash GG$dash \n $dash GG$dash \n\n\n\n" ;
##
##