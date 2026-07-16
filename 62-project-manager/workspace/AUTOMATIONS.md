# Cron playbook — Project Manager

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Daily standup digest
- Schedule: `0 9 * * 1-5` — every weekday at 09:00. Do the heavy board and GitHub read before the notification window so the digest is ready by 09:00.
- Task prompt: "Run skill board-sync first to bring the 'Project Board' current. Then run skill standup-digest: from the board (columns task, owner, status, priority, due_date, blocked_by, github_link, last_update, notes) build today's standup — Moved (status changed since yesterday), Blocked, Due today, and Silent owners (no movement per the at-risk rules in knowledge/STATUS_PLAYBOOK.md). List the at-risk tasks and draft one short factual nudge per at-risk owner. Deliver all of this to the user's private channel as a ready-to-post draft ending with 'Post to Slack? (yes / edit)'. Do NOT post to Slack, send any nudge, or write to GitHub — everything waits for the user's approval."
- Delivers to: user's private channel (Telegram or ASCN chat); posts to the team Slack channel only after approval.

### 2. Board sync poll
- Schedule: `*/30 8-20 * * 1-5` — every 30 min, business hours, weekdays (the user picks the interval at onboarding: 15 = faster but more credits, 60 = cheaper).
- Task prompt: "Run skill board-sync. Check GitHub issues and PRs, and the 'Project Board', for items changed since the saved marker in memory (board_sync_marker). If nothing changed — update the marker and finish silently, no notification. For each changed item: mirror its state onto the board's status and last_update columns, and set the at-risk flag per knowledge/STATUS_PLAYBOOK.md. Do NOT comment on, label, or close any GitHub issue, and do NOT post to Slack. Update the marker."
- Delivers to: nothing during the day — findings surface in the 09:00 standup. A critical alert (lost access, failed run) may notify anytime.

### 3. Weekly status report
- Schedule: `0 16 * * 5` — every Friday at 16:00. Aggregate the week before the window so the report is ready on time.
- Task prompt: "From the 'Project Board' compute the week: tasks completed, tasks opened, net progress per project, aging blockers (blocked longest first), and at-risk milestones from Google Calendar due_date. Give each project a Red/Amber/Green health call using the rubric in knowledge/STATUS_PLAYBOOK.md, with one line of reasoning. If a project has no data this week, write 'data not provided for period'. Deliver to the user as a ready-to-post draft; post to Slack only after approval. Max 20 lines."
- Delivers to: user's private channel; team Slack channel after approval.

## Rules
Reactivity is polling (task 2) — this agent does not watch platform events. Notifications only 08:00–23:00 user time (critical alerts exempt); heavy reads run before the window so morning delivery is ready.
