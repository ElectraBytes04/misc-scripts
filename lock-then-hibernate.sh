#!/usr/bin/env bash

sleep_interval=180 # Seconds

# Check if sound is being played:
check_sound_status()
{
	pactl list sinks | grep "RUNNING"
	return $?
	echo "ERR: Cannot read sound device status" >&2
	return 1
}

if ! check_sound_status; then
	# Locking mechanism
	i3lock -c 000000 &
	lock_pid=$!
	sleep "$sleep_interval"

	# Cleanup
	if kill -0 "$lock_pid" 2>/dev/null; then
		kill "$lock_pid"
		wait "$lock_pid" 2>/dev/null
		systemctl hibernate
	fi
fi
