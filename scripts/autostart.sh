#!/usr/bin/env bash
# Yann Hoffmann
# Equivalent of xinit for startup programs
# or $XDG_CONFIG_HOME/autostart/*.desktop

autorandr -c --debug &
redshift -c "$HOME/.config/redshift/redshift.conf" &  # Go easy on the eyes
python -m autokey.gtkui &                                        # Rebinds bash bindings all over the place
copyq &                                             # Clipboard manager
numlockx on &                                       # Numlock (previously in lightdm.conf)
xset r rate 190 20 &                                # Typematic delays - previously 190 28 / 8
mousetrap -t 5 &                                    # Auto hide mouse after 5s
ulauncher --hide-window --no-window-shadow &        # Dynamic menu
GTK_USE_PORTAL=1 firefox &                          # Firefox
xrdb ~/.Xresources &
emacs --daemon &
emacs &                      # The one and only
mailspring &                                        # Mail client
nextcloud --background &                            # Virtualization
python3 /opt/thefanclub/overgrive/overgrive &
xscreensaver --no-splash &                 # Aerial screensaver
#xss-lock -- "$HOME/system/scripts/lock.sh" &
#xset s 5 &
ckb-next -b &                                       # Corsair bindings
code --disable-workspace-trust &

nitrogen --restore &                                # Wallpaper

if [[ $(hostname) =~ "yann-desktop" ]]; then
    udiskie &                                           # USB daemon
    aw-server &                                         # Windows and time tracker (*)
    bluetooth-autoconnect & 
    vorta --daemonize &                                 # Backup
fi

