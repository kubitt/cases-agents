# Integrations: Pricing & Positioning Advisor

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | "Pricing Model" and "Competitor Pricing" tables | Native OAuth, 1 click |
| Google Docs | Recommended | The "Positioning Brief" deliverable | Native OAuth, 1 click |
| Web reading (built-in) | Required | Reading competitors' public pricing and positioning pages | Built-in, zero setup, free |
| Telegram | Recommended | Quarterly and monthly review notifications | Native OAuth channel, 2-min setup |

Secrets to create before first run: none. This agent uses no external paid API and needs no keys or tokens.

Onboarding connection order: product and costs → Google Sheets (create both tables) → Google Docs → Telegram → notification window.

Degradation: without Google Docs — the "Positioning Brief" is kept in a sheet tab or plain chat instead of a formatted doc. Without Telegram — the quarterly and monthly reviews arrive in ASCN chat. Google Sheets is required — the pricing tables and competitor comparison live there.

Deliberately absent / notes:
- No external paid API. Competitor pricing is read from public pricing pages via built-in web reading; there is no scraping service, SERP key, or pricing-data vendor.
- No live A/B testing or experimentation tooling — this agent advises; running experiments is agents 42 CRO and 43 Growth Experiment Engine.
- For raw daily competitor-price monitoring, pair with agent 38 Competitor Price Watch; this agent is the strategic layer that interprets the numbers.

Optional upgrades (not wired in — need approval + budget): a scraping/parsing API such as Firecrawl for JS-heavy pricing pages — ~$0 on the free tier, then usage-based — only if some competitor pricing pages hide prices behind JavaScript.
