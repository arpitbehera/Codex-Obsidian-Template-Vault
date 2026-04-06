# Template Vault GitHub Publish Design

## Goal

Publish the entire current folder as a public GitHub repository that teammates can clone and use as a Codex-oriented Obsidian template vault.

## Scope

- Initialize git at the current folder root if it is not already a repository.
- Add a root `README.md` that explains the vault's purpose and setup at a high level.
- Credit `gnekt/My-Brain-Is-Full-Crew` as the Claude Code project this vault adapts for Codex.
- Add a `.gitignore` policy for user-specific Obsidian state.
- Create the public GitHub repository from the current folder root.

## Repository Boundary

The repository root is the current folder:

- `AGENTS.md`
- `.obsidian/`
- `My-Brain-Is-Full-Crew/`
- new root `README.md`
- new root `.gitignore`

The repository should publish the whole current folder "as is", not only the `My-Brain-Is-Full-Crew/` subtree.

## .obsidian Policy

Commit shared vault defaults:

- `.obsidian/app.json`
- `.obsidian/appearance.json`
- `.obsidian/core-plugins.json`
- `.obsidian/graph.json`

Ignore user-specific state:

- `.obsidian/workspace.json`

Rationale: this keeps template-level Obsidian configuration while avoiding noisy personal layout diffs for collaborators.

## README Content

The root `README.md` should:

- describe the repo as a template Obsidian vault for integrating with Codex agents
- explain that `My-Brain-Is-Full-Crew/` is the instruction/runtime source adapted for Codex
- give brief setup steps for cloning and opening the vault
- explain the `.obsidian` inclusion policy
- include attribution to `gnekt/My-Brain-Is-Full-Crew`

## Publish Flow

1. Create root `README.md`.
2. Create root `.gitignore` with `.obsidian/workspace.json`.
3. Initialize git in the current folder.
4. Stage and commit the vault.
5. Ensure GitHub CLI authentication is valid.
6. Create a new public GitHub repository from this folder with `gh repo create`.
7. Push the initial commit.

## Constraints

- Do not modify protected wrapper files under `My-Brain-Is-Full-Crew/wrappers/claude/`.
- Keep path references portable and relative.
- Use the current folder as the git root.
- If GitHub authentication is invalid, require re-authentication before the publish step.

## Success Criteria

- A public GitHub repository exists for the current folder.
- The root contains a clear `README.md`.
- Credit to `gnekt/My-Brain-Is-Full-Crew` is present in the root README.
- `.obsidian/workspace.json` is excluded from version control.
- The committed repo contents can be shared with colleagues as a starting template.
