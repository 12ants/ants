#!/bin/bash
#
echo -e "\n\n Installing xfc4-desktop... \n\n";
#
apt update; apt upgrade; apt install -y -qq xfce4-session xfce4-goodies xfce4-panel synaptic xinit luakit; #  minimal desktop env
#
#
# Cred: 12ants.com

