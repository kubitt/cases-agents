# Brand Reputation Monitor

Watches the public web for what people say about your brand, scores every mention positive or negative, logs it in one sheet, and sends a weekly digest — flagging negatives fast so you can respond.

## Value & ROI
Social-listening tools (Brand24, Mention.com, Sprout) run $79–249/mo, and a VA doing it by hand is ~5 hrs/week (~$500/mo) — and still misses the bad review that goes up overnight. This agent scans on a schedule, scores sentiment consistently, keeps a searchable log, and pings you the moment a high-confidence negative appears. Total cost: $29/mo (ASCN Start, 10,000 credits), no external API required for the core. Payback vs $29: roughly 5–20x versus a listening subscription, and far more the first time it catches a complaint before it spreads.

## What it does
1. Keeps every mention in Google Sheets "Mention Log" (columns: date, source, url, author, snippet, sentiment, score, confidence, topic, status, notes) — one row per mention, deduped.
2. Scans your listed sources (review sites, news, forums) on a schedule using built-in web search and page reading — public pages only.
3. Scores each mention: sentiment (negative / neutral / positive), a score from -1.0 to +1.0, and confidence (high / medium / low), tagged by topic.
4. Flags high-confidence negatives inside your notification window, with the link and a suggested reply drafted for you to post yourself.
5. Sends a weekly digest (Monday 08:00): mention volume, sentiment split, week-over-week trend, top negatives, and one recommended action.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (brand details, sources, spreadsheet, then a live test scan on your real brand).

## Required integrations
Native: Google Sheets (required, the "Mention Log"). Built-in: web search and page reading (zero setup). External: none for the core. Channel: Telegram (recommended for digests and negative alerts).

## Deliberate limitations
- Public web only — no login-gated, private, or paywalled content, and no browser automation to click through sites (platform limit; respects each source's terms of service).
- Built-in web search does not reach deep into closed-API social platforms (Instagram, TikTok) or full review-platform exports (Google Maps, Booking, TripAdvisor). Those need a paid data provider — see Optional upgrades in INTEGRATIONS.md (Apify ~$49/mo, Brand24/Mention API ~$79/mo).
- Sentiment is a scored judgment with a confidence, not certainty; sarcasm and mixed reviews are marked low-confidence rather than guessed.
- The agent never posts, replies, or reviews on your behalf — it drafts, you approve and publish.
