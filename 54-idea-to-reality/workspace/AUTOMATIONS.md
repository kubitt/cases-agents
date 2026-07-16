# Cron playbook — Idea to Reality

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Weekly idea-revisit digest (default, created at onboarding if agreed)
The one scheduled task: each Monday morning, surface which parked ideas are due for a fresh reality check and which open ideas look most promising.
- Schedule: `0 8 * * 1` — Monday 08:00 (convert to UTC when writing the cron; do the ledger read and any re-check research earlier so the digest is ready by morning).
- Task prompt: "Read the Google Sheet 'Idea Ledger' (columns: date, idea_name, problem, target_user, core_value, category, reality_signal, trend, verdict, top_competitors, differentiation, brief_link, status, next_review). (1) List every row whose next_review date is today or past and whose status is captured or parked — these are due for a fresh reality check; for each, show idea_name, its last reality_signal and verdict, and offer to re-run skill reality-check. (2) List the top 3 open ideas (status not dropped and not building) by reality_signal with the best verdicts (build or differentiate), each with idea_name, signal, trend, and verdict. (3) If nothing is due and there are no open ideas, finish silently without notifying. Send the digest to the notification channel. Do NOT build anything or make decisions; never invent competitors or numbers — if evidence is missing, write 'data not found'."
- Delivers to: Telegram / ASCN chat.
- Credits note: one ledger read plus optional light web re-checks — a few credits per week, no external cost.

### How to change it
- "Send it Friday instead" → change the schedule to `0 8 * * 5` (UTC-adjusted); keep the same task prompt.
- "Re-check every two weeks" → set next_review two weeks out when logging; the digest already respects next_review.
- "Pause the digest" → disable or delete the cron; on-command intake, reality-check, and brief building still work.

## Rules
Reactivity here is a schedule (one weekly digest) plus on-command work; this agent does not watch external events or poll any platform. Notifications respect the user's window (default 08:00–23:00); research prepared before the window delivers in the morning. Critical alerts (broken access, failed run) may come anytime.
