#!/bin/bash
# Toggle Touchpad
TOUCHPAD_ID=$(/usr/bin/xinput list | /usr/bin/grep Touchpad | /usr/bin/awk -F'id=' '{print $2}' | /usr/bin/awk '{print $1}')
/usr/bin/xinput list --long $TOUCHPAD_ID | /usr/bin/grep 'This device is disabled' > /dev/null
if [ $? -eq 0 ]; then
/usr/bin/xinput --enable $TOUCHPAD_ID
else
/usr/bin/xinput --disable $TOUCHPAD_ID
fi
