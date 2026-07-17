# Integrations: Viral Short-Form Writer

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | "Idea Bank" and "Swipe File": ideas, hooks, angles, status, winning patterns | OAuth, 1 click |
| Web search + web reading | Required | Real trend context and source links so hooks aren't invented | Built in, no setup, no cost |
| Native multimodal reading | Required | Reads a pasted image, screenshot, or rough script | Built in, no setup, no cost |
| Telegram (channel) | Recommended | Weekly idea drops and quick delivery | 2-min setup |
| Google Docs | Optional | Long scripts and a bigger swipe file | OAuth |

No secrets and no external API keys are needed — the whole core is native. Total running cost is the $29/mo ASCN Start plan.

Onboarding connection order: Google Sheets → Telegram (→ Google Docs if wanted).

Degradation: without Telegram — weekly idea drops and results arrive in ASCN chat; without Google Docs — long scripts stay in the Idea Bank cell.

Deliberately absent: direct posting to Instagram / TikTok / YouTube / Threads / Xiaohongshu (no native connector + closed APIs — you publish by copy-paste), live trending-sound catalogs and real competitor metrics (need a paid data API).

Optional upgrades (not wired in — need approval + budget):

| Upgrade | What it buys | ~Cost/mo |
|---|---|---|
| Social data API (a SERP/social provider via custom MCP or direct API) | Live trending sounds and hashtags, plus real competitor metrics for research | ~$50–200/mo depending on volume |

This upgrade keeps the same rule — the agent researches and writes; you still publish yourself.
