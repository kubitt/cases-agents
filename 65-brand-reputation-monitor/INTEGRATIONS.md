# Integrations: Brand Reputation Monitor

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | "Mention Log": every mention, sentiment, score, topic, status | OAuth, 1 click |
| Web search + page reading | Required | Find and read public mentions across review sites, news, forums | Built-in, zero setup |
| Telegram (channel) | Recommended | Weekly digest + immediate negative-mention alerts | 2-min setup |
| Notion | Optional | Alternative to Sheets for the mention log | OAuth |
| Slack | Optional | Alternative channel for digests and alerts | OAuth |

Onboarding connection order: Google Sheets → Telegram.

Degradation: without Telegram — digests and alerts arrive in ASCN chat; without Sheets — mentions can be kept in Notion instead, or exported as CSV on request.

Deliberately absent: no paid scraping or social-listening API in the core (cost, and public web search covers the common review sites and forums); no browser automation or closed-API social posting (platform limits, source terms of service). Secrets required for the core: NONE.

Optional upgrades (not wired in — need your approval + budget):
- Apify review/social Actors — deep scraping of Google Maps, Booking, and TripAdvisor reviews plus Facebook / Instagram / YouTube / TikTok comments that public web search cannot fully reach — ~$49/mo (Apify Starter) + per-run usage; key stored in Settings → Secrets as APIFY_TOKEN. Ask the deployed agent to add it.
- Brand24 or Mention.com API — near-real-time listening across social and the broader web with its own alerting — ~$79/mo; key in Settings → Secrets. For higher volume than scheduled web-search scans.
