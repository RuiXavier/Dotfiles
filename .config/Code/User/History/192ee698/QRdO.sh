#!/bin/bash

# Get the current brightness value
current_brightness=$(brightnessctl g)

# Get the maximum brightness value
max_brightness=$(brightnessctl m)

# Calculate the brightness percentage
brightness_percentage=$((current_brightness * 100 / max_brightness))

# Echo the brightness percentage
echo "󰖨: ${brightness_percentage}%"

if 

exit 0