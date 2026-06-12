#!/usr/bin/env bash
set -euo pipefail

echo "Bootstrapping fresh Ubuntu host..."
echo "This installs minimum prerequisites, then runs bootstrap-builder.sh."

if ! command -v git >/dev/null 2>&1 || ! command -v ansible-playbook >/dev/null 2>&1; then
  echo "Installing git and ansible..."
  sudo apt update
  sudo apt install -y git ansible
else
  echo "git and ansible already installed."
fi

ASK_BECOME_PASS="${ASK_BECOME_PASS:-true}" ./infra/scripts/bootstrap-builder.sh

echo
echo "Host bootstrap complete."
echo "If 'aider' is not found, run:"
echo "  source ~/.bashrc"
echo "or log out and SSH back in."
