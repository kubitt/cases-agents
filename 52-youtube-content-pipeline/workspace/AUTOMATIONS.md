# Cron playbook — YouTube Content Engine

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Overnight idea scan
- Schedule: `0 4 * * *` — every day at 04:00; night shift: heavy web scanning runs while you sleep, results are ready by morning. Runs silently, no notification.
- Task prompt: "Read knowledge/CHANNEL_PROFILE.md for niche, audience, voice, and banned topics. Per skill topic-scout, search the open web for fresh, on-trend topics in the niche from the last 7 days. For each candidate: check novelty against Google Sheets 'Video Catalog' (already published) and 'Idea Backlog' (already logged); drop covered and near-duplicate topics; score the rest 1–10 with the rubric in knowledge/PACKAGE_PLAYBOOK.md. Append the new ideas to 'Idea Backlog' with status=new, novelty, score, angle, and source_urls. Do not notify — the morning digest delivers them."
- Delivers to: nothing at night; writes to "Idea Backlog" only.

### 2. Morning pitch digest
- Schedule: `0 8 * * 1-5` — weekdays at 08:00.
- Task prompt: "Open Google Sheets 'Idea Backlog'. Take rows with status=new from the last scan, sorted by score descending. Send a digest of the top 5: 'topic — angle — score — 1 source link' each. Set their status=pitched. End with 'Approve which to package? (all / numbers)'. If there are no new ideas, finish silently without notifying."
- Delivers to: Telegram (or ASCN chat).

### 3. Slack link intake (only if Slack was connected at onboarding)
- Schedule: `*/30 * * * *` — every 30 min (the user picks the interval at onboarding: 15 = faster but more credits, 60 = cheaper).
- Task prompt: "Check the named Slack intake channel for links posted newer than the saved marker in memory (last_intake_check). Nothing new — finish silently and update the marker. For each new link: run skill link-researcher, append the resulting idea to 'Idea Backlog' with status=new. If inside the notification window, post a one-line 'Logged: <topic> (score N)'. Update the marker."
- Delivers to: Telegram (or ASCN chat), in-window only.

## Rules
Reactivity is polling (task 3) — this agent does not use platform event hooks. Notifications only 08:00–23:00 user time; night runs prepare, mornings deliver (critical alerts exempt).
