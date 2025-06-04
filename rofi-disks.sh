#!/usr/bin/env bash

echo "$(lsblk -o NAME,RM,SIZE,RO,TYPE,MOUNTPOINTS)" | rofi -dmenu -p "Disks"
