#!/bin/bash

# Check if an argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <output>"
    exit 1
fi

output=$1

# Get the list of workspaces for the specified output
workspaces_data=$(i3-msg -t get_workspaces | jq "[.[] | select(.output == \"$output\")]")

# Initialize the result string
result=""

# Determine loop range based on output
if [[ "$output" == "DP2-9" ]]; then
    start=1
    end=10
else
    start=11
    end=20
fi

# Loop through the determined range
for i in $(seq $start $end); do
    # Check if the workspace exists in the list
    workspace=$(echo "$workspaces_data" | jq -r ".[] | select(.num == $i)")

    if [[ -n "$workspace" ]]; then
        is_visible=$(echo "$workspace" | jq '.visible')
        is_focused=$(echo "$workspace" | jq '.focused')

        if [[ "$is_visible" == "true" && "$is_focused" == "true" ]]; then
            result+=" <fc=#AEDEA6>[$i]</fc> "
        else
            result+=" <fc=#1E90FF>$i</fc> "
        fi
    else
        # Display in grey if the workspace doesn't exist
        result+=" <fc=#B0B0B0>$i</fc> "
    fi
done

echo $result

