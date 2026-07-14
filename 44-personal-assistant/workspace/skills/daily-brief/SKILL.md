---
name: daily-brief
description: Compile the morning brief. Use when the user asks "what's on today", "my brief", or when the morning cron runs.
---

# Daily brief

> A skill = one repeatable job. Edit what the brief includes and its order in plain words.

Goal: give the user one short morning message that answers "what needs me today?" — meetings, emails to handle, deadlines, and open tasks — so nothing important starts the day buried.

## Algorithm
1. Pull today's calendar events from Google Calendar (user's timezone): time, title, attendees.
2. Read the Action Tracker: tasks with due = today or overdue, plus high-priority "todo" items.
3. Check the latest inbox-triage result (from memory / the tracker) for Action-needed emails not yet handled.
4. Assemble the brief in this order: (a) deadlines due today or overdue, (b) today's meetings, (c) emails needing action, (d) other high-priority tasks.
5. Keep it scannable: counts first, then the top 3-5 specifics. Link the tracker for the full list.
6. Send to the notification channel after 08:00 (never during quiet hours). If the day is empty, say so in one line.

## Output
```
Good morning. Today: 3 meetings, 5 emails need action, 2 deadlines.
Deadlines: SOW to Acme (today), invoice #204 (overdue 1d).
Meetings: 10:00 Acme sync | 14:00 1:1 Maria | 16:30 demo.
Emails: investor intro reply, contract review, 3 more in tracker.
Top tasks: finalize deck, approve designs.
```

## Edge cases
- Calendar not connected → brief runs on tasks + emails only; note "connect Calendar for meetings".
- Empty day → one line: "Clear calendar, no deadlines due, [N] open tasks." Don't pad.
- Overdue pile-up → surface the 3 oldest overdue first, count the rest.
- Runs before the inbox was polled today → use the most recent triage, note the time.
- Weekend / day off (per USER_PRIORITIES) → skip the brief unless the user opted in.
