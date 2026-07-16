# Sales Enablement Copilot

Prepares a sharp one-page brief for every sales meeting on your calendar — who's in the room, what to ask, the objections you'll hear, and the battlecard to beat — so you walk in ready and close faster.

## Value & ROI
A sales-enablement hire or fractional consultant costs $2,000–6,000/mo; a Gong + Apollo stack runs $150–300/user/mo. Manual pre-call prep is 30–45 min per meeting — a rep with 3–4 meetings a day loses 2–3 hours daily. This agent does that prep overnight and hands you the briefs at 08:00. Total cost: $29/mo (ASCN Start, 10,000 credits), no external APIs required — native integrations plus built-in web search. Payback vs $29: roughly 30–70x — one saved hour a day already covers years of the subscription, before any deal it helps you win.

## What it does
1. Keeps a "Deal Room Tracker" in Google Sheets — one row per upcoming meeting: account, contact, stage, next step, and open objections.
2. Every weekday overnight, reads Google Calendar and prepares a one-page call brief (a Google Doc "Call Brief — account — date") for each sales meeting that day: account snapshot from the open web, attendees mapped to buying-committee roles, deal context from the tracker, 5–7 tailored discovery questions, the likely objections with suggested responses, and the relevant competitor battlecard.
3. Delivers the morning brief summary at 08:00 with links to each Doc.
4. On request, answers a specific objection with framework-based responses drawn from your "Objection Playbook" Doc.
5. After a meeting, turns your raw notes into a structured recap (summary, agreed next steps, MEDDPICC/SPIN gaps) plus a ready Gmail follow-up draft for your approval — it never sends on its own.
6. Builds and refreshes competitor battlecards in a "Battlecard Library" Doc from open-web research and your positioning.
7. Weekly refresh: updates the battlecards and rolls the week's new objections into the Objection Playbook.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, CRON_PLAYBOOK, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (offer, methodology, competitors, integrations, then a live brief for one real meeting).

## Required integrations
Native: Google Calendar (required), Google Docs (required), Google Sheets (required), Gmail (required for follow-up drafts). Built-in web search — no key. External: none. Channel: Telegram (recommended).

## Deliberate limitations
- It prepares and drafts; it does not attend, transcribe, or auto-send. Sending a follow-up is always your click (platform has no voice/real-time calling).
- No CRM or conversation-intelligence connector in the core — you paste meeting notes and it reads your Calendar and Sheets. Live Gong/Salesforce sync is an optional paid upgrade (see INTEGRATIONS.md), not wired in.
- Research uses the open web and your own data only — no bought or "verified" contact lists; anything it cannot verify is labelled unverified, never stated as fact.
- Buying-committee roles are inferred from public data and your notes — confirm names and titles before you rely on them.
