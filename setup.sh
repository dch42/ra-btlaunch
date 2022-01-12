#!/bin/sh

launch_path="/Library/LaunchAgents/com.$USER.controller.launch.RA.plist"

function print_border {
    local string=$1
    declare -i len
    len=${#string}
    len+=4
    printf "%0.s=" $(seq 1 $len)
    printf "\n"
    printf "| \033[01m$string\e[0m |\n"
    printf "%0.s=" $(seq 1 $len)
    printf "\n"
}

print_border "Controller Launch for RetroArch"

[ -f $launch_path ] && printf "\nFile ($launch_path) already exists. Exiting...\n" && exit 0

# create plist 
printf "\nGenerating bluetooth listener...\n\n"
echo "<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
        <string>com.$USER.controller.launch.RA</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/sh</string>
        <string>$PWD/launch_ra.sh</string>
    </array>
        <key>WatchPaths</key>
    <array>
        <string>/Library/Preferences/com.apple.Bluetooth.plist</string>
    </array>
</dict>
</plist>" > com.$USER.controller.launch.RA.plist &&
printf "\n[SUCCESS]\n ==> file generated\n\n"
printf "Moving file to LaunchAgents,\
you may be asked to enter your password.\n" &&
sudo mv com.$USER.controller.launch.RA.plist /Library/LaunchAgents/ &&
printf "\n[SUCCESS]\n ==> $launch_path\n\n" || printf "[ERROR] Could not move plist file.\n" && exit 1

launchctl load $launch_path &&
printf "[SUCCESS]\n ==> plist file successfullly loaded\n\n" || printf "[ERROR] launchctl could not load plist file.\n" &&
exit 1

exit 0