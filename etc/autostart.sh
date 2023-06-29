#!/usr/bin/env bash
# Yann Hoffmann
# Equivalent of xinit for startup programs
# or $XDG_CONFIG_HOME/autostart/*.desktop

autorandr -c &
redshift -c "$HOME/.config/redshift/redshift.conf" &  # Go easy on the eyes
nitrogen --restore &                                # Wallpaper
python -m autokey.gtkui &                                        # Rebinds bash bindings all over the place
copyq &                                             # Clipboard manager
numlockx on &                                       # Numlock (previously in lightdm.conf)
xset r rate 190 20 &                                # Typematic delays - previously 190 28 / 8
mousetrap -t 5 &                                    # Auto hide mouse after 5s
ulauncher --hide-window --no-window-shadow &        # Dynamic menu
GTK_USE_PORTAL=1 firefox &                          # Firefox
ulauncher --hide-window --no-window-shadow &        # Dynamic menu
xrdb ~/.Xresources &
emacs --daemon &
emacs &                                             # The one and only
mailspring &                                        # Mail client
nextcloud --background &                            # Virtualization
autorandr -c &
nextcloud --background &
xscreensaver --no-splash -verbose &                 # Aerial screensaver
redshift -c "$HOME/.config/redshift/redshift.conf" &  # Go easy on the eyes
ckb-next -b &                                       # Corsair bindings
code --disable-workspace-trust &

# Synchronize important directories between machines
gitwatch -r origin -b main "$HOME/.local/share/calibre" &


if [[ $(hostname) =~ "yann-desktop" ]]; then
    udiskie &                                           # USB daemon
    aw-server &                                         # Windows and time tracker (*)
    bluetooth-autoconnect & 
    vorta --daemonize &                                 # Backup
fi

