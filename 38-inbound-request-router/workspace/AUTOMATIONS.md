# Automations: Inbound Request Router

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Inbound polling (created at onboarding)
- Cron: `*/30 8-22 * * *` (every 30 min, 08:00–22:00 user time — convert to UTC when writing the cron; interval set at onboarding: 15 for fast, 30 balanced, 60 economical).
- Task prompt: "Run skill intake-poll to gather new requests from Gmail, Telegram, and the optional 'Form Intake' sheet since the stored markers. If none, finish silently. For each new request run skill request-classify (type + urgency + fields per knowledge/CLASSIFICATION_RULES.md), then skill request-route: write the row to Google Sheets 'Inbound Requests', assign the owner from knowledge/ROUTING_MATRIX.md, notify the owner in Telegram, and escalate high-urgency requests to the manager. Advance markers only after each item is logged. Do not reply to customers. Do not invent missing fields."
- Channel: Telegram / ASCN chat.
- Credits note: a `*/30` poll ≈ 1,450 runs/mo before real work — the interval is a credits/speed tradeoff the user picks at onboarding. Off-hours polling can be narrowed to business hours.

### 2. Urgent acknowledgement reminder (optional)
- Cron: `*/15 8-22 * * *` (every 15 min) — only if the user wants SLA reminders.
- Task prompt: "Check Google Sheets 'Inbound Requests' for status=New, urgency=High rows assigned more than the ROUTING_MATRIX SLA ago (default 30 min) with no acknowledgement. Send the owner and manager a reminder. Do not duplicate reminders more than twice per request."
- Channel: Telegram.

### How to change it
- "Check more/less often" → change the cron interval (weigh credits vs speed).
- "Only during work hours" → keep the `8-22` window or narrow it.
- "Pause routing" → disable/delete the polling cron; the CRM sheet is untouched.

## Reactivity
Reactivity is polling-based (task 1); this agent does not use platform event hooks. Routine notifications respect the window (default 08:00–23:00); a genuinely urgent request may notify outside it — that is the purpose of urgent routing.
