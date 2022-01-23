#!/bin/bash
# You need DIALOG for this. (it's definetly in your repo)
# Done with my shitty brain and some other dude on the internet cos everything else sucks including arandr

cmd=(dialog --menu "Resolution" 0 0 0) # Here's the box itself, you can change its size by editing " 0 0 0 "

options=(1 "1600x900" # Resolutions that I use
         2 "1280x720" # You might want to change these
			3 "800x600")

choices=$("${cmd[@]}" "${options[@]}" 2>&1 > /dev/tty) # found this on stack exchange

for x in $choices
do
case $choices in
        1) xrandr --output LVDS1 --mode 1600x900;; # These too, these are the actual commands
        2) xrandr --output LVDS1 --mode 1280x720;;
        3) xrandr --output LVDS1 --mode 800x600;;
esac
done
clear
