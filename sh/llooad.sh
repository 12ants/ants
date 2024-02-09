pro() {
alias tf='tput setaf $((RANDOM%16));'
alias tb='tput setab $((RANDOM%16));'
c2="$cyan --$re"; tput civis;
$pro &>/dev/null & disown; tput cuu 8; tput ed; tput cud 2; PROC_ID=$!; while kill -0 "$PROC_ID"&>/dev/null; 
do for X in "[        ]" "[$(tf)=$re       ]" "[$(tf)==$re      ]" "[$(tf)===$re     ]" "[$(tf)====    $re]"  "[ $(tf)====   $re]" \
"[  $(tf)====$re  ]" "[   $(tf)==== $re]" "[    $(tf)====$re]" "[     "$(tf)"===$re]" "[      "$(tf)"=="$re"]" "[       =]" "[        ]" "[        ]" "[        ]"; 
do echo -e "  [$(tb)  $re]$c2 Executing $rev $pro $re"$c2" $X"; tput cuu1; sleep 0.08; done; done;
echo -e "\t\t\t\t\t\t [  "$green"DONE"$re"  ] \n\n\n\n\n"; tput cnorm;
}
##
##
pro="sleep 4"; pro; 
