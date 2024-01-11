#!/bin/bash
##
## . /etc/balias.sh
##
##
if [ $UID == 0 ]; then 
mv /home/$SUDO_USER/.bashrc /tmp/ 2>/dev/null;
mv /home/$SUDO_USER/.profile /tmp/ 2>/dev/null;
mv /root/.bashrc /tmp/ 2>/dev/null;
mv /root/.profile /tmp/ 2>/dev/null;
else 
mv /home/$USER/.bashrc /tmp/ 2>/dev/null;
mv /home/$USER/.profile /tmp/ 2>/dev/null;
fi 
cd $ghh/0000/etc 2>/dev/null;
cp ../conf/bash.bashrc /etc/ -b 2>/dev/null; 
source /etc/bash.bashrc
own 
##
##

mv  /etc/skel/.bashrc $ghh/bups0000
echo "source /etc/bash.bashrc " > /etc/skel/.bashrc
##

echo -e "\n\t Copy new bash file . . . . Done . . . .\n\n"
##