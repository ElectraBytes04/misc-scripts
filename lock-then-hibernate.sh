#!/usr/bin/env bash

# Check if sound is being played:
if [ -z "$(cat /proc/asound/card*/pcm*/sub*/status | grep RUNNING)" ]; then
	# Locking mechanism
	i3lock -c 000000 &
	lock_pid=$!
	sleep 180 
	if kill -0 "$lock_pid" 2>/dev/null; then
		kill "$lock_pid"
		wait "$lock_pid" 2>/dev/null
		systemctl hibernate
	fi
fi
