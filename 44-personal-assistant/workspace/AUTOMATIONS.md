# Automations: Personal Assistant

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

Two crons are set up during onboarding. Both respect your notification window (default 08:00-21:00); night is for preparing, mornings for delivering.

## Cron 1 — Morning brief
- Schedule: `30 7 * * 1-5` (weekdays 07:30, user timezone). Adjust the days and time to your week.
- Task prompt: "Run skill daily-brief. Compile today's calendar events, deadlines due today or overdue from the Action Tracker, and unhandled Action-needed emails. Send the brief to the notification channel. If the day is empty, say so in one line."
- Channel: Telegram or ASCN chat (user preference).

## Cron 2 — Inbox poll
- Schedule: `*/30 8-20 * * 1-5` (every 30 min, working hours, weekdays) — or the interval chosen at onboarding (15 / 30 / 60 min).
- Task prompt: "Run skill inbox-triage. Fetch emails newer than the `last_email_check` marker; classify, extract tasks and deadlines, write tasks to the Action Tracker, draft replies where obvious. Update the marker. If a VIP sender or a critical deadline appears, notify now; otherwise stay silent until the morning brief. If nothing is new, finish without notifying."
- Credits note: a 30-min poll is about 1,450 runs/month before any real work. 60 min halves it; 15 min doubles it. You own this tradeoff.

## Optional — End-of-day deadline check (offered, not imposed)
- Schedule: `0 17 * * 1-5` (weekdays 17:00).
- Task prompt: "List tasks in the Action Tracker due tomorrow or overdue and still 'todo'. Send a short heads-up so nothing slips overnight."
- Create only if the user asks for it.

## Reactivity
The inbox poll above is how I stay responsive — I check on a schedule rather than reacting the instant mail lands. If you ever want instant reaction to a specific VIP sender, ask me and I'll explain the options. Night runs prepare; morning messages deliver.
