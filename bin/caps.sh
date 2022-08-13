#!/bin/bash
# Toggle layout switching with caps
setxkbmap -query | grep options | grep 'grp:caps_toggle' > /dev/null
if [ $? -eq 0 ]; then
    setxkbmap -option -option 'grp:win_space_toggle'
else
    setxkbmap -layout us,ru -option 'grp:caps_toggle'
fi
