# Cron playbook — Second Brain

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Nightly link processing
- Schedule: `0 2 * * *` — every day at 02:00 (night shift: heavy page-reading runs at night, summaries are ready by morning).
- Task prompt: "Open Google Sheets 'Memory Index'. Find rows with type=link and status=new. If none, finish silently — no notification. For each one: run skill link-summarizer to read the page, write a concise sourced summary into the `summary` column, create or update its Notion 'Second Brain' page and store the link in `page_url`, set status=summarized, and set resurface_on to today + the interval in knowledge/BRAIN_PROFILE.md (default 30 days). If a page cannot be read, leave status=to_read and note it. Do not message the user at night; nightly work is silent."
- Delivers to: nothing at night (silent); results surface in the next weekly review.
- Credits note: once per night (~30 fires/mo) is cheap; it only does real work when new links exist, so empty nights cost almost nothing.

### 2. Weekly review
- Schedule: `0 8 * * 1` — Monday 08:00 (the user may pick another day at onboarding; delivered in-window, never at night).
- Task prompt: "Run skill weekly-review on Google Sheets 'Memory Index'. Section 1: items captured in the last 7 days grouped by tag, each as title + type + one-line summary + page_url. Section 2: resurface 3–5 items whose resurface_on is today or earlier (bump their resurface_on forward per knowledge/BRAIN_PROFILE.md); if none are due, pick a few older summarized gems. Section 3: open loops — items with status=to_read. Keep it under 25 lines. Deliver to the user's channel."
- Delivers to: Telegram (or ASCN chat).

## Rules
Reactivity is polling-based: the nightly task checks the index for new links rather than reacting to events. This agent does not use platform event hooks. Notifications only 08:00–23:00 user time; nightly processing is silent, and critical alerts (broken access, failed run) are exempt.
