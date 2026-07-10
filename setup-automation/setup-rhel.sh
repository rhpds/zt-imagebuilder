#!/bin/bash

# Unregister and register the VM
dnf -y remove katello-ca-consumer-*
subscription-manager clean
subscription-manager register --activationkey=$ACTIVATION_KEY --org=$ORG_ID --force

# Enable cockpit functionality in showroom.
echo "[WebService]" > /etc/cockpit/cockpit.conf
echo "Origins = https://cockpit-${GUID}.${DOMAIN}" >> /etc/cockpit/cockpit.conf
echo "AllowUnencrypted = true" >> /etc/cockpit/cockpit.conf
systemctl enable --now cockpit.socket

dnf remove -y cockpit-composer
