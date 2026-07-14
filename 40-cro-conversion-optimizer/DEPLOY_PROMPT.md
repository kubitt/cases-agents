# Claude Code prompt: deploy "CRO Conversion Optimizer" to ASCN

Copy the text below into Claude Code opened in this folder (40-cro-conversion-optimizer/).

---

You are transferring the ready-made agent "CRO Conversion Optimizer" to the ASCN platform (ascn.ai).

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
   - workspace/skills/page-audit/SKILL.md → /data/workspace/skills/page-audit/SKILL.md
   - workspace/skills/copy-rewrite/SKILL.md → /data/workspace/skills/copy-rewrite/SKILL.md
   - workspace/skills/test-planner/SKILL.md → /data/workspace/skills/test-planner/SKILL.md
   - workspace/knowledge/CONVERSION_PROFILE.md → /data/workspace/knowledge/CONVERSION_PROFILE.md
   - workspace/knowledge/CRO_CHECKLIST.md → /data/workspace/knowledge/CRO_CHECKLIST.md
   Do NOT touch platform system files (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/). Note: this agent ships its own AUTOMATIONS.md — if the platform already has one, keep the platform's cron policy and MERGE this file's task text into the agent's playbook rather than overwriting it.
3. Secrets before first run: none. This agent requires NO API keys, tokens, or external secrets — it uses only native integrations (built-in web reading, built-in web search, Google Sheets, Notion, Telegram). Nothing to create in Settings → Secrets.
4. Do NOT create automations yourself: the agent offers an optional monthly re-audit cron during onboarding (text in workspace/AUTOMATIONS.md), only if the user agrees.
5. Verify yourself: list transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent asks for the product and conversion goal, brand voice, and real proof, requests Google Sheets (or Notion) and Telegram via OAuth, and runs a real audit + rewrites + ranked tests (it delivers recommendations — it does not publish or edit the live site).
7. Send the agent "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~8 minutes, asks the first product/goal question).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
