# Cron playbook — Business Planning & Reporting Officer

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Daily meeting prep
- Schedule: `0 8 * * 1-5` — every weekday at 08:00 (set which days at onboarding Step 8).
- Task prompt: "Read Google Calendar for today's events that have other attendees or a clear agenda. For each, build a short situation brief per skill report-prep using the KPI Dashboard and any related 'Plan — {name}' Doc: who is in the room, the goal, the 2–3 relevant numbers with their status, and the decision likely needed. If the day has no such meetings, finish silently without notifying. Deliver one compact message per meeting."
- Delivers to: Telegram.

### 2. Weekly executive brief
- Schedule: `0 8 * * 1` — every Monday at 08:00.
- Task prompt: "Per skill report-prep, roll up the KPI Dashboard for the period: overall RAG headline, each metric's status and trend, and the red list with sources. Add plan progress from the 'Plan — {name}' Docs and the week-ahead from Google Calendar. Write it to a Google Doc 'Weekly Executive Brief — {date}', then send a Telegram summary: headline, up to 3 decisions needed, and the Doc link. Mark any missing metric 'data not provided for this period' — never guess."
- Delivers to: Telegram.

### 3. Monthly business review
- Schedule: `0 8 1 * *` — the 1st of each month at 08:00.
- Task prompt: "Per skill report-prep, produce a deeper month-over-month review: each KPI this month vs prior and vs target, what moved and the likely why (labeled as hypothesis, not fact), and progress against each active 'Plan — {name}'. Refresh market or benchmark context with built-in web search and cite every figure with a source link. Write it to a Google Doc 'Monthly Business Review — {month}' and send a Telegram summary with the Doc link. No investment advice — factual figures only."
- Delivers to: Telegram.

## Rules
Reactivity here is scheduled, not event-based — this agent does not use platform event hooks. The monthly review's web-search gathering is the heaviest step; it runs at the start of the 08:00 job so results land inside your morning window. Notifications only 08:00–23:00 user time (critical alerts exempt); night is silent. Credit note: daily prep (~22 runs/month) is the main cost — narrow it to key days to economize; weekly (~4) and monthly (~1) are negligible.
