# Cron playbook — Dynamic Dashboard

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Morning dashboard build (default, created at onboarding)
The main scheduled task: rebuild the dashboard and send the morning summary.
- Schedule: `0 8 * * *` — every day at 08:00 user time (convert to UTC when writing the cron; if many sources are registered, do the reads as the first step so the summary is ready right at 08:00 — heavy work runs early, delivery is in the morning).
- Task prompt: "Run skill dashboard-build. Read the 'Metrics Registry' (columns: metric_name, source, source_ref, unit, good_direction, warn_threshold, target, notes). For each metric, read its current value from its source (a Google Sheets cell/range, or a public number via web search); if a source is unreadable, set value blank and status=no_data — never guess. Look up each metric's previous reading in 'Metrics History' (columns: date, metric_name, value, delta_abs, delta_pct, status), compute delta_abs and delta_pct, and compute status (on_target / watch / breach) per knowledge/METRIC_DEFINITIONS.md using good_direction, warn_threshold, and target. Append today's rows to 'Metrics History'. Render files/dashboard.html (metric cards + inline mini-charts) and files/dashboard_snapshot.csv; if Drive is connected, save both to the 'Dashboard' folder; if Docs is connected, write the summary to the 'Dashboard Summary' doc. Send the summary (top movers, breaches, on-target count, file links) to the notification channel. Do NOT invent readings; do NOT set up paid connectors."
- Delivers to: Telegram / Gmail / ASCN chat.
- Credits note: reads plus a couple of Python scripts, no external paid calls — a few credits per day. No external cost.

### 2. Midday refresh (optional, created only if the user asked in onboarding)
A second same-day build for freshness, quieter than the morning one.
- Schedule: `0 12 * * 1-5` — weekdays at 12:00 user time.
- Task prompt: "Run skill dashboard-build exactly as in the morning task, but only message the user if something changed materially since the morning build: a metric moved into status=breach, or a top mover changed by more than 10%. Otherwise refresh the files silently and finish without notifying."

## How to change it
- "Send it at 07:30 instead" → change the morning schedule to `30 7 * * *` (UTC-adjusted); keep the task prompt.
- "Add an evening build" → add a cron with the same task prompt at your chosen time (keep it inside 08:00–23:00 for notifications).
- "Pause the dashboard" → disable/delete the cron; on-command "refresh the dashboard", metric-intake, and trend-lookup still work.

## Rules
Reactivity here is polling on a schedule (above) — this agent does not watch external events. Notifications only 08:00–23:00 user time; a critical alert (broken access or a failed build) is the only exception.
