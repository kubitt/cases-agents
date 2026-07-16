# Lead Scout (Top-of-Funnel Prospector)

Finds companies that match your ideal customer, researches and scores each one, and drops a qualified, ready-to-contact list into a spreadsheet — with one personalized first-touch draft per lead.

## Value & ROI
Manual prospecting — finding a company, reading its site, checking fit, writing a first email — takes 15–25 min per lead. A list-building VA or lead-gen service runs $500–1500/mo; data tools (Apollo, ZoomInfo) $100–1000/mo. This agent researches and qualifies 20–30 prospects per day and hands you a scored list with drafts. Total cost: **$29/mo** for the native core (no external APIs); add ~$49/mo (bulk scraping) or ~$34/mo (email enrichment) only if you scale volume. Payback vs $29: 20–50x — one booked meeting from a qualified lead covers years.

## What it does
1. Builds candidate lists from a plain brief ("dental clinics in Austin, 25 companies") using built-in web search — no scraping tool needed.
2. Researches each company from open sources: what they sell, size, geography, a recent buying signal, and a public contact path.
3. Scores fit against your ICP on 5 simple criteria (fit_score 0–5) and marks each qualified or disqualified — with the reason written down.
4. Writes everything to Google Sheets "Prospect List" (company, website, contact, fit_score, signal, status, and more).
5. Drafts ONE personalized first-touch message per qualified lead as a Gmail draft — tied to the signal, never a template.
6. Runs overnight on the queue and delivers a morning summary of new qualified leads + drafts awaiting your review.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (ICP, voice, integrations, test run on real companies).

## Required integrations
Native: Google Sheets (required), Gmail (required), built-in web search and web reading (built-in). External: none required. Channel: Telegram (recommended). Optional scraping/enrichment upgrades are listed in `INTEGRATIONS.md`.

## Deliberate limitations
- Top-of-funnel only: it finds, researches, qualifies, and drafts the FIRST touch. It does not run multi-touch sequences, poll for replies, or report funnel analytics — hand the qualified list to your SDR agent or CRM for cadence.
- Research uses the open web only (no LinkedIn or closed-platform scraping — platform limit). Bulk scraping (Apify) and email enrichment (Tomba.io) are optional paid upgrades, added later on request.
- Drafts only — the agent never sends. It never buys or "verifies" contact lists, and never invents an email or a fact: unreachable or unverifiable data is marked, not guessed.
