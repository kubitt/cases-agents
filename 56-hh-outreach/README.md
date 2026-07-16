# Job-Post Prospector

Turns fresh job postings into a warm B2B pipeline: finds companies hiring for a role you can deliver, researches them, and drafts a personal pitch offering your service as the faster alternative to hiring — you only click send.

## Value & ROI
A company that just posted a well-paid vacancy is a lead with a confirmed budget and a concrete, urgent pain. Finding those companies, researching each one, and writing a personal opener is 20-30 minutes of manual work per lead; the agent prepares 20-30 per day overnight. An in-house SDR costs $800-2,000/mo; a prospecting tool $100-500/mo. Total cost: $29/mo (ASCN Start, 10,000 credits), no external APIs required for the core. Payback vs $29: 30-70x — one signed engagement covers years of subscription.

## What it does
1. Maintains a lead pipeline in Google Sheets "Outreach Pipeline" (add companies manually, by message, or by pasting a list).
2. Each night at 04:00 finds companies whose fresh postings match your target roles, using built-in web search over open, public pages only.
3. Researches each into a short dossier with ONE concrete hiring signal (multi-hire, named salary, or the role itself) and a source_url for every fact.
4. Writes an honest opener plus up to 2 follow-ups tied to the posted role, each carrying your booking link — openly from a service provider, never a disguised job application.
5. Weekday mornings at 09:00 delivers a batch of ready Gmail drafts for approval; sending is always your click.
6. Polls the mailbox for replies (every 30 min): classifies interested / question / objection / rejection / auto-reply, updates the pipeline, drafts a response. Friday: funnel analytics by role and opener type.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (offer, target roles, integrations, test run on 3 real companies).

## Required integrations
Native: Gmail (required), Google Sheets (required), built-in web search (research). External: none for the core. Channel: Telegram (recommended).

## Deliberate limitations
- No browser automation and no auto-submission to job boards (platform limit and, on HH.ru, a ToS and account-ban risk): the agent finds signals via the open web and delivers pitches as Gmail drafts you approve.
- The original source disguised a sales pitch as a mass job application in a mocking tone; that is deliberately dropped — outreach here is honest, respectful, and openly from a service provider (higher reply quality, no reputation risk).
- No LinkedIn scraping and no bought or "verified" contact lists: emails come from your data or official public pages only.
- No sender tool (Instantly/Smartlead) in the core — Gmail sending with time spacing; above ~50/day use a separate warmed domain. HH.ru API and senders are listed as Optional upgrades in INTEGRATIONS.md.
