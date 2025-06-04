#!/usr/bin/env bash

vol_menu()
{
	vol="$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}') VOL"
	mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

	[ "$mute" = "yes" ] && vol="(muted)"

	action=$(echo "\nInc [+] Volume\nDec [-] Volume\nToggle Mute State" \
		| rofi -dmenu -p "$vol"
	)

	if [ "$action" = "Inc [+] Volume" ]; then
		pactl set-sink-volume @DEFAULT_SINK@ "+10%"
		vol_menu
	elif [ "$action" = "Dec [-] Volume" ]; then
		pactl set-sink-volume @DEFAULT_SINK@ "-10%"
		vol_menu
	elif [ "$action" = "Toggle Mute State" ]; then
		pactl set-sink-mute @DEFAULT_SINK@ toggle
		vol_menu
	else
		[ -z "$action" ] && exit
		[ "$action" != *"%" ] && action="$action%"
		echo $action
		pactl set-sink-volume @DEFAULT_SINK@ "$action"
		vol_menu
	fi
}

vol_menu
