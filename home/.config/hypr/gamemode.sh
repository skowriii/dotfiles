#!/usr/bin/env sh

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR == 1 { print $2 }')
HYPRPWALLPID=$(pgrep -f -l "pwall" | grep bash | awk '{ print $1 }' 2>/dev/null)
HYPRTMPFILE="/tmp/hyprgamemode.tmp"
HYPRPWALLUSED=$(cat $HYPRTMPFILE 2>/dev/null) || 0
HYPRPWALLUSED=$(($HYPRPWALLUSED))

if [[ "$HYPRGAMEMODE" = "true" ]]; then
    while kill -TERM $HYPRPWALLPID; do
        awww kill

        echo 1 > $HYPRTMPFILE
    done

    hyprctl --batch "\
        eval hl.config({ animations = { enabled = false } });\
        eval hl.config({ decoration = { shadow = { enabled = false } } });\
        eval hl.config({ decoration = { blur = { enabled = false } } });\
        eval hl.config({ decoration = { fullscreen_opacity = 1 } });\
        eval hl.config({ general = { gaps_in = 0 } });\
        eval hl.config({ general = { gaps_out = 0 } });\
        eval hl.config({ general = { border_size = 1 } });\
        eval hl.config({ decoration = { rounding = 0 } })"
    hyprctl notify 1 5000 "rgb(40a02b)" "Gamemode [ON]"

    exit 0
else
    if [[ $HYPRPWALLUSED -eq 1 ]]; then
        waypaper --restore

        pwall &
        disown $!

        rm $HYPRTMPFILE
    fi

    hyprctl notify 1 5000 "rgb(d20f39)" "Gamemode [OFF]"
    hyprctl reload

    exit 0
fi

exit 1
