# Claude Code prompt: deploy "Circle Keeper (Personal CRM)" to ASCN

Copy the text below into Claude Code opened in this folder (53-personal-crm/).

---

You are transferring the ready-made agent "Circle Keeper (Personal CRM)" to the ASCN platform (ascn.ai).

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
   - workspace/skills/contact-sync/SKILL.md → /data/workspace/skills/contact-sync/SKILL.md
   - workspace/skills/checkin-drafter/SKILL.md → /data/workspace/skills/checkin-drafter/SKILL.md
   - workspace/skills/meeting-prep/SKILL.md → /data/workspace/skills/meeting-prep/SKILL.md
   - workspace/knowledge/RELATIONSHIP_CIRCLES.md → /data/workspace/knowledge/RELATIONSHIP_CIRCLES.md
   - workspace/knowledge/CHECKIN_VOICE.md → /data/workspace/knowledge/CHECKIN_VOICE.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets: none required — the core uses only native OAuth integrations and built-in web search. (Optional enrichment/news APIs in INTEGRATIONS.md are add-ons the user can wire up later with their own budget.)
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/AUTOMATIONS.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me manually: on first dialog the agent will request Gmail, Google Calendar, and Google Sheets via OAuth buttons (Notion optional instead of Sheets) and offer Telegram.
7. Send the agent the first message "Hi, let's set up" and confirm it starts the onboarding script (introduces itself, states ~10 minutes, asks the first question about your relationship circles and cadence).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
