---
name: weekly-review
description: Analyze last week's posted results and plan next week's content mix. Use during the Friday review task and on "weekly review" or "how did last week do".
---

# Weekly review

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn the metrics the user pasted into an honest read of what worked, and a concrete plan for next week — no invented numbers, no vanity spin.

## Algorithm
1. Open Google Sheets "X Post Queue"; take rows with status=posted from the last 7 days that have impressions, likes and replies filled in.
2. If a row is missing metrics, skip it for scoring and note "data not provided" — never estimate a number.
3. Compute a simple engagement rate per post = (likes + replies) / impressions. Group by pillar, by hook style, and by post_type; average within each group.
4. Flag any group with fewer than 3 posts as "insufficient data" — report it, do not rank on it.
5. Name the best and weakest pillar, hook style, and post_type from groups that had enough data. Correlation is not proof — phrase findings as patterns, not guarantees.
6. Propose next week's mix: which pillars to do more of, one hook style to test, and 1–2 angles to retire. Write the plan into knowledge/CONTENT_STRATEGY.md notes.

## Output
```
Weekly review (7 posts, 2 skipped: no metrics)
Best pillar: lessons — 5.1% eng (3 posts)
Best hook: question openers — 4.8% eng
Best type: thread — 6.0% eng (insufficient data: 2 posts, treat as signal only)
Weakest: promo — 1.2% eng
Next week: +2 lessons posts, test 1 contrarian hook, pause promo. correlation only, not proof.
```

## Edge cases
- No metrics pasted at all → report "no data for this period", remind the user how to paste numbers, do not fabricate a review.
- One viral post skews the averages → report the median too and flag the outlier by name.
- Fewer than 3 posts total in the week → give observations only, no rankings, and say the sample is too small.
