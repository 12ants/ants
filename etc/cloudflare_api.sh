#!/bin/bash 
git clone https://github.com/timothymiller/cloudflare-ddns.git
cd cloudflare-ddns
wget -O config.json https://gist.githubusercontent.com/12ants/f6482661b0256e395f8c690c35e85467/raw/2eabc94e0d5335db147ac858f0f05aedcae46db8/gistfile1.txt
chmod 770 config.json
read -ep "start cf api?" "cfcfcf"; 
. start-sync.sh