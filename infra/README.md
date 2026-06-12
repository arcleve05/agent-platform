# Infrastructure

Infrastructure-as-code for building disposable Agent Platform VMs.

## Current Scope

This first layer provisions future `ai-builder` VMs.

The builder VM is used for:
- Aider-assisted development
- Git/GitHub work
- Ansible playbook development
- Platform bootstrap work

It does not install Open WebUI, LiteLLM, Docker, or control-plane services.

## Files

- `ansible/inventory/hosts.example.ini` — example inventory
- `ansible/playbooks/bootstrap-builder.yml` — builder bootstrap playbook
- `ansible/roles/builder_base/tasks/main.yml` — builder setup tasks
- `scripts/bootstrap-builder.sh` — wrapper script

## Workflow

1. Create a fresh Ubuntu VM manually.
2. Enable SSH.
3. Copy the example inventory:

   ```bash
   cp infra/ansible/inventory/hosts.example.ini infra/ansible/inventory/hosts.ini
