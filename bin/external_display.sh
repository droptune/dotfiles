#!/bin/bash
# based on https://faq.i3wm.org/question/5312/how-to-toggle-onoff-external-and-internal-monitors.1.html
STATE_FILE=~/.config/monitor_mode
EXTERNAL_OUTPUT=$(xrandr | grep -v primary | awk '/ connected /{print $1}')
INTERNAL_OUTPUT=$(xrandr | awk '/ connected primary/{print $1}')

if [ -z $EXTERNAL_OUTPUT ]; then
  echo "No external display connected."
  exit 1
fi

exit 1
if [ ! -f "${STATE_FILE}" ]; then
  monitor_mode="all"
else
  monitor_mode=`cat "${STATE_FILE}"`
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
echo "${monitor_mode}" > "${STATE_FILE}"
