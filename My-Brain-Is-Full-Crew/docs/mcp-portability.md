# MCP Portability

This project treats MCP support as runtime-specific until startup, auth, transport, and credential requirements are verified.

## Current Integrations

| Integration | Startup | Transport | Auth source | Env vars / credentials | Supported runtimes | Status |
|---|---|---|---|---|---|---|
| Gmail via Claude-hosted MCP | Hosted endpoint | HTTP | Claude-managed session auth | Unknown outside Claude | Claude wrapper only | Sample only |
| Google Calendar via Claude-hosted MCP | Hosted endpoint | HTTP | Claude-managed session auth | Unknown outside Claude | Claude wrapper only | Sample only |
| Gmail via `gws` CLI | Local CLI | Process / shell | Local `gws` auth | Whatever `gws` requires locally | Any runtime that can run the CLI | Supported |
| Google Calendar via `gws` CLI | Local CLI | Process / shell | Local `gws` auth | Whatever `gws` requires locally | Any runtime that can run the CLI | Supported |
| Hey via `hey` CLI | Local CLI | Process / shell | Local `hey` auth | Whatever `hey` requires locally | Any runtime that can run the CLI | Supported |

## Rules

Do not add a committed Codex MCP config until all of these are documented for the target runtime:

1. Startup method
2. Transport type
3. Auth flow
4. Required env vars or local credentials

If any item is unknown, keep the integration documented as `sample only` or `unsupported`.