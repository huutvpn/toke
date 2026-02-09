#!/bin/bash
CONF=/etc/udp-zipvpn/udp.conf
DB=/etc/udp-zipvpn/users.db

PORT=$(grep PORT $CONF | cut -d= -f2)
iptables -I INPUT -p udp --dport $PORT -j ACCEPT

while true; do
 nc -u -l -p $PORT | while read data; do
  USER=$(echo $data | cut -d: -f1)
  PASS=$(echo $data | cut -d: -f2)
  if grep -q "^$USER:$PASS" $DB; then
    echo OK
  else
    echo DENY
  fi
 done
done
