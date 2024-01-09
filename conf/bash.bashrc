#!/bin/bash
## written by 12ants.github.io
#########################
## -- CUSTOM LINUX --  ##
#########################
##
case $- in
*i*) ;;
*) return;;
esac
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
debian_chroot=$(cat /etc/debian_chroot)
fi
case "$TERM" in
xterm-color|*-256color) color_prompt=yes;;
esac
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
color_prompt=yes
else
color_prompt=
fi
fi
unset color_prompt force_color_prompt
case "$TERM" in
xterm*|rxvt*)
PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$#!/bin/bash
## written by 12ants.github.io
#########################
## -- CUSTOM LINUX --  ##
#########################
##
case $- in
*i*) ;;
*) return;;
esac
…ipa
tput sgr0;
## bash prompt
PS1='\$[\[\e[9$(rr2);$(rr1)m\]\t\[\e[0m\]][\[\e[9$(rr1)$(rr2)m\]$(ipnet)\[\e[0m\]][\[\e[$(rr2)$(rr1)m\]\u\[\e[0m\]][\[\e[9$(rr1)m\]$(pwd)\[\e[0m\]] \[\e[97;1m\]>\[\e[37;4m\]_\n\[\e[0m\]'
PS1"
;;
*)
;;
esac
export EDITOR='micro' 
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'  
##
alias ee="echo "
alias own="chown $SUDO_USER: $ghh -R; chmod 775 $ghh -R " ; 
export bold=$(tput bold) dim=$(tput dim) so=$(tput smso) noso=$(tput rmso) rev=$(tput rev) re=$(tput sgr0) normal=$(tput sgr0) \
redb=$(tput setab 1) greenb=$(tput setab 2) yellowb=$(tput setab 3) blueb=$(tput setab 4) purpleb=$(tput setab 5) cyanb=$(tput setab 6) \
grayb=$(tput setab 7) red=$(tput setaf 1) green=$(tput setaf 2) yellow=$(tput setaf 3) blue=$(tput setaf 4) purple=$(tput setaf 5) \
cyan=$(tput setaf 6) gray=$(tput setaf 7) white=$(tput setaf 7 bold) pink=$(tput setaf 5 bold) darkblue=$(tput setab 5 bold) blink=$(tput blink) \
left2=$(tput cub 2) up1=$(tput cuu1);
##
export c2="$cyan  --$re"; 
#dash="$cyan ----------------------------------$re" 
#ll=$(echo -e "\t\t") \
##
# nvm support
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
## enable color support of ls and also add handy aliases
#########################################
## BALIAS ###############################
. ~/.bash_aliases 2>/dev/null
if ! shopt -oq posix; then
if [ -f /usr/share/bash-completion/bash_completion ]; then
. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi
fi
## BALIAS/BBBB
if [ -f /etc/balias.sh ]; then . /etc/balias.sh; fi 
####
#### Welcome screen
####
coolor() {
    echo;
    for fg_color in {0..7}; do
        set_foreground=$(tput setaf $fg_color)
        for bg_color in {0..7}; do
            set_background=$(tput setab $bg_color)
            echo -n $set_background$set_foreground
            printf ' F:%s B:%s ' $fg_color $bg_color
        done
        echo $(tput sgr0)
    done; echo;
}
echo;
greet
fakta
ipa
tput sgr0;
## bash prompt
PS1='\$[\[\e[9$(rr2);$(rr1)m\]\t\[\e[0m\]][\[\e[9$(rr1)$(rr2)m\]$(ipnet)\[\e[0m\]][\[\e[$(rr2)$(rr1)m\]\u\[\e[0m\]][\[\e[9$(rr1)m\]$(pwd)\[\e[0m\]] \[\e[97;1m\]>\[\e[37;4m\]_\n\[\e[0m\]'
