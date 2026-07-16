# Claude Code prompt: deploy "SEO Optimizer" to ASCN

Copy the text below into Claude Code opened in this folder (58-seo-optimizer/).

---

You are transferring the ready-made agent "SEO Optimizer" to the ASCN platform (ascn.ai).

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
   - workspace/skills/keyword-research/SKILL.md → /data/workspace/skills/keyword-research/SKILL.md
   - workspace/skills/page-audit/SKILL.md → /data/workspace/skills/page-audit/SKILL.md
   - workspace/skills/content-brief/SKILL.md → /data/workspace/skills/content-brief/SKILL.md
   - workspace/skills/rank-tracker/SKILL.md → /data/workspace/skills/rank-tracker/SKILL.md
   - workspace/knowledge/SITE_PROFILE.md → /data/workspace/knowledge/SITE_PROFILE.md
   - workspace/knowledge/SEO_STANDARDS.md → /data/workspace/knowledge/SEO_STANDARDS.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets: none required for the native core (Search Console, Sheets, Docs, and web search cover everything). Optional paid upgrades (Ahrefs / Semrush / DataForSEO) are not wired in; only add their keys later if the user approves the budget in INTEGRATIONS.md.
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/AUTOMATIONS.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent will request Google Search Console, Google Sheets, and Google Docs via OAuth buttons, and offer Telegram.
7. Send the agent the first message "Hi, let's set up" and confirm it starts the onboarding script (introduces itself, states ~10 minutes, asks the first question about the website).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
