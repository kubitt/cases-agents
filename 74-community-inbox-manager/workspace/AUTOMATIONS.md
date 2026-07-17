# Cron playbook — Community Inbox Manager

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Inbox and review poll
- Schedule: `*/30 8-22 * * *` — every 30 minutes, 08:00–22:00 user time (you pick the interval at onboarding: 15 minutes = faster reaction but more credits, 30 = balanced default, 60 = cheaper). New items are picked up at the next run, not instantly.
- Task prompt: "Run skill inbox-triage on the connected channels (Telegram, Slack, Gmail): read messages newer than the saved poll marker, classify each, draft a reply in the brand voice, and append rows to Google Sheets 'Inbox Queue' (date, channel, author, message, intent, priority, sentiment, reply_draft, status, notes). Then run skill review-watch on the review pages in knowledge/CHANNEL_SOURCES.md: log new reviews (deduped by url) as channel=review and draft a reply for every negative one. If nothing new, finish silently and update the marker. If a high-priority item or a negative review appeared, send one short alert with its draft to the channel, only between 08:00 and 23:00. Never send or post any reply — drafts only."
- Delivers to: Telegram (alerts only; silent when nothing high-priority or negative is new).

### 2. Daily response digest
- Schedule: `0 9 * * *` — every day at 09:00.
- Task prompt: "Run skill response-digest: read Google Sheets 'Inbox Queue', take every row with status new, drafted, or escalated, sort escalated then high priority then negative first and then oldest, and send a short digest to the channel — total waiting, how many high-priority, how many negative reviews, the age of the oldest item, and a compact line per item with the first line of its reply_draft. Flag anything past its response-time SLA from knowledge/CHANNEL_SOURCES.md. If nothing is waiting, finish silently and send nothing."
- Delivers to: Telegram.

## Rules
Reactivity here is polling (task 1) — this agent does not watch your channels in real time and uses no platform event hooks. New items are handled at the next poll. Notifications only 08:00–23:00 user time; the poll runs 08:00–22:00 and night stays silent, except a genuinely critical item you explicitly opted into.
