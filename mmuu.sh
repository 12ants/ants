#!/bin/bash
## " ops=(FIRST SECOND ETC) && source multi "
function multi {
ops1=($(ls))
ops=(${ops1[@]/.sh/""})
clear
echo "
  ------------------------------------------
  ------------ $green hello $re ---------------------
  ------------------------------------------ 
  --$dim Choose:  [$re Up / Down$dim ]$re
  --$dim Select:  [$re Space$dim ]$re
  --$dim Confirm: [$re Enter$dim ]$re
  ------------------------------------------
  -- Choose multiple options: --------------
  ------------------------------------------
 "
## func "multiselect" begin ############
# little helpers for terminal print control and key input
ESC=$(printf "\033")
cursor_blink_on() { printf "$ESC[?25h"; }
cursor_blink_off() { printf "$ESC[?25l"; }
cursor_to() { printf "$ESC[$1;${2:-1}H"; }
print_inactive() { printf "$2   $1 "; }
print_active() { printf "$2  $ESC[7m $1 $ESC[27m"; }
get_cursor_row() {
IFS=';' read -sdR -p $'\E[6n' ROW COL
echo ${ROW#*[}
}

local return_value=$1
local -n options=$2
local -n defaults=$3
local selected=()
for ((i = 0; i < ${#options[@]}; i++)); do
if [[ ${defaults[i]} = "true" ]]; then
selected+=""$cyan"true"$re""
else
selected+=""$red"false"$re""
fi
printf "\n"
done

# determine current screen position for overwriting the options
local lastrow=$(get_cursor_row)
local startrow=$(($lastrow - ${#options[@]}))

# ensure cursor and input echoing back on upon a ctrl+c during read -s
trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
cursor_blink_off

key_input() {
local key
IFS= read -rsn1 key 2>/dev/null >&2
if [[ $key = "" ]]; then echo enter; fi
if [[ $key = $'\x20' ]]; then echo space; fi
if [[ $key = "k" ]]; then echo up; fi
if [[ $key = "j" ]]; then echo down; fi
if [[ $key = $'\x1b' ]]; then
read -rsn2 key
if [[ $key = [A || $key = k ]]; then echo up; fi
if [[ $key = [B || $key = j ]]; then echo down; fi
fi
}

toggle_option() {
local option=$1
if [[ ${selected[option]} == true ]]; then
selected[option]=""$red"false"$re""
else
selected[option]=true
fi
}

print_options() {
# print options by overwriting the last lines
local idx=0
for option in "${options[@]}"; do
local prefix="        $green[$re $green]$re"
#local suffix="        $blue[$re $pink]$re"
if [[ ${selected[idx]} == true ]]; then

prefix="        [\e[38;5;46m✔\e[0m]"
fi

cursor_to $(($startrow + $idx))
if [ $idx -eq $1 ]; then
print_active "$option" "$prefix"
else
print_inactive "$option" "$prefix"
fi
((idx++))
done
}

local active=0
while true; do
print_options $active

# user key control
case $(key_input) in
space) toggle_option $active ;;
enter)
print_options -1
break
;;
up)
((active--))
if [ $active -lt 0 ]; then active=$((${#options[@]} - 1)); fi
;;
down)
((active++))
if [ $active -ge ${#options[@]} ]; then active=0; fi
;;
esac
done

# cursor position back to normal
cursor_to $lastrow
printf "\n"
cursor_blink_on

eval $return_value='("${selected[@]}")'
}

##
##
opts="x"
echo "" >$opts
my_options=(${ops[*]/.*/})
pre=false
#result=(  "res1" "res2" "res3")
multi result ops pre
echo -e "\n------------------------------------------\n"

for index in "${!result[@]}"; do
echo -e "  ${ops[index]}=$green${result[$index]}$re"
done
echo -e "\n------------------------------------------\n\n\n\n"; tput cuu 4;
read -n1 -ep "$(tput setaf 7 bold)  --  Are these changes correct? $(tput setaf 7)[$(tput setaf 2)Y$(tput setaf 7)/$(tput setaf 1)n$(tput setaf 7)]$(tput setaf 7 bold) " yn
if [ "$yn" != "${yn#[Nn]}" ]; then
reset 
unset * 
break 
exit 
# multi result ops pre
# multi result ops pre;
## write to file
else
for index in "${!result[@]}"; do
echo -e "  ${ops[index]} \t \t -> ${result[$index]}" >>$opts
done
printf "\n ---- \n\n" >>$opts
## write to file
tput cuu1
echo -e "\t\t\t\t[$green OK$re ] 
  --  variables written to: [$re./$opts$dim]"
##########
idx=0
for option in "${my_options[@]}"; do
printf -v "$option" "${result[idx]}"
printf "$option=${result[idx]}\n" >>$opts
((idx++))
done
fi
tput sgr0
echo
echo
