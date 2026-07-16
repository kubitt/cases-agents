# Integrations: Idea to Reality

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Recommended | The "Idea Ledger": every idea with its Reality Signal, verdict, and brief link | Native OAuth, 1 click — $0 |
| Google Docs | Recommended | The structured concept brief, one doc per idea | Native OAuth, 1 click — $0 |
| Built-in web search | Included | Find existing/similar products, judge how crowded and fast-moving the space is | Native, no key — $0 |
| Telegram | Recommended | The weekly re-check digest | Native OAuth channel, 2-min setup — $0 |
| Google Drive | Optional | Keep all concept briefs in one "Idea Briefs" folder | Native OAuth — $0 |

Secrets to create before first run (Settings → Secrets): NONE. This agent needs no API keys or tokens — every integration is native OAuth or runs on built-in web search. That is the point: real competitor validation with zero external spend beyond the $29/mo ASCN plan.

Onboarding connection order: building context → validation method → Google Sheets (ledger) → Google Docs / Drive (briefs) → Telegram (digest) → validate first idea live.

Degradation: without Google Sheets — the ledger is kept in the workspace files instead, so idea history still compounds but is less shareable. Without Google Docs — the brief is delivered as formatted text in chat. Without Telegram — the weekly digest posts in the ASCN chat. Built-in web search always works; the reality check never depends on an external paid service.

Deliberately absent / notes:
- **No paid market-data source.** Competitor and demand evidence comes from public web results; exact private numbers (funding, traffic, download counts) are out of scope on the native plan.
- **No login-gated scraping.** The agent reads public pages only and respects each source's terms; it never signs into a site or works around a paywall.

Optional upgrades (not wired in — need approval + budget):
- SerpApi — structured Google/News search results and result counts for a sharper competitor-density read — ~$50/mo (via key in Settings → Secrets and a custom call).
- Semrush or Similarweb — competitor traffic and keyword-volume data to size real demand — ~$100+/mo (via key in Settings → Secrets and a custom call).
