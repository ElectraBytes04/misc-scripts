#!/usr/bin/env bash

nmcli radio wifi on

nets=$(nmcli -f IN-USE,BSSID,SSID,MODE,CHAN,RATE,SIGNAL,SECURITY device wifi)
wifi=$(nmcli connection show --active | grep wifi)
ethe=$(nmcli connection show --active | grep ethernet)
blue=$(bluetoothctl devices Connected)

action=$(echo "WiFi\n$wifi\n$ethe\n$blue" | rofi -dmenu -p "Connections")

if [ "$action" = "WiFi" ]; then
	network=$(echo "$nets" | rofi -dmenu -p "WiFi (select to connect)" | awk '{print $2}')
	password=$(rofi -dmenu -p "Please enter network password (empty to omit)")

	nmcli device wifi connect "$network" password "$password"
fi
