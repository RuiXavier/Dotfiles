#!/bin/bash

# Define a file to store the toggle state
toggle_file="/tmp/brightness_toggle"

# Check if the toggle file exists, if not, create it with the default state
if [[ ! -f "$toggle_file" ]]; then
    echo "percentage" > "$toggle_file"
fi

# Read the current toggle state
toggle_state=$(cat "$toggle_file")

# Get the current brightness value
current_brightness=$(brightnessctl g)

# Get the maximum brightness value
max_brightness=$(brightnessctl m)

if [[ "$BLOCK_BUTTON" == "1" ]]; then
    # Toggle the state on click
    if [[ "$toggle_state" == "percentage" ]]; then
        echo "raw" > "$toggle_file"
    else
        echo "percentage" > "$toggle_file"
    fi
fi

# Update the toggle state after a click
toggle_state=$(cat "$toggle_file")

# Display the appropriate value based on the toggle state
if [[ "$toggle_state" == "percentage" ]]; then
    # Calculate the brightness percentage
    brightness_percentage=$((current_brightness * 100 / max_brightness))
    echo "󰖨: ${brightness_percentage}%"
else
    echo "󰖨: ${current_brightness}"
fi

exit 0