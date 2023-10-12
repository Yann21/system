#!/usr/bin/env python3

import i3ipc
import sys

action = sys.argv[1]  # either 'left' or 'right'

i3 = i3ipc.Connection()
tree = i3.get_tree()
focused = tree.find_focused()

if not focused:
    sys.exit(1)

# Get the current workspace
current_workspace = focused.workspace()

# Get all the windows in the current workspace
windows = current_workspace.leaves()

# Find the currently focused window's index
current_index = windows.index(focused)

# Determine the target position
if action == 'right':
    target_index = (current_index + 1) % len(windows)
else:  # action == 'left'
    target_index = (current_index - 1) % len(windows)

# Move the container
if target_index > current_index:
    focused.command('move right')
elif target_index < current_index:
    focused.command('move left')

