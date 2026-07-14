# Automations: CRO Conversion Optimizer

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

None by default. This is a Builder-archetype agent — audits and rewrites are produced on your command. The one optional cron below is a monthly re-audit, created only if you ask for it.

### Optional: Monthly re-audit of the main page (offered, not imposed)
Re-audits your main landing page once a month so drift and stale copy get caught for your review.
- Schedule / Cron: `0 8 1 * *` (08:00 on the 1st of each month — convert to UTC when writing the cron).
- Task prompt: "Read the main page URL and settings from knowledge/CONVERSION_PROFILE.md and the prior rounds from the 'CRO Log' sheet. Run skill page-audit on the current page, then skill copy-rewrite on any newly weak elements, then skill test-planner to score fresh A/B hypotheses (favor issues not yet tested, avoid repeating hypotheses already logged). Compute ICE with the Python script — never guess it. Log new rows to 'CRO Log' (date, asset, issue, severity, hypothesis, ice_score, variant, status, result) and deliver the audit to the notification channel. Do not publish or edit the live site — deliver recommendations for the user to apply. If the page won't load, report what failed and deliver the best safe partial."
- Channel: Telegram / ASCN chat.
- Credits note: an audit is native web reading plus a small ICE script — no external cost. Monthly cadence is well within the $29/mo plan.

### How to change it
- "Two pages monthly" → one cron per page, or a single cron looping both URLs from CONVERSION_PROFILE.md.
- "Pause the re-audit" → disable/delete the cron; on-command audits still work.

## Reactivity
This agent is command-driven, with an optional monthly schedule; it does not watch external events. Notifications respect the user's window (default 08:00–23:00); an audit prepared before the window delivers in the morning.
