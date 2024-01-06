#!/bin/bash
## login
#
## About: Change SSH Login-Screen.
#
echo "Banner /etc/issue" >> /etc/ssh/sshd_config
echo '
____________╔═╗__╔╗╔__╔╦╗__╔═╗__________
____________╠═╣__║║║___║___╚═╗__________
____________╩_╩__╝╚╝___╩___╚═╝__________
              server login
              -------------' > /etc/issue.net
##
##

echo "Banner /etc/issue.net" >> /etc/ssh/sshd_config
echo '


______/\\\____/\\\\\\\\\_________/\\\\\\\\\_____/\\\\\_____/\\\__/\\\\\\\\\\\\\\\_____/\\\\\\\\\\\___________
___/\\\\\\\__/\\\///////\\\_____/\\\\\\\\\\\\\__\/\\\\\\___\/\\\_\///////\\\/////____/\\\/////////\\\________
___\/////\\\_\///______\//\\\___/\\\/////////\\\_\/\\\/\\\__\/\\\_______\/\\\________\//\\\______\///________
________\/\\\___________/\\\/___\/\\\_______\/\\\_\/\\\//\\\_\/\\\_______\/\\\_________\////\\\______________
_________\/\\\________/\\\//_____\/\\\\\\\\\\\\\\\_\/\\\\//\\\\/\\\_______\/\\\____________\////\\\__________
__________\/\\\_____/\\\//________\/\\\/////////\\\_\/\\\_\//\\\/\\\_______\/\\\_______________\////\\\______
___________\/\\\___/\\\/___________\/\\\_______\/\\\_\/\\\__\//\\\\\\_______\/\\\________/\\\______\//\\\____
____________\/\\\__/\\\\\\\\\\\\\\\_\/\\\_______\/\\\_\/\\\___\//\\\\\_______\/\\\_______\///\\\\\\\\\\\/____
_____________\///__\///////////////__\///________\///__\///_____\/////________\///__________\///////////_____
 ' > /etc/issue.net

service ssh reload

login_ssh_net='

______/\\\____/\\\\\\\\\_________/\\\\\\\\\_____/\\\\\_____/\\\__/\\\\\\\\\\\\\\\_____/\\\\\\\\\\\___________
___/\\\\\\\__/\\\///////\\\_____/\\\\\\\\\\\\\__\/\\\\\\___\/\\\_\///////\\\/////____/\\\/////////\\\________
___\/////\\\_\///______\//\\\___/\\\/////////\\\_\/\\\/\\\__\/\\\_______\/\\\________\//\\\______\///________
________\/\\\___________/\\\/___\/\\\_______\/\\\_\/\\\//\\\_\/\\\_______\/\\\_________\////\\\______________
_________\/\\\________/\\\//_____\/\\\\\\\\\\\\\\\_\/\\\\//\\\\/\\\_______\/\\\____________\////\\\__________
__________\/\\\_____/\\\//________\/\\\/////////\\\_\/\\\_\//\\\/\\\_______\/\\\_______________\////\\\______
___________\/\\\___/\\\/___________\/\\\_______\/\\\_\/\\\__\//\\\\\\_______\/\\\________/\\\______\//\\\____
____________\/\\\__/\\\\\\\\\\\\\\\_\/\\\_______\/\\\_\/\\\___\//\\\\\_______\/\\\_______\///\\\\\\\\\\\/____
_____________\///__\///////////////__\///________\///__\///_____\/////________\///__________\///////////_____

' 
echo "login_ssh_net is now this: $login_ssh_net "