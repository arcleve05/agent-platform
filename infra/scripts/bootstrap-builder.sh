#!/bin/bash

# This script bootstraps an ai-builder VM with required tools and dependencies.
# It assumes Ansible is installed locally and the target host is configured in inventory.

set -e

echo "Bootstrapping ai-builder VM..."
echo "================================"

# Check if ansible is installed
if ! command -v ansible &> /dev/null; then
    echo "Error: Ansible is not installed. Please install Ansible first."
    exit 1
fi

# Get target host from arguments or use default inventory
TARGET_HOST="${1:-all}"

echo "Target host: $TARGET_HOST"

# Run the bootstrap playbook
ansible-playbook infra/ansible/playbooks/bootstrap-builder.yml -i infra/ansible/inventory/hosts.ini -l "$TARGET_HOST"

echo "Bootstrap complete!"
echo ""
echo "Please verify the following tools are installed:"
echo "- aider"
echo "- gh"
echo "- uv"
echo "- git"
echo "- ansible"
