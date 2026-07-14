# Automations: Messenger Concierge

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

The concierge answers customers live through the Telegram channel — that needs no schedule. Crons cover reminders and the owner's digest. Notifications to you respect your window (default 08:00-22:00); reminders to customers go out only in daytime business hours.

## Cron 1 — Reminder sweep (only if auto_reminders is on)
- Schedule: `0 10 * * *` (daily 10:00, business timezone). Adjust to when your customers prefer reminders.
- Task prompt: "Run skill send-reminder. Read 'Orders and Bookings' for bookings within ~24 hours (status not cancelled or reminded) and stale 'new' orders. Send each customer a short reminder in the owner's tone, update status to 'reminded', and send the owner a one-line digest of what went out."
- Create only if the user enabled reminders at onboarding.

## Optional — Daily owner digest (offered, not imposed)
- Schedule: `0 20 * * *` (daily 20:00, within the owner's window).
- Task prompt: "Summarize today from 'Orders and Bookings' and conversations: messages handled, new orders, new bookings, and anything escalated. Send a compact digest to the owner. Keep it to counts plus the items that need attention."
- Create only if the user asks for it.

## Reactivity
Live customer replies come through the Telegram channel in real time — no polling is needed for conversations. If you later want the concierge to reach a saved customer list proactively, that's a separate, opt-in request. Night runs prepare; daytime messages deliver.
