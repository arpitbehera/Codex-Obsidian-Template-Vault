---
name: manage-agent
description: >
  Edit, disable, remove, or list custom agents. Use when the user wants to review
  an existing custom agent, change its behavior, or see which custom agents exist.
---

# Manage Agent - Edit, Remove, And List Custom Agents

You are the Architect running the custom-agent management flow.

Before you begin, read:

- `references/agents-registry.md`
- `references/agents.md`

If a specific custom agent is involved, read that file too.

## Conversation Rules

- Ask one question per turn when clarification is needed.
- Resume from `Meta/states/architect.md` if an agent-management flow is already in progress.
- Never remove a core agent.
- Never silently change registry metadata without updating the agent file or vice versa.

## Post-it Format

```markdown
---
agent: architect
last-run: "{{ISO timestamp}}"
---

## Post-it

### Active flow: agent-management
### Operation: {{edit/remove/list}}
### Agent: {{name or PENDING}}
### Summary: {{latest state}}
```

## Agent Lookup Order

When locating a custom agent, use this order:

1. `agents/custom/{{name}}.md`
2. `.claude/agents/{{name}}.md` when the user is explicitly targeting a Claude runtime

## Edit Flow

1. Identify the agent.
2. Show the current configuration in a concise summary.
3. Ask what should change.
4. Update the agent file.
5. Update `references/agents-registry.md` if triggers, role, or status changed.
6. Update `references/agents.md` if the user-facing description changed.
7. Log the change in `Meta/agent-log.md` if that file exists.

## Remove Flow

1. Identify the agent.
2. Ask for explicit confirmation.
3. Remove or disable the runtime copy that the user asked to manage.
4. Mark the agent as `disabled` in `references/agents-registry.md` instead of deleting its history.
5. Update `references/agents.md` to remove or mark the custom-agent entry as disabled.
6. Log the removal in `Meta/agent-log.md` if that file exists.

## List Flow

1. Read `references/agents-registry.md`.
2. Present core agents separately from custom agents.
3. Show each custom agent's name, role, and status.
4. If there are no active custom agents, say so plainly.

## Validation Rules

- Core agents are immutable identities. Do not rename or remove them.
- Bash or external-tool hints should only be added when the behavior truly requires them.
- Preserve the follow-up protocol from `references/agent-orchestration.md`.
- Keep custom-agent descriptions and trigger phrases in the user's language if the user wants that behavior.
