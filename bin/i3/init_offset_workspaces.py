#!/usr/bin/python
#%%
import subprocess
import re


def get_monitors():
  # Execute xrandr and capture its output
  result = subprocess.run(["xrandr"], stdout=subprocess.PIPE)
  output = result.stdout.decode()

  # Regular expression to parse monitor details
  regex = r"(.+) connected (primary )?(\d+)x(\d+)\+(\d+)\+(\d+)"

  # Find all matches and store them in a list
  matches = re.findall(regex, output)

  # Process matches to extract monitor names and positions
  monitors = []
  for match in matches:
    name, _, width, height, x_pos, y_pos = match
    monitors.append((name, int(x_pos), int(y_pos), int(width), int(height)))

  # Sort monitors based on their X position
  monitors.sort(key=lambda monitor: monitor[1])

  return monitors


def main():
  monitors = get_monitors()

  # Assign workspaces to monitors based on sorted order
  workspace_number = 1
  for monitor in monitors:
    name, x_pos, y_pos, width, height = monitor
    print(f"Assigning workspace {workspace_number} to monitor {name}")
    # Replace 'print' with the actual i3-msg command in practice
    subprocess.run(
      ["i3-msg", f"workspace {workspace_number}; move workspace to output {name}"]
    )
    workspace_number += 10


if __name__ == "__main__":
  main()
