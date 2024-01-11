#!/bin/bash
##
## 0000/etc/github.sh
## About: GitHub
##
echo "##################################"
echo "## GITHUB CREDENTIALS INSTALLER ##"
echo "##################################"
#if [ $UID == 0 ]; then 
echo -e "\n$c2 INSTALLING GITHUB CREDENTIALS...\n"; 
tput setaf dim; cd $ghh/0000; 
apt install -y gh 2>/dev/null
if [ -f "../conf/s/gh.txt" ]; then
echo "$re gg"; gh auth logout; gh auth login --with-token < ../conf/s/gh.txt;
else source ../conf/cred.sh; 
fi 
rm ../conf/s/gh.txt; 
sleep 1; gh auth status;
echo;echo; psp ; 
read -ep "$c2 github name: " -i "12ants" "ghname";
read -ep "$c2 github mail: " -i "leonljunghorn@gmail.com" "ghmail";
git config --global user.email  "$ghmail"
git config --global user.name  "$ghname"
echo;echo;
echo -e "\n$c2 Github-credentials updated$green OK \n"; 
# else echo "not root"; fi 
## GITHUB CREDENTIALS INSTALLER ##
################################## 
## by 12ants.com
