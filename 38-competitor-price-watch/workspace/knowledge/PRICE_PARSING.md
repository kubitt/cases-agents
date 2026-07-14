# Price Parsing Hints

> Your reference file: per-competitor notes on where prices live on each page. The agent reads it during a scan and updates it when a page changes. Edit freely.
[FILLED DURING ONBOARDING — the agent maintains this file; the user may edit]

## How the agent finds prices
- Read the pricing page, locate plan cards / a pricing table, and pull the plan name + amount + period.
- Prefer clearly labeled amounts near a plan name over any number on the page.
- Keep the raw text string next to each parsed number for verification.

## Per-competitor hints
[FILL DURING ONBOARDING — one block per competitor, the agent refines these as it learns]
- Competitor: [name]
  - Pricing URL: [url]
  - Where prices are: [e.g., "3 plan cards in the middle; monthly/annual toggle defaults to monthly"]
  - Track: [e.g., Starter, Pro, Business]
  - Notes: [e.g., "JS-rendered — needs Firecrawl", "prices shown as 'from $X'"]

## Example filled
- Competitor: Acme
  - Pricing URL: https://acme.com/pricing
  - Where prices are: 3 plan cards; monthly/annual toggle (read the monthly view)
  - Track: Starter, Pro, Business
  - Notes: static HTML, built-in fetch is enough; watch the promo banner at top
- Competitor: Globex
  - Pricing URL: https://globex.io/prices
  - Where prices are: single pricing table
  - Track: Pro only
  - Notes: JS-rendered — use Firecrawl
