# Integrations: X Account Analyst

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | "X Post Log": post history, classifications, engagement metrics, analysis | OAuth, 1 click |
| Web search + web page reading | Required (built-in) | Read publicly visible posts and benchmark accounts; gather context | Built-in, no setup |
| Telegram (channel) | Recommended | Deliver the weekly content review and audits | 2-min setup |
| Google Docs | Optional | Long-form audit reports beyond a chat message | OAuth |

Onboarding connection order: Google Sheets → Telegram (→ Google Docs if wanted).

Degradation: without Telegram — reviews arrive in ASCN chat; without Google Docs — audits stay in chat + the Sheet. Without a user analytics export — the agent still works on publicly visible posts, but every rate is marked unverified.

Deliberately absent: any X/Twitter data API in the core (reading X at scale is paid; the core uses the user's own CSV export + public pages), browser automation (platform limit), auto-posting to X (out of scope — analysis only).

Optional upgrades (not wired in — need approval + budget):
| Service | Capability it would buy | ~Cost |
|---|---|---|
| Third-party X data API (e.g., twitterapi.io / a RapidAPI X endpoint) | Automatic pull of your full post history + metrics into "X Post Log", no manual CSV | ~$5–50/mo by volume |
| Official X API (Basic tier) | Sanctioned programmatic access to your posts and metrics | ~$200/mo |

If added later, the key goes in Settings → Secrets (e.g., X_API_KEY) and is wired into the weekly scan; it is never written into workspace files.
