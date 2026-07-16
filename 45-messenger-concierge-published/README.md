# Messenger Concierge

Your 24/7 front desk in Telegram: answers customers in seconds — questions, orders, bookings, reminders — in your voice and only from your facts, escalating anything it shouldn't answer alone.

## Value & ROI
An after-hours question that waits until morning is often a lost sale — studies of lead response put the drop-off within the first hour at more than half. The concierge replies in about 20 seconds, any hour, so those orders and bookings don't slip away. It also takes repetitive FAQ and booking work off your front desk — easily 1-2 hours of staff time a day. Recover even 2-3 extra bookings a month, or a couple of staff-hours a week, and the math is obvious. Cost: $29/mo (ASCN Start); Telegram and storage are native — no paid APIs. Payback: roughly 15-50x depending on your order value.

## What it does
1. Replies to customer messages in Telegram within seconds, 24/7, in your tone.
2. Answers only from your Business Profile: services, prices, hours, location, promos, policies — never invents.
3. Takes orders and books appointments: collects details, confirms, and logs to "Orders and Bookings".
4. Notifies you of every new order/booking and escalates complaints or anything off-script.
5. Sends customers appointment and order reminders (if you enable them) to cut no-shows.
6. Optional: creates a Google Calendar event for each booking.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, 3 skills, 2 knowledge files, AUTOMATIONS).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — integrations, costs, and the WhatsApp upgrade path.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~8 min: connect Telegram, enter your business facts and voice, pick where orders are saved, then a live test as your concierge).

## Required integrations
Native only: Telegram channel (required), Notion or Google Sheets for "Orders and Bookings" (required, your choice), Google Calendar (optional). No external API keys; no cost beyond the $29/mo plan. WhatsApp is available as a paid upgrade via an external provider — see `INTEGRATIONS.md`.

## Deliberate limitations
- **Telegram first; WhatsApp is a paid upgrade.** ASCN has no native WhatsApp — it needs an external provider (~$5-50/mo + Meta fees). Telegram works out of the box.
- **No payments.** It collects the order and points to your payment step; it never takes card details or confirms money received.
- **Only your facts.** Anything not in your Business Profile is escalated to you, not guessed — accuracy over coverage.
- **Not a hard-seller.** It helps and books; it won't pressure or chase. For proactive outbound sales, see the SDR / Telegram-sales templates.
- **Reminders are opt-in and daytime-only.** No night-time messages to customers; reminders send only if you turn them on.
