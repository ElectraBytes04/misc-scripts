#!/usr/bin/env bash

pods=$(\
	echo "$(podman ps -a --format \
	'table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Image}}')" \
	| rofi -dmenu -p "Podman"\
)

pod_name=$(echo $pods | awk '{print $2}')
pod_status=$(echo $pods | awk '{print $3}')
echo $pod_name
echo $pod_status

# Per-container start options
if [ "$pod_name" = "debian-main" ]; then
	wezterm start -- podman start -ia $pod_name
elif [ "$pod_name" = "electrabytes04.dev" ]; then
	podman start $pod_name
fi

if [ "$pod_status" = "Up" ]; then
	podman stop $pod_name
fi
