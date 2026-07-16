# Task Pilot

Your personal task manager: captures every task, keeps them prioritized in one list, and hands you a realistic daily plan each morning — calendar included.

## Value & ROI
Manual daily planning eats 15–20 minutes a day, and a dedicated planning app (Sunsama, Motion, Akiflow) runs $20–34/mo — on top of the mental load of remembering what matters. Task Pilot captures tasks the moment you think of them, keeps one prioritized "Task List", and assembles each day's plan overnight so it is waiting at 08:00 with your calendar woven in. Total cost: $29/mo (ASCN Start, 10,000 credits), no external APIs required. On planning time alone (~7 hrs/mo at $25/hr ≈ $175) the payback vs $29 is roughly 6x, and more once it replaces a paid planning subscription.

## What it does
1. Captures tasks by message ("remind me to…", "add task…") and structures each one into the Google Sheets "Task List" (task, project, priority, due_date, estimate, status).
2. Keeps the list prioritized: labels P1/P2/P3, tracks status inbox → next → today → waiting → done, and flags overdue items — never inventing a deadline you did not give.
3. Builds a realistic daily plan overnight: rolls over unfinished tasks, pulls today's Google Calendar events, ranks by the rules in PRIORITY_RULES.md, and caps the day to your stated capacity.
4. Delivers the plan every morning at 08:00: today's must-dos, calendar events, overdue flags, and an "if time" list.
5. Optionally blocks time on Google Calendar for your top tasks — only after you approve each event.
6. Sends a Friday weekly review: what got done vs planned, stale tasks, and the top 3 priorities for next week.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, CRON_PLAYBOOK, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (projects, priority rules, integrations, then captures your first tasks and plans your day live).

## Required integrations
Native: Google Sheets (required — the "Task List"), Google Calendar (required — events in the plan). External: none. Channel: Telegram (recommended). Notion is an optional native alternative to Sheets.

## Deliberate limitations
- It plans and reminds — it does not do the tasks for you, and it never marks something done or deletes a task on its own; status changes come from you.
- No calendar event is created without your explicit approval; the daily plan itself is a suggestion, not an auto-booked schedule.
- Capture is by message in core — email-to-task (Gmail) and a Todoist sync are Optional upgrades (see INTEGRATIONS.md), not wired in out of the box. Existing Todoist users can connect their account later at $0/mo (free API token).
- It never guesses deadlines or priorities: anything you did not state is left blank and flagged, not invented.
