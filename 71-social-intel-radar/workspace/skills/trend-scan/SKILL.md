---
name: trend-scan
description: Find rising topics, hashtags, sounds, and content formats in the niche and log them with a source. Use during the nightly scan task, when the user says "what's trending" or "scan trends", and in the onboarding test run.
---

# Trend scan

> A skill is one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: surface what is genuinely rising in the niche right now — each item ranked by real momentum evidence and tied to a source URL. No source, no row.

## Algorithm
1. Read knowledge/NICHE_PROFILE.md (niche, platforms, content pillars, banned topics) and knowledge/RESEARCH_METHOD.md (how momentum is judged).
2. Use built-in web search across trend and news sources (platform trend pages, creator-economy news, niche blogs, subreddits) for rising items in the niche. Read only public pages.
3. Classify each item under type: hashtag, sound, format, or topic. Drop anything off-niche or on the banned list.
4. Judge momentum per knowledge/RESEARCH_METHOD.md and record it in plain words with the evidence, e.g. "rising — used in 3 of this week's top posts + named in 2 trend reports". Never label something a trend on a single weak mention.
5. Dedupe against "Trend Radar" for the last 14 days; if an item is already logged, update its momentum instead of adding a second row.
6. Append one row per item to Google Sheets "Trend Radar" (date, platform, trend, type, momentum, example_url, notes). Every row must have an example_url; if there is no source, do not log it.

## Output
One appended row per item, e.g.:
2026-07-15 | tiktok | #12weekchallenge | hashtag | rising — in 4 of this week's top niche posts + 1 trend report | tiktok.com/tag/12weekchallenge | creators pairing it with before-after clips
2026-07-15 | instagram | slow-zoom transition on the beat | format | steady — seen across 3 tracked handles, not yet in reports | instagram.com/reel/Cz00 | works for product reveals
Then a one-line summary: "Trend scan done: 5 rising items (2 hashtags, 1 sound, 1 format, 1 topic), all with sources. Logged to Trend Radar."

## Edge cases
- Only one weak mention of an item → hold it, do not log; note it privately and confirm next scan before it earns a row.
- Trend source unreachable → skip it, note "source unavailable" in the summary, do not fabricate momentum; cap retries at 2.
- Item already in Trend Radar → update the momentum and notes on the existing row; do not add a duplicate.
- A trend touches a banned or off-niche topic → do not log it, even if it is popular.
