#!/bin/bash

pro() {
ttff() {
tput setaf $((RANDOM%16));
}
ttbb() {
tput setab $((RANDOM%16));
}
wwotd() {
RANDOMWORD=($(cat /usr/share/dict/words))
tput sc cup 4 4; ttff; echo -e " ${RANDOMWORD[$((RANDOM%${#RANDOMWORD[@]}))]} "; tput sgr0 rc;
}
export c2="$cyan --$re"; tput civis;
$pro &>/dev/null & disown; tput cuu 8; tput ed; tput cud 2; PROC_ID=$!; while kill -0 "$PROC_ID"&>/dev/null; 
do for X in "[        ]" "[$(ttff)=$re       ]" "[$(ttff)==$re      ]" "[$(ttff)===$re     ]" "[$(ttff)====    $re]"  "[ $(ttff)====   $re]" \
"[   $(ttff)====$re ]" "[    $(ttff)====$re]" "[     "$(ttff)"===$re]" "[      "$(ttff)"=="$re"]" "[       =]" "[        ]" "[        ]" "[        ]"; 
do echo -e "  [$(ttbb)  $re]$c2 Executing $rev $pro $re"$c2" $X"; tput cuu1; sleep 0.08; done; done;
echo -e "\t\t\t\t\t\t [  "$green"DONE"$re"  ] \n\n\n\n\n"; tput cnorm;
}
pro="sleep 4"; pro; 
coolors 2>/dev/null;