# Cron playbook — Brand Reputation Monitor

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Mention scan
- Schedule: `0 */6 * * *` — every 6 hours (the user picks the interval at onboarding: hourly = faster reaction but more credits, every 6 hours = balanced default, daily = cheapest). Scans may run at night; alerts are held for the notification window.
- Task prompt: "For each source in knowledge/SOURCE_LIST.md, use built-in web search and page reading to find brand mentions newer than the saved `last_scan_marker` for that source (skip anything already in the log). If nothing new, finish silently and update the marker. For each new mention: run skill sentiment-scoring; append a row to Google Sheets 'Mention Log' with date, source, url, author, snippet, sentiment, score, confidence, topic, status=new, notes. If any mention is a high-confidence negative, prepare an alert with the link and a short suggested reply draft, and send it to the channel only between 08:00 and 23:00 (or immediately if the user chose always-on urgent alerts). Update `last_scan_marker` per source."
- Delivers to: Telegram (negative alerts only; silent when nothing negative is new).

### 2. Weekly reputation digest
- Schedule: `0 8 * * 1` — every Monday at 08:00.
- Task prompt: "Read Google Sheets 'Mention Log' for the last 7 days and build the digest per skill weekly-digest: total mentions, sentiment split (negative / neutral / positive counts and share), week-over-week trend versus the prior 7 days, the top 3 negatives with their url, and one recommended action. If fewer than 5 mentions this week, say 'insufficient data' for the trend instead of forcing one. Deliver to Telegram, max 18 lines."
- Delivers to: Telegram.

## Rules
Reactivity here is polling (task 1) — this agent does not use platform event hooks. Notifications only 08:00–23:00 user time; night runs prepare and stay silent, except a critical reputation alert the user explicitly opted into.
