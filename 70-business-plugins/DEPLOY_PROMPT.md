# Claude Code prompt: deploy "Business Planning & Reporting Officer" to ASCN

Copy the text below into Claude Code opened in this folder (70-business-plugins/).

---

You are transferring the ready-made agent "Business Planning & Reporting Officer" to the ASCN platform (ascn.ai).

Access method (ask me if unclear from the environment):
A) Direct file access to the agent workspace — copy files directly.
B) ASCN workspace MCP (https://api.clawman.ascn.ai/api/v1/mcp, Bearer key from Settings → API; tools: chat, list_history, list_memory, delete) — pass file contents via the `chat` tool asking the agent to save to the given paths.

Do in order:
1. Read every file in this project's workspace/ folder.
2. Transfer into the ASCN agent workspace:
   - workspace/IDENTITY.md → /data/workspace/IDENTITY.md (replace)
   - workspace/SOUL.md → /data/workspace/SOUL.md (replace)
   - workspace/ONBOARDING.md → /data/workspace/ONBOARDING.md (new)
   - workspace/CRON_PLAYBOOK.md → /data/workspace/CRON_PLAYBOOK.md (new; the agent reads it when creating crons)
   - workspace/skills/plan-drafting/SKILL.md → /data/workspace/skills/plan-drafting/SKILL.md
   - workspace/skills/kpi-tracking/SKILL.md → /data/workspace/skills/kpi-tracking/SKILL.md
   - workspace/skills/report-prep/SKILL.md → /data/workspace/skills/report-prep/SKILL.md
   - workspace/knowledge/BUSINESS_PROFILE.md → /data/workspace/knowledge/BUSINESS_PROFILE.md
   - workspace/knowledge/REPORTING_STYLE.md → /data/workspace/knowledge/REPORTING_STYLE.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets before first run: none — this agent requires NO API keys or tokens. Every integration is native OAuth (Google Sheets, Google Docs, Google Calendar, optional Notion, Telegram) or built-in (web search). Do not create any secret.
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/CRON_PLAYBOOK.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent will request Google Sheets, Google Docs, and Google Calendar via OAuth buttons and offer Telegram (no keys). It plans and reports — it does not run tests, send anything without approval, or move money.
7. Send the agent "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~10 minutes, asks the first business-context question).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
