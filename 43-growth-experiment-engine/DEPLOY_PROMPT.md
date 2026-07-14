# Claude Code prompt: deploy "Growth Experiment Engine" to ASCN

Copy the text below into Claude Code opened in this folder (43-growth-experiment-engine/).

---

You are transferring the ready-made agent "Growth Experiment Engine" to the ASCN platform (ascn.ai).

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
   - workspace/skills/experiment-intake/SKILL.md → /data/workspace/skills/experiment-intake/SKILL.md
   - workspace/skills/significance-analyzer/SKILL.md → /data/workspace/skills/significance-analyzer/SKILL.md
   - workspace/skills/experiment-designer/SKILL.md → /data/workspace/skills/experiment-designer/SKILL.md
   - workspace/knowledge/GROWTH_PROFILE.md → /data/workspace/knowledge/GROWTH_PROFILE.md
   - workspace/knowledge/EXPERIMENT_METHOD.md → /data/workspace/knowledge/EXPERIMENT_METHOD.md
   Do NOT touch platform system files (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/). Note: this agent ships its own AUTOMATIONS.md — if the platform already has one, keep the platform's cron policy and MERGE this file's task text into the agent's playbook rather than overwriting it.
3. Secrets before first run: none — this agent requires NO API keys or tokens. Every integration is native OAuth (Google Sheets, Telegram, optional Notion) or runs locally (built-in web search, Python scripts in the container). Do not create any secret.
4. Do NOT create automations yourself: the agent offers the one weekly-digest cron during onboarding (Monday 08:00, text in workspace/AUTOMATIONS.md), only if the user agrees.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent asks for the product/funnel and testing method, connects Google Sheets/Telegram via OAuth (no keys), and scores my first 3 test ideas live into the "Experiment Ledger" (it designs/scores/analyzes — it does not run tests or touch ad budgets).
7. Send the agent "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~9 minutes, asks the first product/funnel question).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
