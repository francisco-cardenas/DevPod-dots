#!/bin/bash
set -euo pipefail

echo "Running DevPod dotfiles install script..."

# --- Fix TERM for Ghostty ---
#echo "  Setting fallback TERM to xterm-256color"
#export TERM=xterm-256color

# Apply to bash sessions going forward
#echo 'export TERM=xterm-256color' >> ~/.bashrc
#echo 'export TERM=xterm-256color' >> ~/.profile

# --- Install chezmoi & configure dotfile ---
if ! command -v chezmoi >/dev/null; then
    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:cardenas-sec/devpod-dotfiles.git
fi


echo "Devpod Successfully setup!"

exit 0
