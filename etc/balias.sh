#!/bin/bash
##
## 0000/etc/balias.sh
## About: A asorted series of alias commands for the bash shell.
##
## . /etc/balias.sh
##
##
cd $ghh/0000/etc;
cp ../conf/balias.sh /etc/balias.sh -b
chown $SUDO_USER: /etc/balias.sh; 
chmod 775 /etc/balias.sh;
source /etc/balias.sh;
##
##
