# Automations: Warm Lead Nurture

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Daily follow-up run (created at onboarding)
- Cron: `0 10 * * *` (daily 10:00 user time — convert to UTC when writing the cron; e.g., 10:00 Moscow = `0 7 * * *`).
- Task prompt: "Run skill lead-scan on Google Sheets 'Warm Leads' to find leads due for a follow-up (status thinking/call_later, 2+ days silent, under the touch cap; rules in knowledge/NURTURE_PLAYBOOK.md). If none, finish silently. Otherwise run skill followup-writer to draft a personal message per lead, then skill followup-send: in approval mode send the batch to the notification channel and wait; in auto-send mode deliver directly on each lead's channel. Update the sheet (last_contact, touches, next_touch, status), mark leads that hit 3 touches as cold, and skip any lead that has replied. Report what was sent or queued."
- Channel: Telegram / ASCN chat.
- Credits note: one run/day over the due leads; email volume through Gmail should stay modest (≤30–50/day) for deliverability. The user owns the cadence and batch size.

### How to change it
- "Follow up faster/slower" → change the delay in NURTURE_PLAYBOOK.md (the cron time stays the same; the delay decides who's due).
- "Run twice a day" → add a second cron time (UTC); lead-scan won't double-touch because next_touch moves forward on send.
- "Pause nurturing" → disable/delete the cron; the sheet is untouched.

## Reactivity
This agent is schedule-driven and command-driven only; it does not watch external events. The daily batch is delivered inside the notification window (default 08:00–23:00); follow-ups to leads respect the lead's local send window.
