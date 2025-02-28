#!/bin/bash

# Create a new tmux session named 'logs'
tmux new-session -d -s logs

# Split the window horizontally
tmux split-window -v -t logs

# Select the first pane and split it vertically
tmux split-window -v -t logs:0.0

# Select the second pane and split it vertically
tmux split-window -h -t logs:0.1

# Evenly distribute the pane sizes
tmux select-layout -t logs tiled

# Send the commands to the respective panes
tmux send-keys -t logs:0.0 'sudo docker logs -f execution' Enter
tmux send-keys -t logs:0.1 'sudo docker logs -f validator' Enter
tmux send-keys -t logs:0.2 'sudo docker logs -f beacon' Enter
tmux send-keys -t logs:0.3 'sudo df -H && echo "If successful all 3 other panels should show activity. To change panels just type <CTRL B> and press the arrow in the direction you want to change panels. Wait until everything is fully synced to upload your .json file to the pulsechain validator website to become a validator. When everything is fully synced (This can be 24-48 hours) go to https://launchpad.v4.testnet.pulsechain.com/ and follow the instructions to deposit 32M Pulse. To move to differant windows hit <CTRL> B then the arrow key for the window you want to switch to. To exit this screen hit <CTRL-C> to stop each log viewer and type exit to close each pane until the green bar is gone. ' Enter

# Select the first pane (0.0)
tmux select-pane -t logs:0.0

# Attach to the tmux session
tmux attach-session -t logs:0.0
