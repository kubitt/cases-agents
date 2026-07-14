# Claude Code prompt: deploy "SMM Content Factory" to ASCN

Copy the text below into Claude Code opened in this folder (37-smm-content-factory/).

---

You are transferring the ready-made agent "SMM Content Factory" to the ASCN platform (ascn.ai).

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
   - workspace/skills/trend-research/SKILL.md → /data/workspace/skills/trend-research/SKILL.md
   - workspace/skills/post-writer/SKILL.md → /data/workspace/skills/post-writer/SKILL.md
   - workspace/skills/post-publisher/SKILL.md → /data/workspace/skills/post-publisher/SKILL.md
   - workspace/knowledge/BRAND_PROFILE.md → /data/workspace/knowledge/BRAND_PROFILE.md
   - workspace/knowledge/CONTENT_PLAYBOOK.md → /data/workspace/knowledge/CONTENT_PLAYBOOK.md
   Do NOT touch platform system files (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/). Note: this agent ships its own AUTOMATIONS.md — if the platform already has one, keep the platform's cron policy and merge this file's task texts into the agent's playbook rather than overwriting.
3. Secrets before first run: create in Settings → Secrets: OPENROUTER_API_KEY (from openrouter.ai/keys). Optional: BLOTATO_API_KEY (blotato.com, for Instagram/X/LinkedIn autopublish), VK_TOKEN (VK API, for VK wall).
4. Do NOT create automations yourself: the agent offers the weekly-prep and autoposting crons during onboarding (texts in workspace/AUTOMATIONS.md), only if the user agrees.
5. Verify yourself: list transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent asks for the brand + networks, requests Google Sheets and Telegram via OAuth, asks for the OpenRouter key, and runs a real test package for approval before publishing.
7. Send the agent "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~10 minutes, asks the first brand question).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
