# Claude Code prompt: deploy "Dynamic Dashboard" to ASCN

Copy the text below into Claude Code opened in this folder (51-dynamic-dashboard/).

---

You are transferring the ready-made agent "Dynamic Dashboard" to the ASCN platform (ascn.ai).

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
   - workspace/skills/metric-intake/SKILL.md → /data/workspace/skills/metric-intake/SKILL.md
   - workspace/skills/dashboard-build/SKILL.md → /data/workspace/skills/dashboard-build/SKILL.md
   - workspace/skills/trend-lookup/SKILL.md → /data/workspace/skills/trend-lookup/SKILL.md
   - workspace/knowledge/DASHBOARD_PROFILE.md → /data/workspace/knowledge/DASHBOARD_PROFILE.md
   - workspace/knowledge/METRIC_DEFINITIONS.md → /data/workspace/knowledge/METRIC_DEFINITIONS.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets before first run: none — the native core requires NO API keys or tokens. Every source is native OAuth (Google Sheets, Drive, Docs, Gmail), built-in web search, or a value the user pastes; Python runs in the container. Do not create any secret. (Paid data connectors are optional and set up later only if the user asks.)
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/AUTOMATIONS.md (the morning build, and an optional midday refresh) — only if the user agrees.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me manually: on first dialog the agent will request Google Sheets (and optionally Drive/Docs/Gmail/Telegram) via OAuth buttons; no external key is needed for the native core.
7. Send the agent the first message "Hi, let's set up" and confirm it starts the onboarding script (introduces itself, states ~10 minutes, asks the first question about which metrics to track).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
