#!/usr/bin/env bash

for entry in $(\ls desktop_entries); do
    [[ $entry != "example.desktop" ]] && ln -sfv $(pwd)/desktop_entries/$entry $HOME/.local/share/applications/
done
