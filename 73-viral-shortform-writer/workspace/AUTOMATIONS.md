# Cron playbook — Viral Short-Form Writer

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change the schedule and wording — the agent will follow the updated version.

## Cron tasks

### 1. Weekly idea refresh
- Schedule: `0 8 * * 1` — every Monday at 08:00.
- Task prompt: "Read knowledge/CREATOR_VOICE.md for the niche, audience, and primary platform. Use built-in web search to find 5 fresh angles worth a short-form video this week in that niche; keep a source_url for any claim or number. For each angle write one strong opening hook. Append 5 rows to Google Sheets 'Idea Bank': date=today, platform=primary platform, topic, hook, angle, status=idea, performance_notes=blank. Then send the 5 angles with their one-line hooks to the notification channel. Do not write full scripts unless the user asks."
- Delivers to: Telegram (or ASCN chat).

## Rules
Reactivity: this agent is mostly on-command — you ask, it writes. The one weekly task above just keeps the "Idea Bank" full so you never start from a blank page; it runs on a fixed weekly schedule (polling), not a live event listener.
Notifications only 08:00–23:00 user time (a broken-access or failed-run alert is the only exception).
