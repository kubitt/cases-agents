# Claude Code prompt: deploy "YouTube Content Engine" to ASCN

Copy the text below into Claude Code opened in this folder (52-youtube-content-pipeline/).

---

You are transferring the ready-made agent "YouTube Content Engine" to the ASCN platform (ascn.ai).

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
   - workspace/skills/topic-scout/SKILL.md → /data/workspace/skills/topic-scout/SKILL.md
   - workspace/skills/content-packager/SKILL.md → /data/workspace/skills/content-packager/SKILL.md
   - workspace/skills/link-researcher/SKILL.md → /data/workspace/skills/link-researcher/SKILL.md
   - workspace/knowledge/CHANNEL_PROFILE.md → /data/workspace/knowledge/CHANNEL_PROFILE.md
   - workspace/knowledge/PACKAGE_PLAYBOOK.md → /data/workspace/knowledge/PACKAGE_PLAYBOOK.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets: none required — this agent runs fully on native integrations and built-in web search. (Only if the user later opts into an optional upgrade like the YouTube Data API or X API would keys be added in Settings → Secrets.)
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/CRON_PLAYBOOK.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me manually: on first dialog the agent will request Google Sheets and Google Docs via OAuth buttons, and offer optional Slack and a Telegram channel.
7. Send the agent the first message "Hi, let's set up" and confirm it starts the onboarding script (introduces itself, states ~10 minutes, asks the first question about the channel and niche).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
