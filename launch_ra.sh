#!/bin/sh

connection_test=$(system_profiler SPBluetoothDataType | \
awk '/DualSense Wireless Controller/{f=1}/Connected:/ && f{print $2; exit}')

[ $connection_test = "Yes" ] &&
printf "Wireless Controller Detected: Launching Retroarch..." &&
/Applications/RetroArch.app/Contents/MacOS/RetroArch