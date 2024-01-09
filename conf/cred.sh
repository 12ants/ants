#!/bin/bash
if [ $UID == 0 ]; then 
cd /home/$SUDO_USER/gh/0000; else cd /home/$USER/gh/0000; fi 
cd ./conf;
cd $ghh/conf;
tput cup 6;
tput ed; 
echo -e "\n\n\n\n\n\n";
function stage1 {
while true;do
tput cup 8; read -t 22 -s -ep "$ll$c2 Password to Cloudflare: " "cfpw"; 
cat ./s/cf256.txt|openssl enc -aes-256-cbc -md sha512 -a -d -pbkdf2 -pass pass:"$cfpw" 2>/dev/null > "./s/cf.txt"
if [ $? == 0 ]; then echo -e "\t\t\t\t CORRECT \n\n\n\n"; stage2
else echo -e "\t\t\t\t WRONG \n\n\n\n";
fi 
read -n1 -ep "$ll$c2 Try again? ["$bold"Y"$re"]es ["$bold"N"$re"]o ["$bold"A"$re"]bort " yno
    case $yno in
        [Nn]*) stage2;;
        [Yn]*) continue;;
        [Aa]*) exit 0;;
            *) echo "Try again";;

    esac
done
}
function stage2 { 
while true;do 
tput cup 8; read -t 22 -s -ep "$ll$c2 Password to Github:         " "ghpw"; 
cat ./s/gh256.txt|openssl enc -aes-256-cbc -md sha512 -a -d -pbkdf2 -pass pass:"$ghpw" 2>/dev/null >"./s/gh.txt"
if [ $? == 0 ]; then echo -e "\t\t\t\t CORRECT \n\n"; exit 0
else echo -e "\t\t\t\t WRONG \n\n\n\n";
fi 

read -n1 -ep "$ll$c2 Try again? ["$bold"Y"$re"]es ["$bold"N"$re"]o ["$bold"A"$re"]bort " yno
    case $yno in
        [Nn]*) exit 0;;
        [Yn]*) continue;;
        [Aa]*) exit 0;;
            *) echo "Try again";;

    esac
done 
}

stage1
