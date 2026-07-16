# Integrations: Sales Enablement Copilot

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Calendar | Required | Reads upcoming meetings to prepare briefs | OAuth, 1 click |
| Google Docs | Required | "Call Brief" docs, "Battlecard Library", "Objection Playbook" | OAuth, 1 click |
| Google Sheets | Required | "Deal Room Tracker": accounts, meetings, stages, open objections | OAuth |
| Gmail | Required | Follow-up email drafts (never sent without approval) | OAuth |
| Web search | Built-in | Account, attendee, and competitor research | None — no key |
| Telegram (channel) | Recommended | Morning brief summary, follow-up approvals | 2-min setup |

Onboarding connection order: Google Calendar → Google Docs → Google Sheets → Gmail → Telegram.

Degradation: without Telegram — the morning summary and approvals arrive in ASCN chat; without Gmail — follow-ups are handed to you as plain text to paste yourself; without web search access — the brief still assembles from your tracker and notes and flags "no external research".

Deliberately absent: Gong/Chorus/Fireflies (no native connector — you paste notes instead); Salesforce/HubSpot (no core CRM sync — the Deal Room Tracker holds context); Apollo/ZoomInfo (no core enrichment — public web + your data only). Each can be added later via a custom MCP server after cost approval.

Secrets required: NONE — the core runs entirely on native OAuth integrations and built-in web search.

Optional upgrades (not wired in — need approval + budget):
- Conversation intelligence (Fireflies ~$10–19/user/mo; Gong ~$100–150/user/mo) — auto meeting transcripts and scoring instead of pasting notes.
- CRM sync via custom MCP (HubSpot from ~$20/user/mo; Salesforce ~$25–150/user/mo) — pull deal context automatically into the brief.
- Contact enrichment (Apollo ~$49–99/mo; ZoomInfo enterprise) — verified buying-committee contacts and direct dials.
