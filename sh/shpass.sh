#!/bin/bash
########### SSH AUTO LOGIN KEY GENERATOR
echo;echo;read -ep " $c2 ssh host: " "host"; read -ep " $c2 ssh user: " "user";
mkdir ~/.ssh 2>/dev/null; chmod 700 ~/.ssh; sudo chmod 700 ~/.ssh; cd ~./.ssh/;
ssh-keygen -t rsa; cat ~/.ssh/id_rsa.pub | ssh $user@$host 'cat >> ~/.ssh/authorized_keys';
ssh $user@$host 'chmod g-w,o-w ~/./ssh/; chmod 700 ~/.ssh; chmod 600 ~/.ssh/authorized_keys'
