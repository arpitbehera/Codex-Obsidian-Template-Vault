# Template Vault GitHub Publish Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Publish the current folder as a public GitHub repository with a clear root README, portable vault metadata, and an Obsidian config policy suitable for sharing with colleagues.

**Architecture:** Treat the current folder as the repository root and keep the existing `My-Brain-Is-Full-Crew/` subtree intact as the runtime/instruction source. Add only two root-level repo files (`README.md` and `.gitignore`), initialize git locally, and publish through GitHub CLI after authentication is valid.

**Tech Stack:** Markdown, Git, GitHub CLI, Obsidian vault metadata

---

## File Structure

- Create: `README.md`
- Create: `.gitignore`
- Create: `docs/superpowers/plans/2026-04-06-template-vault-github-publish.md`
- Verify only: `.obsidian/app.json`
- Verify only: `.obsidian/appearance.json`
- Verify only: `.obsidian/core-plugins.json`
- Verify only: `.obsidian/graph.json`
- Ignore from git: `.obsidian/workspace.json`

### Task 1: Add Repository Metadata Files

**Files:**
- Create: `README.md`
- Create: `.gitignore`
- Verify: `AGENTS.md`

- [ ] **Step 1: Write the root README**

Create `README.md` with:

```markdown
# Codex Obsidian Template Vault

This repository is a template Obsidian vault for working with Codex agents.

It packages a vault root together with a portable runtime/instruction source under `My-Brain-Is-Full-Crew/`, so teammates can clone one folder, open it in Obsidian, and use Codex against a ready-made vault structure.

## What Is Included

- `AGENTS.md` at the vault root to route Codex behavior for this vault
- `.obsidian/` with shared vault defaults
- `My-Brain-Is-Full-Crew/` as the adapted agent and skill source

## Attribution

This vault adapts `gnekt/My-Brain-Is-Full-Crew`, originally built for Claude Code, for use with Codex in an Obsidian vault workflow.

## Setup

1. Clone this repository.
2. Open the repository folder as an Obsidian vault.
3. Use Codex from the vault root so it picks up `AGENTS.md`.
4. Keep your own local workspace layout out of version control.

## Obsidian Config Policy

This repo includes shared `.obsidian` defaults that help the template open consistently across machines.

This repo does not track `.obsidian/workspace.json` because that file stores personal window and pane state and creates noisy diffs for collaborators.
```

- [ ] **Step 2: Write the root gitignore**

Create `.gitignore` with:

```gitignore
.obsidian/workspace.json
```

- [ ] **Step 3: Verify the new files exist**

Run: `Get-ChildItem README.md, .gitignore`

Expected: both files are listed from the current folder root.

- [ ] **Step 4: Commit the metadata files**

Run:

```bash
git add README.md .gitignore
git commit -m "docs: add root repository metadata"
```

Expected: a commit is created after git has been initialized in Task 2.

### Task 2: Initialize the Local Repository

**Files:**
- Modify: local git metadata in `.git/`
- Verify: `.obsidian/app.json`
- Verify: `.obsidian/appearance.json`
- Verify: `.obsidian/core-plugins.json`
- Verify: `.obsidian/graph.json`

- [ ] **Step 1: Initialize git at the current folder root**

Run: `git init`

Expected: git reports an initialized repository in the current folder.

- [ ] **Step 2: Verify ignored Obsidian state before staging**

Run:

```bash
git check-ignore -v .obsidian/workspace.json
```

Expected: output shows `.gitignore` as the source of the ignore rule for `.obsidian/workspace.json`.

- [ ] **Step 3: Stage the repository contents**

Run:

```bash
git add AGENTS.md README.md .gitignore .obsidian My-Brain-Is-Full-Crew docs
```

Expected: shared vault files are staged, but `.obsidian/workspace.json` is not staged.

- [ ] **Step 4: Verify staging matches the intended policy**

Run:

```bash
git status --short
```

Expected: staged files include `AGENTS.md`, `README.md`, `.gitignore`, shared `.obsidian/*.json`, `My-Brain-Is-Full-Crew/...`, and `docs/...`; `.obsidian/workspace.json` is absent.

- [ ] **Step 5: Create the initial commit**

Run:

```bash
git commit -m "feat: add codex obsidian template vault"
```

Expected: the initial repository commit is created successfully.

### Task 3: Authenticate and Publish to GitHub

**Files:**
- Modify: local git config / remote metadata
- Verify: published GitHub repository

- [ ] **Step 1: Check GitHub CLI authentication**

Run: `gh auth status`

Expected: if authentication is invalid, stop and re-authenticate before publishing.

- [ ] **Step 2: Re-authenticate if needed**

Run:

```bash
gh auth login -h github.com
```

Expected: GitHub CLI completes login for the target account and `gh auth status` passes afterward.

- [ ] **Step 3: Create the public repository from the current folder**

Run:

```bash
gh repo create --public --source . --remote origin --push
```

Expected: GitHub CLI creates a new public repository, adds `origin`, and pushes the current branch.

- [ ] **Step 4: Verify the remote repository**

Run:

```bash
git remote -v
gh repo view --web
```

Expected: `origin` points to the new GitHub repo and the repository page opens successfully.

- [ ] **Step 5: Record the final publish state**

Run:

```bash
git status --short
```

Expected: working tree is clean or contains only intentional post-publish local-only changes.
