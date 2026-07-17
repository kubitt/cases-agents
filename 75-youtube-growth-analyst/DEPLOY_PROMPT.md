# Claude Code prompt: deploy "YouTube Growth Analyst" to ASCN

Copy the text below into Claude Code opened in this folder (75-youtube-growth-analyst/).

---

You are transferring the ready-made agent "YouTube Growth Analyst" to the ASCN platform (ascn.ai).

Access method (ask me if unclear from the environment):
A) Direct file access to the agent workspace — copy files directly.
B) ASCN workspace MCP (https://api.clawman.ascn.ai/api/v1/mcp, Bearer key from Settings → API; tools: chat, list_history, list_memory, delete) — pass file contents via the `chat` tool asking the agent to save to the given paths.

Do in order:
1. Read every file in this project's workspace/ folder.
2. Transfer into the ASCN agent workspace:
   - workspace/IDENTITY.md → /data/workspace/IDENTITY.md (replace)
   - workspace/SOUL.md → /data/workspace/SOUL.md (replace)
   - workspace/ONBOARDING.md → /data/workspace/ONBOARDING.md (new)
   - workspace/AUTOMATIONS.md → /data/workspace/AUTOMATIONS.md (new; the agent reads it when creating cron tasks)
   - workspace/skills/channel-audit/SKILL.md → /data/workspace/skills/channel-audit/SKILL.md
   - workspace/skills/competitor-benchmark/SKILL.md → /data/workspace/skills/competitor-benchmark/SKILL.md
   - workspace/skills/growth-roadmap/SKILL.md → /data/workspace/skills/growth-roadmap/SKILL.md
   - workspace/knowledge/CHANNEL_PROFILE.md → /data/workspace/knowledge/CHANNEL_PROFILE.md
   - workspace/knowledge/BENCHMARK_LIBRARY.md → /data/workspace/knowledge/BENCHMARK_LIBRARY.md
   Do NOT touch platform system files: AGENTS.md, USER.md, MEMORY_POLICY.md, INTEGRATIONS.md, CHANNELS.md, TOOLS.md, HEARTBEAT.md, rules/, files/.
3. Secrets (create in Settings → Secrets before first run only if the user wants the automatic public/competitor pulls):
   - YOUTUBE_API_KEY — OPTIONAL and FREE. A YouTube Data API v3 key from a Google Cloud project (10,000 units/day free, $0/mo). It enables public own-channel and competitor stats. Without it the agent runs in manual-paste mode and the user pastes numbers from YouTube Studio. Do NOT create it for the user — the agent explains the 2-minute setup during onboarding.
   - DATAFORSEO_LOGIN and DATAFORSEO_PASSWORD — OPTIONAL, only for the paid live-keyword SEO upgrade (DataForSEO, ~$5–30/mo light use). Not used by the shipped build; leave unset unless the user asks to turn the upgrade on.
4. Do NOT create automations yourself: the agent creates them during onboarding, reading workspace/AUTOMATIONS.md.
5. Verify yourself: list the transferred files and print the first 3 lines of each from the agent workspace.
6. Remind me manually: on first dialog the agent will request Google Sheets and Google Docs via OAuth buttons, offer Telegram as the channel, and walk the user through the optional free YOUTUBE_API_KEY (or manual-paste mode).
7. Send the agent the first message "Hi, let's set up" and confirm it starts the onboarding script (introduces itself, states ~12 minutes, asks the first question about the channel handle and primary goal).

Ready criterion: files in place; the agent responds with the onboarding scenario, not generic chat.
