# Integrations: Second Brain

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | "Memory Index" — the searchable index, one row per captured item | OAuth, 1 click, $0 |
| Notion | Recommended | "Second Brain" — the store holding each item's full note and link summary | OAuth, 1 click, $0 |
| Google Docs / Drive | Optional | Alternative store if you prefer Docs over Notion | OAuth, $0 |
| Web reading | Built-in | Reads the page behind a saved link and summarizes it | Zero setup, $0 |
| Telegram (channel) | Recommended | Zero-friction capture from your phone + the weekly review | 2-min setup, $0 |

Onboarding connection order: Google Sheets → Notion → Telegram.

Degradation: without Notion — full notes and summaries live in the "Memory Index" `summary` cell in Google Sheets (shorter, but complete); without Telegram — capture and the weekly review happen in ASCN chat; without web reading (page unfetchable) — the link is kept with `status=to_read` and flagged, never summarized from a guess.

Deliberately absent: any read-later/AI-note SaaS (Readwise, Notion AI, Mem) — replaced by the native Sheets + Notion + built-in web reading combo at $0. Apple Notes / iMessage import (closed apps, no native connector) — replaced by forwarding text to the agent.

Optional upgrades (not wired in — need approval + budget):
- Scraping API (e.g. Firecrawl) — read JS-heavy, paywalled, or login-gated pages the built-in reader can't — ~$16/mo at a few hundred pages/mo.
- Readwise / Readwise Reader — import existing highlights and read-later articles — ~$8–10/mo.
- Transcription API (e.g. Deepgram or Whisper API) — capture voice notes as text — ~$5–15/mo at light personal use.
