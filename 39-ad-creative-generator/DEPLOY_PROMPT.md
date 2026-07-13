# Claude Code prompt: deploy "Ad Creative Generator" to ASCN

Copy the text below into Claude Code opened in this folder (39-ad-creative-generator/).

---

You are transferring the ready-made agent "Ad Creative Generator" to the ASCN platform (ascn.ai).

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
   - workspace/skills/brief-intake/SKILL.md → /data/workspace/skills/brief-intake/SKILL.md
   - workspace/skills/ad-copywriter/SKILL.md → /data/workspace/skills/ad-copywriter/SKILL.md
   - workspace/skills/creative-packager/SKILL.md → /data/workspace/skills/creative-packager/SKILL.md
   - workspace/knowledge/BRIEF_TEMPLATE.md → /data/workspace/knowledge/BRIEF_TEMPLATE.md
   - workspace/knowledge/HOOKS_LIBRARY.md → /data/workspace/knowledge/HOOKS_LIBRARY.md
   Do NOT touch platform system files (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/). Note: this agent ships its own AUTOMATIONS.md — if the platform already has one, keep the platform's cron policy and merge this file's task text into the agent's playbook rather than overwriting.
3. Secrets before first run: create in Settings → Secrets: OPENROUTER_API_KEY (from openrouter.ai/keys). Optional: FIRECRAWL_API_KEY (firecrawl.dev, for competitor-page analysis).
4. Do NOT create automations yourself: the agent offers an optional weekly-batch cron during onboarding (text in workspace/AUTOMATIONS.md), only if the user agrees.
5. Verify yourself: list transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent asks for the product/audience and platform, requests the OpenRouter key and Google Sheets/Drive/Telegram via OAuth, and runs a real test batch of 5 variants (it delivers creatives — it does not publish ads).
7. Send the agent "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~9 minutes, asks the first product question).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
