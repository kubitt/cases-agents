# Cron playbook — Small-Business Assistant

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Weekly review — overnight preparation
- Schedule: `0 5 * * 1` — Monday 05:00. Heavy work runs early and finishes silently; you are not notified now.
- Task prompt: "Open Google Sheets 'Business Metrics'. Read this week's rows and the previous period. For each metric look up one industry benchmark via web search and keep the source URL. Following skill weekly-review, write the Google Doc 'Weekly Business Review — <week_start>' with headline, what's working, what's not, and next actions (owner + due date). Save the Doc link in memory as review_doc_link. Do NOT notify the user and do NOT send anything."
- Delivers to: nothing yet (silent preparation).

### 2. Weekly review — Monday delivery
- Schedule: `0 8 * * 1` — Monday 08:00 (inside the 08:00–23:00 window).
- Task prompt: "Read the Doc at memory review_doc_link (if missing, run skill weekly-review now). Send a short summary — 1-line headline, top 2 wins, top 2 problems, top 2 next actions — plus the Doc link. Ask: 'Anything to adjust?' Do NOT send anything externally."
- Delivers to: Telegram or ASCN chat (set at onboarding step 7).

### 3. Monthly market and performance deep-dive
- Schedule: `0 8 1 * *` — 1st of the month, 08:00. Heavier gathering may begin overnight; the summary is held until 08:00.
- Task prompt: "Run skill market-scan for the user's main competitors and skill weekly-review across the whole month from 'Business Metrics'. Write the Doc 'Market Scan — <month>' plus a month-over-month review. Send a summary with the two Doc links and 3 recommended actions. Do NOT send anything externally."
- Delivers to: Telegram or ASCN chat.

## Rules
Reactivity here is polling on a schedule — this agent does not use platform event hooks. Notifications only 08:00–23:00 user time; night runs prepare quietly and deliver in the morning. Critical alerts (broken access, failed run) are the only exception.
