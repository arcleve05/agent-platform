# Infrastructure

Infrastructure-as-code for building disposable Agent Platform VMs.

## Fresh VM Workflow

1. Create a fresh Ubuntu VM manually.
2. Enable SSH.
3. Clone this repo:

```bash
git clone https://github.com/arcleve05/agent-platform.git
cd agent-platform
```

4. Copy inventory:

```bash
cp infra/ansible/inventory/hosts.example.ini infra/ansible/inventory/hosts.ini
```

5. Edit hosts.ini for local bootstrap:

```ini
[builder]
ai-builder-local ansible_host=127.0.0.1 ansible_connection=local

[all:vars]
ansible_python_interpreter=/usr/bin/python3
```

6. Run:

```bash
ASK_BECOME_PASS=true ./infra/scripts/bootstrap-host.sh
```

7. Reload shell if needed:

```bash
source ~/.bashrc
```
