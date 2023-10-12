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

# Move focus left or right, looping within the current workspace
if action == 'right':
    next_index = (current_index + 1) % len(windows)
else:  # action == 'left'
    next_index = (current_index - 1) % len(windows)

windows[next_index].command('focus')

