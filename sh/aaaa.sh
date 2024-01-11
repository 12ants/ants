#!/bin/bash
# aaaa.sh
# alias for bash terminal
# by 12ants.github.com
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -caklhuptr --group-directories-first'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
##
## MOVE AROUND
alias pppp='tput cuu 8 ed; echo -e "\n\n\n\n\t ";';
alias psp='echo -e "\n\n\n\n\n\n\n"; tput cuu 4
'
# old -- alias psp='echo -e "\n\n\n\n\n\n\n"; tput cuu 4;  '
alias ports='echo -e "\n\n   $cyan-$re Open ports on local network"$cyan" -"$re" \n"; echo -e " -- -- -- -- -- -- -- $(portsopen;  echo " -- -- -- -- -- -- --")"|column -tLo "$(tput sgr0)|  " -tLo "  $(tput sgr0)||   " -H 1,2,3,4,8; echo -e "\n\n" '
alias greet='echo -n -e "  $(tput setaf 6)--$re Welcome back $darkblue $USER, $re today is:$blue "; date; echo;'
#export ipn="$(hostname -I | tail -c3)"
#export ipnet="$(hostname -I|tr  " " "\n"|head -n1)"
export ipnet=$(hostname -I|tr " " "\n"|head -n1)
export ipn=$(hostname -I|tr " " "\n"|head -n1|tail -c2)
alias ipnet="tput setab $ipn; echo -n $ipnet; tput sgr0;"
alias ippub="wget -qO- ifconfig.me"
alias ipports="sudo lsof -i -P -n"
alias qw="fortune|lolcat -a& disown;"
##
##
alias rainbow='echo;echo;echo; tput cuu 2; read -ep "$c2 " "rainbow"; rb "$rainbow";'
alias cds='
psp read -ep "$c2 "$rev"goto:$re " -i "$PWD" "goto"; 
mkdir -p $folder -m 775; 
#chown "$SUDO_USER":"$USER" "$goto"; 
cd $goto; echo -e "\n\t $cyan$bold> $pink$PWD$cyan <$re\n\t * * * *\n"; ls -caklhuptr --group-directories-first;'
alias ff='
psp read -ep "$c2 "$rev"new folder?$re " -i "$PWD" "folder"; 
mkdir -p $folder -m 775; 
chown "$SUDO_USER":"$USER" "$folder"; 
cd $folder; echo -e "\n\t $cyan$bold> $pink$PWD$cyan <$re\n\t * * * *\n"; ls -caklhuptr --group-directories-first;'
alias oooo="rrf; fortune; tput sgr0;"
alias rr="sudo -s"
alias besh="micro /etc/bbbb.sh"
alias mm="sudo micro "
alias ee="echo "
alias rw="wotd"
##
alias qq='cd ..; echo -ne "\t$pinkb $PWD $re\n"; ll -h; echo -ne "\t$pinkb $PWD $re\n";'
alias bb="btop --utf-force"
############################################
#### GITHUB ################################
alias kk='read -ep ">_ " 'kl'; printf "$kl"|gh gist create -f $(date +%A_%y_%m_%d_%__0k_%M.sh); echo \n\n\t$c2 !$/raw\n\n""'
alias kf='guf=$(gum file);echo -e "\n\n\n\n\n"; tput cuu 2; read -ep "$c2 title: $cyan" -i "$(date +%A%y%m%d%0k%M.sh)" "ttll";cat $guf|gh gist create -f $ttll - '

############################################
#### SSH ###################################
export sl="2.2.2.2" slu="aaaa"; 
alias sl='read -ep "$c2 ssh: " -i "$sl" sl; read -ep "$c2 user: " -i "$slu" slu;  ssh $sl -l $slu'
############################################
#### ANTS ##################################
alias aaaa='sudo micro /etc/aaaa.sh && read -t2 -n1 -ep "update aaaa.sh? " ab && source /etc/aaaa.sh'
alias bbbb='sudo micro /etc/bbbb.sh && read -t2 -n1 -ep "update bbbb.sh? " ba && source /etc/bbbb.sh'
alias cccc='sudo micro /etc/cccc.sh && read -t2 -n1 -ep "update cccc.sh? " ba && source /etc/cccc.sh'
alias uu='sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo snap refresh && jp2a /boot/grub/tard.jpg|pv --rate-limit=2222 --quiet; sleep 2 && reboot'
##
alias www="www-browser"
alias aa="apropos"
############################################
#### WEATHER ###############################
# vv='curl -sm2 http://wttr.in/sthlm?format=%l:+%c+%f'
alias vvvv='curl http://wttr.in/stockholm; '
alias vv='tput sc; 
tput cup 4 $((COLUMNS - 28)) setab $((RANDOM%22 + 111)) el; 
tput cup 5 $((COLUMNS - 28)) el; tput cuf 2; 
curl -sm2 http://wttr.in/sthlm?format=%l:+%c+%t+/+%f++; 
tput cup 6 $((COLUMNS - 28)) el; tput sgr0 rc;'
#curl http://wttr.in/Stockholm?format=%l:+%c%t+-+%C++-++Feels+like:+%f++H:+%h; 
############################################
## MISC_STUFF ##############################
alias fill='seq -s _ 1 2222'
alias tputhelp='pager --omit-header /ants/tput_help.sh'
############################################
## RANDOM_STUFF ############################
# export rnd1="(($RANDOM%99))"
# alias rnd1="(shuf 0-222 -n1)"
alias rr1='(echo $SRANDOM|tail -c2)'
alias rr2='(echo $RANDOM|tail -c2)'
alias rrf='tput setaf $(rr1)'
alias rrb='tput setab $(rr2)'
############################################
#### IP_STUFF ##############################
alias ipa='
echo " $(rrf)  ------$(tput setaf 2) Public IP: $(tput sgr0)$(ippub)$(tput setaf 6)";
echo " $(tput setaf $(rr2))  ---------------------------------- " ;
echo " $(rrf)  ------$(tput setaf 4) Network IP: $(tput sgr0)$(ipnet)$(tput sgr0)"; echo;'
############################################"
##
# alias ali='psp read -ep "$c2 " -i "alias " "ali"; echo "$ali" >> /etc/aaaa.sh; echo -e "\n $ali \n " '
# alias ali='psp read -ep "$c2 " -i "ali " "ali";
# echo "$ali" >> /etc/aaaa.sh; echo -e "\n $ali \n " '
alias ali='psp read -ep "$c2 alias name: " "alia"; 
psp read -ep "$c2 alias $alia=" -i ""'""""'"" "aliq"; 
echo "alias $alia=$aliq" >> /etc/aaaa.sh; 
echo -e "\n $alia=""$aliq"" \n "; source /etc/aaaa.sh;'
############################################
############################################
alias fakta='neofetch 2>/dev/null '
alias gg='psp read -ep "$c2 " -i "google: " "google"; googler "https://www.google.com/search?q=$google"'
alias zz="ranger 2>/dev/null" 
alias pp='echo ____pinging_moto8____; for i in {1..18}; do sleep 1; 
kdeconnect-cli -n "moto g(8)" --ping-msg "  >_<  "; sleep 1; done'
alias clone='
psp read -ep "$c2 "$rev"clone where folder?$re " -i "$PWD/" "folder"; mkdir -p $folder -m 775 2>/dev/null; 
chown "$SUDO_USER":"$USER" "$folder"; cd $folder; echo -e "\n\t $cyan$bold> $pink$PWD/$cyan <$re\n\t * * * *\n"; ll -caklup;
####
psp read -ep "$c2 CLONE: https://github.com/12ants/" -i "" "clone"; 
git clone https://github.com/12ants/$clone; cd $clone 2>/dev/null; echo -e "\n\t $cyan$bold> $pink$PWD/$cyan <$re\n\t * * * *\n"; ls -a; echo;echo; '
# alias ww='ee;ee "$cyan";w;ee;ee "$blue"; ps all;ee "$re $PWD"'
alias ww='echo;echo "  LAST LOGINS";echo;sudo lastb -axdwn 14;echo;echo "       = = = = = = == ";echo; sudo last -wxdFan14;echo;landscape-sysinfo; echo;echo "    = = = = = =   ";echo;'
alias rb='sudo wall "gg"; sleep 1; sudo systemctl reboot'
alias gt='read -n1 -ep "  $c2  g/t  $(systemctl get-default)  " "gt"; if [ $gt == t ]; then sudo systemctl set-default multi-user.target; else sudo systemctl set-default graphical.target; fi ; echo gg ; '
alias xxxx='startx'
alias cc=cds
echo aaaa
