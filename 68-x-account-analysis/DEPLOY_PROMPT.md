# Claude Code prompt: deploy "X Account Analyst" to ASCN

Copy the text below into Claude Code opened in this folder (68-x-account-analysis/).

---

You are transferring the ready-made agent "X Account Analyst" to the ASCN platform (ascn.ai).

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
   - workspace/skills/account-audit/SKILL.md → /data/workspace/skills/account-audit/SKILL.md
   - workspace/skills/post-analyzer/SKILL.md → /data/workspace/skills/post-analyzer/SKILL.md
   - workspace/skills/content-review/SKILL.md → /data/workspace/skills/content-review/SKILL.md
   - workspace/knowledge/ACCOUNT_PROFILE.md → /data/workspace/knowledge/ACCOUNT_PROFILE.md
   - workspace/knowledge/ANALYSIS_METHOD.md → /data/workspace/knowledge/ANALYSIS_METHOD.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets: none required for the core agent. (Optional upgrade only: if the user later adds an X data API, its key goes in Settings → Secrets as X_API_KEY — do not create it now.)
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/CRON_PLAYBOOK.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me manually: on first dialog the agent will request Google Sheets via an OAuth button, offer Telegram as the channel, and optionally Google Docs.
7. Send the agent the first message "Hi, let's set up" and confirm it starts the onboarding script (introduces itself, states ~10 minutes, asks the first question about the user's handle and goal).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
