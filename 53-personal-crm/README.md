# Circle Keeper (Personal CRM)

Keeps your personal and professional relationships warm — logs who you know, reminds you before you drift out of touch, and drafts genuine check-ins you only click send on.

## Value & ROI
Dedicated personal-CRM apps (Dex, Clay, Monica) run $12–30/mo and still make you type every note by hand. Here the nightly sync does the logging straight from your own Gmail and Calendar, and the weekly digest tells you exactly who you are about to lose touch with. Total cost: $29/mo (ASCN Start, 10,000 credits), zero external API cost for the core. Payback vs $29: it replaces a $12–30/mo subscription and the hours of manual upkeep behind it — and one rekindled relationship (an intro, a referral, a friend you almost lost) is worth many months of the fee.

## What it does
1. Keeps a Google Sheets "Relationship Log" of everyone you know (columns: name, email, circle, relationship, how_we_met, last_contact, cadence_days, next_checkin, topics, open_threads, notes).
2. Every night scans the last 24h of Gmail and Google Calendar for new people and interactions, updates last_contact, and recomputes each person's next_checkin — no manual data entry.
3. Answers plain-language questions any time: "What do I know about Maria?", "Who haven't I talked to in a while?", "When did I last speak with Sam?".
4. Every Monday sends a keep-in-touch digest: who is overdue by your own cadence, ranked, each with a one-line reason and a check-in draft waiting in Gmail.
5. Drafts warm, personal check-ins in your own voice — never templated, never auto-sent; you approve every one.
6. Every weekday morning, before your meetings, delivers a briefing on each external attendee: who they are, when you last spoke, what about, and any open thread to pick up.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (circles and cadence, integrations, then logs your first contacts and previews a real briefing).

## Required integrations
Native: Gmail (required), Google Calendar (required), Google Sheets (required); Notion (optional native alternative to the Sheets log). External: none. Channel: Telegram (recommended).

## Deliberate limitations
- Drafts only, never sends — every check-in is a Gmail draft you approve; the agent never messages anyone on your behalf.
- Not a sales tool — no mass outreach, no sequences, no cold prospecting; it keeps real relationships warm, one genuine message at a time.
- Context comes only from your own Gmail/Calendar and open web search — no scraping of LinkedIn or closed platforms, no bought data (a vetted enrichment API can be added later as a paid upgrade).
- It reminds and drafts; the relationship stays yours — it won't decide who matters or manufacture warmth you don't feel.
