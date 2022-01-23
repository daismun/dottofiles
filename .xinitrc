#!/bin/sh

DESKTOP_SESSION="bspwm"
USERXSESSION="$XDG_CACHE_HOME/X11/xsession"
USERXSESSIONRC="$XDG_CACHE_HOME/X11/xsessionrc"
ALTUSERXSESSION="$XDG_CACHE_HOME/X11/Xsession"
ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"
picom &
dunst &
mpd &
fehbg &
redshift -c $HOME/.config/redshift/redshift.conf &
xmodmap -e "keycode 135 = Super_R" &
sxhkd &
$HOME/.config/polybar/launch.sh &
exec bspwm
