# Integrations: LinkedIn Page Manager

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | "LinkedIn Calendar": slots, statuses, post_urn, analytics | OAuth, 1 click — free ($0) |
| Google Docs | Required | "Post Drafts": editable master copy of every post | OAuth, 1 click — free ($0) |
| Web search | Required | Sourced post angles and timely hooks | Built in — free ($0) |
| Telegram (channel) | Recommended | Draft batches, digests, and approvals | 2-min setup — free ($0) |
| LinkedIn Community Management API | Optional | Connected mode: publish/schedule to the Page, pull analytics | Your own developer app; token in Secrets as LINKEDIN_ACCESS_TOKEN — official API, free ($0) |
| X API | Optional | Text fan-out of an approved post | Token in Secrets as X_BEARER_TOKEN — official API, free tier ($0) |
| Threads API | Optional | Text fan-out of an approved post | Token in Secrets as THREADS_ACCESS_TOKEN — official API, free ($0) |

Onboarding connection order: Google Sheets → Google Docs → Telegram → (optional) LinkedIn / X / Threads tokens.

Degradation: without Telegram — batches and digests arrive in ASCN chat; without any LinkedIn token — full draft mode (plan, draft, approve, post by hand), which is the default and needs no setup.

Deliberately absent: no third-party scheduler (Buffer/Hootsuite and similar) — those are the $15–99/mo cost this agent removes; native drafting plus official APIs instead. No image or video generation. Personal LinkedIn profiles are not supported — company Pages only.

Optional upgrades (not wired in — need approval + your own app): LinkedIn Community Management API (publish + analytics), X API and Threads API (text fan-out) — all official and free ($0); the one-time cost is the developer-app approval time, not money.
