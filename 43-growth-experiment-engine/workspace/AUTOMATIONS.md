# Automations: Growth Experiment Engine

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change the schedule and wording — the agent will follow the updated version.

## Cron tasks

### 1. Weekly experiment digest (default, created at onboarding if agreed)
The one scheduled task: each Monday morning, report what finished and what to run next.
- Schedule: `0 8 * * 1` (Monday 08:00 — convert to UTC when writing the cron; do the heavy ledger read and analysis earlier so the digest is ready by morning).
- Task prompt: "Read the 'Experiment Ledger' (columns: date, name, hypothesis, metric, ice_score, status, variant_a_n, variant_a_conv, variant_b_n, variant_b_conv, p_value, verdict, learning). (1) For every row with status=done since the last digest, report the verdict and its p-value in one line each; if any row has result counts but no verdict yet, run skill significance-analyzer on it first and write the p_value and verdict back. (2) List the top 3 backlog rows by ice_score (status=backlog) as the experiments to run next, each with its ICE and hypothesis. (3) If a running test has now reached its required sample, flag it as ready to analyze. Send the digest to the notification channel. Do NOT run any test or touch ad platforms; never invent missing numbers — if a period has no data, write 'data not provided for period'."
- Channel: Telegram / ASCN chat.
- Credits note: read + a couple of Python scripts only, no external calls — a few credits per week. No external cost.

### How to change it
- "Send it Friday instead" → change the schedule to `0 8 * * 5` (UTC-adjusted); keep the same task prompt.
- "Digest twice a week" → add a second cron with the same prompt on the second day.
- "Pause the digest" → disable/delete the cron; on-command intake, design, and analysis still work.

## Reactivity
This agent is schedule-driven (one weekly digest) and command-driven; it does not watch external events or poll ad platforms. Notifications respect the user's window (default 08:00–23:00); analysis prepared before the window delivers in the morning.
