#!/bin/bash
## 
## 0000/etc/add_user.sh
## About: Add another user to this shell.
##
deluser 12ants 2>/dev/null; rm /12ants -r 2>/dev/null
useradd -G ""$SUDO_USER"" -m 12ants -r -d /12ants;
echo ""12ants":"aaaa"" | chpasswd
echo '12ants ALL=(ALL) NOPASSWD:ALL' > "/etc/sudoers.d/12ants"
# echo ". /etc/bash.bashrc; . /etc/balias.sh;" > /12ants/.profile; 
rm /12ants/.bashrc; rm /12ants/.profile; chsh -s /bin/bash 12ants; rm /12ants/0000 2>/dev/null; cd /12ants;
##
git clone https://github.com/12ants/0000
##
echo -e "\n\n User added... \n\n"
##
##
