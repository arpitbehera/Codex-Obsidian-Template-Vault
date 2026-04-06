# Contributing to My Brain Is Full - Crew

This repo now has a physical wrapper split:

- portable core: `AGENTS.md`, `agents/`, `skills/`, `references/`, `docs/`
- Claude wrapper: `wrappers/claude/`
- Claude compatibility shims: `scripts/launchme.sh`, `scripts/updateme.sh`

Contributions should preserve that split.

## Where To Change Things

### Change portable behavior

Edit the portable core when the change should apply across runtimes:

- `AGENTS.md`
- `agents/*.md`
- `skills/*/SKILL.md`
- `references/*.md`
- runtime-neutral docs under `docs/`

### Change Claude-only behavior

Edit these only when the change is specific to Claude vault installs, Claude hooks, Claude plugin loading, or Claude-hosted MCP:

- `wrappers/claude/CLAUDE.md`
- `wrappers/claude/hooks/`
- `wrappers/claude/settings.json`
- `wrappers/claude/mcp.sample.json`
- `wrappers/claude/plugin/`
- `wrappers/claude/scripts/`

### Change compatibility behavior

Edit these only when you need to preserve older entrypoints:

- `scripts/launchme.sh`
- `scripts/updateme.sh`

## Agent Files

Agent files are markdown capability specs. Their frontmatter is runtime-neutral metadata with optional runtime hints.

When you edit or add an agent:

1. Keep the instructions in English.
2. Keep routing phrases natural and user-facing.
3. Put runtime-specific tool or model hints under `runtime_hints`, not at the top level.
4. Preserve the follow-up protocol from `references/agent-orchestration.md`.
5. Keep the agent conservative by default. Prefer archive over delete.

## Skills

Skills are for multi-step or conversational workflows.

When you edit a skill:

1. Avoid Claude-only tool assumptions unless the file is explicitly wrapper-specific.
2. Prefer one question per turn.
3. Refer to repo-local paths such as `references/...` unless a runtime-specific copy is required.
4. If the skill needs downstream work, use `### Suggested next agent` instead of calling another agent directly.

## Custom Agents

Repo-local custom agents belong in `agents/custom/`.

Whenever you create, rename, disable, or remove a custom agent, also update:

- `references/agents-registry.md`
- `references/agents.md`

For Claude vault installs, you may also need to mirror the runtime copy under `.claude/agents/`.

## MCP And External Integrations

Treat MCP portability as a separate concern from prompt portability.

Before you claim an MCP integration is cross-runtime, verify:

1. startup command or hosted endpoint
2. auth method
3. transport type
4. required env vars or local credentials

If any of those are unknown, document the gap instead of assuming compatibility.

## Pull Requests

Good PRs usually include:

- the user-visible problem being solved
- whether the change is portable core, Claude wrapper, or compatibility shim
- any runtime-specific tradeoffs
- any docs updated to match the new behavior

If you change routing, orchestration, runtime layout, or wrapper placement, update the relevant docs in the same PR.