# Cron playbook — Circle Keeper (Personal CRM)

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Nightly relationship sync
- Schedule: `0 2 * * *` — every day at 02:00. Night shift: heavy scanning runs while you sleep so the log is fresh by morning. This task never notifies you.
- Task prompt: "Read Gmail and Google Calendar for items newer than the memory marker last_sync. For each interaction (sent/received mail, a meeting held) with a person in the 'Relationship Log', update last_contact to that date, append any new open_threads, and recompute next_checkin = last_contact + cadence_days. For a person not yet in the log, add a row with circle=professional and a default cadence_days from knowledge/RELATIONSHIP_CIRCLES.md, and mark notes='new — confirm circle'. Never guess personal details. Update last_sync. Finish silently — no message unless the run failed."
- Delivers to: nothing (silent; updates the log only).

### 2. Morning meeting prep
- Schedule: `0 8 * * 1-5` — weekdays at 08:00 (inside the notification window).
- Task prompt: "Read today's Google Calendar. For each event with an external attendee, build a briefing per skill meeting-prep from the 'Relationship Log' and recent Gmail: who they are, last_contact, topics, and any open_threads to pick up. If there are no external meetings today, finish silently. Otherwise send the briefings to the chosen channel."
- Delivers to: Telegram / ASCN chat.

### 3. Weekly keep-in-touch digest
- Schedule: `0 9 * * 1` — Mondays at 09:00.
- Task prompt: "From the 'Relationship Log', list people whose next_checkin is on or before today and whose circle is not muted, ranked by how overdue they are. For the top ones, draft a check-in per skill checkin-drafter (Gmail drafts, never sent). Send a digest: numbered 'name — circle — days overdue — one-line reason', ending with 'Approve all / numbers'. Respect snoozes: skip anyone the user asked to hold."
- Delivers to: Telegram / ASCN chat.

## Rules
Reactivity is polling (tasks above read new items since a saved marker) — this agent does not use platform event hooks. Notifications only 08:00–23:00 user time; night runs stay silent (critical alerts exempt).
