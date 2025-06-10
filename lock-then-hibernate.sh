#!/usr/bin/env bash

# Locking mechanism
i3lock -c 000000 &
lock_pid=$!
sleep 180

# Cleanup
if kill -0 "$lock_pid" 2>/dev/null; then
	kill "$lock_pid"
	wait "$lock_pid" 2>/dev/null
	systemctl hibernate
fi
