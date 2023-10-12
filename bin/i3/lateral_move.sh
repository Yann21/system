#!/bin/bash

# Expected argument: "left" or "right"
if [ "$#" -ne 1 ] || { [ "$1" != "left" ] && [ "$1" != "right" ]; }; then
    echo "Usage: $0 <left|right>"
    exit 1
fi

# Get currently focused workspace and output
workspace_data=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true)')

focused_workspace=$(echo "$workspace_data" | jq '.num')
focused_output=$(echo "$workspace_data" | jq -r '.output')

# Determine the next workspace based on direction
if [ "$1" == "left" ]; then
    target_workspace=$(( focused_workspace - 1 ))
else
    target_workspace=$(( focused_workspace + 1 ))
fi

# Switch to the target workspace on the same output
i3-msg workspace number $target_workspace

