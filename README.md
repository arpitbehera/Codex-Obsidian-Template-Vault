# Codex Obsidian Template Vault

This repository is a template Obsidian vault for working with Codex agents.

It packages a vault root together with a portable runtime/instruction source under `My-Brain-Is-Full-Crew/`, so teammates can clone one folder, open it in Obsidian, and use Codex against a ready-made vault structure.

## What Is Included
- `AGENTS.md` at the vault root to route Codex behavior for this vault
- `.obsidian/` with shared vault defaults
- `My-Brain-Is-Full-Crew/` as the adapted agent and skill source

## Attribution
This vault adapts [`gnekt/My-Brain-Is-Full-Crew`](https://github.com/gnekt/My-Brain-Is-Full-Crew), originally built for Claude Code, for use with Codex in an Obsidian vault workflow.

## Setup
1. Clone this repository.
2. Open the repository folder as an Obsidian vault.
3. Use Codex from the vault root so it picks up `AGENTS.md`.
4. Keep user notes and content in the vault root, not inside `My-Brain-Is-Full-Crew/`, because that subtree is the runtime and instruction source.
5. Keep your own local workspace layout out of version control.

## Obsidian Config Policy
This repo includes shared `.obsidian` defaults that help the template open consistently across machines.

This repo does not track `.obsidian/workspace.json` or `.obsidian/workspace-mobile.json` because both files store personal window and pane state and create noisy diffs for collaborators.
