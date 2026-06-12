# Architecture

## Core Principles

- GitHub is the source of truth.
- VMs are disposable and rebuildable.
- Windows host stays clean and acts primarily as Hyper-V host and GPU provider.
- Open WebUI is for conversation and coordination.
- Aider is for editing code and building the platform.
- Humans approve major decisions, prompt changes, infrastructure changes, and merges.

## Main VM Roles

- ai-builder: coding and infrastructure automation workspace.
- ai-control: Open WebUI, LiteLLM, GitHub tooling, coordination services.
- ai-worker: disposable project build/test/deploy environments.
