# Infrastructure

This directory contains infrastructure-as-code for provisioning ai-builder VMs.

## Files

- `ansible/inventory/hosts.example.ini` - Example inventory file for builder VMs
- `ansible/playbooks/bootstrap-builder.yml` - Main playbook to bootstrap builder VMs
- `ansible/roles/builder_base/tasks/main.yml` - Base tasks for builder VM setup
- `scripts/bootstrap-builder.sh` - Convenience script to run the bootstrap playbook

## Workflow

1. Create a fresh Ubuntu VM manually.
2. Enable SSH.
3. Add the VM to inventory (`infra/ansible/inventory/hosts.ini`).
4. Run `./bootstrap-builder.sh [target-host]`.
5. Confirm aider, gh, uv, git, and ansible are installed.

The bootstrap script is safe to run multiple times.
