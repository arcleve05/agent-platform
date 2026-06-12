#!/usr/bin/env bash
set -euo pipefail

INVENTORY="infra/ansible/inventory/hosts.ini"
PLAYBOOK="infra/ansible/playbooks/bootstrap-builder.yml"
TARGET_HOST="${1:-all}"
ASK_BECOME_PASS="${ASK_BECOME_PASS:-false}"

echo "Bootstrapping ai-builder VM..."
echo "Target host: ${TARGET_HOST}"

if ! command -v ansible-playbook >/dev/null 2>&1; then
  echo "Error: ansible-playbook is not installed on this machine."
  exit 1
fi

if [ ! -f "$INVENTORY" ]; then
  echo "Error: inventory file not found: $INVENTORY"
  echo "Create it from: infra/ansible/inventory/hosts.example.ini"
  exit 1
fi

EXTRA_ARGS=()
if [ "$ASK_BECOME_PASS" = "true" ]; then
  EXTRA_ARGS+=(--ask-become-pass)
fi

EXTRA_ARGS=()
if [ "$ASK_BECOME_PASS" = "true" ]; then
  EXTRA_ARGS+=(--ask-become-pass)
fi

ANSIBLE_ROLES_PATH=infra/ansible/roles ansible-playbook "$PLAYBOOK" -i "$INVENTORY" -l "$TARGET_HOST" "${EXTRA_ARGS[@]}" "${EXTRA_ARGS[@]}"

echo "Bootstrap complete."
