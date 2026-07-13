# Competitor Price Watch

Checks your competitors' pricing pages every morning, compares them to yesterday, and sends a short summary of what changed — prices, plans, discounts — straight to Telegram.

## Value & ROI
Manually checking 10 competitors' pricing pages is 30–60 minutes a day, and people quietly stop doing it after a week — so a competitor's price cut goes unnoticed for months. A market-intelligence tool runs $50–300/mo. The agent watches every morning for the price of the subscription. Total cost: $29/mo (ASCN Start); web reading and Telegram are free, Firecrawl is an optional add-on only for JS-heavy pages. Payback vs $29: catching one competitor's move in time — a matched price or a defended deal — pays for years.

## What it does
1. Reads your competitor list from Google Sheets (name, pricing URL, what to track).
2. Each morning fetches every competitor's pricing page (built-in web reading; Firecrawl for JS-heavy pages).
3. Extracts the tracked plans/prices and compares them to yesterday's stored values.
4. Computes the change in % and classifies it (increase / cut / new plan / promo / removed).
5. Sends a short Telegram summary: competitor, what changed, was → became, delta %. Nothing changed → "No changes ✅".
6. Optionally flags when a competitor drops below your price, or on big moves (≥15%).
7. Saves today's values as the new baseline and keeps a full price history in the sheet.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, 3 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — integrations, costs, and the daily cron.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~7 min: competitor list, Google Sheets, a test read of the pages, notification channel, daily time).

## Required integrations
Native: Google Sheets (required — list + history), Telegram (recommended — the summary). Built-in web reading (required, free). Optional: Firecrawl API for JS-heavy pricing pages. Secrets: none required; `FIRECRAWL_API_KEY` optional.

## Deliberate limitations
- **Public pricing pages only.** No prices behind logins or paywalls, no bypassing site protections — the agent reads what any visitor can see.
- **JS-heavy pages may need Firecrawl.** If a page renders prices only via JavaScript and you haven't added Firecrawl, the agent flags it "unreadable" rather than guessing.
- **Reports facts, not strategy.** The agent tells you what changed; deciding how to respond is yours (or a separate pricing-analysis agent's).
- **Not a full market radar.** It watches prices, not news, mentions, or product launches — those are a different agent.
- **Parsing can drift.** If a competitor redesigns its pricing page, the agent flags "parsing hint needs update" and asks you, instead of reporting a wrong number.
