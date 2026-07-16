# Cron playbook — Market Research Factory

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Weekly mining and opportunity digest
- Schedule: `0 8 * * 1` — every Monday at 08:00 user time (convert to UTC when writing the cron). Heavy research runs earlier, around 03:00, so the digest is ready by morning.
- Task prompt: "Read knowledge/RESEARCH_PROFILE.md for the saved topics and sources, and the last_run marker stored in memory. For each topic, run skill pain-signal-mining to collect pain quotes newer than the last_run marker; dedupe against source_urls already in Google Sheets 'Opportunity Ledger' and add only genuinely new signals. Then run skill opportunity-ranking to re-cluster, recount mentions, recompute opportunity_score, and re-rank. Deliver a digest to the notification channel: new and changed opportunities plus the top 3 by opportunity_score, each as 'opportunity — score (RxIxG) — mentions — status'. Update the last_run marker. If nothing new appeared, finish silently without notifying. Never invent pain or numbers; if a source is unreachable, note it and continue with the rest."
- Delivers to: Telegram / ASCN chat.
- Credits note: web reads plus two Python scripts, no external calls — a modest weekly cost. Weekly is the default; bi-weekly or monthly costs less, the user picks at onboarding.

### 2. Monthly ledger re-score and cleanup (optional)
- Schedule: `0 8 1 * *` — the 1st of each month at 08:00 user time (UTC-adjusted). Prepare the read at night.
- Task prompt: "Open Google Sheets 'Opportunity Ledger'. Re-run skill opportunity-ranking across all rows so opportunity_score and rank reflect the full mention history. Mark clusters with fewer than 5 mentions as 'insufficient signal' in notes, and set status=parked for opportunities untouched for 90+ days. Send a one-message summary of what moved up, what was parked, and the current top 3. Change nothing else and never fabricate counts."
- Delivers to: Telegram / ASCN chat.

## How to change it
- "Mine bi-weekly / monthly" → change task 1 to `0 8 * * 1/2` style or a monthly schedule; keep the same task prompt.
- "Digest on Friday" → change task 1 to `0 8 * * 5` (UTC-adjusted); keep the prompt.
- "Pause mining" → disable or delete task 1; on-command mining, ranking, and briefs still work.

## Rules
Reactivity here is polling (the weekly run mines for signals newer than the saved marker) — this agent does not watch external events. Notifications only 08:00–23:00 user time; critical alerts (broken access, failed run) are exempt.
