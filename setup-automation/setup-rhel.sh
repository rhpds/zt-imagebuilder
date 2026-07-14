#!/bin/bash

# Install cockpit - this step is now in the lab content, but keep for automation
dnf install -y cockpit-composer

# Pre-create cockpit config before installation
mkdir -p /etc/cockpit
echo "[WebService]" > /etc/cockpit/cockpit.conf
echo "Origins = https://cockpit-${GUID}.${DOMAIN}" >> /etc/cockpit/cockpit.conf
echo "AllowUnencrypted = true" >> /etc/cockpit/cockpit.conf

# Enable and start cockpit service
systemctl enable --now cockpit.socket
