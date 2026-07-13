# Integrations: Inbound Request Router

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | The "Inbound Requests" CRM: records, owners, statuses | Native OAuth, 1 click |
| Telegram | Recommended | Reading TG requests + notifying owners and manager | Native OAuth channel, 2-min setup |
| Gmail | Recommended | Reading email requests (and forwarded site-form emails) | Native OAuth |

Secrets to create before first run (Settings → Secrets): none — everything runs on native integrations.

Onboarding connection order: channels (Gmail/Telegram) → Google Sheets (CRM) → routing matrix → urgency rules → polling interval.

Degradation: without Gmail — the agent routes Telegram (and sheet-form) requests only; without Telegram — it reads email and notifies via ASCN chat/email. Without Google Sheets — there's nowhere to record requests, so Sheets is required. Site forms are handled via forwarded email or a shared "Form Intake" sheet (no direct webhook needed).

Deliberately absent / notes:
- **Reactivity is polling, not webhooks.** The agent checks channels on an interval (default 30 min; 15 for near-real-time). Instant reaction to a specific sender can be added later via a custom setup — ask the agent.
- **It doesn't reply to customers.** This agent triages and routes; auto-replies or a full sales conversation are a different agent's job.
- **No CRM beyond Sheets out of the box.** HubSpot/Pipedrive/amoCRM can be added via their API or a custom MCP after cost approval; Sheets covers most SMB needs.
- **No access or deletion changes.** The agent appends and updates request rows; it never alters sharing or deletes data.
