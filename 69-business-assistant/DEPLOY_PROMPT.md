# Claude Code prompt: deploy "Small-Business Assistant" to ASCN

Copy the text below into Claude Code opened in this folder (69-business-assistant/).

---

You are transferring the ready-made agent "Small-Business Assistant" to the ASCN platform (ascn.ai).

Access method (ask me if unclear from the environment):
A) Direct file access to the agent workspace — copy files directly.
B) ASCN workspace MCP (https://api.clawman.ascn.ai/api/v1/mcp, Bearer key from Settings → API; tools: chat, list_history, list_memory, delete) — pass file contents via the `chat` tool asking the agent to save to the given paths.

Do in order:
1. Read every file in this project's workspace/ folder.
2. Transfer into the ASCN agent workspace:
   - workspace/IDENTITY.md → /data/workspace/IDENTITY.md (replace)
   - workspace/SOUL.md → /data/workspace/SOUL.md (replace)
   - workspace/ONBOARDING.md → /data/workspace/ONBOARDING.md (new)
   - workspace/CRON_PLAYBOOK.md → /data/workspace/CRON_PLAYBOOK.md (new; the agent reads it when creating cron tasks)
   - workspace/skills/weekly-review/SKILL.md → /data/workspace/skills/weekly-review/SKILL.md
   - workspace/skills/draft-document/SKILL.md → /data/workspace/skills/draft-document/SKILL.md
   - workspace/skills/market-scan/SKILL.md → /data/workspace/skills/market-scan/SKILL.md
   - workspace/knowledge/BUSINESS_PROFILE.md → /data/workspace/knowledge/BUSINESS_PROFILE.md
   - workspace/knowledge/REPORTING_SPEC.md → /data/workspace/knowledge/REPORTING_SPEC.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets: none required for the core (native Google apps + built-in web search only). If the user later adds a paid data API from INTEGRATIONS.md, create that key in Settings → Secrets then.
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/CRON_PLAYBOOK.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent will request Google Sheets, Google Docs, Gmail, and Google Calendar via OAuth buttons and offer Telegram.
7. Send the agent the first message "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~10 minutes, asks the first question about the business).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
