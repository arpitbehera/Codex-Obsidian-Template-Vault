# Agent Orchestration Protocol

This document defines how Crew agents and skills coordinate across runtimes.

The active wrapper may be:

- `AGENTS.md` in Codex
- `CLAUDE.md` in Claude
- another runtime-specific entrypoint that follows the same protocol

## Overview

The runtime wrapper is a reactive router with skill-first routing:

1. Read the user request.
2. Check for a matching skill first.
3. If no skill fits, choose the best matching agent.
4. Read the result.
5. Continue only if the next step is obvious and still part of the same user request.

Skills and agents help the wrapper by emitting structured follow-up suggestions.

## Skill-First Routing

Skills handle complex, multi-step, or interview-style workflows.

- Enter a skill when the request is conversational, stateful, or audit-like.
- Triggers may come from natural language, slash commands, UI buttons, or direct operator choice.
- If a skill matches, do not also invoke its source agent for the same step.
- Skills may still emit `### Suggested next agent` if downstream work is needed.

## How Agents And Skills Signal Follow-Up Work

When follow-up work is needed, append this section to the output:

```markdown
### Suggested next agent
- **Agent**: {name from `references/agents-registry.md`}
- **Reason**: {what should happen next and why}
- **Context**: {paths, note titles, or concrete details the next step needs}
```

Multiple suggestions are allowed. The active wrapper decides whether to continue the chain.

### Suggesting A New Agent

When no existing agent covers the need, emit:

```markdown
### Suggested new agent
- **Need**: {missing capability}
- **Reason**: {why the current roster is insufficient}
- **Suggested role**: {what the new agent would do}
```

The wrapper or operator may route this to the custom-agent workflow.

## Call Chain Rules

Use a short call chain per user request.

1. Start with an empty chain.
2. Append each completed skill or agent step.
3. Do not invoke the same agent twice in one chain.
4. Default max depth is 3 steps.
5. If a fourth step is needed, stop and return the deferred work to the user.

## Custom Agent Lifecycle

Custom agents participate in the same protocol as core agents.

### Repo-local Codex workflow

- Store custom agents in `agents/custom/`
- Update `references/agents-registry.md`
- Update `references/agents.md`

### Claude vault workflow

- Store runtime copies in `.claude/agents/`
- Keep `references/agents-registry.md` and `references/agents.md` aligned with the portable source of truth

## What Agents And Skills Must Not Do

- Do not invoke other agents directly.
- Do not block waiting for another agent.
- Do not edit wrapper-specific runtime files unless the user explicitly asked for wrapper work.
- Do not rely on deprecated shared-message patterns.

## Agent State

Agents may keep a post-it file in `Meta/states/{agent-name}.md`.

Rules:

- one file per agent
- read it at the start if it exists
- overwrite it at the end
- keep it short
- use it to resume interrupted multi-step flows

## Reference Files

- `references/agents-registry.md`
- `references/agents.md`
- `references/agent-template.md`
