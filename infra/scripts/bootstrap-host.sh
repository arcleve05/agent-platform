#!/usr/bin/env bash
set -euo pipefail

INVENTORY="infra/ansible/inventory/hosts.ini"
EXAMPLE_INVENTORY="infra/ansible/inventory/hosts.example.ini"

echo "Bootstrapping fresh Ubuntu host..."
echo "This installs minimum prerequisites, then runs bootstrap-builder.sh."

if ! command -v git >/dev/null 2>&1 || ! command -v ansible-playbook >/dev/null 2>&1; then
  echo "Installing git and ansible..."
  sudo apt update
  sudo apt install -y git ansible
else
  echo "git and ansible already installed."
fi

if [ ! -f "$INVENTORY" ]; then
  echo "No hosts.ini found. Creating local inventory for this VM..."
  HOSTNAME_VALUE="$(hostname)"
  cat > "$INVENTORY" <<INVENTORY_EOF
[builder]
${HOSTNAME_VALUE} ansible_host=127.0.0.1 ansible_connection=local

[all:vars]
ansible_python_interpreter=/usr/bin/python3
INVENTORY_EOF
fi

ASK_BECOME_PASS="${ASK_BECOME_PASS:-true}" ./infra/scripts/bootstrap-builder.sh


if ! git config --global user.email >/dev/null 2>&1; then
  echo
  echo "Git identity not configured."
  echo "Run:"
  echo 'git config --global user.name "Andrew Cleveland"'
  echo 'git config --global user.email "aross.cleveland@gmail.com"'
fi

echo
echo "Host bootstrap complete."
echo "If 'aider' is not found, run:"
echo "  source ~/.bashrc"
echo "or log out and SSH back in."

echo
echo "Optional next steps:"
echo "  git config --global user.name \"Andrew Cleveland\""
echo "  git config --global user.email \"aross.cleveland@gmail.com\""
echo "  gh auth login"

touch "$HOME/.agent-platform-bootstrap-complete"

touch "$HOME/.agent-platform-bootstrap-complete"
