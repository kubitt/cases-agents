# Integrations: Earnings Tracker

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Recommended | The "Earnings Log": watchlist rows, report dates, results, verdicts | Native OAuth, 1 click — $0 |
| Telegram | Recommended | The weekly preview and each earnings summary | Native OAuth channel, 2-min setup — $0 |
| Built-in web search | Included | Earnings calendar, report dates, actual results and consensus | Native, no key — $0 |
| Notion | Optional | Native alternative to Google Sheets for the ledger | Native OAuth — $0 |

Secrets to create before first run (Settings → Secrets): NONE. Every integration is native OAuth or built-in web search. That is the point: a full earnings tracker with zero external spend beyond the $29/mo ASCN plan.

Onboarding connection order: companies/watchlist → summary format → Google Sheets (ledger) → Telegram (channel) → notification window → timeliness → weekly preview + results-check crons → live test.

Degradation: without Google Sheets — the log is held in the workspace files instead, so history still compounds but is less shareable (Notion is the native alternative). Without Telegram — the preview and summaries post in the ASCN chat instead. Web search always works; the tracking never depends on a paid service.

Deliberately absent / notes:
- **No investment advice, ever.** The agent tracks and summarizes facts; it never recommends buying, selling, or holding, and shows a "not financial advice" note on every summary.
- **No paid market-data API in the core.** Calendar and results come from web search; there is nothing to pay for and no key to leak.
- **No browser automation, no trading, no payments.** It reads public sources and reminds you; you act.

Optional upgrades (not wired in — need approval + budget):
- Financial Modeling Prep API — confirmed earnings calendar + consensus estimates and actuals, less web-search guesswork — ~$22/mo (Starter) at a few hundred companies tracked; key in Secrets as FMP_API_KEY.
- Finnhub API — earnings calendar and surprise (actual vs estimate) data — ~$50/mo; key in Secrets as FINNHUB_API_KEY.
- Alpha Vantage API — earnings history and estimates — ~$50/mo (premium); key in Secrets as ALPHAVANTAGE_API_KEY.
