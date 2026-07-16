# Integrations: Messenger Concierge

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Telegram (channel) | Required | Talk to customers 24/7; owner notifications | Native, 2-min setup |
| Notion | Required (option A) | "Orders and Bookings" database | Native OAuth, 1 click |
| Google Sheets | Required (option B) | "Orders and Bookings" spreadsheet | Native OAuth, 1 click |
| Google Calendar | Optional | Each booking as a calendar event | Native OAuth, 1 click |

Telegram is the core channel; Notion OR Google Sheets stores orders (chosen at onboarding). No external API keys — no cost beyond the ASCN plan ($29/mo Start).

Onboarding connection order: Telegram → order destination (Notion or Sheets) → Google Calendar → reminders/notification setup.

Degradation: without Calendar — bookings still log to the table. Without a channel — the agent can't reach customers (blocks onboarding). Telegram is the core dependency.

## Optional upgrades (need approval + budget)
- **WhatsApp** — ASCN has no native WhatsApp channel. To serve customers on WhatsApp, connect an external WhatsApp Cloud API provider (e.g., 360dialog, Twilio, or Wati) as a custom MCP / API. Cost: provider fee ~$5-50/mo plus Meta's per-conversation charges (~$0.005-0.08 per conversation by country). Ask the deployed agent to wire it once you have a provider account. Everything else — facts, orders, reminders — works the same.
- **Payment link automation** — the agent can share your existing payment link, but generating per-order invoices (Stripe, YooKassa) is a separate integration; add later if needed.

## Deliberately absent
- **No payment processing.** The concierge collects the order and points to your payment step — it never takes card details or confirms money received. Safer and simpler.
- **No cold outreach.** It replies and sends enabled reminders; it never blasts a customer list.
- **No invented facts.** Anything not in your Business Profile is escalated to you, not guessed.
- **No voice or calls.** Text messaging only.
