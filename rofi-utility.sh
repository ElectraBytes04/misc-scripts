#!/usr/bin/env bash

menu=$(\
	echo "Containers\nConnection\nSound\nFilesystem\nDisks" \
	| rofi -dmenu -p "Utilities"\
)

if [ "$menu" = "Containers" ]; then
	. $HOME/.local/bin/misc-scripts/rofi-podman.sh
elif [ "$menu" = "Connection" ]; then
	. $HOME/.local/bin/misc-scripts/rofi-connection.sh
elif [ "$menu" = "Sound" ]; then
	. $HOME/.local/bin/misc-scripts/rofi-sound.sh
elif [ "$menu" = "Filesystem" ]; then
	. $HOME/.local/bin/misc-scripts/rofi-fs.sh
elif [ "$menu" = "Disks" ]; then
	. $HOME/.local/bin/misc-scripts/rofi-disks.sh
fi
