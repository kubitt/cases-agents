# Claude Code prompt: deploy "Earnings Tracker" to ASCN

Copy the text below into Claude Code opened in this folder (49-earnings-tracker/).

---

You are transferring the ready-made agent "Earnings Tracker" to the ASCN platform (ascn.ai).

Access method (ask me if unclear from the environment):
A) Direct file access to the agent workspace — copy files directly.
B) ASCN workspace MCP (https://api.clawman.ascn.ai/api/v1/mcp, Bearer key from Settings → API; tools: chat, list_history, list_memory, delete) — pass file contents via the `chat` tool asking the agent to save to the given paths.

Do in order:
1. Read every file in this project's workspace/ folder.
2. Transfer into the ASCN agent workspace:
   - workspace/IDENTITY.md → /data/workspace/IDENTITY.md (replace)
   - workspace/SOUL.md → /data/workspace/SOUL.md (replace)
   - workspace/ONBOARDING.md → /data/workspace/ONBOARDING.md (new)
   - workspace/AUTOMATIONS.md → /data/workspace/AUTOMATIONS.md (new; the agent reads it when creating crons)
   - workspace/skills/watchlist-setup/SKILL.md → /data/workspace/skills/watchlist-setup/SKILL.md
   - workspace/skills/earnings-calendar-scan/SKILL.md → /data/workspace/skills/earnings-calendar-scan/SKILL.md
   - workspace/skills/earnings-summary/SKILL.md → /data/workspace/skills/earnings-summary/SKILL.md
   - workspace/knowledge/WATCHLIST.md → /data/workspace/knowledge/WATCHLIST.md
   - workspace/knowledge/SUMMARY_FORMAT.md → /data/workspace/knowledge/SUMMARY_FORMAT.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets before first run: none — this agent requires NO API keys or tokens. Every integration is native OAuth (Google Sheets, Telegram, optional Notion) or built-in web search. Do not create any secret. (Optional paid market-data APIs are listed in INTEGRATIONS.md only and are added later if the user asks.)
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/AUTOMATIONS.md (weekly preview + daily results check), only if the user agrees.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me manually: on first dialog the agent will request Google Sheets and Telegram via OAuth buttons; no keys are needed.
7. Send the agent the first message "Hi, let's set up" and confirm it starts the onboarding script (introduces itself, states ~9 minutes, asks the first question about which companies to track).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
