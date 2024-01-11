#!/bin/bash
## new_db
##
d1="$(date +%h%d%y-%S)"; read -ep "$c2 DB User: " -i "$SUDO_USER" "dbu" ;r ead -ep "$c2 New DB: " -i "$d1" "d1"; echo -e "\n $green $d1 $re";
mysql -u aaaa -p -e"CREATE DATABASE IF NOT EXISTS $d1;flush privileges;SHOW DATABASES;";
echo -e "\n $cyan $d1 $re \n\n";
##
##
