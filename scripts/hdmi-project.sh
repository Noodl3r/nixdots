#!/usr/bin/env bash
set -euo pipefail

internal="eDP-1"
displays="$(xrandr --query)"
hdmi="$(awk '/^HDMI-[^ ]+ connected/ { print $1; exit }' <<< "$displays")"

if [[ -n "$hdmi" ]]; then
    # Mirror the laptop screen onto the connected HDMI display.
    xrandr --output "$internal" --auto --primary \
           --output "$hdmi" --auto --same-as "$internal"
    echo "Mirroring $internal to $hdmi"
else
    # HDMI was unplugged: disable HDMI outputs and keep the laptop screen on.
    while read -r output; do
        xrandr --output "$output" --off
    done < <(awk '/^HDMI-[^ ]+ disconnected/ { print $1 }' <<< "$displays")

    xrandr --output "$internal" --auto --primary
    echo "No HDMI display connected; using $internal only"
fi
