#!/usr/bin/env bash

if [ -d "$HOME/agent-platform" ] && [ ! -f "$HOME/.agent-platform-bootstrap-complete" ]; then
  echo
  echo "Agent Platform setup detected."
  echo
  echo "To finish bootstrapping this VM, run:"
  echo
  echo "  cd ~/agent-platform"
  echo "  ASK_BECOME_PASS=true ./infra/scripts/bootstrap-host.sh"
  echo
  echo "After successful bootstrap, this reminder will stop appearing."
  echo
fi
