#!/usr/bin/env bash
set -e

echo "Validating builder environment..."
echo

check() {
  local name="$1"
  local cmd="$2"

  if eval "$cmd" >/dev/null 2>&1; then
    echo "[PASS] $name"
  else
    echo "[FAIL] $name"
    FAILED=1
  fi
}

FAILED=0

check "Git" "git --version"
check "GitHub CLI" "gh --version"
check "Ansible" "ansible --version"
check "UV" "uv --version || ~/.local/bin/uv --version"
check "Aider" "aider --version || ~/.local/bin/aider --version"

echo

if [ "$FAILED" -eq 0 ]; then
  echo "Builder Validation Passed"
else
  echo "Builder Validation Failed"
  exit 1
fi
