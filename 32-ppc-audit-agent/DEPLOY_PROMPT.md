# Claude Code prompt: deploy "PPC Audit Agent" to ASCN

Copy the text below into Claude Code opened in this folder (ppc-audit-agent/).

---

You are transferring the ready-made agent "PPC Audit Agent" to the ASCN platform (ascn.ai).

Access method (ask me if unclear from the environment):
A) Direct file access to the agent workspace — copy files directly.
B) ASCN workspace MCP (https://api.clawman.ascn.ai/api/v1/mcp, Bearer key from Settings → API) — pass file contents to the agent via the `chat` tool asking it to save to the given paths.

Do in order:
1. Read every file in this project's workspace/ folder.
2. Transfer into the ASCN agent workspace:
   - workspace/IDENTITY.md → /data/workspace/IDENTITY.md (replace)
   - workspace/SOUL.md → /data/workspace/SOUL.md (replace)
   - workspace/ONBOARDING.md → /data/workspace/ONBOARDING.md (new)
   - workspace/skills/ads-audit/SKILL.md → /data/workspace/skills/ads-audit/SKILL.md
   - workspace/skills/ads-platform-deep-dive/SKILL.md → /data/workspace/skills/ads-platform-deep-dive/SKILL.md
   - workspace/skills/ads-strategy/SKILL.md → /data/workspace/skills/ads-strategy/SKILL.md
   - workspace/skills/ads-math/SKILL.md → /data/workspace/skills/ads-math/SKILL.md
   - workspace/knowledge/ADS_CHECKLISTS.md → /data/workspace/knowledge/ADS_CHECKLISTS.md
   - workspace/knowledge/ADS_BENCHMARKS.md → /data/workspace/knowledge/ADS_BENCHMARKS.md
   Do NOT touch platform system files (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, rules/).
3. Secrets: none required. All integrations use native OAuth.
4. Do NOT create automations yourself: the agent creates them during onboarding (texts prepared in this folder's AUTOMATIONS.md — verify if you wish).
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me manually: on first dialog the agent will request ad platform integrations (Google Ads, Meta Ads, LinkedIn Ads, TikTok Ads — whichever the user runs) and Google Sheets via OAuth buttons, and offer Telegram channel setup.
7. Send the agent the first message "Hi, let's set up" and confirm it starts the onboarding script (introduces itself, states ~12 minutes, asks about business type and ad spend).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
