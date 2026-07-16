# Claude Code prompt: deploy "Brand Reputation Monitor" to ASCN

Copy the text below into Claude Code opened in this folder (65-brand-reputation-monitor/).

---

You are transferring the ready-made agent "Brand Reputation Monitor" to the ASCN platform (ascn.ai).

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
   - workspace/skills/mention-scan/SKILL.md → /data/workspace/skills/mention-scan/SKILL.md
   - workspace/skills/sentiment-scoring/SKILL.md → /data/workspace/skills/sentiment-scoring/SKILL.md
   - workspace/skills/weekly-digest/SKILL.md → /data/workspace/skills/weekly-digest/SKILL.md
   - workspace/knowledge/BRAND_PROFILE.md → /data/workspace/knowledge/BRAND_PROFILE.md
   - workspace/knowledge/SOURCE_LIST.md → /data/workspace/knowledge/SOURCE_LIST.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets: none required. The core runs on native Google Sheets + built-in web search only. (Optional later: if the user adds Apify or a listening API from INTEGRATIONS.md, create APIFY_TOKEN or the relevant key in Settings → Secrets first.)
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/AUTOMATIONS.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent will request Google Sheets via an OAuth button and offer Telegram as the notification channel.
7. Send the agent the first message "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~10 minutes, asks the first question about brand names and aliases).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
