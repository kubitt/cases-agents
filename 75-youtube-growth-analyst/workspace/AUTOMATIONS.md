# Cron playbook — YouTube Growth Analyst

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Monthly re-audit (morning delivery)
- Schedule: `0 8 1 * *` — the 1st of every month at 08:00 (user timezone). Heavy data pulls run first thing so the summary is ready in the morning window; the user is not pinged before then.
- Task prompt: "Re-run skill channel-audit on the user's channel (YouTube Data API if YOUTUBE_API_KEY is set, otherwise ask the user to paste the public numbers), and skill competitor-benchmark on the competitors in knowledge/CHANNEL_PROFILE.md. Append new rows to Google Sheets 'Channel Audit Log' (columns date, metric, value, benchmark, verdict, source, notes) and 'Competitor Benchmark' (columns date, competitor, subscribers, avg_views, upload_cadence, view_sub_ratio, top_format, notes). Compare each metric to the same metric last month. Deliver max 15 lines: what changed since last month + the top 3 actions. Tag every line [fact] or [hypothesis]; mark each number api / studio-paste / estimate; never mix a verified number with an estimate. If no key and no pasted numbers are available, deliver the comparison from the last logged rows and say what is missing."
- Delivers to: Telegram or ASCN chat (set at onboarding).

### 2. Weekly competitor pulse (morning delivery)
- Schedule: `0 8 * * 1` — every Monday at 08:00 (user timezone).
- Task prompt: "Do a light check on the competitors in knowledge/CHANNEL_PROFILE.md (YouTube Data API if the key is set, otherwise their public pages). Look only for something that stands out: a breakout video well above their average views, or a clear change in upload cadence. If nothing stands out, finish silently and do not notify. If something stands out, send a 3–5 line note naming the competitor, the move, and one thing the user might try — tagged [fact] or [hypothesis]."
- Delivers to: Telegram or ASCN chat (set at onboarding).

## Reactivity
Reactivity here is polling: both tasks run on their schedule and compare against the last logged rows or a saved marker; this agent does not use platform event hooks. Heavy API pulls are front-loaded at the start of each run (night execution is fine if the user prefers — shift the collection earlier, e.g. `0 3 ...`, and keep delivery in the morning). Notifications respect the user's window (default 08:00–23:00); night is silent except critical alerts (broken access, failed run).
