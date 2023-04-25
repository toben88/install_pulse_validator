#!/bin/bash

# Open three new terminal windows and execute the specified commands in each

# Open the first terminal window and execute the first command
gnome-terminal --tab --title="Install" -- bash -c "git clone https://github.com/toben88/install_pulse_validator && cd install_pulse_validator && chmod +x setup_pulse_node.sh && sudo ./setup_pulse_node.sh; exec bash; exec bash"

# Open the 2nd terminal window and execute df -h
gnome-terminal --tab --title="DiskUsage" -- bash -c "watch df -H; exec bash"

# Open the 3rd terminal window and execute the second command
gnome-terminal --tab --title="Instructions" -- bash -c "echo "wait for everything to stop and then type in exit 3 times to continue"; exec bash"


