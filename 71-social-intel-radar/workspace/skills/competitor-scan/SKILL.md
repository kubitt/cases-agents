---
name: competitor-scan
description: Find the recent best public posts from tracked competitor and creator handles and log them. Use during the nightly scan task, when the user says "scan now" or "check competitors", and in the onboarding test run.
---

# Competitor scan

> A skill is one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: for every tracked handle, capture its recent best-performing public posts as clean rows — real format, real hook_type, engagement marked verified or estimated, zero duplicates, zero invented numbers.

## Algorithm
1. Read knowledge/NICHE_PROFILE.md (tracked handles, platforms, banned topics) and knowledge/RESEARCH_METHOD.md (how to classify format and hook_type, the verified-vs-estimated rule, the engagement_rate formula).
2. For each handle, use built-in web search and page reading to find its recent standout public posts (roughly the last 14 days, top 3-5 by visible reach). Read only public pages; skip anything login-gated or paywalled.
3. Dedupe: skip any post older than the saved `last_scan_marker` for that handle, and skip any post_url already in "Social Intel Log".
4. For each post extract: date, platform, source_handle, post_url, format, hook_type, topic (skip banned topics), and any visible likes, comments, shares, views.
5. Mark verified = yes when a number is shown on the public page; verified = no (estimated) when I inferred it. Never copy a number I cannot see and never guess exact figures as if verified.
6. Compute engagement_rate per knowledge/RESEARCH_METHOD.md, for example in Python:
   `engagement_rate = round((likes + comments + shares) / views, 4) if views else round((likes + comments + shares) / followers, 4)`
7. Append one row per post to "Social Intel Log" (date, platform, source_handle, post_url, format, hook_type, topic, likes, comments, shares, views, engagement_rate, verified, notes). Update `last_scan_marker` per handle to the newest post seen.

## Output
One appended row per post, e.g.:
2026-07-15 | tiktok | @fitcoach_amy | tiktok.com/@fitcoach_amy/video/7391 | talking-head demo | pattern-interrupt | home workouts | 48200 | 910 | 1300 | 612000 | 0.0824 | yes | pinned-comment CTA
2026-07-15 | instagram | @rival_brand | instagram.com/reel/Cxy9 | before-after | proof/result | resistance bands | 5100 | 88 | 0 | | 0.0192 | no | views hidden, /followers basis
Then a one-line summary: "Competitor scan done: 12 new posts across 6 handles (9 verified, 3 estimated). Logged to Social Intel Log."

## Edge cases
- Handle unreachable or its page blocks reading → skip it, note "handle unavailable" in the summary, do not guess its posts; cap retries at 2.
- Exact counts hidden by the platform → record what is visible, set verified = no, and use the /followers basis for engagement_rate per RESEARCH_METHOD.md.
- Same post already logged (duplicate post_url) → do not add a row; if reach changed a lot, update the existing row and note "refreshed" in notes.
- A post about a banned or irrelevant topic → do not log it; the log stays on-niche.
