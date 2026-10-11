#!/usr/bin/env bash

change_to_highres()
{
	mv ~/.config/hypr/land/05-monitors/01-1280x720.lua ~/.config/hypr/land/05-monitors/S-1280x720.lua
	mv ~/.config/hypr/land/05-monitors/S-1920x1080.lua ~/.config/hypr/land/05-monitors/01-1920x1080.lua

	hyprctl reload
}

change_to_lowres()
{
	mv ~/.config/hypr/land/05-monitors/01-1920x1080.lua ~/.config/hypr/land/05-monitors/S-1920x1080.lua
	mv ~/.config/hypr/land/05-monitors/S-1280x720.lua ~/.config/hypr/land/05-monitors/01-1280x720.lua

	hyprctl reload
}

get_current_resolution()
{
	hyprctl monitors all | awk '{ print $1 }' | grep '[0-9].*x[0-9].*' | sed 's/@.*//' | awk 'NR == 1'
}

currentres=$(get_current_resolution)

if [ "$currentres" == "1920x1080" ]; then
	echo "lowres"
	change_to_lowres
else
	echo "highres"
	change_to_highres
fi
