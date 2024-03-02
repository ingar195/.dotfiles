current_now=$(cat /sys/class/power_supply/BAT0/current_now)
voltage_now=$(cat /sys/class/power_supply/BAT0/voltage_now)
watage_now=$(echo "$current_now * $voltage_now / 1000000000000" | bc)

if [[ $watage_now =~ ^[0-9]+$ ]]; then
  echo $watage_now W
else
  echo "AC"
fi


