# Claude Code prompt: deploy "Pinterest Traffic Agent" to ASCN

Copy the text below into Claude Code opened in this folder (34-pinterest-traffic-agent/).

---

You are transferring the ready-made agent "Pinterest Traffic Agent" to the ASCN platform (ascn.ai).

Access method (ask me if unclear from the environment):
A) Direct file access to the agent workspace — copy files directly.
B) ASCN workspace MCP (https://api.clawman.ascn.ai/api/v1/mcp, Bearer key from Settings → API) — pass file contents via the `chat` tool asking the agent to save to the given paths.

Do in order:
1. Read every file in this project's workspace/ folder.
2. Transfer into the ASCN agent workspace:
   - workspace/IDENTITY.md → /data/workspace/IDENTITY.md (replace)
   - workspace/SOUL.md → /data/workspace/SOUL.md (replace)
   - workspace/ONBOARDING.md → /data/workspace/ONBOARDING.md (new)
   - workspace/AUTOMATIONS.md → /data/workspace/AUTOMATIONS.md (new; the agent reads it when creating crons)
   - workspace/skills/niche-research/SKILL.md → /data/workspace/skills/niche-research/SKILL.md
   - workspace/skills/pin-writer/SKILL.md → /data/workspace/skills/pin-writer/SKILL.md
   - workspace/skills/pin-publisher/SKILL.md → /data/workspace/skills/pin-publisher/SKILL.md
   - workspace/knowledge/NICHE_STRATEGY.md → /data/workspace/knowledge/NICHE_STRATEGY.md
   - workspace/knowledge/PIN_SETTINGS.md → /data/workspace/knowledge/PIN_SETTINGS.md
   Do NOT touch platform system files (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/). Note: this agent intentionally ships its own AUTOMATIONS.md — if the platform already has one, keep the platform's cron policy and merge this file's task texts into the agent's playbook rather than blindly overwriting.
3. Secrets before first run: create in Settings → Secrets: OPENROUTER_API_KEY (from openrouter.ai/keys), PINTEREST_ACCESS_TOKEN (Pinterest Developers app, scopes boards:read/pins:read/pins:write), PINTBOT (Telegram bot token from @BotFather), TELEGRAM_CHAT_ID (the user's chat id). The Pinterest username and board id are not secrets — the agent saves them to knowledge/PIN_SETTINGS.md during onboarding.
4. Do NOT create automations yourself: the agent offers the autoposting cron during onboarding (texts in workspace/AUTOMATIONS.md), and only if the user agrees.
5. Verify yourself: list transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent will ask for the niche + target link, then request the three API keys and offer Telegram; it will run a real test pin and ask for approval before publishing.
7. Send the agent "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~10 minutes, asks the first niche question).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
