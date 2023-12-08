#!/bin/bash

# Expected argument: target workspace number (1-10)
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <workspace_number>"
    exit 1
fi

# Determine the currently focused output
focused_output=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true) .output')

# Adjust the target workspace number based on the focused output
if [ "$focused_output" == "DVI-D-0" ]; then
    target_workspace=$(( $1 + 10 ))
elif [ "$focused_output" == "DP2-8-1" ]; then
    target_workspace=$(( $1 + 10 ))

elif [ "$focused_output" == "DP-5" ]; then
    target_workspace=$(( $1 + 20 ))

elif [ "$focused_output" == "DP2-9-1" ]; then
    target_workspace=$1
elif [ "$focused_output" == "HDMI-0" ]; then
    target_workspace=$1

else
    target_workspace=$1
fi

# Switch to the target workspace
i3-msg workspace number $target_workspace

