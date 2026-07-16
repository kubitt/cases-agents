---
name: weekly-digest
description: Build the weekly reputation summary from the log. Use during the weekly digest task and whenever the user says "digest" for an on-demand summary.
---

# Weekly digest

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: a short, honest weekly read of the brand's reputation that a busy owner can act on in two minutes.

## Algorithm
1. Read Google Sheets "Mention Log" for the last 7 days (by the date column).
2. Count total mentions and the sentiment split: negative / neutral / positive counts and each as a share of the total.
3. Compute the week-over-week trend: compare this week's negative share to the prior 7 days. Report the direction and the change in points. If either week has fewer than 5 mentions, write "insufficient data" instead of a trend.
4. Pull the top negatives: highest-confidence, most negative score first; take up to 3, each with its snippet, topic, and url.
5. Group by topic to name the single biggest theme driving negatives this week (e.g. "support response time").
6. Write one recommended action tied to that theme — concrete, not generic. If nothing stands out, say the week was quiet and why.
7. Deliver to the channel, max 18 lines. Do not include private data or any content behind a login.

## Output
```
Reputation digest — week of Jul 8–14
Mentions: 23 (was 19) | negative 5 (22%) · neutral 12 · positive 6
Trend: negative share down 8 pts week-over-week — improving
Top theme in negatives: support response time (3 of 5)
Top negatives:
1. Trustpilot — "5 days, no fix" — support — trustpilot.com/...
2. Reddit — "billing ignored" — support — reddit.com/...
3. Google review — "hard to reach anyone" — support — g.co/...
Recommended: publish support hours + a 24h reply SLA; reply to the 3 above (drafts ready on request).
```

## Edge cases
- Fewer than 5 mentions all week → deliver a one-line "quiet week, N mentions" note, skip the trend, flag "insufficient data".
- No negatives at all → still send the digest with the positive/neutral counts and "no negatives this week — nice".
- A source went dark mid-week (no data) → note "data not provided for {source} this period" rather than implying zero mentions.
- User asks for a digest off-schedule → run the same steps for the last 7 days or the range they name.
