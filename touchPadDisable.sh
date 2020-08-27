#! /bin/bash

# enter this command into Settings >> Devices >> Keyboard Shortcuts, add a new, name, then...
# bash /home/rick/touchPadDisable.sh

read TouchPadDeviceId <<< $( xinput | sed -nre '/TouchPad|Touchpad/s/.*id=([0-9]*).*/\1/p' ) 

state=$( xinput list-props "$TouchPadDeviceId" | grep "Device Enabled" | grep -o "[01]$" )

echo "TouchPadDeviceId = $TouchPadDeviceId"
echo "state = $state"

if [ "$state" -eq '1' ];then
    xinput --disable "$TouchPadDeviceId"
    zenity --info --text "Touchpad DISABLED" --timeout=2
    # Next line required only if using imwheel to fix slow scroll speed in Chrome, for ex; see here: 
    # https://askubuntu.com/a/991680/327339
    # imwheel -b "4 5"
else
    xinput --enable "$TouchPadDeviceId"
    zenity --info --text "Touchpad ENABLED" --timeout=2
    # Next line required only if using imwheel to fix slow scroll speed in Chrome, for ex; see here: 
    # https://askubuntu.com/a/991680/327339
    # killall imwheel
fi
