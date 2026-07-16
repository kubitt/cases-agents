# Claude Code prompt: deploy "Daily Reddit Digest" to ASCN

Copy the text below into Claude Code opened in this folder (48-daily-reddit-digest/).

---

You are transferring the ready-made agent "Daily Reddit Digest" to the ASCN platform (ascn.ai).

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
   - workspace/skills/subreddit-digest/SKILL.md → /data/workspace/skills/subreddit-digest/SKILL.md
   - workspace/skills/post-deep-dive/SKILL.md → /data/workspace/skills/post-deep-dive/SKILL.md
   - workspace/skills/preference-tuning/SKILL.md → /data/workspace/skills/preference-tuning/SKILL.md
   - workspace/knowledge/SUBREDDIT_LIST.md → /data/workspace/knowledge/SUBREDDIT_LIST.md
   - workspace/knowledge/DIGEST_PREFERENCES.md → /data/workspace/knowledge/DIGEST_PREFERENCES.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets before first run: none required. The core digest reads Reddit's public pages with built-in web reading — no API key or token. (Optional, only if the user later asks for the Reddit official API upgrade: create the key in Settings → Secrets then; not needed to start.)
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/AUTOMATIONS.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me: on first dialog the agent will request Google Sheets via an OAuth button and offer a Telegram channel; no keys are needed for the core digest.
7. Send the agent "Hi, let's set up" and confirm it starts onboarding (introduces itself, states ~10 minutes, asks the first question about which subreddits to follow).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
