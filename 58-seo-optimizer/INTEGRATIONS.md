# Integrations: SEO Optimizer

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Search Console | Required | Real clicks, impressions, CTR, and ranking positions for your site | OAuth, 1 click |
| Google Sheets | Required | "SEO Tracker" workbook: Keyword Map, Rank Tracker, Audit Log | OAuth, 1 click |
| Google Docs | Recommended | Content briefs and audit reports your team can open and comment on | OAuth, 1 click |
| Web search + web reading | Required | SERP analysis, competitor pages, on-page fetch for audits | Built-in, no setup |
| Telegram (channel) | Recommended | Weekly report delivery and approvals | 2-min setup |

Onboarding connection order: Search Console → Sheets → Docs → Telegram.

Degradation: without Search Console — audits and briefs still work, but rank/traffic tracking is unavailable; without Docs — briefs and audits stay as chat text and summaries in "Audit Log"; without Telegram — reports arrive in ASCN chat.

Deliberately absent: paid SEO/SERP indexes (Ahrefs, Semrush, DataForSEO) — the native core estimates volume and difficulty from live search results instead. No browser automation (platform limit), so no logged-in tool scraping.

Optional upgrades (not wired in — need approval + budget):
- Ahrefs API — accurate keyword volume, difficulty, and backlink data — ~$129/mo (Lite plan).
- Semrush API — keyword and position database — ~$140/mo (Pro plan; API units billed on top).
- DataForSEO — pay-as-you-go SERP and keyword data — from ~$25/mo at low volume.
- Google PageSpeed Insights API — Core Web Vitals field data — free, optional API key to lift rate limits.

Each upgrade would need its API key added in Settings → Secrets and is disclosed here for cost before anyone enables it.
