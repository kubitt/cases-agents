# Cron playbook — Task Pilot

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Overnight plan prep
- Schedule: `30 5 * * *` — 05:30 every day (night shift: heavy prep runs before you wake; no message is sent).
- Task prompt: "Open Google Sheets 'Task List'. Roll over first: any task with status=today that is not done → status=next. Read knowledge/PRIORITY_RULES.md and knowledge/TASK_SETUP.md. Pull today's Google Calendar events. Build today's plan per skill daily-plan and mark the chosen tasks status=today, respecting the daily capacity. Save the assembled plan text into the notes column of the chosen rows, then finish silently — do NOT message the user."
- Delivers to: nothing (silent preparation).

### 2. Morning daily plan
- Schedule: `0 8 * * *` — 08:00 every day.
- Task prompt: "Read the Google Sheets 'Task List' tasks with status=today prepared overnight, plus today's Google Calendar events. Send the daily plan digest per skill daily-plan to the channel: must-dos P1 first, calendar events with times, OVERDUE flags, then the 'if time' list. If no plan was prepared overnight, build it now per skill daily-plan, then send. Do not create calendar events unless the user has already approved specific ones."
- Delivers to: Telegram (or ASCN chat).

### 3. Weekly review
- Schedule: `0 17 * * 5` — Friday 17:00.
- Task prompt: "From the 'Task List' compute for this week: tasks completed (status=done with date_done this week), tasks still open, and anything overdue or stale (in next/today for 14+ days). Per skill weekly-review, deliver a short recap and propose next week's top 3 priorities by P1/P2 and due dates. Max 15 lines."
- Delivers to: Telegram (or ASCN chat).

## Rules
Reactivity here is scheduled polling of your own Task List and Calendar — this agent does not use platform event hooks. Notifications only 08:00–23:00 user time; the 05:30 prep is silent. Critical alerts (broken access, failed run) are exempt.
