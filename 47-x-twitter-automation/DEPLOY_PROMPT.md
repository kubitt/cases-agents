# Claude Code prompt: deploy "X Content Engine" to ASCN

Copy the text below into Claude Code opened in this folder (47-x-twitter-automation/).

---

You are transferring the ready-made agent "X Content Engine" to the ASCN platform (ascn.ai).

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
   - workspace/skills/trend-research/SKILL.md → /data/workspace/skills/trend-research/SKILL.md
   - workspace/skills/post-drafting/SKILL.md → /data/workspace/skills/post-drafting/SKILL.md
   - workspace/skills/weekly-review/SKILL.md → /data/workspace/skills/weekly-review/SKILL.md
   - workspace/knowledge/VOICE.md → /data/workspace/knowledge/VOICE.md
   - workspace/knowledge/CONTENT_STRATEGY.md → /data/workspace/knowledge/CONTENT_STRATEGY.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets: none required — the core is fully native (Google Sheets + built-in web search/reading). Only if the user later approves the optional X API or Typefully/Buffer upgrade, create the relevant key in Settings → Secrets then; nothing to add for the core.
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/CRON_PLAYBOOK.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent will request Google Sheets via an OAuth button and offer Telegram (and optionally Google Docs). No external key is needed for the core.
7. Send the agent the first message "Hi, let's set up" and confirm it starts the onboarding script (introduces itself, states ~10 minutes, asks the first question about the user's niche and topics).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
