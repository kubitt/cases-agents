# Claude Code prompt: deploy "Idea to Reality" to ASCN

Copy the text below into Claude Code opened in this folder (54-idea-to-reality/).

---

You are transferring the ready-made agent "Idea to Reality" to the ASCN platform (ascn.ai).

Access method (ask me if unclear from the environment):
A) Direct file access to the agent workspace — copy files directly.
B) ASCN workspace MCP (https://api.clawman.ascn.ai/api/v1/mcp, Bearer key from Settings → API; tools: chat, list_history, list_memory, delete) — pass file contents via the `chat` tool asking the agent to save to the given paths.

Do in order:
1. Read every file in this project's workspace/ folder.
2. Transfer into the ASCN agent workspace:
   - workspace/IDENTITY.md → /data/workspace/IDENTITY.md (replace)
   - workspace/SOUL.md → /data/workspace/SOUL.md (replace)
   - workspace/ONBOARDING.md → /data/workspace/ONBOARDING.md (new)
   - workspace/CRON_PLAYBOOK.md → /data/workspace/CRON_PLAYBOOK.md (new; the agent reads it when creating cron tasks)
   - workspace/skills/idea-intake/SKILL.md → /data/workspace/skills/idea-intake/SKILL.md
   - workspace/skills/reality-check/SKILL.md → /data/workspace/skills/reality-check/SKILL.md
   - workspace/skills/concept-brief/SKILL.md → /data/workspace/skills/concept-brief/SKILL.md
   - workspace/knowledge/IDEA_PROFILE.md → /data/workspace/knowledge/IDEA_PROFILE.md
   - workspace/knowledge/VALIDATION_METHOD.md → /data/workspace/knowledge/VALIDATION_METHOD.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets before first run: none — this agent requires NO API keys or tokens. Every integration is native OAuth (Google Sheets, Google Docs, Google Drive, Telegram) or built-in web search. Do not create any secret.
4. Do NOT create automations yourself: the agent offers the one weekly digest cron during onboarding (Monday 08:00, text in workspace/CRON_PLAYBOOK.md), only if the user agrees.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me manually: on first dialog the agent connects Google Sheets and Google Docs (and optionally Drive, Telegram) via OAuth buttons — no keys — then validates my first real idea live into the "Idea Ledger" (it validates and structures; it does not build the product for me).
7. Send the agent the first message "Hi, let's set up" and confirm it starts the onboarding script (introduces itself, states ~8 minutes, asks the first question about my building context).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
