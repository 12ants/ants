#!/usr/bin/env bash
# NAME:  GNOS sockets
# DESC:  Handy ss wrapper
# FEAT:  Colors support
# DEPS:  ss sed awk sort column sudo
# LICE:  WTFPL
# AUTH:  elias@gnos.in
########
# FUNC #
########
Usage () # $1:RET
{
cat <<EOF
Usage: $( basename "$( readlink -f "$BASH_SOURCE" )" ) [ options ] [ PATTERN ]

  -4       Display only IPv4 sockets
  -6       Display only IPv6 sockets
  -t       Display only TCP sockets
  -u       Display only UDP sockets
  -l       Display only listening sockets
  -L       Display only non-listening sockets
  -s       Display short IP
  -N       Resolve numerics
  PATTERN  Plain-text match
EOF
exit $1
}

Fix ()
{
sed -E -e 's/^([a-z0-9]+)([A-Z])/\1 \2/' \
   -e 's/^([A-Z-]+)([0-9])/\1 \2/'
}

Render () # $1:COLORS $2:PROTO_SUFFIX $3:PATTERN $4:LISTEN $5:NUMERIC $6:FORCE $7:SHORT
{
awk -v colors=$1 -v suffix=$2 -v pattern="$3" -v listen=$4 -v numeric=$5 -v force=$6 -v short=$7 \
-v username=${SUDO_USER:-$USER} -v hostname=$HOSTNAME '

BEGIN {
unknown=":"

# Colors
creset="\033[0m"
cbold="\033[1m"
cred="\033[31m"
cgreen="\033[32m"
cyellow="\033[33m"
cblue="\033[34m"

# Usernames by pid
cmd="ps --no-headers -eo pid,user"
while (cmd | getline v)
{
gsub("^ +" , "", v)
i=index(v, " ")
users[substr(v, 1, i-1)+0]=substr(v, i+1)
}
close(cmd)

# Local ips
cmd="ip a"
while (cmd | getline )
{
if ($1=="inet" || $1=="inet6") locals[ substr($2, 1, index($2, "/")-1) ] = 1
}
close(cmd)
}

{
# Init
nolport=0

# Mapping
if (length(force))
{
proto=force
state=$1
local=$4
remote=$5
user=$6
}
else
{
proto=$1
state=$2
local=$5
remote=$6
user=$7
}

# PROTOCOL
if (proto=="tcp" || proto=="udp") proto=proto suffix
else nolport=1

if (colors)
{
protov=""
if (substr(proto, length(proto))==6)
{
proto=substr(proto, 1, length(proto)-1)
protov=6
}
proto=ColorProto(proto) cred protov creset
}

# LOCAL
laddr=FormatIp(local)
if (colors) laddr=ColorIp(laddr)
lport=local
gsub("^.*:" , "", lport)
if (nolport) lport=""

# REMOTE
if (listen!=1 && force!="udp")
{
raddr=FormatIp(remote)
if (colors) raddr=ColorIp(raddr)
rport=remote
gsub("^.*:" , "", rport)
}

# PROCESS, PID, UID
name=unknown
pid=unknown
uid=unknown
if (substr(user, 1, 6)=="users:")
{
name=substr(user, 10, index(user, "\",")-10)

i=index(user, "=")
pid=substr(user, i+1)
i=index(pid, ",")
pid=substr(pid, 1, i-1)

if (users[pid]) uid=users[pid]
}
if (colors) uid=ColorUser(uid)

# STATE
if (state=="LISTEN" || state=="UNCONN")
{
raddr=""
rport=""
}
if (colors) state=ColorState(state)

# Main
if (listen==1 || force=="udp" ) line=uid " " name " " pid " " proto " " laddr ":" lport " " state
else                            line=uid " " name " " pid " " proto " " laddr ":" lport " " raddr ":" rport " " state

if (length(pattern))
{
# Filter
raw=" " line
gsub("\033\\[[0-9]+m" , "", raw)
# print raw
if (index(raw, pattern)) print line
}
else print line
}
function FormatIp(ip)
{
gsub("(:[^:]*|%.*)$" , "", ip)
if (short==1)
{
if (substr(ip, 1, 1)=="[") ip=substr(ip, 2, length(ip)-2)
if (substr(ip, 1, 7)=="::ffff:") ip=substr(ip, 8)
if (ip=="*" || ip=="0.0.0.0" || ip=="::") ip=0
if (substr(ip, 1, 4)=="127." || ip=="::1" || ip=="localhost") ip=1
}
return ip
}
function ColorIp(ip)
{
if (ip==0) return cred ip creset
else if (ip==1 || ip=="localhost" || substr(ip, 1, 4)=="127." ) return cgreen ip creset
else if (locals[ip]==1 || ip==hostname) return cblue ip creset
else return cyellow ip creset
}
function ColorProto(p)
{
if (p=="tcp") return cgreen p creset
else if (p=="udp") return cblue p creset
else return cyellow p creset
}
function ColorUser(u)
{
if (u=="root") return cred u creset
else if (u==username) return cgreen u creset
else if (u==unknown) return u
else return cyellow u creset
}
function ColorState(s)
{
if (s=="LISTEN") return cred s creset
else if (s=="ESTAB") return cgreen s creset
else if (s=="UNCONN") return cblue s creset
else return cyellow s creset
}
'
}


########
# INIT #
########

# DEFS
args="$@"
opts="--no-header --extended --processes"
ipv=0
tcp=0
listen=0
numeric=1
short=0

# Colors
[[ -t 1 && "$(tput colors)" -ge 8 ]] && colors=$(tput colors)
cyellow='\033[33m'
creset='\033[0m'
cbold='\033[1m'


# ARGS
while getopts hNlL46tupns opt "$@" &>/dev/null ; do
case "$opt" in

4)    [[ $ipv -eq 6 ]] && ipv=0 || ipv=4 ;;
6)    [[ $ipv -eq 4 ]] && ipv=0 || ipv=6 ;;

t)    [[ $tcp -eq 2 ]] && tcp=3 || tcp=1 ;;
u)    [[ $tcp -eq 1 ]] && tcp=3 || tcp=2 ;;

l)    [[ $listen -eq 2 ]] && listen=0 || listen=1 ;;
L)    [[ $listen -eq 1 ]] && listen=0 || listen=2 ;;

N)    numeric=0 ;;
s)    short=1 ;;

h)    Usage 0 ;;
[?])  Usage 1 ;;
esac
done
shift "$((OPTIND-1))"
[[ $# -gt 1 ]] && Usage 1
pattern=$1
shift

# USER
if [[ $( id -u ) -ne 0 ]] ; then
sudo "$( readlink -f "$BASH_SOURCE" )" $args && exit
[[ -n $colors ]] && echo -en $cyellow >&2
echo "WARNING: Running unprivileged"    >&2
[[ -n $colors ]] && echo -en $creset  >&2
fi

# OPTS
[[ $numeric -eq 1 ]] && opts="$opts --numeric" || opts="$opts --resolve"
case $listen in
0) opts="$opts --all" ;;
1) opts="$opts --listen" ;;
esac
case $tcp in
0)    [[ $listen -eq 2 ]] \
   && opts="$opts --tcp --udp" \
   || opts="$opts --tcp --udp --raw" ;;
3)    opts="$opts --tcp --udp"       ;;
1)    opts="$opts --tcp" ; force=tcp ;;
2)    opts="$opts --udp" ; force=udp ;;
esac


########
# MAIN #
########

{
# Header
[[ -n $colors ]] && echo -en $cbold
if [[ $listen -eq 1 || $force == "udp" ]] ; then
echo -n USER PROCESS PID PROTO LOCAL STATE
else
echo -n USER PROCESS PID PROTO LOCAL REMOTE STATE
fi
[[ -n $colors ]] && echo -en $creset
echo

# Data
{
[[ $ipv -eq 4 || $ipv -eq 0 ]] && ss $opts --ipv4 | Fix | Render "$colors" "" "$pattern" "$listen" "$numeric" "$force" "$short"
[[ $ipv -eq 6 || $ipv -eq 0 ]] && ss $opts --ipv6 | Fix | Render "$colors" 6  "$pattern" "$listen" "$numeric" "$force" "$short"
} | sort -n

} | column -t
