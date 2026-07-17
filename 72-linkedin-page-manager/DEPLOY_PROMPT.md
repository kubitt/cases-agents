# Claude Code prompt: deploy "LinkedIn Page Manager" to ASCN

Copy the text below into Claude Code opened in this folder (72-linkedin-page-manager/).

---

You are transferring the ready-made agent "LinkedIn Page Manager" to the ASCN platform (ascn.ai).

Access method (ask me if unclear from the environment):
A) Direct file access to the agent workspace — copy files directly.
B) ASCN workspace MCP (https://api.clawman.ascn.ai/api/v1/mcp, Bearer key from Settings → API; tools: chat, list_history, list_memory, delete) — pass file contents via the `chat` tool asking the agent to save to the given paths.

Do in order:
1. Read every file in this project's workspace/ folder.
2. Transfer into the ASCN agent workspace:
   - workspace/IDENTITY.md → /data/workspace/IDENTITY.md (replace)
   - workspace/SOUL.md → /data/workspace/SOUL.md (replace)
   - workspace/ONBOARDING.md → /data/workspace/ONBOARDING.md (new)
   - workspace/AUTOMATIONS.md → /data/workspace/AUTOMATIONS.md (new; the agent reads it when it sets up crons)
   - workspace/skills/page-post-writer/SKILL.md → /data/workspace/skills/page-post-writer/SKILL.md
   - workspace/skills/page-publisher/SKILL.md → /data/workspace/skills/page-publisher/SKILL.md
   - workspace/skills/page-analytics/SKILL.md → /data/workspace/skills/page-analytics/SKILL.md
   - workspace/knowledge/PAGE_PROFILE.md → /data/workspace/knowledge/PAGE_PROFILE.md
   - workspace/knowledge/PUBLISHING_RULES.md → /data/workspace/knowledge/PUBLISHING_RULES.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets — all OPTIONAL, only needed for connected auto-publish mode (draft mode needs none): create in Settings → Secrets if the user wants connected mode: LINKEDIN_ACCESS_TOKEN (from the user's own LinkedIn developer app with Community Management API access), and optionally X_BEARER_TOKEN and THREADS_ACCESS_TOKEN (for text fan-out). Skip all of these for draft mode.
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/AUTOMATIONS.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent will request Google Sheets and Google Docs via OAuth buttons, offer Telegram, and — only for connected mode — the optional tokens from step 3.
7. Send the agent "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~10 minutes, asks the first question about the company and Page).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
