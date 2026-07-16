# Claude Code prompt: deploy "Social Media Manager" to ASCN

Copy the text below into Claude Code opened in this folder (59-social-media-manager/).

---

You are transferring the ready-made agent "Social Media Manager" to the ASCN platform (ascn.ai).

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
   - workspace/skills/content-planner/SKILL.md → /data/workspace/skills/content-planner/SKILL.md
   - workspace/skills/post-writer/SKILL.md → /data/workspace/skills/post-writer/SKILL.md
   - workspace/skills/approval-queue/SKILL.md → /data/workspace/skills/approval-queue/SKILL.md
   - workspace/knowledge/BRAND_VOICE.md → /data/workspace/knowledge/BRAND_VOICE.md
   - workspace/knowledge/NETWORK_PLAYBOOK.md → /data/workspace/knowledge/NETWORK_PLAYBOOK.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets: NONE required — the core is fully native (Google Sheets, Google Docs, web search, Telegram). Only if the user later opts into the paid autopublishing upgrade (see INTEGRATIONS.md) do they add that provider's API key in Settings → Secrets.
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/CRON_PLAYBOOK.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me manually: on first dialog the agent will request Google Sheets, Google Docs, and Telegram via OAuth buttons (all native, free) and offer Google Drive as optional.
7. Send the agent the first message "Hi, let's set up" and confirm it starts the onboarding script (introduces itself, states ~10 minutes, asks the first question about the brand and its networks).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
