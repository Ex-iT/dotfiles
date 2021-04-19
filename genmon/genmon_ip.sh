#!/bin/bash
# Dependencies: xclip

FONT="JetBrains Mono 11"
COLOR_ACTIVE="#40da00"

ETH0=$(ifconfig eth0 | awk '/inet/{print $2; exit}')
TUN0=$(ifconfig tun0 | awk '/inet/{print $2; exit}')

if ! [ -z $TUN0 ]; then
    IP=$TUN0
    LABEL="<span foreground='${COLOR_ACTIVE}'>$IP</span>"
else
    IP=$ETH0
    LABEL=$IP
fi

CLICK="/usr/bin/bash -c 'echo -n ${IP} | /usr/bin/xclip -selection clipboard'"

TOOL="<tool><span font='${FONT}'>"
TOOL+="eth0: $ETH0"
if ! [ -z $TUN0 ]; then
    TOOL+="\ntun0: $TUN0"
fi
TOOL+="</span></tool>"

# Genmon
echo "<txt> "$LABEL" </txt>"
echo "<txtclick>${CLICK}</txtclick>"
echo -e $TOOL

exit 0
