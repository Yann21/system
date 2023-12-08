#!/usr/bin/env bash
# Initializes workspaces 1, 11, 21... on every monitor to replicate xmonad
# behavior of having a unique set of workspaces for each monitor.

#monitors=( $(xrandr | grep " connected" | cut -d ' ' -f1) )

## i3
#i=1
#for m in "${monitors[@]}"; do
    #i3-msg "workspace $i; move workspace to output $m"
    #((i+=10))
#done

# Create an associative array for monitor names and their X positions
declare -A monitor_positions

# Extract monitor names and positions
while IFS=' ' read -r monitor status res rest; do
    if [[ $status == "connected" ]]; then
        # Extract X position from resolution string (e.g., 1920x1080+0+0)
        x_pos=$(echo $res | grep -oP '\+\K\d+(?=\+\d+$)')
        monitor_positions[$monitor]=$x_pos
    fi
done < <(xrandr | grep -E ' connected')

# Sort monitors by X position
IFS=$'\n'
sorted_monitors=($(sort -n -k2 <<<"${!monitor_positions[*]}" "${monitor_positions[@]}"))
unset IFS

echo "${sorted_monitors[@]}"

# Assign workspaces based on sorted order
#i=1
#for monitor in "${sorted_monitors[@]}"; do
    #i3-msg "workspace ${i}; move workspace to output $monitor"
    #((i+=10))
#done

