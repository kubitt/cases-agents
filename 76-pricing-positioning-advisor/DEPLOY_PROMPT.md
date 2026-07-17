# Claude Code prompt: deploy "Pricing & Positioning Advisor" to ASCN

Copy the text below into Claude Code opened in this folder (76-pricing-positioning-advisor/).

---

You are transferring the ready-made agent "Pricing & Positioning Advisor" to the ASCN platform (ascn.ai).

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
   - workspace/skills/pricing-analysis/SKILL.md → /data/workspace/skills/pricing-analysis/SKILL.md
   - workspace/skills/positioning-builder/SKILL.md → /data/workspace/skills/positioning-builder/SKILL.md
   - workspace/skills/competitor-pricing-research/SKILL.md → /data/workspace/skills/competitor-pricing-research/SKILL.md
   - workspace/knowledge/PRODUCT_PROFILE.md → /data/workspace/knowledge/PRODUCT_PROFILE.md
   - workspace/knowledge/PRICING_FRAMEWORKS.md → /data/workspace/knowledge/PRICING_FRAMEWORKS.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets: none — this agent requires NO API keys or tokens. Every integration is native OAuth (Google Sheets, Google Docs, Telegram) or runs locally (built-in web reading). Do not create any secret.
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/AUTOMATIONS.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent will request Google Sheets and Google Docs via OAuth buttons and offer Telegram — no keys — then run a first real pricing and positioning pass (it recommends; it does not decide or implement for me).
7. Send the agent the first message "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~12 minutes, asks the first question about my product and price).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
