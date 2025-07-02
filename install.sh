#!/bin/bash
set -euo pipefail

echo "Running DevPod dotfiles install script..."

# --- Fix TERM issue from ghostty ---
if [[ "$TERM" == "xterm-ghostty" ]]; then
    echo "Fixing TERM for ghostty..."
    export TERM=xterm-256color
    echo 'export TERM=xterm-256color' >> ~/.bashrc
fi

# --- Install Vim ---
echo "Installing vim..."
if command -v apt &>/dev/null; then
    sudo apt-get update -y
    sudo apt-get install -y vim
elif command -v dnf &>/dev/null; then
    sudo dnf install -y vim
else
    echo "No supported package manager found. Skipping vim install."
fi


echo "Devpod Successfully setup!"
