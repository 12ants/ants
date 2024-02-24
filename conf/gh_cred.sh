#!/bin/bash
###########
## ants/etc/github.sh
## About: GitHub
##
echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"; tput cuu 12;
echo "##################################"
echo "## GITHUB CREDENTIALS INSTALLER ##"
echo "##################################"
apt install -y gh 2>/dev/null; chmod 700 ~/.gnupg; 
##
read -ep "$c2 File to decrypt:" -i "$PWD/gh.gpg" "dcfile"; 
gpg -d $dcfile > /tmp/gh.txt;
gh auth login --with-token < /tmp/gh.txt; rm /tmp/gh.txt;
echo;echo; gh auth status; echo;echo;
read -ep "$c2 github name: " -i "12ants" "ghname";
read -ep "$c2 github mail: " -i "leonljunghorn@gmail.com" "ghmail";
git config --global user.email  "$ghmail";
git config --global user.name  "$ghname";
echo;echo;
echo -e "\n$c2 Github-credentials updated [$green OK$re ] \n\n";
