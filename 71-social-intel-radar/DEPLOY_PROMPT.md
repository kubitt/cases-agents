# Claude Code prompt: deploy "Social Intel Radar" to ASCN

Copy the text below into Claude Code opened in this folder (71-social-intel-radar/).

---

You are transferring the ready-made agent "Social Intel Radar" to the ASCN platform (ascn.ai).

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
   - workspace/skills/competitor-scan/SKILL.md → /data/workspace/skills/competitor-scan/SKILL.md
   - workspace/skills/trend-scan/SKILL.md → /data/workspace/skills/trend-scan/SKILL.md
   - workspace/skills/insight-digest/SKILL.md → /data/workspace/skills/insight-digest/SKILL.md
   - workspace/knowledge/NICHE_PROFILE.md → /data/workspace/knowledge/NICHE_PROFILE.md
   - workspace/knowledge/RESEARCH_METHOD.md → /data/workspace/knowledge/RESEARCH_METHOD.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets: none required. The core runs on native Google Sheets + built-in web search only. (Optional later: if you approve a paid data API from INTEGRATIONS.md, create CREATORCRAWL_API_KEY or TIKHUB_API_KEY in Settings → Secrets first — never wired into this build.)
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/AUTOMATIONS.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent will request Google Sheets via an OAuth button and offer Telegram as the notification channel.
7. Send the agent the first message "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~10 minutes, asks the first question about your niche and platforms).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
