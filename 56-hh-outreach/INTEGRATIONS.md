# Integrations: Job-Post Prospector

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Gmail | Required | Drafts, approved sending, reply polling | OAuth, 1 click |
| Google Sheets | Required | "Outreach Pipeline": leads, signals, statuses, touch history, analytics | OAuth |
| Web search | Required | Find fresh postings and research companies on the open web | Built-in, no setup |
| Telegram (channel) | Recommended | Morning draft batches for approval, reply alerts | 2-min setup |
| Google Docs | Optional | Long dossiers for key accounts | OAuth |

Onboarding connection order: Gmail -> Sheets -> Telegram.

Degradation: without Telegram — batches and alerts arrive in ASCN chat; without Docs — dossiers stay abbreviated in Sheets cells.

Deliberately absent: browser automation and auto-submission to job boards (no native support; on HH.ru also a ToS and account-ban risk); LinkedIn (no browser automation); Instantly/Smartlead/Apollo (no native connectors — Gmail sending plus a Sheets pipeline instead).

Optional upgrades (not wired in — need approval + budget):
- HH.ru API — a structured feed of fresh vacancies with salary and region filters, higher volume than open-web search; ~$0/mo (register a free developer app; key in Secrets as HH_API_TOKEN).
- Contact-enrichment API (e.g., Hunter/Snov) — find and verify decision-maker emails when official pages don't list one; ~$49/mo at ~1,000 lookups (key in Secrets as ENRICH_API_KEY).
- Dedicated cold-email sender (Instantly/Smartlead) via a custom MCP — a warmed domain for above ~50 sends/day; ~$37-97/mo (key in Secrets as SENDER_API_KEY).
