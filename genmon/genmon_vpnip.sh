#!/bin/sh
# Dependencies: xclip

INTERFACE="$(ip tuntap show | cut -d : -f1 | head -n 1)"
IP="$(ip a s "${INTERFACE}" 2>/dev/null \
        | grep -o -P '(?<=inet )[0-9]{1,3}(\.[0-9]{1,3}){3}')"
CLICK="/usr/bin/bash -c 'echo -n ${IP} | /usr/bin/xclip -selection clipboard'"
COLOR_ACTIVE="#40DA00"
LABEL="<span foreground='${COLOR_ACTIVE}'>${IP}</span>"

if [ "${IP}" != "" ]; then
  printf "<icon>network-vpn-symbolic</icon>"
  printf "<txt>${LABEL}</txt>"
  printf "<txtclick>${CLICK}</txtclick>"
  printf "<tool>VPN IP - Click to copy</tool>"
else
  printf "<txt></txt>"
fi
