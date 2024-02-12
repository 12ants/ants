#!/bin/bash
## written by 12ants.github.io
#########################
## -- CUSTOM LINUX --  ##
#########################
tput sc; tput cup 4 $((COLUMNS-28)); echo -en "loaded $(rrf)/etc/bbbb"; tput rc;
export EDITOR='micro'; export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'  
alias ee="echo ";
export bold=$(tput bold) dim=$(tput dim) so=$(tput smso) noso=$(tput rmso) rev=$(tput rev) re=$(tput sgr0) normal=$(tput sgr0) \
redb=$(tput setab 1) greenb=$(tput setab 2) yellowb=$(tput setab 3) blueb=$(tput setab 4) purpleb=$(tput setab 5) cyanb=$(tput setab 6) \
grayb=$(tput setab 7) red=$(tput setaf 1) green=$(tput setaf 2) yellow=$(tput setaf 3) blue=$(tput setaf 4) purple=$(tput setaf 5) \
cyan=$(tput setaf 6) gray=$(tput setaf 7) white=$(tput setaf 7 bold) pink=$(tput setaf 5 bold) darkblue=$(tput setab 5 bold) blink=$(tput blink) \
left2=$(tput cub 2) up1=$(tput cuu1) pinkb=$(tput setab 5 bold) 
export c2=""$cyan"--$re"; sup
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
##########################
#### Welcome screen ######
##########################
echo; sup
echo; greet
fakta
ee;fortune|tr  -s "\t\n" "  "|lolcat -p 22; ee;ee; ipa
if [ "$(id -u)" -eq 0 ]; then us='#'; else us='$'; fi;
## bash prompt
#PS1='\$[\[\e[9$(rr2);$(rr1)m\]\t\[\e[0m\]][\[\e[9$(rr1)$(rr2)m\]$(ipnet)\[\e[0m\]][\[\e[$(rr2)$(rr1)m\]\u\[\e[0m\]][\[\e[9$(rr1)m\]$(pwd)\[\e[0m\]] \[\e[97;1m\]>\[\e[37;4m\]_\n\[\e[0m\]'
PS1='[$(tput setaf $((RANDOM%4+44)))$us$re][$(tput setaf $((RANDOM%4+61)))$(date +%T)$re][$(tput setaf $((RANDOM%4+144)))$(hostname)$re][$(ipnet)][$(tput setaf $((RANDOM%4+84)))$USER$re][$(tput setaf $((RANDOM%4+194)))$PWD/$re]>_\n'