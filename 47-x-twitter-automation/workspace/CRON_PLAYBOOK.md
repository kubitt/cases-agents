# Cron playbook — X Content Engine

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Nightly draft prep
- Schedule: `0 4 * * *` — every day at 04:00; night shift: research and drafting run at night, finished drafts wait for you by morning (no notification is sent overnight).
- Task prompt: "Read knowledge/CONTENT_STRATEGY.md for today's pillar and cadence and knowledge/VOICE.md for tone. Run skill trend-research to find 2–4 fresh angles with source URLs. Run skill post-drafting to write the day's posts for the current pillar. Append each to Google Sheets 'X Post Queue' as status=draft with date, scheduled_time, pillar, post_type, hook, draft_text, hashtags, source_url. Do NOT post anything and do NOT notify — only fill the queue."
- Delivers to: the queue (silent).

### 2. Morning content brief
- Schedule: `0 9 * * *` — every day at 09:00.
- Task prompt: "Open 'X Post Queue'. List today's rows with status=draft or status=approved. For each, show slot, pillar, hook, and the full copy-paste draft_text with hashtags and source link. Ask the user to approve all, approve by numbers, or edit #N. Deliver to Telegram (or ASCN chat). Do NOT post."
- Delivers to: Telegram / ASCN chat.

### 3. Due-post reminder polling
- Schedule: `*/30 8-22 * * *` — every 30 min, 08:00–22:00 (the user picks the interval at onboarding: 15 = tighter timing but more credits, 60 = cheaper).
- Task prompt: "Check 'X Post Queue' for rows with status=approved and scheduled_time now or past that are not yet status=posted, newer than the saved marker last_reminder_check. Nothing due — finish silently and update the marker. For each due row: send the copy-paste text and remind the user to post it now; when they confirm it's posted, set status=posted. Update the marker."
- Delivers to: Telegram / ASCN chat.

### 4. Friday performance review
- Schedule: `0 17 * * 5` — every Friday at 17:00.
- Task prompt: "Run skill weekly-review on 'X Post Queue' rows with status=posted from the last 7 days using the pasted impressions, likes and replies. Report best pillar, best hook style, best post_type, and 2–3 recommendations for next week's mix. Mark any period with no pasted metrics as 'data not provided'. Deliver to Telegram, max 15 lines."
- Delivers to: Telegram / ASCN chat.

## Rules
Reactivity here is polling (task 3) — this agent does not use platform event hooks. Notifications only 08:00–23:00 user time; night is silent except critical alerts (broken access, failed run).
