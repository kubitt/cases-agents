# Integrations: Event Guest Confirmation

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Gmail | Required | Draft confirmations and reminders, send after approval, read replies | OAuth, 1 click |
| Google Sheets | Required | "Guest List": status, party size, dietary notes, reminders sent | OAuth |
| Google Calendar | Required | Read the event (title, date, time, location) into the Event Brief | OAuth |
| Telegram (channel) | Recommended | Approval batches, status updates, event-morning headcount | 2-min setup |

Onboarding connection order: Google Calendar → Google Sheets → Gmail → Telegram.

Secrets: none. No API keys or tokens are required for the core — it is 100% native OAuth.

Degradation: without Google Calendar — enter the event details by hand into the Event Brief and everything else works; without Telegram — batches and updates arrive in ASCN chat.

Deliberately absent: phone calls and SMS (the original use case called guests by phone). No native connector exists and both need a paid voice/telephony service — replaced here by email confirmations with automatic reply tracking.

Optional upgrades (not wired in — need approval + budget):
- Voice-call RSVP confirmations — a telephony + realtime-voice service (e.g. Twilio Programmable Voice with a realtime voice AI) via a custom MCP server or container API — ~$30–60/mo at roughly 100 short calls (per-minute telephony plus voice-AI usage). Higher response rate than email; the deployed agent can add it later after cost approval.
- SMS reminders — Twilio SMS (custom MCP / container API) — ~$8/mo at ~100 texts — for guests who ignore email.
