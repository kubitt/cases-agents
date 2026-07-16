# Claude Code prompt: deploy "Market Research Factory" to ASCN

Copy the text below into Claude Code opened in this folder (46-market-research-factory/).

---

You are transferring the ready-made agent "Market Research Factory" to the ASCN platform (ascn.ai).

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
   - workspace/skills/pain-signal-mining/SKILL.md → /data/workspace/skills/pain-signal-mining/SKILL.md
   - workspace/skills/opportunity-ranking/SKILL.md → /data/workspace/skills/opportunity-ranking/SKILL.md
   - workspace/skills/opportunity-brief/SKILL.md → /data/workspace/skills/opportunity-brief/SKILL.md
   - workspace/knowledge/RESEARCH_PROFILE.md → /data/workspace/knowledge/RESEARCH_PROFILE.md
   - workspace/knowledge/SCORING_RUBRIC.md → /data/workspace/knowledge/SCORING_RUBRIC.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets before first run: none — this agent requires NO API keys or tokens. Every integration is native OAuth (Google Sheets, Google Docs, Telegram, optional Notion) or runs locally (built-in web search, Python scripts in the container). Do not create any secret.
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/AUTOMATIONS.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent will request Google Sheets and Google Docs via OAuth buttons and offer Telegram — no keys — then run a live research pass on my first topic (it researches and briefs; it does not build or ship the app).
7. Send the agent "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~10 minutes, asks the first question about the topics I want mined).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
