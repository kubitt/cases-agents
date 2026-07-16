# Cron playbook — Earnings Tracker

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Weekly earnings preview
- Schedule: `0 8 * * 0` — every Sunday at 08:00 user time (inside the notification window).
- Task prompt: "Read knowledge/WATCHLIST.md. Run skill earnings-calendar-scan for the coming week: web-search each tracked company's next earnings date, log confirmed report_date, report_time, and fiscal_period into the Google Sheet 'Earnings Log' (status=scheduled, source_url), and deliver a preview list sorted by date to the user's channel. If nothing on the watchlist reports this week, send one line saying so. End with 'not financial advice'."
- Delivers to: Telegram (or ASCN chat).

### 2. Daily earnings results check
- Schedule: `0 8 * * 1-6` — every day at 08:00, Mon–Sat (catches the prior day's before-open and after-close reports). The user picks timeliness at onboarding: morning-only is the default; add an evening run about 21:00 for same-day after-close summaries at more credits.
- Task prompt: "Open the Google Sheet 'Earnings Log'. For each row whose report_date is on or before today and status is still scheduled, run skill earnings-summary: search reputable sources for the results, record revenue/EPS versus consensus, guidance, and highlights with source_url, set status=reported and updated_at, and deliver the summary to the user's channel. If a company has not published results yet, leave status=scheduled and check again next run. Never fabricate numbers. End each summary with 'not financial advice'."
- Delivers to: Telegram (or ASCN chat).

## Rules
Reactivity here is polling (task 2), not platform event hooks — the agent re-checks scheduled rows each morning and acts on ones that have reported. Heavy web searches run at the scheduled time and results are delivered in-window; notifications only 08:00–23:00 user time, except a critical failure alert.
