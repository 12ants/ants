#!/bin/bash
## /gh/0000/etc/enter.sh
#
#  
cat ops 

if [ ${CHECKED[] }
if $
printf "Webmin - Login name (default aaaa): "
	if [ "$login" = "" ]; then
		read login
		if [ "$login" = "" ]; then
			login="aaaa"
		fi
	fi
	echo "$login" | grep : >/dev/null
	if [ "$?" = "0" ]; then
		echo "ERROR: Username contains a : character"
		echo ""
		
	fi
	echo $login | grep " " >/dev/null
	if [ "$?" = "0" ]; then
		echo "ERROR: Username contains a space"
		echo ""
		
	fi
	if [ "$login" = "webmin" ]; then
		echo "ERROR: Username 'webmin' is reserved for internal use"
		echo ""
	fi
export password="zxasqw122" 
password="zxasqw122" 
export password2="zxasqw122" 
password2="zxasqw122" 
		printf "Login password: "
	if [ "$password" = "" -a "$crypt" = "" ]; then
		stty -echo
		read password
		stty echo
		printf "\n"
		printf "Password again: "
		stty -echo
		read password2
		stty echo
		printf "\n"
		if [ "$password" != "$password2" ]; then
			echo "ERROR: Passwords don't match"
			echo ""
		fi
        fi 
