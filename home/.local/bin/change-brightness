#!/usr/bin/env bash

morning="08"
evening="22"
hour=$(date +%H)
declare -i current_brightness=$(brightnessctl | awk 'NR == 2 { print $4 }' | sed 's/(//' | sed 's/%)//')

if [[ "$hour" == "$morning" ]] || [[ $current_brightness -le 10 ]]; then
    brightnessctl s 50% 1>/dev/null
elif [[ "$hour" == "$evening" ]] || [[ $current_brightness -ge 50 ]]; then
    brightnessctl s 0% 1>/dev/null
fi
