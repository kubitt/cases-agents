# Claude Code prompt: deploy "Community Inbox Manager" to ASCN

Copy the text below into Claude Code opened in this folder (74-community-inbox-manager/).

---

You are transferring the ready-made agent "Community Inbox Manager" to the ASCN platform (ascn.ai).

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
   - workspace/skills/inbox-triage/SKILL.md → /data/workspace/skills/inbox-triage/SKILL.md
   - workspace/skills/review-watch/SKILL.md → /data/workspace/skills/review-watch/SKILL.md
   - workspace/skills/response-digest/SKILL.md → /data/workspace/skills/response-digest/SKILL.md
   - workspace/knowledge/BRAND_REPLY_VOICE.md → /data/workspace/knowledge/BRAND_REPLY_VOICE.md
   - workspace/knowledge/CHANNEL_SOURCES.md → /data/workspace/knowledge/CHANNEL_SOURCES.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets: none required for the native core (Google Sheets + Telegram/Slack/Gmail + built-in web reading only). OPTIONAL, and only if the user later adds connected sources from INTEGRATIONS.md: create SOCIAL_INBOX_API_KEY (paid social-inbox API, for Instagram / Facebook / X) and/or GOOGLE_BUSINESS_TOKEN (to post review replies directly) in Settings → Secrets first. Do not create these for the native build.
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/AUTOMATIONS.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent will request Google Sheets via an OAuth button, offer to connect Telegram / Slack / Gmail (whichever the user uses), and offer Telegram as the notification channel.
7. Send the agent the first message "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~10 minutes, asks the first question about the business and reply voice).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
