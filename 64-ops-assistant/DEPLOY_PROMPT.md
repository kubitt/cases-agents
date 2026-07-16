# Claude Code prompt: deploy "Ops Assistant" to ASCN

Copy the text below into Claude Code opened in this folder (64-ops-assistant/).

---

You are transferring the ready-made agent "Ops Assistant" to the ASCN platform (ascn.ai).

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
   - workspace/skills/ops-briefing/SKILL.md → /data/workspace/skills/ops-briefing/SKILL.md
   - workspace/skills/task-triage/SKILL.md → /data/workspace/skills/task-triage/SKILL.md
   - workspace/skills/checklist-run/SKILL.md → /data/workspace/skills/checklist-run/SKILL.md
   - workspace/knowledge/OPS_PROFILE.md → /data/workspace/knowledge/OPS_PROFILE.md
   - workspace/knowledge/OPS_PLAYBOOK.md → /data/workspace/knowledge/OPS_PLAYBOOK.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets before first run: none — this agent requires NO API keys or tokens. Every integration is native OAuth (Google Sheets, Google Docs/Drive, GitHub, Google Calendar, Slack; optional Notion) or runs locally (built-in web search). Do not create any secret.
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/CRON_PLAYBOOK.md (Morning ops briefing, PR and check watch, Weekly ops digest), only if the user agrees.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me manually: on first dialog the agent will request Google Sheets, Google Docs/Drive, GitHub, Google Calendar, and Slack via OAuth buttons (no keys), then deliver a first briefing live on the connected sources.
7. Send the agent the first message "Hi, let's set up" and confirm it starts the onboarding script (introduces itself, states ~12 minutes, asks the first question about the team and its owners).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
