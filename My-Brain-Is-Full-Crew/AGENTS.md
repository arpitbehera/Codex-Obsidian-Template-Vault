# My Brain Is Full - Crew - Codex Wrapper

This file is the Codex-native runtime wrapper for the Crew.

## Scope

Treat these directories as the portable core:

- `agents/`
- `skills/`
- `references/`
- `docs/`

Treat these locations as Claude-specific wrappers:

- `wrappers/claude/`
- `scripts/launchme.sh`
- `scripts/updateme.sh`

## Routing

Route by intent, not by slash-command syntax.

1. Check `skills/<name>/SKILL.md` first for multi-step, interview-style, or audit-style workflows.
2. If no skill fits, use the best matching file in `agents/*.md` for single-shot work.
3. If follow-up work is needed, continue the chain yourself only when it is still part of the same user request and the next step is clear.

Natural-language requests replace Claude slash commands. For example:

- "initialize my vault" -> `skills/onboarding/SKILL.md`
- "create a new agent" -> `skills/create-agent/SKILL.md`
- "edit my agent" -> `skills/manage-agent/SKILL.md`

## Orchestration

Use `references/agent-orchestration.md` as the cross-runtime protocol.

- Skills and agents do not call each other directly.
- Use `### Suggested next agent` when follow-up work is obvious.
- Use `### Suggested new agent` when a genuine capability gap appears.
- Keep chains short. Default max depth is 3 steps per user request.

## Custom Agents

For repo-local Codex work, store custom agents in `agents/custom/`.

When you create, edit, disable, or remove a custom agent, also update:

- `references/agents-registry.md`
- `references/agents.md`

If the user is explicitly targeting a Claude vault install, the runtime copy belongs under `.claude/agents/` in that vault.

## Replacements For Claude Hooks

Codex does not use the Claude hook system in this repo. Replace those behaviors with explicit operating rules:

1. Protect system files:
   Do not edit Claude wrapper files under `wrappers/claude/` or installed runtime copies under `.claude/` unless the user explicitly asks for wrapper migration or wrapper repair.
2. Validate frontmatter:
   After writing any non-wrapper Markdown note that starts with `---`, verify the closing delimiter exists, avoid tabs in YAML, and quote values that contain `:`.
3. Notifications:
   During long work, send concise progress updates in commentary instead of relying on desktop notification hooks.

## MCP

Do not treat Claude-hosted MCP samples as portable Codex configuration.

Before you rely on any MCP server:

1. Verify startup method.
2. Verify transport type.
3. Verify auth requirements.
4. Verify required env vars or local credentials.

If any of those are unclear, treat the MCP integration as a draft and mark the gap explicitly. See `docs/mcp-portability.md`.