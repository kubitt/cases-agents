# Integrations: Social Intel Radar

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | "Social Intel Log" and "Trend Radar": every competitor post and rising trend | OAuth, 1 click |
| Web search + page reading | Required | Find and read public posts, trend pages, and niche news | Built-in, zero setup |
| Telegram (channel) | Recommended | Weekly what's-working brief | 2-min setup |
| Notion | Optional | Alternative to Sheets for the logs | OAuth |
| Slack | Optional | Alternative channel for the brief | OAuth |

Onboarding connection order: Google Sheets → Telegram.

Degradation: without Telegram — the brief arrives in ASCN chat; without Sheets — logs can be kept in Notion instead, or exported as CSV on request.

Deliberately absent: no paid scraping or social-listening API in the core (cost, and public web search covers competitor pages, trend pages, and niche news); no browser automation or closed-platform posting (platform limits, source terms of service). Secrets required for the core: NONE.

Optional upgrades (not wired in — need your approval + budget):
- CreatorCrawl API — structured metrics, historical data, video transcripts, and ad-library data for Western platforms (TikTok, Instagram, YouTube, LinkedIn, X, Reddit) that public web search cannot fully reach — ~$29-49/mo; key stored in Settings → Secrets as CREATORCRAWL_API_KEY. Ask the deployed agent to add it.
- TikHub API — the same structured data for Chinese platforms (Douyin, Xiaohongshu, Weibo, Bilibili) — pricing similar (~$29-49/mo); key in Settings → Secrets as TIKHUB_API_KEY. Use when your niche lives on those platforms.
