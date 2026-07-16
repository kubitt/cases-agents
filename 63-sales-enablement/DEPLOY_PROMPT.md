# Claude Code prompt: deploy "Sales Enablement Copilot" to ASCN

Copy the text below into Claude Code opened in this folder (63-sales-enablement/).

---

You are transferring the ready-made agent "Sales Enablement Copilot" to the ASCN platform (ascn.ai).

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
   - workspace/skills/call-brief/SKILL.md → /data/workspace/skills/call-brief/SKILL.md
   - workspace/skills/objection-response/SKILL.md → /data/workspace/skills/objection-response/SKILL.md
   - workspace/skills/follow-up-notes/SKILL.md → /data/workspace/skills/follow-up-notes/SKILL.md
   - workspace/skills/battlecard-builder/SKILL.md → /data/workspace/skills/battlecard-builder/SKILL.md
   - workspace/knowledge/SALES_PROFILE.md → /data/workspace/knowledge/SALES_PROFILE.md
   - workspace/knowledge/COMPETITOR_BATTLECARDS.md → /data/workspace/knowledge/COMPETITOR_BATTLECARDS.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets: none required. This agent runs entirely on native OAuth integrations and built-in web search — do not create any Settings → Secrets entries.
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/AUTOMATIONS.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me manually: on first dialog the agent will request Google Calendar, Google Docs, Google Sheets, and Gmail via OAuth buttons, and offer Telegram as the delivery channel.
7. Send the agent the first message "Hi, let's set up" and confirm it starts the onboarding script (introduces itself, states ~12 minutes, asks the first question about what you sell).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
