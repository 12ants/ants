#!/bin/bash
####
#### INSTALL PROMPT
#### XFCE4 Desktop enviroment
####
install="Cloudpanel on Ubuntu";
####
echo -e "\n\n\n\n\n\n\v\v\v\v $up1$up1$up1$up1$up1$up1$up1$up1";
read -ep "    $c2 Install $install? $(tput setaf 2)" -i "Y" "ask";
if [ $ask == "Y" ]; then echo "    $c2 "$dim"["$green" OK "$re$dim"]"; cd $inst;
####
curl -sS https://installer.cloudpanel.io/ce/v2/install.sh -o install.sh; \
echo "3c30168958264ced81ca9b58dbc55b4d28585d9066b9da085f2b130ae91c50f6 install.sh" | \
sha256sum -c && sudo DB_ENGINE=MARIADB_10.11 bash install.sh
####
else echo "    $c2 No, "$dim"["$green" OK "$re$dim"]"; cd $inst; fi;
####
####
#### Cred: 12ants.com
####

