# Claude Code prompt: deploy "Personal Assistant" to ASCN

Copy the text below into Claude Code opened in this folder (personal-assistant/).

---

You are transferring the ready-made agent "Personal Assistant" to the ASCN platform (ascn.ai).

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
   - workspace/skills/inbox-triage/SKILL.md → /data/workspace/skills/inbox-triage/SKILL.md
   - workspace/skills/meeting-summary/SKILL.md → /data/workspace/skills/meeting-summary/SKILL.md
   - workspace/skills/daily-brief/SKILL.md → /data/workspace/skills/daily-brief/SKILL.md
   - workspace/knowledge/USER_PRIORITIES.md → /data/workspace/knowledge/USER_PRIORITIES.md
   - workspace/knowledge/REPLY_VOICE.md → /data/workspace/knowledge/REPLY_VOICE.md
   Do NOT touch platform system files (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, rules/).
3. Secrets: none required — every integration is native OAuth (Gmail, Notion/Sheets, Calendar, Telegram) connected by the user during onboarding. No API keys go in Settings → Secrets.
4. Do NOT create automations yourself: the agent sets up its morning brief and inbox poll during onboarding (texts in workspace/AUTOMATIONS.md — verify if you wish).
5. Verify yourself: list transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent will request Gmail, a task destination (Notion or Sheets), Calendar, and Telegram via OAuth buttons.
7. Send the agent "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~8 minutes, asks to connect Gmail first).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
