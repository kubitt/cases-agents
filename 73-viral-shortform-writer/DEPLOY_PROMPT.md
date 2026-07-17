# Claude Code prompt: deploy "Viral Short-Form Writer" to ASCN

Copy the text below into Claude Code opened in this folder (73-viral-shortform-writer/).

---

You are transferring the ready-made agent "Viral Short-Form Writer" to the ASCN platform (ascn.ai).

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
   - workspace/skills/hook-forge/SKILL.md → /data/workspace/skills/hook-forge/SKILL.md
   - workspace/skills/caption-craft/SKILL.md → /data/workspace/skills/caption-craft/SKILL.md
   - workspace/skills/short-script/SKILL.md → /data/workspace/skills/short-script/SKILL.md
   - workspace/knowledge/CREATOR_VOICE.md → /data/workspace/knowledge/CREATOR_VOICE.md
   - workspace/knowledge/PLATFORM_SIGNALS.md → /data/workspace/knowledge/PLATFORM_SIGNALS.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets: none. This agent is fully native — no external API keys, nothing to add in Settings → Secrets.
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/AUTOMATIONS.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent will request Google Sheets via an OAuth button and offer Telegram; there are no secrets to paste.
7. Send the agent the first message "Hi, let's set up" and confirm it starts the onboarding script (introduces itself, states ~10 minutes, asks the first question about your niche).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
