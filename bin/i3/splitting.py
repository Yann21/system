import i3ipc
import subprocess


i3 = i3ipc.Connection()


def on_window(i3, event):
    subprocess.run(["notify-send", "window created"])
    i3.command("split horizontal")
    # Check if the container has a parent
    if event.container.parent:
        subprocess.run(["notify-send", "parent exists"])

        # If the parent is a vertical split container
        if event.container.parent.layout == "vertical":
            subprocess.run(["notify-send", "parent is vertical"])
            # Change the split direction to horizontal for subsequent splits
            i3.command("split horizontal")


# Subscribe to window events
i3.on("window::new", on_window)

# Start the main loop
i3.main()
