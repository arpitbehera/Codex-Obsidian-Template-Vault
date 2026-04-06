# Codex Migration Report

## Summary

The repo now has a physical wrapper split:

- portable core at the repo root: `AGENTS.md`, `agents/`, `skills/`, `references/`, `docs/`
- Claude-specific runtime assets under `wrappers/claude/`
- compatibility shims at `scripts/launchme.sh` and `scripts/updateme.sh`

## Normalized Layout

### Portable Core

- `AGENTS.md`
- `agents/`
- `agents/custom/`
- `skills/`
- `references/`
- `docs/`

### Claude-Specific Wrapper

- `wrappers/claude/CLAUDE.md`
- `wrappers/claude/hooks/`
- `wrappers/claude/settings.json`
- `wrappers/claude/mcp.sample.json`
- `wrappers/claude/plugin/`
- `wrappers/claude/scripts/`

### Compatibility Shims

- `scripts/launchme.sh`
- `scripts/updateme.sh`

## Mapping Table

| Construct | Location | Classification | Codex-native equivalent | Notes |
|---|---|---|---|---|
| Root dispatcher prompt | `wrappers/claude/CLAUDE.md` | Claude wrapper | `AGENTS.md` | Claude routing stays isolated from Codex guidance |
| Claude plugin manifest | `wrappers/claude/plugin/plugin.json` | Claude wrapper | None | Keep as wrapper-only metadata |
| Claude hook config | `wrappers/claude/settings.json` | Claude wrapper | `AGENTS.md` rules | Hook behavior is explicit operating guidance in Codex |
| Hook scripts | `wrappers/claude/hooks/*.sh` | Portable intent, wrapper runtime | `AGENTS.md` rules and commentary updates | Logic preserved for Claude installs |
| Claude-hosted MCP sample | `wrappers/claude/mcp.sample.json` | Wrapper sample | `docs/mcp-portability.md` | No Codex MCP config was invented without a verified contract |
| Legacy install/update commands | `scripts/*.sh` | Compatibility shim | Forward to `wrappers/claude/scripts/` | Keeps older docs and existing users from breaking immediately |
| Claude-leaning agent metadata | `agents/*.md` | Portable-with-edits | Runtime-neutral frontmatter plus `runtime_hints` | `tools` and `model` no longer live at the top level |
| Slash-command docs | root docs | Portable-with-edits | Natural-language routing | Root docs no longer present slash commands as canonical |

## Validation Checklist

- [x] Claude-only assets moved under `wrappers/claude/`
- [x] Root README rewritten around portable core plus wrapper tracks
- [x] Root `.mcp.json` removed in favor of `wrappers/claude/mcp.sample.json`
- [x] MCP portability documented in `docs/mcp-portability.md`
- [x] Core agent files now use runtime-neutral frontmatter with `runtime_hints`
- [x] Claude install/update scripts still work from their new wrapper location
- [x] Legacy `scripts/launchme.sh` and `scripts/updateme.sh` remain as shims

## Remaining Known Gap

A committed Codex-native MCP config is still intentionally absent. The repo documents why, but a real Codex config should only be added once the target runtime's startup, auth, transport, and credential contract is known.