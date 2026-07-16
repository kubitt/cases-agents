# Cron playbook — Ops Assistant

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Morning ops briefing
- Schedule: `0 8 * * 1-5` — every weekday at 08:00 (convert to UTC when writing the cron; do the heavy reads a little earlier so the briefing is ready by 08:00).
- Task prompt: "Run skill ops-briefing in daily mode. Read the Google Sheet 'Ops Tracker' tabs 'Tasks' and 'Checklists' (Tasks columns: date_added, task, owner, area, priority, due_date, status, source, notes; Checklists columns: checklist_name, cadence, next_due, owner, sop_doc, last_run, status). Read GitHub for the watched repos: open PRs needing review and any checks currently failing. Read today's Google Calendar events. Read flagged or unread items in the ops Slack channel. Produce the status snapshot, list checklists whose next_due is today or overdue, and the top 3 next actions, each line citing its source. Post to the ops Slack channel. Never mark anything done, merge, or post elsewhere; if a source is unreachable, say so and continue."
- Delivers to: Slack ops channel (fallback ASCN chat).

### 2. PR and check watch (polling)
- Schedule: `*/30 9-18 * * 1-5` — every 30 min during work hours (the user picks the interval at onboarding: 15 = faster but more credits, 60 = cheaper).
- Task prompt: "Check the watched GitHub repos for items newer than the saved marker `last_github_check` in memory. Nothing new — finish silently and update the marker. For each new item: a PR that became ready for review, or a check that newly failed — post one Slack line to the ops channel with the repo, number, title, and link; if it maps to a tracked task, note it. Do not comment or merge. Update the marker."
- Delivers to: Slack ops channel.

### 3. Weekly ops digest
- Schedule: `0 8 * * 1` — Monday at 08:00 (UTC-adjusted; run the heavy read before the window so it is ready by morning).
- Task prompt: "Run skill ops-briefing in weekly mode over the past 7 days. From the 'Ops Tracker' tab 'Tasks': count tasks closed vs opened, list every row with status not done and due_date in the past (overdue). From GitHub: PRs merged and opened this week (throughput). From the tab 'Checklists': the checklists due this week by next_due. Note any SOP docs in the 'Ops SOPs' folder changed this week. Deliver a max-20-line digest to the ops Slack channel. Never invent missing numbers — write 'data not provided for period' where a source is empty."
- Delivers to: Slack ops channel.

## Rules
Reactivity is polling (task 2) — this agent does not watch platform events. Notifications only 08:00–23:00 user time; critical alerts (a broken integration or a failed run) are exempt.
