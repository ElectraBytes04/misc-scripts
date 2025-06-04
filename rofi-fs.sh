#!/usr/bin/env bash

echo "$(df -h)" | rofi -dmenu -p "Filesystem"
