# Integrations: Overnight Mini-App Builder

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Drive | Recommended | Stores every built artifact (HTML app, CSV, script) so you can open or download it | Native OAuth, 1 click — $0 |
| Google Sheets | Recommended | The "Build Queue" and "Build Log" | Native OAuth — $0 |
| GitHub | Optional | Push finished code to a repo (only after you confirm each push) | Native OAuth — $0 |
| Telegram | Recommended | Morning delivery and ship/confirm messages | Native OAuth channel, 2-min setup — $0 |
| Built-in web search + reading | Included | Check current library/API docs before coding | Native, no key — $0 |
| In-container code | Included | Writes and runs the build (Python first, TypeScript second) | Runs in the agent's own container — $0 |
| Notion | Optional | Native alternative to Google Sheets for the queue/log | Native OAuth — $0 |

Secrets to create before first run (Settings → Secrets): NONE. The core agent needs no API keys or tokens — every integration is native OAuth or runs locally. Core total cost: $29/mo (ASCN Start, 10,000 credits) and nothing else.

Onboarding connection order: Google Drive → Google Sheets (queue/log) → GitHub (optional) → Telegram → build nights → live test build.

Degradation: without Google Drive — artifacts stay in the workspace files/ folder (still downloadable, less shareable). Without Google Sheets — the queue and log live in workspace files (Notion is the native alternative). Without GitHub — builds are delivered as files only; you move them yourself. Without Telegram — delivery posts in the ASCN chat. Web search and in-container code always work; the build itself never depends on a paid service.

Deliberately absent:
- **No live deployment in the core.** The agent builds and hands off; putting an app on a public URL uses an optional upgrade below and always needs your confirmation.
- **No browser automation, no voice calls, no WhatsApp** — cloud-side building only.
- **No paid build tools.** Code is written and run in the agent's container; there is nothing to pay for beyond the $29/mo plan.

Optional upgrades (not wired in — need approval + budget):
- **Vercel or Netlify** (REST + token in Settings → Secrets) — turn a built app into a live URL — free hobby tier; ~$20/mo for Pro (custom domains, more builds).
- **A runtime data or model API the built app itself needs** (for example a data feed or an LLM key) — priced by the provider, often a free tier, roughly $5–20/mo for light use.
