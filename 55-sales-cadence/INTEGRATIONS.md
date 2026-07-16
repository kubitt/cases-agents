# Integrations: Sales Cadence Keeper

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Gmail | Required | Read the day's activity, draft follow-ups, poll lead replies, send your daily summary | OAuth, 1 click |
| Google Sheets | Required | "Sales Cadence Pipeline": stages, next_touch, context, thread history | OAuth |
| Google Calendar | Recommended | Reminders for calls and tasks captured in the evening review | OAuth |
| Telegram (channel) | Recommended | Evening review, morning batch, reply approval cards | 2-min setup |
| Google Docs / Drive | Optional | Read meeting notes you already keep | OAuth |

Onboarding connection order: Gmail → Sheets → Calendar → Telegram.

Degradation: without Telegram — reviews and batches arrive in ASCN chat; without Calendar — next steps stay in the sheet's next_touch column only; without Docs/Drive — meeting context comes from you verbally.

External APIs: none required. Total external cost: $0/mo.

Deliberately absent: HubSpot/Salesforce and other CRMs (no native connector — the pipeline lives in Google Sheets); meeting-notes transcription (Granola/Fireflies); LinkedIn (no browser automation).

Optional upgrades (not wired in — need approval + budget):
- CRM sync (HubSpot/Salesforce) via custom MCP or REST — a one-way mirror of the pipeline into your existing CRM — ~$0–50/mo depending on your CRM plan.
- Meeting-notes transcription (Granola / Fireflies) — auto next-step capture from calls — ~$10–29/mo.
- Warmed-domain sender (Instantly / Smartlead) for higher daily volume — ~$30–100/mo.
