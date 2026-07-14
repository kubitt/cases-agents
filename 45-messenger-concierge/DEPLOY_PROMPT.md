# Claude Code prompt: deploy "Messenger Concierge" to ASCN

Copy the text below into Claude Code opened in this folder (messenger-concierge/).

---

You are transferring the ready-made agent "Messenger Concierge" to the ASCN platform (ascn.ai).

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
   - workspace/skills/answer-inquiry/SKILL.md → /data/workspace/skills/answer-inquiry/SKILL.md
   - workspace/skills/take-order-booking/SKILL.md → /data/workspace/skills/take-order-booking/SKILL.md
   - workspace/skills/send-reminder/SKILL.md → /data/workspace/skills/send-reminder/SKILL.md
   - workspace/knowledge/BUSINESS_PROFILE.md → /data/workspace/knowledge/BUSINESS_PROFILE.md
   - workspace/knowledge/CONVERSATION_VOICE.md → /data/workspace/knowledge/CONVERSATION_VOICE.md
   Do NOT touch platform system files (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, rules/).
3. Secrets: none required for the default setup — Telegram, Notion/Sheets, and Calendar are native OAuth connected during onboarding. (Only if the user later adds WhatsApp: store the provider key in Settings → Secrets then.)
4. Do NOT create automations yourself: the agent sets up the reminder cron during onboarding (texts in workspace/AUTOMATIONS.md — verify if you wish).
5. Verify yourself: list transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent will request Telegram, an order destination (Notion or Sheets), and optionally Calendar via connect buttons.
7. Send the agent "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~8 minutes, asks to connect Telegram first).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
