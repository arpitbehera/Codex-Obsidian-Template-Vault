# Claude Vault Setup Guide

This guide is for the Claude Code vault-install path.

If you are using Codex in the repo directly, start with `AGENTS.md` instead. Codex does not need the Claude installer.

## What You Need

### Required

- Obsidian
- Claude Code with a Claude Pro, Max, or Team subscription
- a local Obsidian vault
- Git

### Optional

- Gmail and Google Calendar via `gws`
- Hey.com via `hey`
- the Claude-hosted MCP sample if you want the read-only fallback described in `docs/mcp-portability.md`

## Install The Crew Into A Claude Vault

1. Clone the repo in or near your vault.

```bash
git clone https://github.com/gnekt/My-Brain-Is-Full-Crew.git
cd ./My-Brain-Is-Full-Crew
```

2. Run the Claude wrapper installer.

```bash
bash wrappers/claude/scripts/install.sh
```

The older command below still works, but it is now just a compatibility shim:

```bash
bash scripts/launchme.sh
```

3. Answer the install prompts:
- confirm the target vault path
- choose whether to copy the Claude MCP sample into the vault as `.mcp.json`

4. Open Claude Code inside the vault folder.

5. Say `Initialize my vault`.

The onboarding skill will collect your profile, preferred language, vault shape, and optional integrations.

## Resulting Vault Layout

After install, the target vault contains runtime copies for Claude:

```text
your-vault/
├── .claude/
│   ├── agents/
│   ├── skills/
│   ├── hooks/
│   ├── references/
│   └── settings.json
├── CLAUDE.md
├── .mcp.json          # only if you opted in
├── My-Brain-Is-Full-Crew/
└── ...your notes
```

## Updating A Claude Install

From the repo root, after pulling new repo changes:

```bash
git pull
bash wrappers/claude/scripts/update.sh
```

The older `bash scripts/updateme.sh` command still forwards to the wrapper updater.

## Troubleshooting

### Agents do not activate

Make sure Claude Code is open inside the vault directory, not just inside the repo directory. Verify that `.claude/agents/` and `.claude/skills/` exist in the vault.

### Email or calendar is not working

Prefer the local CLIs when possible:

- `gws` for Gmail and Google Calendar
- `hey` for Hey.com

If you installed `.mcp.json`, remember that it is a Claude-hosted sample and not a portable contract. See `docs/mcp-portability.md`.

### My runtime files are out of date

Run the wrapper updater again. It preserves custom agents and user-mutable reference content.

## Next Steps

- `docs/examples.md`
- `docs/mobile-access.md`
- `docs/gws-setup-guide.md`
- `CONTRIBUTING.md`
