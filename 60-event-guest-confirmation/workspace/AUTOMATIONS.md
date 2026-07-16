# Cron playbook — Event Guest Confirmation

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. RSVP reply polling
- Schedule: `*/30 8-22 * * *` — every 30 min, 08:00–22:00 (the user picks the interval at onboarding: 15 = faster near the deadline but more credits, 60 = cheaper).
- Task prompt: "Check the Gmail inbox for messages newer than the memory marker last_reply_check from senders present in Google Sheets 'Guest List' with status invited or maybe. If none — finish silently and update the marker. For each reply: classify per skill reply-tracker as confirmed / declined / maybe / opt_out; record party_size and dietary_notes; update status, last_contact, and a one-line quote in notes. Opt-out → status opt_out, stop all future emails to them. Notify the host only about meaningful changes (new confirmations, declines, opt-outs), batched. Update the marker. Do NOT send any reply email without host approval."
- Delivers to: Telegram / ASCN chat.

### 2. Daily reminder and status batch
- Schedule: `0 9 * * *` — daily at 09:00 (do the heavy sheet read earlier so the batch is ready by morning).
- Task prompt: "Open 'Guest List'. Take guests with status invited or no_response whose reminder_count is under 2, where the RSVP deadline (knowledge/EVENT_BRIEF.md) has not passed and last_contact is 3+ days ago. Draft one reminder email each per skill rsvp-outreach. Send the host a single message: a short headcount snapshot per skill headcount-summary plus the numbered list of reminder drafts 'name — subject'. Do NOT send any email — drafts only, the host approves. When a reminder is approved and sent, increment reminder_count and set last_contact."
- Delivers to: Telegram / ASCN chat.

### 3. Event-morning headcount
- Schedule: `0 8 * * *` — daily at 08:00; acts only when today is the event date (from knowledge/EVENT_BRIEF.md or Google Calendar), otherwise finish silently without notifying.
- Task prompt: "If today is the event date: read 'Guest List' and send the host the final summary per skill headcount-summary — confirmed count, total party_size, declined, maybe, no_response, and every dietary_note grouped by guest. If today is not the event date, finish silently."
- Delivers to: Telegram / ASCN chat.

## Rules
Reactivity is polling (task 1) — this agent does not use platform event hooks. Notifications only 08:00–23:00 user time (critical alerts exempt); heavy reads run before the window so morning messages are ready.
