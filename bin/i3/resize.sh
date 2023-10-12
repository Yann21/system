#!/bin/bash

# Get information about the current workspace and focused window
workspace_info=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).rect')
window_info=$(i3-msg -t get_tree | jq -r '.. | select(.focused? and .type?=="con") .rect')

# Extract necessary details
workspace_x=$(echo $workspace_info | jq '.x')
workspace_width=$(echo $workspace_info | jq '.width')
window_x=$(echo $window_info | jq '.x')
window_width=$(echo $window_info | jq '.width')

# Calculate effective center of the window
window_center=$((window_x + (window_width / 2)))

# Check if the effective center of the window is on the left or right side of the workspace's center
if (( window_center < workspace_x + workspace_width / 2 )); then
    # Effective center is on the left
    if [ "$1" == "left" ]; then
        # Shrink if 'Left' is pressed
        i3-msg resize shrink width 8 px or 8 ppt
    else
        # Grow if 'Right' is pressed
        i3-msg resize grow width 8 px or 8 ppt
    fi
else
    # Effective center is on the right
    if [ "$1" == "left" ]; then
        # Grow if 'Left' is pressed
        i3-msg resize grow width 8 px or 8 ppt
    else
        # Shrink if 'Right' is pressed
        i3-msg resize shrink width 8 px or 8 ppt
    fi
fi

