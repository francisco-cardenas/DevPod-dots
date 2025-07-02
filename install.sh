#!/bin/bash
set -euo pipefail

echo "Running DevPod dotfiles install script..."

# --- Fix TERM for Ghostty ---
if [[ "$TERM" == "xterm-ghostty" ]]; then
    echo "Setting fallback TERM to xterm-256color"

    export TERM=xterm-256color

    # Apply to all shell types (login + non-login)
    echo 'export TERM=xterm-256color' >> ~/.bashrc
    echo 'export TERM=xterm-256color' >> ~/.profile
    echo 'export TERM=xterm-256color' >> ~/.bash_profile

    # Optional: make it system-wide (if allowed)
    if [ -w /etc/profile.d ]; then
        echo 'export TERM=xterm-256color' | sudo tee /etc/profile.d/fix-term.sh > /dev/null
        sudo chmod +x /etc/profile.d/fix-term.sh
    fi
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
