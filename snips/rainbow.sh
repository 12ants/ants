#!/bin/bash ## RAINBOW-TEXT ## Example usage: rb "Yo yo yo " 
rb() { echo;echo; colors=("31" "33" "32" "36" "34" "35")
for ((i=0; i<${#1}; i++)); do char="${1:i:1}"; color_index=$((i % ${#colors[@]}))
color_code="${colors[$color_index]}"; echo -en "\033[${color_code}m${char}\033[0m"; done; echo;echo;echo; } 
alias rainbow='echo;echo;echo; tput cuu 2; read -ep "$c2 " "rainbow"; rb "$rainbow";'