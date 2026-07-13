# Integrations: Warm Lead Nurture

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | The "Warm Leads" base: statuses, interests, touch history | Native OAuth, 1 click |
| Telegram | Recommended | The daily approval batch + following up leads on Telegram | Native OAuth channel, 2-min setup |
| Gmail | Optional | Following up leads by email + reading their replies | Native OAuth |

Secrets to create before first run (Settings → Secrets): none — everything runs on native integrations.

Onboarding connection order: what you sell → Google Sheets (lead base) → follow-up rules → channels (Telegram/Gmail) → delivery mode → daily run.

Degradation: without Telegram — the approval batch arrives in ASCN chat; without Gmail — the agent follows up on Telegram only and marks email-only leads "needs a channel". Without Google Sheets — there's no lead base to work from, so Sheets is required.

Deliberately absent / notes:
- **No cold outreach.** This agent nurtures warm leads already in your pipeline; finding and cold-emailing new prospects is a different agent.
- **No auto-send without your opt-in.** By default every follow-up is approved first; auto-send is a deliberate switch you flip.
- **No live sales conversation.** It re-engages quiet leads with short follow-ups; once a lead replies, it hands the thread to you (a full inbound-sales dialog is a different agent).
- **Email volume is capped for deliverability** (Gmail ~30–50/day); larger bases should lean on Telegram or a dedicated ESP.
