#!/bin/bash
# based on https://faq.i3wm.org/question/5312/how-to-toggle-onoff-external-and-internal-monitors.1.html
EXTERNAL_OUTPUT=$(xrandr | grep -v primary | awk '/ connected /{print $1}')
INTERNAL_OUTPUT=$(xrandr | awk '/ connected primary/{print $1}')

if [ ! -f ~/tmp/monitor_mode.dat ]; then
  monitor_mode="all"
else
# if we don't have a file, start at zero
  monitor_mode=`cat ~/tmp/monitor_mode.dat`
fi


if [ $monitor_mode = "all" ]; then
        monitor_mode="EXTERNAL"
        xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto
elif [ $monitor_mode = "EXTERNAL" ]; then
        monitor_mode="INTERNAL"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --off
elif [ $monitor_mode = "INTERNAL" ]; then
        monitor_mode="CLONES"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT
else
        monitor_mode="all"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --left-of $INTERNAL_OUTPUT
fi
echo "Current mode is ${monitor_mode}"
echo "${monitor_mode}" > ~/tmp/monitor_mode.dat
