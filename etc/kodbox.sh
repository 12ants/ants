#!/bin/bash
#
#
## About: Kodbox dl sh script.
#
cd $ghh
echo;echo;echo;echo;echo;echo; tput cuu 4;
read -t 12 -ep "$ll$c2 kodbox folder:  " -i "$PWD" "kbkb";
cd $kbkb
git clone https://github.com/kalcaddle/kodbox.git
$own 
$mod 
echo gg
##
##
