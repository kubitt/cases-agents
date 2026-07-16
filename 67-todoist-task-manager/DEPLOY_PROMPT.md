# Claude Code prompt: deploy "Task Pilot" to ASCN

Copy the text below into Claude Code opened in this folder (67-todoist-task-manager/).

---

You are transferring the ready-made agent "Task Pilot" to the ASCN platform (ascn.ai).

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
   - workspace/skills/task-capture/SKILL.md → /data/workspace/skills/task-capture/SKILL.md
   - workspace/skills/daily-plan/SKILL.md → /data/workspace/skills/daily-plan/SKILL.md
   - workspace/skills/weekly-review/SKILL.md → /data/workspace/skills/weekly-review/SKILL.md
   - workspace/knowledge/TASK_SETUP.md → /data/workspace/knowledge/TASK_SETUP.md
   - workspace/knowledge/PRIORITY_RULES.md → /data/workspace/knowledge/PRIORITY_RULES.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets before first run: none required. Every core integration is native OAuth (Google Sheets, Google Calendar, Telegram) — no API keys or tokens.
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/AUTOMATIONS.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me manually: on first dialog the agent will request Google Sheets and Google Calendar via OAuth buttons and offer Telegram as the channel.
7. Send the agent the first message "Hi, let's set up" and confirm it starts the onboarding script (introduces itself, states ~9 minutes, asks the first question about your projects and working hours).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
