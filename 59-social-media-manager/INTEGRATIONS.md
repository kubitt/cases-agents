# Integrations: Social Media Manager

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Recommended | The "Content Calendar": slots, pillars, statuses, draft links | Native OAuth, 1 click — $0 |
| Google Docs | Recommended | The "Post Drafts" doc: master copy + per-network versions | Native OAuth, 1 click — $0 |
| Built-in web search | Included | Real trends and a sourced angle for each post | Native, no key — $0 |
| Telegram | Recommended | The approval queue and the weekly / daily digests | Native OAuth channel, 2-min setup — $0 |
| Google Drive | Optional | Organize draft docs and reference a shared asset folder | Native OAuth — $0 |

Secrets to create before first run (Settings → Secrets): NONE. The core is fully native — no API keys or tokens. That is the point: a complete planning-and-copy workflow with zero external spend beyond the $29/mo ASCN plan.

Onboarding connection order: brand and networks → pillars → Google Sheets (calendar) → Google Docs (drafts) → Telegram (approvals) → plan the first week and draft one post.

Degradation: without Google Sheets — the calendar is held in the agent's workspace files instead, so history still compounds but is less shareable. Without Google Docs — drafts stay as shorter text inside the calendar's notes column. Without Telegram — the queue and digests post in the ASCN chat. Built-in web search always works; planning and copy never depend on an external service.

Deliberately absent: no native connector posts to Instagram, X, LinkedIn, or TikTok (closed platform APIs), and there is no image or video generation. The agent delivers an approve-ready package you publish yourself.

## Optional upgrades (not wired in — need approval + budget)
- **Paid multi-social posting API** (e.g. OmniSocials — the source project — or a comparable service such as Ayrshare/Blotato) — auto-publishes approved posts to Instagram, X, LinkedIn, TikTok, Pinterest, YouTube, Threads, and more after your confirmation. ~$19–39/mo depending on channel count (estimate — verify the provider's current pricing). Wire it in later via the provider's API key in Settings → Secrets; publishing still asks for your confirmation every time.
- **AI image generation** (e.g. an image model via OpenRouter) — one visual per post. ~$1–3/mo at a few posts a week. Only if you want the agent to own visuals too.
