#!/bin/bash
## Loading animation for jobs 
## [Change "pro=' to job ' "]
##
pro='sleep 4'
##
##
pro() {
$pro & disown; tput cuu 8; tput ed; tput cud 2;
PROC_ID=$!
while kill -0 "$PROC_ID"&>/dev/null; do for X in "[    ]" "[$green=$re   ]" "[$green==$re  ]" "[$green===$re ]" "[ $green===$re]" "[  $green==$re]" "[   $green=$re]" "[    ]" "[    ]" "[    ]" "[    ]"; 
do echo -en "\b\b\b\b\b\b$X"; tput el; sleep 0.1; done; done 
echo "PROCESS TERMINATED"
}
##
##
pro


