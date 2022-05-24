#!/bin/bash
set -euo pipefail
tmux split-window -v -p 30
tmux split-window -h -p 66
tmux split-window -h -p 50
