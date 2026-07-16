# Integrations: Small-Business Assistant

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | "Business Metrics" (weekly numbers) and "Content Plan" (schedule) | OAuth, 1 click |
| Google Docs | Required | Where the weekly review, drafts, and market scans are written | OAuth, 1 click |
| Gmail | Required | Draft marketing emails and deliver the review summary; sending only after your approval | OAuth, 1 click |
| Google Calendar | Recommended | Adds content publish dates and review reminders | OAuth, 1 click |
| Web search + reading | Built-in | Benchmarks and competitor pages, always with a source link | none, zero setup |
| Telegram (channel) | Recommended | Monday review summary and approval prompts | 2-min setup |

Onboarding connection order: Google Sheets → Google Docs → Gmail → Google Calendar → Telegram.

Degradation: without Telegram — the summary arrives in ASCN chat; without Google Calendar — content dates stay in the "Content Plan" sheet only; without Gmail — email drafts are written into a Google Doc instead.

Deliberately absent: SimilarWeb / Ahrefs / Semrush and social ad platforms (no native connector; closed to direct posting) — the market scan uses public web pages, and ad numbers are entered in "Business Metrics" by hand.

Optional upgrades (not wired in — need approval + budget):
- SEO / competitor data API (DataForSEO or Serpstat) — richer traffic, keyword, and backlink data for the market scan — ~$50–120/mo at a small-business query volume; key stored in Settings → Secrets.
- Ads / analytics connector (Supermetrics-style or a custom MCP to Meta / Google Ads) — auto-fills ad spend and ROAS into "Business Metrics" instead of manual entry — ~$50–100/mo.
- Image generation API (OpenAI gpt-image / DALL·E) — campaign visuals attached to drafts — ~$10–30/mo at light volume.
