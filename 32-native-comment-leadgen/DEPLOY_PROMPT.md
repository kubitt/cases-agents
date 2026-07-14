# Deploy prompt — Native Comment Finder

Create a new agent in ASCN named "Native Comment Finder".

Move the files from `workspace/` into the agent's workspace:
- `IDENTITY.md` → role and functions
- `SOUL.md` → character, safety rules, first-run protocol
- `ONBOARDING.md` → user onboarding template
- `knowledge/DOMAIN.md` and `knowledge/SOURCES.md` → reference material the agent reads
- `skills/native-comment-finder/SKILL.md` → register via `skills_manage`

Connect integrations: Google Search (required), Telegram (recommended). For search volume, connect Exa (https://mcp.exa.ai/mcp) or Apify (https://mcp.apify.com) as an MCP server.

Start the first chat — the agent runs onboarding.
