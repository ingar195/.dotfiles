#!/bin/sh
# sleep 1

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done

# Launch bar1 and bar2
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    NIC=$(ip -br a | grep -oP 'enp\S+')
    MONITOR=$m NIC=$NIC polybar top & 
  done
else
  NIC=$NIC polybar top &
fi

 
#polybar bottom;

echo "Bars launched..."
