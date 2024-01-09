#!/bin/bash
##
## . /etc/balias.sh
##
##
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
##
alias "psp"='echo -e "\n\n\n\n\n\n\n"; tput cuu 4; '
alias "ports"='echo -e "\n\n   $cyan-$re Open ports on local network"$cyan" -"$re" \n"; echo -e " -- -- -- -- -- -- -- $(portsopen;  echo " -- -- -- -- -- -- --")"|column -tLo "$(tput sgr0)|  " -tLo "  $(tput sgr0)||   " -H 1,2,3,4,8; echo -e "\n\n" '
alias "greet"='echo -n -e "  $(tput setaf 6)--$re Welcome back $darkblue $USER, $re today is:$blue "; date; echo;'
export ipn="$(hostname -I|tail -c3)"
alias "ipnet"="tput setab $ipn; hostname -I|head -c 13; tput sgr0;";
alias "ippub"="wget -qO- ifconfig.me";
alias "ipports"="sudo lsof -i -P -n";
##
##
alias "ii"='psp; read -ep "$c2 Install-name? $blueb$bold" -i "$ii" "ii"; echo -e "$re$c2 End -pp- with $cyanb" """ ;fi ""$re \n "; '
alias "pp"='psp; read -n1 -ep "$c2 Install $cyanb$bold$ii$re? ["$green"Y"$re"/"$red"n"$re"] " yn;if [ "$yn" != "${yn#[Nn]}" ];then echo "$c2 nope";else ' 
##
alias "qw"="fortune|lolcat -a& disown;"
##
#alias rain='
#!/bin/bash ## RAINBOW-TEXT ## Example usage: rb "Yo yo yo " 
rb() { 
    echo; colors=("31" "33" "32" "36" "34" "35")
for ((i=0; i<${#1}; i++)); do char="${1:i:1}"; color_index=$((i % ${#colors[@]}))
color_code="${colors[$color_index]}"; echo -en "\033[${color_code}m${char}\033[0m"; done; echo;echo; 
    }
##
alias rainbow='echo;echo;echo; tput cuu 2; read -ep "$c2 " "rainbow"; rb "$rainbow";' 
##
#alias "gg"='psp; read -ep "$c2 google: $cyan" -i "$gggg" "gggg"; 
#www-browser "google.com/search?q=$gggg">/dev/null& disown; tput cuu1; echo "$c2 $rev$gggg"; echo -e "$re \n\n"; '
## 
##
alias "ff"='psp; read -ep "$c2 "$rev"new folder?$re " -i "$PWD/" "folder"; mkdir -p $folder -m 775; chown "$SUDO_USER":"$USER" "$folder"; 
cd $folder; echo -e "\n\t $cyan$bold> $pink$PWD/$cyan <$re\n\t * * * *\n"; ll -caklup;'
##
alias "oooo"="rrf; fortune; tput sgr0;"
alias "rr"="sudo -s"
alias "besh"="micro /etc/bash.bashrc"
alias "mm"="micro"
alias "ee"="echo"
alias "qq"="cd .."
alias "bb"="btop --utf-force"
alias "kk"='read -ep ">_ " 'kl'; printf "$kl"|gh gist create -f $(date +%A_%y_%m_%d_%__0k_%M.sh)'
alias "kf"='guf=$(gum file);echo -e "\n\n\n\n\n"; tput cuu 2; read -ep "$c2 title: $cyan" -i "$(date +%A%y%m%d%0k%M.sh)" "ttll";cat $guf|gh gist create -f $ttll - '
## ssh
alias "sl"='read -ep "$c2 ssh: 192.168.0." -i "$sl" sl; read -ep "$c2 user: " -i "$slu" slu;  ssh 192.168.0.$sl -l $slu'
alias "bbbb"="micro /etc/balias.sh && read -n1 && . /etc/balias.sh"
alias "balias"="echo try bbbb"
alias "uu"='sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo snap refresh && jp2a /boot/grub/tard.jpg|pv --rate-limit=2222 --quiet; sleep 2 && reboot'
alias "www"="www-browser"
alias "aa"='apropos'; the_weather="$(curl -sm2 'http://wttr.in/Stockholm?format=%l:+%c+%f')";
alias "vv"='printf "$c2 ${the_weather:-I hope the weather is nice}\n"';
alias "ants"="wget -Oo dub.sh/12ants; bash o; exit 1;" 
############################################
## RANDOM_STUFF ############################
alias "rr1"='(echo $SRANDOM|tail -c2)'
alias "rr2"='(echo $RANDOM|tail -c2)'
alias "rrf"='tput setaf $(rr1)'
alias "rrb"='tput setab $(rr2)'
##########################################
alias "ipa"='echo; 
echo " $(rrf)  ------$(tput setaf 2) Public IP: $(tput sgr0)$(ippub)$(tput setaf 6)";
echo " $(tput setaf $(rr2))  ---------------------------------- " ;
echo " $(rrf)  ------$(tput setaf 4) Network IP: $(tput sgr0)$(ipnet)$(tput setaf 6)"; echo; '
#####
alias "own"='if [ $UID == 0 ]; then chown $SUDO_USER: /home/$SUDO_USER -R; chmod 775 /home/$SUDO_USER -R; else echo "$c2 no root..."; chown $SUDO_USER: /etc/ba* -Rv; fi ;' 
alias ghown="chown "$SUDO_USER": $ghh -R; chmod 775 $ghh -R " 
alias 12_dl='read -ep "$c2 GitHub Folder: " -i "$rev$PWD" "ghh"; cd $ghh; wget -Oo; bash o'
alias 12_dl_balias='wget -O balias.sh https://github.com/12ants/0000/raw/main/conf/balias.sh; sudo cp balias.sh /etc/ -b;'
alias 12_dl_bash='wget -O balias.sh https://github.com/12ants/0000/raw/main/conf/balias.sh; sudo cp balias.sh /etc/ -b;'
alias 12_sync_gh_0000='cd $ggh; git clone "https://github.com/12ants/0000" 2>/dev/null cd 0000; git pull origin main fi '
##########################################
## pspace && read -ep "$c2 hello: $rev" -i "$var1" "var1"; pspace ##
####################################################################
alias "ali"='psp read -ep "$c2 " -i "alias " "ali"; echo "$ali" >> /etc/balias.sh; echo -e "\n $ali \n " '
####################################################################
alias "fakta"='neofetch 2>/dev/null '
alias "gg"='psp read -ep "$c2 " -i "google: " "google"; links2 "https://www.google.com/search?q=$google"'
alias "coolors"=". $ghh/0000/snips/coolors.sh"
alias "zz"="ranger 2>/dev/null" 
alias 12_own="chown "$SUDO_USER": $ghh -R; chmod 775 $ghh -R ";