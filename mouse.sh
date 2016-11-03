#!/bin/bash
sleep 5
for Id in $(xinput --list | grep  "A4TECH USB" | grep -oE "id=[0-9]{1,2}" | grep -oE "[0-9]{1,2}")
do
if [ "$(xinput --list-props $Id | grep -oE "\"Button 0\"")" ]
then
buttonId=$Id
fi
done
sleep 5
xinput --disable $buttonId
sleep 5
tEvent=$(xinput --list-props $buttonId | grep -oE "event+[0-9]{1,3}")
evtest /dev/input/$tEvent | awk '/KEY_LEFTMETA), value 1/ {system("xdotool click --repeat 2 1")}'