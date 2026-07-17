# Integrations: YouTube Growth Analyst

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | "Channel Audit Log" and "Competitor Benchmark" — every metric, benchmark, verdict, and source | OAuth, 1 click |
| Google Docs | Required | The deliverable "Growth Roadmap" document | OAuth, 1 click |
| Web search + web page reading | Required (built-in) | Read channel/video pages, competitor context, and public references | Built-in, no setup |
| YouTube Data API v3 | Optional (recommended) | Public own-channel + competitor stats (subscribers, views, video counts, recent uploads, top videos) via plain REST from the container | Free key in a Google Cloud project; key in Secrets as YOUTUBE_API_KEY; 10,000 units/day free = ~$0/mo |
| Telegram (channel) | Recommended | Monthly re-audit summary and weekly competitor pulse | 2-min setup |

Onboarding connection order: Google Sheets → Google Docs → YouTube Data API key (or choose manual-paste mode) → Telegram.

Degradation: without the YouTube Data API key — the agent runs in manual-paste mode; the user pastes public stats and YouTube Studio numbers, and every automatic pull is unavailable (nothing is fabricated). Without Telegram — summaries arrive in ASCN chat. Own private analytics (watch-time, audience-retention curves, traffic sources, impressions click-through rate) are always pasted from YouTube Studio; there is no native automatic path for them.

Quota tip (baked into skill channel-audit): traverse the channel's uploads playlist with playlistItems.list (1 unit per call) instead of the 100-unit search.list call, so a full audit stays well inside the free 10,000 units/day.

Deliberately absent: automatic private YouTube Analytics (needs a self-hosted OAuth app ASCN does not provide — pasted from Studio instead), transcript scraping / yt-dlp (fragile and ToS-gray — the user pastes transcripts), video editing and thumbnail generation (out of scope — advisory only).

Optional upgrades (not wired in — need approval + budget):
| Service | Capability it would buy | ~Cost |
|---|---|---|
| DataForSEO | Live keyword / YouTube-SERP search volume and difficulty for title and topic decisions | ~$5–30/mo light use; keys in Secrets as DATAFORSEO_LOGIN + DATAFORSEO_PASSWORD |

If added later, the keys go in Settings → Secrets and are wired into the growth-roadmap SEO step; they are never written into workspace files.
