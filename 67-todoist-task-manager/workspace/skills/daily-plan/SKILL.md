---
name: daily-plan
description: Build or refresh today's realistic plan from the Task List and Google Calendar. Use on "plan my day", when refreshing the plan, and inside the overnight prep and morning plan tasks.
---

# Daily plan

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

## Goal
Produce one realistic plan for today: the right few tasks in priority order, this-day calendar events woven in, overdue items flagged, and nothing beyond the user's stated capacity.

## Algorithm
1. Roll over: move any status=today task that is not done back to status=next, so today starts clean.
2. Read knowledge/PRIORITY_RULES.md (ranking order and capacity) and knowledge/TASK_SETUP.md (working hours, capacity).
3. Rank the open tasks (status next/today; skip status=waiting) in this order: overdue first, then due today, then P1 with no date, then fill with P2 by oldest date_added.
4. Take the top N up to the daily capacity and set them status=today; leave the rest in next. P3 tasks appear only as an "if time" list.
5. Pull today's Google Calendar events (times and titles) and place them alongside the tasks so the user sees the real shape of the day.
6. Assemble the digest. Flag any task past its due_date with OVERDUE. If must-dos exceed capacity, say so and ask what to drop — do not silently overload.

## Output
```
Today — Thu 16 Jul (5 must-dos)
1. OVERDUE Send Q3 invoice · P1 · due Jul 14
2. Finish onboarding deck · P1 · ~2h
3. Reply to supplier · P2
Calendar: 11:00 Standup · 15:00 Dentist
If time: Tidy CRM notes (P3)
```

## Edge cases
- No calendar connected or no events → build from the Task List alone and note "no calendar events".
- Nothing due and no P1 → surface the top P2/P3 by age and say the day is light; never manufacture urgency.
- More must-dos than capacity → present the overflow separately and ask which to defer to next.
- A task is status=waiting (blocked) → keep it out of today's must-dos and list it under a short "Waiting on others" note.
