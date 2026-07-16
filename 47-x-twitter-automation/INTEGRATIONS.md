# Integrations: X Content Engine

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | "X Post Queue": drafts, schedule, status, pasted metrics | OAuth, 1 click |
| Web search + web reading | Required | Nightly trend research; source links for every claim | Built in, no setup, no cost |
| Telegram (channel) | Recommended | Morning briefs, due-post reminders, approvals | 2-min setup |
| Google Docs | Optional | Long thread drafts and a swipe file of winners | OAuth |

Onboarding connection order: Google Sheets → Telegram (→ Google Docs if wanted).

Degradation: without Telegram — briefs and reminders arrive in ASCN chat; without Google Docs — long threads stay in the queue's draft_text cell.

Deliberately absent: direct X (Twitter) posting (paid API, see below), browser scraping (platform limit + X terms of service), automatic engagement metrics (needs the X API — you paste numbers instead).

Optional upgrades (not wired in — need approval + budget):
| Upgrade | What it buys | ~Cost/mo |
|---|---|---|
| X (Twitter) API — Basic tier, via custom MCP or direct API | Auto-post the approved queue, read real engagement metrics, pull follower/liker/retweeter lists, live account monitoring, automated giveaway winner extraction | ~$200/mo |
| Typefully or Buffer API | Auto-schedule and publish the approved queue without a full X API | ~$15–30/mo |

Both upgrades keep the same "approve before publish" rule — the agent never posts without your confirmation.
