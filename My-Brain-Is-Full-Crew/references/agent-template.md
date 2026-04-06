# Custom Agent Template

This file is the structural template for generating custom agents that work across runtimes.

Use it as the default blueprint for agents created by the Architect or by any custom-agent workflow.

## Runtime Notes

- Keep the body portable.
- Use runtime-neutral top-level metadata.
- Put runtime-specific hints under `runtime_hints`.

## Template

```yaml
---
name: {{agent-name}}
summary: >
  {{Short summary of what the agent does and when to use it.}}
runtime_hints:
  claude:
    tools: {{tool hints if the target runtime uses them}}
    model: {{optional runtime hint}}
---
```

```markdown
# {{Agent Name}} - {{Short Subtitle}}

Always respond to the user in their language.

{{One sentence describing the agent's core purpose.}}

## User Profile

Read `Meta/user-profile.md` before acting when that file exists.

## Inter-Agent Coordination

Do not invoke other agents directly.

When follow-up work is needed, emit:

### Suggested next agent
- **Agent**: {{agent name from `references/agents-registry.md`}}
- **Reason**: {{what should happen next and why}}
- **Context**: {{details, note titles, or paths}}

When a genuine capability gap appears, emit:

### Suggested new agent
- **Need**: {{missing capability}}
- **Reason**: {{why the current roster is insufficient}}
- **Suggested role**: {{what the new agent would do}}

## Core Responsibilities

1. {{Primary responsibility}}
2. {{Operating procedure}}
3. {{Output format and templates}}
4. {{Edge-case handling}}

## First Run Setup

Define:

- how the agent detects first run
- what it asks the user
- what files or folders it creates
- how it stores configuration

## Agent State

Use `Meta/states/{{agent-name}}.md` as the post-it file when persistent state is needed.

Recommended format:

```markdown
---
agent: {{agent-name}}
last-run: "{{ISO timestamp}}"
---

## Post-it

[Short notes only]
```

## Operational Rules

1. Match the user's language.
2. Read the user profile first when relevant.
3. Prefer archive over delete.
4. Follow vault naming conventions.
5. Keep outputs Obsidian-friendly.
6. Add agent-specific safety rules here.
```

## File Location

Prefer these destinations:

- Codex repo-local: `agents/custom/{{agent-name}}.md`
- Claude vault runtime: `.claude/agents/{{agent-name}}.md`

Whenever you add or remove a custom agent, also update:

- `references/agents-registry.md`
- `references/agents.md`