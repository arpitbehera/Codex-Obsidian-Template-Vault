  # Obsidian Vault Runtime

  Use `./My-Brain-Is-Full-Crew/AGENTS.md` as the runtime wrapper for this vault.

  ## Instruction Sources

  Read and follow these repo-local instruction sources:

  - `./My-Brain-Is-Full-Crew/AGENTS.md`
  - `./My-Brain-Is-Full-Crew/agents/`
  - `./My-Brain-Is-Full-Crew/skills/`
  - `./My-Brain-Is-Full-Crew/references/`
  - `./My-Brain-Is-Full-Crew/docs/`

  ## Vault Root

  Treat the current directory (`.`) as the Obsidian vault root.

  Create and edit vault content in this vault root, not inside `./My-Brain-Is-Full-Crew/`.

  If a repo instruction refers to paths like `00-Inbox/`, `01-Projects/`, `02-Areas/`, `05-People/`, `06-Meetings/`, `MOC/`, `Templates/`,
  `Meta/`, or `Meta/user-profile.md`, resolve those paths relative to the vault root.

  ## Routing

  Route requests by intent using the crew agents and skills.

  Prefer natural-language routing, not slash commands.

  Treat `./My-Brain-Is-Full-Crew/` as the instruction source and the current directory as the data workspace.

  ## Safety

  Do not modify wrapper files under `./My-Brain-Is-Full-Crew/wrappers/claude/` unless explicitly asked.

  If there is any ambiguity between repo-relative paths and vault-root paths, prefer the vault root and state that assumption briefly.
