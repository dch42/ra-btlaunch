# retroarch-btlaunch
Shell script to automatically launch RetroArch when DualSense Wireless Controller connects on MacOS. 

## Setup 🔧

Clone the repo and change to directory:

~~~
git clone https://github.com/dch42/ra-btlaunch.git && cd ra-btlaunch
~~~

Add exec permissions and run `setup.sh`:

~~~
chmod +x ./setup.sh && ./setup.sh
~~~

*Note: when running setup.sh, working directory must contain both `setup.sh` and `launch_ra.sh`.*

## How It Works

`setup.sh` will generate a plist file that is moved to LaunchAgents and subsquently loaded with launchctl. The plist file watches for changes in bluetooth devices, and runs `launch_ra.sh`.

`launch_ra.sh` parses bluetooth device data with awk, and launches RetroArch when a DualSense controller is connected.
