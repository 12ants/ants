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
pv \
neofetch \
tlp \
net-tools \
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
export NVM_DIR="/home/$SUDO_USER/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
cp ssss.sh /bin/ssss -vb
chown $SUDO_USER:$USER /bin/ssss
chmod 775 /bin/ssss
##
# GUM __ Debian/Ubuntu
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install gum
##
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
