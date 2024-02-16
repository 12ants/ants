#!/bin/bash
########### [ants.sh] - bash installer
########### 
## About: antsinstaller
############# 12ants.github.com
tput cup 0; tput ed; echo -e "\n\n\t\t$(tput blink) ¯\(ツ)/¯$(tput sgr0) ";
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
echo "%sudo ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/; echo -e "$SUDO_USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/ants;
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
$pro &>./tmp & disown; tput cuu1; PROC_ID=$!; while kill -0 "$PROC_ID" &>/dev/null; 
do for X in "[        ]" "[$(tf)=$re       ]" "[$(tf)=$(tf)=$re      ]" "[$(tf)=$(tf)=$(tf)=$re     ]" "[$(tf)=$(tf)=$(tf)=$(tf)=    $re]"  \
"[ $(tf)=$(tf)=$(tf)=$(tf)=   $re]" "[  $(tf)=$(tf)=$(tf)=$(tf)=$re  ]" "[   $(tf)=$(tf)=$(tf)=$(tf)= $re]" "[    $(tf)=$(tf)=$(tf)=$(tf)=$re]" \
"[     "$(tf)"=$(tf)=$(tf)=$re]" "[      "$(tf)"=$(tf)="$re"]" "[       $(tf)=]" "[        ]" "[        ]" "[        ]"; 
do echo -e "    $dim[$(tb)  $re$dim]$re "$c2" Executing $rev $pro $re $c2$c2$c2$c2$c2"; tput cuu1; tput sgr0; echo -e "\t\t\t\t\t $X"; tput cuu1; sleep 0.08; 
tput sc; tput cup $((LINES-4)) 0; echo -e "\t$rev $(tail -n2 ./tmp|head -n1) $re"; echo -e "\t$rev $(tail -n1 ./tmp) $re"; tput cuu 2; tput rc; 
done; done; echo -e "\t\t\t\t\t"$dim" [$re  "$green"DONE"$re" $dim ]$re "; tput cnorm; echo; rm ./tmp &>/dev/null;
}
###########################################################################################
tput cup 9; pro='apt update'; pro; sleep 1; pro='apt upgrade'; pro; sleep 1; ##############
## Welcome to ... 		###################################################################
echo -e "\t $dddd\n\t Welcome to$cyan 12ants$re bash-improver! \n\t $dddd"; ###############
## Proceed ... 			###################################################################
read -n1 -ep "$ll""$c2"" Do you wish to proceed? "$dim"["$re$bold"Y"$dim"/"$re$bold"n"$re$dim"] $re" "yn"; 
if [ "$yn" != "${yn#[Nn]}" ]; then echo "$c2 nope";exit 0; else echo "$ll$c2 OK"; fi ; ####
## Github folder... 	###################################################################
read -ep "$ll$c2 Folder for$cyan$bold Github? $re" -i "$PWD/gh/" "gh"; export gh="$gh"; ####
mkdir $gh -p -m 775; chown $SUDO_USER: $gh; cd $gh; mkdir ants -p -m 775; #################
cd $gh/ants; echo;echo; #######################################################################
pro='git stash'; pro; sleep 1; pro='git pull'; pro; sleep 1; cd ..; sleep 1; echo -ne " $re ";
pro="git clone https://github.com/12ants/ants"; pro; cd ants; sleep 1; #############################
chown $SUDO_USER: ../ants -R; read -n1 -ep "$ll""$c2"" Install Improvments? "$dim"["$re$bold"Y"$dim"/"$re$bold"n"$re$dim"] $re" "yn"; 
if [ "$yn" != "${yn#[Nn]}" ]; then echo "$c2 nope"; return 2>/dev/null; else echo "$ll$c2 OK";
cd ants; tput dim; sudo cp sh/aaaa.sh /etc/aaaa.sh -bv; sudo cp sh/bbbb.sh /etc/bbbb.sh -bv; sudo cp sh/cccc.sh /etc/cccc.sh -bv; 
sudo cp sh/etc_profile.sh /etc/profile -bv; sudo cp sh/etc_bash.sh /etc/bash.bashrc -bv; sudo cp sh/ssss.sh /bin/ssss -bv;
echo " $re "; sleep 1; pro='chmod 775 /bin/ssss'; pro; sleep 1; pro="chown "$SUDO_USER": /etc/*.sh"; pro; 
pro='chmod 755 /etc/*.sh -v'; pro; sleep 1; fi;
sleep 1; tput sgr0; 
#######
#######
#######
cd /$gh/ants/etc/;
####### MENU
#######
#!/bin/bash
# tput indn $((LINES-2)); 
# tput cup 2; tput ed; 
#clear; unset *; 
echo -e "\n\n\n\n\n\n\n\n
\t ------------------------------------------
\t ------------ $green hello $re ---------------------
\t ------------------------------------------
\t --$dim Choose:  [$re Up / Down$dim ]$re
\t --$dim Select:  [$re Space$dim ]$re
\t --$dim Confirm: [$re Enter$dim ]$re
\t ------------------------------------------
\t -- Choose multiple options: --------------
\t ------------------------------------------"
function prompt_for_multiselect () {
# little helpers for terminal print control and key input
ESC=$( printf "\033")
cursor_blink_on()   { printf "$ESC[?25h"; }
cursor_blink_off()  { printf "$ESC[?25l"; }
cursor_to()         { printf "$ESC[$1;${2:-1}H"; }
print_inactive()    { printf "$2   $1 "; }
print_active()      { printf "$2  $ESC[7m $1 $ESC[27m"; }
get_cursor_row()    { IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }
key_input()         {
local key
IFS= read -rsn1 key 2>/dev/null >&2
if [[ $key = ""      ]]; then echo enter; fi;
if [[ $key = $'\x20' ]]; then echo space; fi;
if [[ $key = $'\x1b' ]]; then
read -rsn2 key
if [[ $key = [A ]]; then echo up;    fi;
if [[ $key = [B ]]; then echo down;  fi;
fi
}
toggle_option()    {
local arr_name=$1
eval "local arr=(\"\${${arr_name}[@]}\")"
local option=$2
if [[ ${arr[option]} == true ]]; then
arr[option]=
else
arr[option]=true
fi
eval $arr_name='("${arr[@]}")'
}
local retval=$1
local options
local defaults
IFS=';' read -r -a options <<< "$2"
if [[ -z $3 ]]; then
defaults=()
else
IFS=';' read -r -a defaults <<< "$3"
fi
local selected=()
for ((i=0; i<${#options[@]}; i++)); do
selected+=("${defaults[i]:-false}")
printf "\n"
done
# determine current screen position for overwriting the options
local lastrow=`get_cursor_row`
local startrow=$(($lastrow - ${#options[@]}))
# ensure cursor and input echoing back on upon a ctrl+c during read -s
trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
cursor_blink_off
local active=0
while true; do
# print options by overwriting the last lines
local idx=0
for option in "${options[@]}"; do
local prefix="    [ ]"
if [[ ${selected[idx]} == true ]]; then
prefix="    [$green*$re]"
fi
cursor_to $(($startrow + $idx))
if [ $idx -eq $active ]; then
print_active "$option" "$prefix"
else
print_inactive "$option" "$prefix"
fi
((idx++))
done
# user key control
case `key_input` in
space)  toggle_option selected $active;;
enter)  break;;
up)     ((active--));
if [ $active -lt 0 ]; then active=$((${#options[@]} - 1)); fi;;
down)   ((active++));
if [ $active -ge ${#options[@]} ]; then active=0; fi;;
esac
done
# cursor position back to normal
cursor_to $lastrow
printf "\n"
cursor_blink_on
eval $retval='("${selected[@]}")'
}
echo -e "\n\n\n\n"
# Usage Example
# cd $ghh/0000/etc 2>/dev/null;
ov1=($(ls $gh/ants/etc))
ov2=(${ov1[@]^})
OPTIONS_VALUES=(${ov2[@]//.*/ })
##
## OPTIONS_LABELS=("Apple" "Microsoft" "Google")
##
for i in "${!OPTIONS_VALUES[@]}"; do
OPTIONS_STRING+="${OPTIONS_VALUES[$i]} (${OPTIONS_LABELS[$i]});"
done
##
prompt_for_multiselect SELECTED "$OPTIONS_STRING"
##
for i in "${!SELECTED[@]}"; do
if [ "${SELECTED[$i]}" == "true" ]; then
CHECKED+=("${OPTIONS_VALUES[$i]}")
fi
done
########
echo -e "\n\n\t You chose: \n\t ${CHECKED[@]/#/"$c2 "} \n\n\n\n";
read -n1 -ep "
$up1$up1$ll$c2 Do you wish to proceed? "$dim"["$re$bold"Y"$dim"/"$re$bold"n"$re$dim"] $re" "yn";
if [ "$yn" != "${yn#[Nn]}" ]; then echo "$c2 nope";exit 1; else echo "$ll$c2 OK"; fi ; tput cup 0;
for i in "${CHECKED[@],,}";
do echo -e "$i=true \n"
done
for i in "${CHECKED[@],,}";
do
echo -e "\n\t $c2 Installing $i \n"; sleep 1;
bash "$gh/ants/etc/"$i".sh"; echo -e "\n\t $c2 All done$c2 \n";
done
echo -e "\t $c2 All done$c2\n\n";
########################################
echo -e "\n\n\n\n    $ll $c2$blink Bash is now better! $re$c2 \n\n\n\n"; sleep 1;
source ./menu.sh
