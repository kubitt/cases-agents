# Cron playbook — X Account Analyst

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Weekly post scan (night prep)
- Schedule: `0 3 * * 0` — every Sunday at 03:00. Night shift: heavy reading runs at night so the Monday review is ready and waiting; the user is not notified during the scan.
- Task prompt: "Open Google Sheets 'X Post Log'. Read the memory marker last_scanned_date. Using the data source recorded in knowledge/ACCOUNT_PROFILE.md (the user's analytics CSV if provided, otherwise publicly visible posts on their own X profile), collect only posts newer than last_scanned_date. If nothing new, finish silently and update the marker. For each new post: classify it per skill post-analyzer (format, topic, hook_type), compute engagement_rate when impressions are known, set verified=yes/no, and append a row. Read only the user's own account and public pages; never log in-walled or private data. Update last_scanned_date. Do not notify the user."
- Delivers to: nothing (silent prep; results feed task 2).

### 2. Weekly content review (morning delivery)
- Schedule: `0 9 * * 1` — every Monday at 09:00.
- Task prompt: "Run skill content-review over 'X Post Log' for the last 7 days (and compare to the prior 4 weeks). Produce max 15 lines: top 3 engagement patterns, 2 warnings, 3 things to test this week. Tag every line [fact] or [hypothesis]; state 'correlation is not causation' where you link a pattern to a result; mark any slice with fewer than 5 posts as insufficient data; note where numbers are unverified. Deliver to the user's chosen channel."
- Delivers to: Telegram or ASCN chat (set at onboarding).

## Notes
- Scan frequency is the user's credits choice (onboarding step 7): weekly `0 3 * * 0` is the default; for heavy posters switch the scan to daily `0 3 * * *` (more credits).
- Reactivity here is polling: task 1 scans for posts newer than a saved marker. This agent does not use platform event hooks.
- Notifications respect the user's window (default 08:00–23:00); night is silent except critical alerts (broken access, failed run).
