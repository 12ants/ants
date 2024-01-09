#!/bin/bash
##
## 0000/etc/cloudpanel.sh
## About: Simply CloudPanel.io.
####
##
echo -e "\n\n\t Installing Cloudpanel... \n \n "
curl -sS https://installer.cloudpanel.io/ce/v2/install.sh -o install.sh; \
echo "85762db0edc00ce19a2cd5496d1627903e6198ad850bbbdefb2ceaa46bd20cbd install.sh" | \
sha256sum -c && sudo DB_ENGINE=MARIADB_10.11 bash install.sh
##
##
