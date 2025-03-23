#!/bin/bash

BAT=$(acpi -b | grep -E -o '[0-9]{1,3}%')
STATUS=$(acpi -b | grep -o 'charging')

if [ "$STATUS" == "charging" ]; then
    echo "Charging: $BAT"
    echo "CHG: $BAT"
else
    echo "Battery: $BAT"
    echo "BAT: $BAT"
fi

# Set urgent flag below 5% or use orange below 20%
[ ${BAT%?} -le 5 ] && exit 33
[ ${BAT%?} -le 20 ] && echo "#FF8000"

exit 0