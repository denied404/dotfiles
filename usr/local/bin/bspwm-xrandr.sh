#!/bin/bash

# Get out of town if something errors
set -e

# Get it work only if bspwm is running
if [[ $(ps -ef | awk '{print $NF}' | grep bspwm | wc -l) > 1 ]]; then
  DP1_STATUS=$(</sys/class/drm/card0/card0-DP-1/status )

  if [ "connected" == "$DP1_STATUS" ]; then  
    if [[ $(xrandr | grep "3840x2160x49.98" | wc -l) == 0 ]]; then
      /usr/bin/xrandr --newmode "3840x2160x49.98"  442.000000  3840 3888 3920 4000  2160 2163 2167 2211  +HSync -VSync
    fi
    /usr/bin/xrandr --addmode DP1 "3840x2160x49.98"
    /usr/bin/xrandr --output DP1 --above eDP1 --mode "3840x2160x49.98"
    /usr/bin/notify-send -t 6000 "Graphics Update" "DP plugged in"
  else  
    /usr/bin/xrandr --output DP1 --off
    /usr/bin/notify-send -t 6000 "Graphics Update" "External monitor disconnected"
    exit
  fi
fi
