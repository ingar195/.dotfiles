if [[ -f /sys/class/power_supply/BAT0/current_now ]] && [[ -f /sys/class/power_supply/BAT0/voltage_now ]]; then
  current_now=$(cat /sys/class/power_supply/BAT0/current_now)
  voltage_now=$(cat /sys/class/power_supply/BAT0/voltage_now)
  watage_now=$(echo "$current_now * $voltage_now / 1000000000000" | bc)
else
  echo $watage_now W
fi

