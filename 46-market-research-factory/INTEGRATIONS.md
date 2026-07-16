# Integrations: Market Research Factory

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | The "Opportunity Ledger": pain signals, clusters, scores, statuses | Native OAuth, 1 click — $0 |
| Google Docs | Recommended | The "Opportunity Brief" build-ready MVP specs | Native OAuth — $0 |
| Built-in web search | Included | Reads public forums, review sites, and communities for pain signals | Native, no key — $0 |
| Python scripts | Included | Clustering counts and the Reach x Intensity x Gap opportunity score | Run in the agent's own container — $0 |
| Telegram | Recommended | The weekly digest and approval messages | Native OAuth channel, 2-min setup — $0 |
| Notion | Optional | Native alternative to Google Sheets for the ledger | Native OAuth — $0 |

Secrets to create before first run (Settings → Secrets): NONE. Every integration is native OAuth or runs locally. That is the point: full research rigor with zero external spend beyond the $29/mo ASCN plan.

Onboarding connection order: topics/sources → scoring rubric → Google Sheets (ledger) → Google Docs (briefs) → Telegram (digest) → live test run.

Degradation: without Google Sheets — the ledger lives in workspace files (Notion is the native alternative), so history still compounds but is less shareable. Without Google Docs — briefs are delivered as chat text. Without Telegram — the weekly digest posts in the ASCN chat. Web search and the Python scripts always work; the core pipeline never depends on an external service.

Deliberately absent / notes:
- **No X/Twitter firehose or login-gated communities.** Native research reads public pages and built-in search only, so X coverage is thin and Reddit is read via public pages, not bulk scraping.
- **No paid social-listening or scraping tools** are wired in. Every count and score is a small Python script, so there is nothing to pay for and nothing to leak.
- **No app building or shipping.** The agent delivers a build-ready brief; implementation is a separate step (a developer or a build agent).

Optional upgrades (not wired in — need approval + budget):
- Scraping API (e.g., Apify) — adds X/Twitter coverage, deeper Reddit history, and higher volume — ~$30–49/mo at a few thousand items/mo.
- SERP API (e.g., structured search provider) — cleaner, higher-volume search results for niche queries — ~$30/mo.
