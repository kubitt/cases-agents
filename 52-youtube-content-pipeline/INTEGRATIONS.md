# Integrations: YouTube Content Engine

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | "Idea Backlog" and "Video Catalog" — pitches, scores, statuses, and your published-video list for dedup | OAuth, 1 click |
| Google Docs | Required | The content package per approved idea: titles, outline, description, tags, thumbnail brief, checklist | OAuth, 1 click |
| Web search / reading | Required | Built-in topic research and trend scouting | Built-in, no setup |
| Slack | Optional | Link-intake channel: drop a link, it becomes a researched backlog idea | OAuth, 1 click |
| Notion | Optional | Native alternative to Google Sheets for the backlog if you already live in Notion | OAuth, 1 click |
| Telegram (channel) | Recommended | Morning pitch digest and idea alerts | 2-min setup |

Onboarding connection order: Google Sheets → Google Docs → (optional) Slack → Telegram.

Degradation: without Telegram — the pitch digest arrives in ASCN chat; without Slack — drop links straight into chat and the agent researches them the same way; without Docs — packages fall back to a long cell/note in Sheets (not recommended).

Deliberately absent: YouTube (no native connector — the agent prepares, you upload), X/Twitter (paid API), Asana/Todoist from the original workflow (replaced by the native "Idea Backlog" in Sheets + package Docs).

Optional upgrades (not wired in — need approval + budget):
- YouTube Data API v3 — schedule uploads of finished videos and sync real view counts / CTR / retention into "Video Catalog" — API is free (no monthly fee) but needs a Google Cloud project + OAuth setup; ~$0/mo.
- X/Twitter API — pull related posts and early trend signals into topic research — X API Basic ~$100/mo, or a vetted scraping provider ~$30–50/mo.
- AI thumbnail image generation — turn the written thumbnail brief into draft images — image-generation API ~$5–20/mo by volume.
- Keyword / SEO volume data — real search volume and competition for titles and tags — keyword API ~$30–60/mo.
- Vector-embedding semantic dedup — for very large catalogs, embed ideas for similarity search beyond topic-level matching — embeddings API ~$5/mo plus a vector store.
