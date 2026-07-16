# Claude Code prompt: deploy "Overnight Mini-App Builder" to ASCN

Copy the text below into Claude Code opened in this folder (61-overnight-mini-app-builder/).

---

You are transferring the ready-made agent "Overnight Mini-App Builder" to the ASCN platform (ascn.ai).

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
   - workspace/skills/build-intake/SKILL.md → /data/workspace/skills/build-intake/SKILL.md
   - workspace/skills/overnight-build/SKILL.md → /data/workspace/skills/overnight-build/SKILL.md
   - workspace/skills/ship-artifact/SKILL.md → /data/workspace/skills/ship-artifact/SKILL.md
   - workspace/knowledge/BUILD_PREFERENCES.md → /data/workspace/knowledge/BUILD_PREFERENCES.md
   - workspace/knowledge/SPEC_TEMPLATE.md → /data/workspace/knowledge/SPEC_TEMPLATE.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets before first run: none required. Every core integration is native OAuth (GitHub, Google Drive, Google Sheets, Telegram) or runs locally (built-in web search and page reading, plus code that runs in the agent's container). Do not create any secret. Only if the user later wires an optional live-deploy provider (Vercel/Netlify) would they add that provider's token in Settings → Secrets — not needed for the core agent.
4. Do NOT create automations yourself: the agent creates the two crons during onboarding (Overnight build 02:00, Morning delivery 08:00), reading workspace/CRON_PLAYBOOK.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent requests Google Drive, Google Sheets, and Telegram via OAuth buttons, and GitHub when the user first wants to ship code — no API keys needed.
7. Send the agent the first message "Hi, let's set up" and confirm it starts the onboarding script (introduces itself, states ~10 minutes, asks the first question about what to build).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
