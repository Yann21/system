#!/usr/bin/env bash
# Yann Hoffmann
# Equivalent of xinit for startup programs
# or $XDG_CONFIG_HOME/autostart/*.desktop

autorandr -c --debug &
#redshift -c "$HOME/.config/redshift/redshift.conf" &  # Go easy on the eyes
autokey-gtk &					    # Autokey
copyq &                                             # Clipboard manager
numlockx on &                                       # Numlock (previously in lightdm.conf)
mousetrap -t 5 &                                    # Auto hide mouse after 5s
ulauncher --hide-window --no-window-shadow &        # Dynamic menu
#GTK_USE_PORTAL=1 firefox &                          # Firefox
firefox &                          # Firefox
xrdb ~/.Xresources &
emacs --daemon &
emacs &                      # The one and only
thunderbird &                                        # Mail client
nextcloud --background &                            # Virtualization
#python3 /opt/thefanclub/overgrive/overgrive &
xscreensaver --no-splash &                 # Aerial screensaver
#xss-lock -- "$HOME/system/scripts/lock.sh" &
ckb-next -b &                                       # Corsair bindings
#code --disable-workspace-trust &
/opt/activitywatch/aw-server/aw-server &
/opt/activitywatch/aw-watcher-afk/aw-watcher-afk &
/opt/activitywatch/aw-watcher-window/aw-watcher-window &
xbindkeys &

"$HOME/.pyenv/shims/selfspy" -p "" -d "$HOME" &
feh --bg-center ~/Documents/Media/wallpapers/drool-l.svg & # Wallpaper
xset r rate 190 20 &

if [[ $(hostname) =~ "yann-laptop" ]]; then
    powerkit &
fi

if [[ $(hostname) =~ "yann-desktop" ]]; then
    udiskie &                                           # USB daemon
    bluetooth-autoconnect & 
    vorta --daemonize &                                 # Backup
fi

xset r rate 190 20 &
