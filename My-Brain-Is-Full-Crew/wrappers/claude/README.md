# Claude Wrapper

This directory contains the Claude-specific runtime wrapper for My Brain Is Full - Crew.

Use these files when you want the Crew installed into an Obsidian vault for Claude Code.

## Contents

- `CLAUDE.md`: Claude dispatcher rules copied into the target vault root
- `hooks/`: Claude hook scripts for runtime protection, frontmatter checks, and notifications
- `settings.json`: Claude hook configuration
- `mcp.sample.json`: Claude-hosted MCP sample for Gmail and Google Calendar
- `plugin/plugin.json`: Claude plugin metadata
- `scripts/install.sh`: first-time Claude vault installer
- `scripts/update.sh`: Claude vault updater

## Status

These files are wrapper-specific, not portable core. The portable prompt and workflow assets remain at the repo root in:

- `AGENTS.md`
- `agents/`
- `skills/`
- `references/`
- `docs/`

## Notes

- `mcp.sample.json` is intentionally labeled as a sample because its hosted endpoints and auth contract are Claude-specific.
- The root `scripts/launchme.sh` and `scripts/updateme.sh` files are compatibility shims that forward to this directory.