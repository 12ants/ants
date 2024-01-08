#!/bin/bash
echo cccc


sup() {

echo -e "\n\t $red running: $gray";
sudo w -o;
echo -e "\n\t $yellow running-processess: $gray";
sudo ps -la
echo -e "\n\t$blue login-attempts: $gray";
sudo lastb -an8
echo -e "\n\t $cyan login-users: $gray";
sudo last
echo -e "\n$re";

}