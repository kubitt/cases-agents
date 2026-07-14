# Claude Code prompt: deploy "Inbound Request Router" to ASCN

Copy the text below into Claude Code opened in this folder (40-inbound-request-router/).

---

You are transferring the ready-made agent "Inbound Request Router" to the ASCN platform (ascn.ai).

Access method (ask me if unclear from the environment):
A) Direct file access to the agent workspace — copy files directly.
B) ASCN workspace MCP (https://api.clawman.ascn.ai/api/v1/mcp, Bearer key from Settings → API) — pass file contents via the `chat` tool asking the agent to save to the given paths.

Do in order:
1. Read every file in this project's workspace/ folder.
2. Transfer into the ASCN agent workspace:
   - workspace/IDENTITY.md → /data/workspace/IDENTITY.md (replace)
   - workspace/SOUL.md → /data/workspace/SOUL.md (replace)
   - workspace/ONBOARDING.md → /data/workspace/ONBOARDING.md (new)
   - workspace/AUTOMATIONS.md → /data/workspace/AUTOMATIONS.md (new; the agent reads it when creating crons)
   - workspace/skills/intake-poll/SKILL.md → /data/workspace/skills/intake-poll/SKILL.md
   - workspace/skills/request-classify/SKILL.md → /data/workspace/skills/request-classify/SKILL.md
   - workspace/skills/request-route/SKILL.md → /data/workspace/skills/request-route/SKILL.md
   - workspace/knowledge/ROUTING_MATRIX.md → /data/workspace/knowledge/ROUTING_MATRIX.md
   - workspace/knowledge/CLASSIFICATION_RULES.md → /data/workspace/knowledge/CLASSIFICATION_RULES.md
   Do NOT touch platform system files (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/). Note: this agent ships its own AUTOMATIONS.md — if the platform already has one, keep the platform's cron policy and merge this file's task texts into the agent's playbook rather than overwriting.
3. Secrets before first run: none required (native Gmail, Telegram, Sheets).
4. Do NOT create automations yourself: the agent creates the polling cron during onboarding, reading workspace/AUTOMATIONS.md.
5. Verify yourself: list transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent asks about my channels, requests Gmail/Telegram and Google Sheets via OAuth, and runs a live test on recent requests — showing how each is classified and routed (it does not reply to customers).
7. Send the agent "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~8 minutes, asks the first channels question).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
