#!/bin/bash

# Create a new tmux session named 'val'
tmux new-session -d -s val

# Split the window vertically
tmux split-window -v -t val

# Select the 2ndt pane and split it horizontally
tmux split-window -h -t val:0.1

# Evenly distribute the pane sizes
#tmux select-layout -t val tiled

# Send the commands to the respective panes
tmux send-keys -t val:0.0 'git clone https://github.com/toben88/install_pulse_validator && cd install_pulse_validator && chmod +x setup_pulse_node.sh && sudo ./setup_pulse_node.sh; exec bash; exec bash' Enter
tmux send-keys -t val:0.1 'sudo df -h' Enter
tmux send-keys -t val:0.2 'echo "┌─────────────────────────────────────────────────────────┐" ; \
echo "│ On the left we are now installing 3 items for the       │" ; \
echo "│ Pulsechain testnet v4 validator                         │" ;  \ 
echo "│ 1. Execution client geth                                |" ;  \
echo "| 2. Beacon client lighhouse                              │" ;  \
echo "│ 3. Validator client                                     │" ;  \
echo "│                                                         │" ;  \
echo "│                                                         │" ;  \
echo "│ It is strongly recommended that you review the script   │" ;  \
echo "│ and understand its workings before proceeding.          │" ;  \
echo "└─────────────────────────────────────────────────────────┘" ' Enter


# Select the first pane (0.0)
tmux select-pane -t val:0.0

# Attach to the tmux session
tmux attach-session -t val:0.0

echo "If you installed everything you can now view the action by running the following command from your blochcain directory"
echo "default would be ./blockchain/log_viewer.sh" or 
echo "default would be ./blockchain/tmux_logviewer.sh" 
