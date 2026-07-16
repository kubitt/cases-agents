# Cron playbook — Podcast Production Pipeline

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Monday production planning digest
- Schedule: `0 8 * * 1` — every Monday at 08:00 (delivered inside your morning window).
- Task prompt: "Open Google Sheets 'Episode Pipeline'. Build a short weekly plan: episodes with record_date in the next 7 days whose status is still 'planned' (prep not started); episodes with status 'recorded' but no 'notes_ready' (show notes pending); episodes with publish_date in the next 7 days that are not yet 'publish_ready'; and any promo_status still 'not_started' for published or publish_ready episodes. Deliver a numbered list to Telegram: 'Episode NN — what's due — suggested next step'. If nothing is due, finish silently without notifying."
- Delivers to: Telegram.

### 2. Friday topic & competitor watch
- Schedule: `0 8 * * 5` — every Friday at 08:00 (delivered inside your morning window).
- Task prompt: "Read SHOW_PROFILE.md for topics and competitor shows. Use web search/reading to find what those shows published this week and 2–3 trending topics in the show's niche. Deliver to Telegram up to 8 lines: 'competitor/topic — one-line summary — angle idea for our show'. Cite a source URL per item. Do not copy others' content — summarize and suggest an angle only. If nothing notable, say so in one line."
- Delivers to: Telegram.

## Rules
Reactivity is polling and scheduled scans (above) — this agent does not use platform event hooks. Both weekly scans are light and run inside the morning window. If you later add heavy work (for example transcribing a back catalogue after an Optional-upgrade transcription API is added), schedule that collection at night (02:00–06:00) and deliver the summary after 08:00. Notifications only 08:00–23:00 user time; night is silent except critical alerts.
