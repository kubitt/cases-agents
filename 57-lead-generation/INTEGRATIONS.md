# Integrations: Lead Scout (Top-of-Funnel Prospector)

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Web search + web reading | Built-in | Discover candidates, research companies, find public contacts | Included, zero setup |
| Google Sheets | Required | "Prospect List": companies, dossiers, fit_score, status | OAuth, 1 click |
| Gmail | Required | First-touch drafts (drafts only — never sends) | OAuth, 1 click |
| Telegram (channel) | Recommended | Morning summary + drafts-ready alerts | 2-min setup |
| Google Docs | Optional | Long dossiers for high-value accounts | OAuth |

Onboarding connection order: Google Sheets → Gmail → Telegram.

Degradation: without Telegram — the morning summary arrives in ASCN chat; without Gmail — the agent still researches and qualifies, and writes the first-touch text into the `first_touch` column for you to send manually; without Docs — dossiers stay compact in Sheet cells.

Deliberately absent: LinkedIn and other closed platforms (no browser automation — platform limit); paid scraping and enrichment APIs (not wired into the core — see below). The native core covers discovery via web search, research via web reading, and drafting via Gmail with no external spend.

Optional upgrades (not wired in — need your approval + budget; keys go in Settings → Secrets):
- Apify (Google Maps / SERP / directory scraping) — bulk discovery of hundreds of candidates per run beyond what web search returns — ~$49/mo at typical volumes.
- Tomba.io (email enrichment) — fills missing decision-maker emails from a name + company domain at scale — ~$34/mo.
- Apollo / Clearbit-style enrichment — firmographics (headcount, revenue, tech stack) to sharpen size_match scoring — ~$99/mo.
Ask the deployed agent to wire any of these in once you have a key; until then everything runs on the $29 native core.
