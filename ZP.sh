#!/bin/bash

HOTSPOT_NAME="ZawaProxy"

setup_encrypted_dns() {
    echo "nameserver 1.1.1.1" | sudo su mobile -c "tee /etc/resolv.conf"
}

setup_hotspot() {
    echo "Setting up hotspot..."
    echo "ssid $HOTSPOT_NAME" | sudo su mobile -c "tee /var/preferences/SystemConfiguration/com.apple.wifi.plist"
    echo "EncryptionType None" | sudo su mobile -c "tee -a /var/preferences/SystemConfiguration/com.apple.wifi.plist"
    sudo killall CommCenter
    sleep 5
    echo "Hotspot $HOTSPOT_NAME is now active."
}

main() {
    setup_encrypted_dns
    setup_hotspot
}

main
