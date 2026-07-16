# Claude Code prompt: deploy "Sales Cadence Keeper" to ASCN

Copy the text below into Claude Code opened in this folder (55-sales-cadence/).

---

You are transferring the ready-made agent "Sales Cadence Keeper" to the ASCN platform (ascn.ai).

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
   - workspace/skills/evening-recap/SKILL.md → /data/workspace/skills/evening-recap/SKILL.md
   - workspace/skills/followup-writer/SKILL.md → /data/workspace/skills/followup-writer/SKILL.md
   - workspace/skills/reply-triage/SKILL.md → /data/workspace/skills/reply-triage/SKILL.md
   - workspace/knowledge/VOICE.md → /data/workspace/knowledge/VOICE.md
   - workspace/knowledge/CADENCE_PLAYBOOK.md → /data/workspace/knowledge/CADENCE_PLAYBOOK.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets: none required. All integrations are native OAuth (Gmail, Google Sheets, Google Calendar), so no entries in Settings → Secrets are needed.
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/AUTOMATIONS.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent will request Gmail, Google Sheets, and Google Calendar via OAuth buttons and offer Telegram.
7. Send the agent "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~12 minutes, asks the first question about your offer).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
