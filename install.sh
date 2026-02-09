#!/bin/bash
clear
echo "=== UDP-ZIPVPN INSTALLER (ROODYZAIN STYLE) ==="
read -p "Masukkan Domain VPS: " DOMAIN

apt update -y
apt install -y curl netcat zip unzip

mkdir -p /etc/udp-zipvpn
mkdir -p /usr/bin/udp-zipvpn

echo "$DOMAIN" > /etc/udp-zipvpn/domain

cp udp-server.sh /etc/udp-zipvpn/
cp users.db udp.conf telegram.conf /etc/udp-zipvpn/
cp udp-zipvpn/* /usr/bin/udp-zipvpn/
cp systemd/udp-zipvpn.service /etc/systemd/system/

chmod +x /etc/udp-zipvpn/udp-server.sh
chmod +x /usr/bin/udp-zipvpn/*

ln -sf /usr/bin/udp-zipvpn/udp-menu /usr/bin/udp

systemctl daemon-reload
systemctl enable udp-zipvpn
systemctl restart udp-zipvpn

echo "INSTALL SELESAI"
echo "Jalankan menu dengan perintah: udp"
