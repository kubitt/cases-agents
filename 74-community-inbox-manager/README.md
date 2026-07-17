# Community Inbox Manager

Answers pile up faster than you can reply — this agent triages every comment, message, and review you receive, drafts a reply in your voice, and keeps a queue so nothing slips.

## Value & ROI
A part-time community manager runs $400–1200/mo, and a review-management tool adds $30–100/mo on top — and messages still sit unanswered overnight. This agent triages your owned inbox on a schedule, drafts every reply in your brand voice, keeps one searchable queue with response-time targets, and pings you the moment a high-priority message or a negative review lands. Total cost: $29/mo (ASCN Start, 10,000 credits), no external API for the native core. Payback vs $29: roughly 10–40x versus hiring the work out — and more the first time it catches an angry review before it festers.

## What it does
1. Keeps every item in Google Sheets "Inbox Queue" (columns: date, channel, author, message, intent, priority, sentiment, reply_draft, status, notes) — one row per item, deduped.
2. Triages new messages from the channels you own — Telegram, Slack, and Gmail — classifying each by intent (question / complaint / lead / spam / praise) with a priority and sentiment.
3. Watches the public review pages you list (Google Business Profile page, Yelp, marketplace pages) with built-in web reading, logs each new review, and drafts a reply fast for negatives.
4. Drafts every reply in your brand voice from a voice file you fill once — you approve and send; it never sends or posts on its own.
5. Alerts you inside your notification window when a high-priority item or a negative review appears, draft attached.
6. Sends a daily digest (09:00) of what still needs you, oldest first, with drafts ready and anything past its response-time target flagged.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (voice, channels, review pages, spreadsheet, then a live test on your real inbox).

## Required integrations
Native: Google Sheets (required, the "Inbox Queue"); Telegram, Slack, and Gmail (connect the channels you actually use); built-in web search and page reading (zero setup). External: none for the native core. Channel: Telegram (recommended for alerts and the daily digest).

## Deliberate limitations
- Native mode covers Telegram, Slack, Gmail, and public review pages only. Reading Instagram / Facebook / X messages and comments needs the optional paid social-inbox API (~$29–99/mo — see INTEGRATIONS.md); it is not wired into this build.
- Posting a review reply directly needs a Google Business Profile token; without it, the agent drafts the reply and you paste it yourself.
- It drafts every reply and never sends or posts without your approval — decisions to send are always yours.
- The 30-minute poll means near-real-time, not instant, and it is not a full helpdesk or ticketing system.
