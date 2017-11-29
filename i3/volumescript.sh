#!/bin/bash
pkill --signal RTMIN+10 i3blocks
if [ $1 = 'up' ]; then
  amixer -q sset Master,0 1%+ unmute
  killall -USR1 i3status
  VOLUME=$(amixer get Master | grep % | head -n 1 | awk '{print $5}')
  notify-send -t 500 "$VOLUME"
fi
if [ $1 = 'down' ]; then
  amixer -q sset Master,0 1%- unmute
  killall -USR1 i3status
  VOLUME=$(amixer get Master | grep % | head -n 1 | awk '{print $5}')
  notify-send -t 500 "$VOLUME"
fi
