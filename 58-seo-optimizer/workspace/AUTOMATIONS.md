# Cron playbook — SEO Optimizer

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Weekly performance report
- Schedule: `30 8 * * 1` — every Monday at 08:30 (inside the notification window).
- Task prompt: "Pull Google Search Console for the last 7 days and the 7 days before that for the connected property. Append a dated row per tracked query and page to the 'Rank Tracker' tab of 'SEO Tracker' (columns: date, item, item_type, clicks, impressions, ctr, position, position_change, clicks_change, opportunity, notes). Compute position_change and clicks_change vs the prior week. Flag: biggest gainers, biggest losers, and striking-distance keywords (position 8–20) as opportunity. Include any findings the monthly deep scan wrote since the last report. Send a summary (max 15 lines): traffic vs last week, top 3 opportunities, top 3 losers. If Search Console returns no data, say 'data not provided for period' and finish."
- Delivers to: Telegram (or ASCN chat).

### 2. Monthly deep scan (heavy — runs at night, silent)
- Schedule: `0 4 1 * *` — 1st of each month at 04:00 (night shift, no notification during quiet hours).
- Task prompt: "For each priority page in SITE_PROFILE.md (cap at the number set during onboarding, default 10): run skill page-audit, save a Google Doc 'SEO Audit — <url>', and append a row to the 'Audit Log' tab (columns: date, url, health_score, critical, high, medium, low, top_fix, doc_link). Then from the 'Rank Tracker' history, list pages that lost the most clicks over 90 days as content-refresh candidates. Write everything to Sheets and Docs. Do NOT notify the user now — it is quiet hours; the next weekly Monday report surfaces these findings."
- Delivers to: nothing at run time; results are stored and reported by task 1.

## Rules
Reactivity is polling-based (scheduled pulls above); this agent does not use platform event hooks. Notifications only 08:00–23:00 user time; night runs prepare and stay silent, the morning report delivers. Critical alerts (broken Search Console access, a failed run) may notify outside the window.
