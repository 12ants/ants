#!/bin/bash
##
## 0000/etc/basic_apps.sh
## About: gpm links2 ranger mc lolcat googler...
##
# BASIC APPS #
##############
tput cuu 8; tput ed; 
echo -e "\n\n$ll$c2 Installing basic apps . . . \n\n";
apt update; apt upgrade -yqq;
apt install -yqq \
gpm \
links2 \
ranger \
mc \
gh \
neofetch \
tlp \
btop \
curl \
fortune-mod \
lolcat \
googler \
2>/dev/null ;
sudo snap refresh; 
sudo snap install lolcat spt; 
tput cuu 8; tput ed; ee -e "\n\n$ll$c2 Basic apps installed . . . \n\n";
#### nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
cp ssss.sh /bin/ssss
echo "$ll$c2 OK"
##
ln /usr/games/fortune /bin/ 2>/dev/null;
ln /usr/games/fortune-mod /bin/ 2>/dev/null;
ln /usr/games/lolcat /bin/ 2>/dev/null;
ln /usr/games/fortune /bin/ 2>/dev/null;
##
##
##
## About: gpm links2 ranger mc lolcat googler...