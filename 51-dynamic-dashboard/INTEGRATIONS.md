# Integrations: Dynamic Dashboard

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Recommended | The "Metrics Registry" (definitions) and "Metrics History" (every reading over time); also a common metric source | Native OAuth, 1 click — $0 |
| Telegram | Recommended | The morning dashboard summary and any breach alerts | Native OAuth channel, 2-min setup — $0 |
| Built-in web search | Included | Read public numbers (prices, published rates, competitor public figures) as metric sources | Native, no key — $0 |
| Python scripts | Included | Compute deltas and status, render dashboard.html and dashboard_snapshot.csv | Run in the agent's own container — $0 |
| Google Drive | Optional | Store the rendered dashboard.html and CSV in a "Dashboard" folder you can open anytime | Native OAuth — $0 |
| Google Docs | Optional | A written summary doc ("Dashboard Summary") alongside the HTML | Native OAuth — $0 |
| Gmail | Optional | Email the morning summary with the CSV attached, instead of (or with) Telegram | Native OAuth — $0 |

Secrets to create before first run (Settings → Secrets): NONE. The native core needs no API keys or tokens — every source is native OAuth, built-in web search, or a value you paste. That is the point: a self-refreshing dashboard with zero external spend beyond the $29/mo ASCN plan.

Onboarding connection order: business + metrics → Google Sheets (Registry + History) → notification channel/window → refresh cadence → build the first dashboard live.

Degradation: without Google Sheets — the Registry and History are kept in the agent's own workspace files, so history still compounds but is less shareable. Without Google Drive — the HTML/CSV stay in the agent's files and are linked in the summary. Without Telegram — the summary posts in the ASCN chat. Web search and Python always work; the compute and render never depend on an external service.

Deliberately absent:
- **No browser automation** — the agent will not log into a third-party dashboard and scrape numbers off the screen. Point it at a Sheets cell or a public URL instead.
- **No always-live web app** — it rebuilds a static HTML file on schedule, not a streaming server.

Optional upgrades (not wired in — need your approval, a key in Secrets, and budget):
- Marketing/analytics data API (e.g. Supermetrics-style connector) — auto-pull GA / ad-platform / social metrics into the Registry — ~$29–99/mo depending on sources.
- SERP / rank-tracking API (e.g. DataForSEO) — pull keyword positions and search-visibility metrics — pay-as-you-go, ~$10–25/mo at light volume.
- Market-data API (e.g. Alpha Vantage or Finnhub premium) — live stock / crypto / FX metrics beyond what free web search gives — ~$25–50/mo.
