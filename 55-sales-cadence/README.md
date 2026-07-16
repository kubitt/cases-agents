# Sales Cadence Keeper

Runs your daily follow-up cadence: an evening review captures where each deal stands, and every morning you wake up to ready-to-send follow-ups in your own voice — so no warm lead ever goes cold from a missed follow-up.

## Value & ROI
Most deals are lost not to a competitor but to silence — the follow-up that never got sent. Sales engagement platforms (Salesloft, Outreach, HubSpot Sales Hub) run $75–150/user/mo; a part-time sales assistant is $600–1500/mo. This agent enforces the follow-up discipline those tools sell, on native integrations only. Total cost: $29/mo, no external APIs required. Payback vs $29: 25–50x — a single recovered deal that would have gone cold covers years of subscription.

## What it does
1. Maintains a lead pipeline in Google Sheets "Sales Cadence Pipeline" (add leads by row, by message, or CSV import).
2. Evening review (weekdays 18:00): pulls the day's Gmail and Calendar activity, lists leads that moved, and asks you for quick verbal context ("going cold", "call Friday", "liked pricing") — then files it.
3. Sets next steps: writes next_touch dates into the sheet and optional Google Calendar reminders for the calls and tasks you mention.
4. Morning outreach (weekdays 08:00): decides the next action per due lead (email / call / text / wait) and drafts the follow-ups in your voice.
5. Cadence framework: teach-and-reframe follow-ups (not "just checking in"), 60–80 words, no AI-sounding vocabulary; max 3 touches without a reply.
6. Reply handling: polls Gmail for lead replies (every 30 min by default), classifies them, updates the pipeline, and drafts a response for your approval.
7. Delivers a morning batch summary: what's drafted, what needs a call, what needs your personal attention. You only click "send".

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (pipeline, voice, cadence, integrations, test run on your real leads).

## Required integrations
Native: Gmail (required), Google Sheets (required), Google Calendar (recommended). External: none. Channel: Telegram (recommended).

## Deliberate limitations
- Never sends to prospects automatically — drafts only; the only email it sends on a schedule is your own daily summary. Unreviewed serial sending risks your domain and reputation.
- No native CRM connector (HubSpot/Salesforce): the pipeline lives in Google Sheets. A one-way CRM sync can be added later via a custom MCP after cost approval.
- No meeting-notes transcription built in — it reads notes you already keep in Google Docs/Drive; a transcription service (Granola/Fireflies) is an optional paid upgrade.
- No LinkedIn or closed-platform scraping and no bought lists — leads come from your data or official public pages.
