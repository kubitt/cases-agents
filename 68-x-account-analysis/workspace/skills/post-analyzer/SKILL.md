---
name: post-analyzer
description: Classify and log one post or a batch of posts. Use when the user says "analyze this post", pastes post links or an analytics CSV, and during the weekly post scan.
---

# Post analyzer

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn each post into one clean, correctly labeled row in "X Post Log" — the raw material every review depends on. Wrong labels here poison every later insight, so classify carefully and mark unknowns honestly.

## Algorithm
1. Get the source. From a user CSV export: read post_url, date, and the metric columns directly (these are verified). From a pasted link or a public profile page: read only what is publicly visible; metrics you cannot see stay blank.
2. Read the post text. Record a text_excerpt (first ~120 chars, no edits).
3. Classify format: single / thread / image / video / poll / quote. A thread = the post has linked follow-up posts.
4. Classify hook_type from the opening line: question / bold-claim / story / list / how-to / contrarian / news. Use the definitions in knowledge/ANALYSIS_METHOD.md; if it fits none, write "other".
5. Assign topic from the user's content pillars in knowledge/ACCOUNT_PROFILE.md. No pillar fits → "off-pillar".
6. Compute engagement_rate = (likes + reposts + replies) / impressions x 100 when impressions are known; round to 1 decimal. If impressions are blank, leave engagement_rate blank and set verified=no.
7. Set verified=yes only when the numbers came from the user's own analytics export; otherwise verified=no. Append one row to "X Post Log"; if the post_url already exists, update that row instead of duplicating.

## Output
```
Logged 3 posts to "X Post Log":
2026-07-14 — thread — how-to — 6.2% (verified) — pillar: growth
2026-07-13 — single — question — 3.1% (verified) — pillar: mindset
2026-07-11 — image — story — impressions unknown, raw eng 240 (unverified) — pillar: build-in-public
```

## Edge cases
- Post or profile unreachable / login-walled → skip it, note "not publicly accessible" in the run summary; never guess its metrics.
- Impressions missing → leave engagement_rate blank, set verified=no, keep the raw likes/reposts/replies; do not fabricate a rate.
- Duplicate post_url → update the existing row, add "dedup" to notes; never add a second row for the same post.
- Ambiguous hook or no clear pillar → use "other" / "off-pillar" rather than forcing a label, and flag it in notes.
