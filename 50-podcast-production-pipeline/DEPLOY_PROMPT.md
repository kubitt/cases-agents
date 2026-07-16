# Claude Code prompt: deploy "Podcast Production Pipeline" to ASCN

Copy the text below into Claude Code opened in this folder (50-podcast-production-pipeline/).

---

You are transferring the ready-made agent "Podcast Production Pipeline" to the ASCN platform (ascn.ai).

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
   - workspace/skills/episode-prep/SKILL.md → /data/workspace/skills/episode-prep/SKILL.md
   - workspace/skills/show-notes/SKILL.md → /data/workspace/skills/show-notes/SKILL.md
   - workspace/skills/episode-description/SKILL.md → /data/workspace/skills/episode-description/SKILL.md
   - workspace/skills/promo-kit/SKILL.md → /data/workspace/skills/promo-kit/SKILL.md
   - workspace/knowledge/SHOW_PROFILE.md → /data/workspace/knowledge/SHOW_PROFILE.md
   - workspace/knowledge/VOICE_AND_STYLE.md → /data/workspace/knowledge/VOICE_AND_STYLE.md
   - workspace/knowledge/PUBLISH_CHECKLIST.md → /data/workspace/knowledge/PUBLISH_CHECKLIST.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets: none required for the core agent — all core work uses native integrations and built-in web search/reading. (Optional upgrades in INTEGRATIONS.md would add keys later.)
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/CRON_PLAYBOOK.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent will request Google Sheets and Google Docs via OAuth buttons and offer Telegram (Google Drive optional).
7. Send the agent the first message "Hi, let's set up" and confirm it starts the onboarding script (introduces itself, states ~10 minutes, asks the first question about the show).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
