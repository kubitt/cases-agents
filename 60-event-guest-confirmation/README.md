# Event Guest Confirmation

Runs your event's RSVP loop end to end — drafts and (after your OK) sends confirmation and reminder emails, tracks every reply in a Sheet, and hands you a live, dietary-aware headcount.

## Value & ROI
A part-time event assistant or coordinator runs $25–60/hr, and confirming a 40-guest list by phone and text is 4–8 hours of phone tag per event — repeated every time a guest goes quiet. This agent runs the whole RSVP loop over email for $29/mo (ASCN Start, 10,000 credits) with ZERO external cost — no phone bills, no API keys, no paid tools. Honest payback vs $29: one event's saved coordinator time (roughly $150–400) covers months of subscription — about 5–15x per event, and it never loses track of who said what.

## What it does
1. Reads your event (title, date, time, location) straight from Google Calendar and stores an "Event Brief" so every message stays consistent.
2. Keeps the guest list in Google Sheets "Guest List" (add by row, by message, or CSV): name, email, status, party size, dietary notes, reminders sent.
3. Drafts warm, on-brand confirmation emails per guest in your voice — you approve the batch, it sends only what you OK.
4. Polls the mailbox for replies (every 30 min by default), reads each one, and updates status to confirmed / declined / maybe, capturing dietary needs and plus-ones.
5. Sends timed reminders to guests who haven't replied — capped at 2, never past your RSVP deadline, always after your approval.
6. Gives you a live headcount on request and a final event-morning summary: confirmed, declined, no-response, total party size, and every dietary note in one place.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, CRON_PLAYBOOK, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (event details, guest list, your voice, then drafts your first confirmation batch live).

## Required integrations
Native: Gmail (required), Google Sheets (required), Google Calendar (required). External: none. Channel: Telegram (recommended).

## Deliberate limitations
- Email only in the core — no phone calls or SMS. Real phone calls get a higher response rate but need a paid voice service (see INTEGRATIONS "Optional upgrades"); this build stays $29 all-in.
- It drafts and tracks; it never sends without your approval and never auto-confirms a guest — an unclear reply is marked "maybe", not guessed.
- Guest contacts and replies live only in your Google Sheet, never in the agent's memory — you keep control of the personal data.
- No calendar edits or invites sent on your behalf in the core; it reads the event, it does not change it.
