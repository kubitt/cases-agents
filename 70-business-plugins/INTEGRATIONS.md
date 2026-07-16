# Integrations: Business Planning & Reporting Officer

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | The one "KPI Dashboard" — statuses, trends, sources | OAuth, 1 click |
| Google Docs | Required | Plans ("Plan — {name}") and briefs the user can edit and share | OAuth, 1 click |
| Google Calendar | Required | Daily meeting prep — attendees, agenda, week ahead (read-only) | OAuth, 1 click |
| Web search | Required | Cited benchmark and market context | Built-in, zero setup |
| Telegram (channel) | Recommended | Weekly brief, daily meeting prep, approvals | 2-min setup |
| Notion | Optional | Native alternative store for plans/briefs | OAuth |

Onboarding connection order: Google Sheets → Google Docs → Google Calendar → Telegram.

Degradation: without Telegram — briefs and prep arrive in ASCN chat; without Calendar — the weekly brief still runs, but there is no automatic meeting prep; without Docs — plans stay as summaries in chat and the KPI Dashboard.

Deliberately absent: any paid data or BI connector (no native OAuth, cost, and factual-only policy) — KPIs are entered by the user; benchmarks come from built-in web search.

Secrets: NONE — every integration is native OAuth or built-in. No API keys or tokens are created.

Optional upgrades (not wired in — need approval + budget):
- Market-data API (Financial Modeling Prep / Alpha Vantage) — richer public-company benchmarks — ~$20–50/mo, factual figures only (no investment advice).
- Auto-KPI ingestion from a data warehouse / BI tool via a custom MCP server — removes manual number entry — cost varies by tool.
