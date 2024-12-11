#!/bin/bash
 
# Prompt for the session name
read -p "Enter the tmux session name: " SESSION_NAME
 
# Create a new tmux session and start logging
tmux new-session -d -s $SESSION_NAME
 
# Enable logging for the initial window
tmux pipe-pane -t $SESSION_NAME:0.0 'cat >> ~/tmux-logs/tmux-session-'$SESSION_NAME'.log'
 
# Attach to the tmux session
tmux attach-session -t $SESSION_NAME
