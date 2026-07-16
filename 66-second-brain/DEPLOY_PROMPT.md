# Claude Code prompt: deploy "Second Brain" to ASCN

Copy the text below into Claude Code opened in this folder (66-second-brain/).

---

You are transferring the ready-made agent "Second Brain" to the ASCN platform (ascn.ai).

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
   - workspace/skills/capture-note/SKILL.md → /data/workspace/skills/capture-note/SKILL.md
   - workspace/skills/link-summarizer/SKILL.md → /data/workspace/skills/link-summarizer/SKILL.md
   - workspace/skills/search-recall/SKILL.md → /data/workspace/skills/search-recall/SKILL.md
   - workspace/skills/weekly-review/SKILL.md → /data/workspace/skills/weekly-review/SKILL.md
   - workspace/knowledge/BRAIN_PROFILE.md → /data/workspace/knowledge/BRAIN_PROFILE.md
   - workspace/knowledge/INDEX_SCHEMA.md → /data/workspace/knowledge/INDEX_SCHEMA.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets: none required — this agent uses only native OAuth integrations and built-in web reading, so there are no API keys to create in Settings → Secrets.
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/CRON_PLAYBOOK.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me manually: on first dialog the agent will request Google Sheets and Notion via OAuth buttons (Google Docs/Drive optional) and offer to connect Telegram.
7. Send the agent the first message "Hi, let's set up" and confirm it starts the onboarding script (introduces itself, states ~10 minutes, asks the first question about what you want to capture).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
