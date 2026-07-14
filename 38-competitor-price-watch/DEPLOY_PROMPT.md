# Claude Code prompt: deploy "Competitor Price Watch" to ASCN

Copy the text below into Claude Code opened in this folder (38-competitor-price-watch/).

---

You are transferring the ready-made agent "Competitor Price Watch" to the ASCN platform (ascn.ai).

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
   - workspace/skills/price-scan/SKILL.md → /data/workspace/skills/price-scan/SKILL.md
   - workspace/skills/price-diff/SKILL.md → /data/workspace/skills/price-diff/SKILL.md
   - workspace/skills/price-report/SKILL.md → /data/workspace/skills/price-report/SKILL.md
   - workspace/knowledge/WATCH_CONFIG.md → /data/workspace/knowledge/WATCH_CONFIG.md
   - workspace/knowledge/PRICE_PARSING.md → /data/workspace/knowledge/PRICE_PARSING.md
   Do NOT touch platform system files (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/). Note: this agent ships its own AUTOMATIONS.md — if the platform already has one, keep the platform's cron policy and merge this file's task text into the agent's playbook rather than overwriting.
3. Secrets before first run: none required. Optional: FIRECRAWL_API_KEY (only if some competitor pricing pages are JS-heavy; from firecrawl.dev).
4. Do NOT create automations yourself: the agent creates the daily price-watch cron during onboarding, reading workspace/AUTOMATIONS.md.
5. Verify yourself: list transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent asks for the competitor list, requests Google Sheets and Telegram via OAuth, test-reads the pricing pages, and runs a baseline scan.
7. Send the agent "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~7 minutes, asks the first competitor question).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
