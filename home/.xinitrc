#!/bin/bash
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
[ -f "$HOME/.xprofile" ] && source "$HOME/.xprofile"
