#!/bin/bash
set -euo pipefail

echo "Running DevPod dotfiles install script..."

# --- Fix TERM for Ghostty ---
echo "  Setting fallback TERM to xterm-256color"
export TERM=xterm-256color

# Apply to bash sessions going forward
echo 'export TERM=xterm-256color' >> ~/.bashrc
echo 'export TERM=xterm-256color' >> ~/.profile

# --- Install Vim ---
#echo "Installing vim..."
#if command -v apt &>/dev/null; then
#    sudo apt-get update -y
#    sudo apt-get install -y vim
#elif command -v dnf &>/dev/null; then
#    sudo dnf install -y vim
#else
#    echo "No supported package manager found. Skipping vim install."
#fi

echo "Devpod Successfully setup!"
