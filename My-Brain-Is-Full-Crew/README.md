# My Brain Is Full - Crew

A portable Obsidian agent system for capture, filing, search, transcription, and email/calendar workflows.

The repo now ships in three layers:

- portable core: `AGENTS.md`, `agents/`, `skills/`, `references/`, `docs/`
- Claude wrapper: `wrappers/claude/`
- legacy compatibility shims: `scripts/launchme.sh`, `scripts/updateme.sh`

## What It Does

The Crew gives you:

- 8 core agents for reactive vault work such as capture, search, filing, structure, and maintenance
- 13 multi-step skills for guided workflows such as onboarding, inbox triage, vault audits, and meeting prep
- a natural-language interface so you ask for outcomes, not commands
- multilingual behavior so agents answer in the language you use

This is built for people who want to manage an Obsidian vault through conversation instead of manual file housekeeping.

## Runtime Tracks

### Codex

Use the repo in place.

1. Open the repo in Codex.
2. Let `AGENTS.md` route requests to the right skill or agent.
3. Store repo-local custom agents in `agents/custom/`.

Codex does not use the Claude hook runtime or the Claude-hosted MCP sample. See `docs/mcp-portability.md` before assuming any MCP integration is portable.

### Claude Code

Use the Claude wrapper to install runtime copies into your vault.

1. Clone this repo inside or next to your vault.
2. Run `bash wrappers/claude/scripts/install.sh`.
3. Open Claude Code inside the vault folder.
4. Say `Initialize my vault` to start onboarding.

If you are following older docs or videos, `bash scripts/launchme.sh` still works as a compatibility shim.

## The Crew

| Agent | Role |
|---|---|
| `architect` | vault structure, templates, and onboarding-related structure work |
| `scribe` | text capture and note creation |
| `sorter` | inbox filing and batch organization |
| `seeker` | vault search and synthesis |
| `connector` | link analysis and graph-strengthening |
| `librarian` | vault maintenance and quality checks |
| `transcriber` | audio, transcript, and meeting-note processing |
| `postman` | email and calendar workflows |

## Skills

Skills handle the longer conversational workflows that should stay in the main conversation context.

| Skill | Purpose |
|---|---|
| `onboarding` | guided vault setup |
| `create-agent` | design a custom agent |
| `manage-agent` | edit, remove, or list custom agents |
| `defrag` | structural vault defragmentation |
| `email-triage` | inbox scanning and prioritization |
| `meeting-prep` | meeting briefing |
| `weekly-agenda` | week overview |
| `deadline-radar` | deadline timeline |
| `transcribe` | recording and transcript processing |
| `vault-audit` | full vault audit |
| `deep-clean` | extended cleanup |
| `tag-garden` | tag analysis and cleanup |
| `inbox-triage` | inbox note routing |

Use natural-language requests. Root docs no longer require slash commands.

## Integrations

The Postman workflows can use:

- `gws` CLI for Gmail and Google Calendar
- `hey` CLI for Hey.com email
- the Claude-hosted MCP sample in `wrappers/claude/mcp.sample.json` as a Claude-only fallback

Read `docs/mcp-portability.md` before treating any MCP setup as cross-runtime.

## Project Structure

```text
./
├── AGENTS.md
├── agents/
│   ├── architect.md
│   ├── connector.md
│   ├── librarian.md
│   ├── postman.md
│   ├── scribe.md
│   ├── seeker.md
│   ├── sorter.md
│   ├── transcriber.md
│   └── custom/
├── skills/
├── references/
├── docs/
├── wrappers/
│   └── claude/
│       ├── CLAUDE.md
│       ├── hooks/
│       ├── plugin/
│       ├── scripts/
│       ├── settings.json
│       └── mcp.sample.json
├── scripts/
│   ├── launchme.sh
│   └── updateme.sh
└── README.md
```

## Getting Started

- Codex users: start from `AGENTS.md`
- Claude users: start from `docs/getting-started.md`
- Mobile Claude usage: `docs/mobile-access.md`
- Integration notes: `docs/mcp-portability.md` and `docs/gws-setup-guide.md`
- Contributor guidance: `CONTRIBUTING.md`

## Updating

### Codex

Pull the latest repo changes and keep working in place.

### Claude Code

From the repo root:

```bash
git pull
bash wrappers/claude/scripts/update.sh
```

The old `bash scripts/updateme.sh` entrypoint still forwards to the wrapper updater.

## Contributing

Keep portable behavior in the repo root and runtime-specific behavior in the wrapper directories. See `CONTRIBUTING.md` for the current layout and manifest conventions.

## License

MIT. See `LICENSE`.
