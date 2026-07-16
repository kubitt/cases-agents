---
name: content-review
description: Produce the recurring what's-working brief from "X Post Log". Use during the weekly content review task and when the user says "review my account" or asks what to post more of.
---

# Content review

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: a short, honest weekly brief that tells the user which patterns earn engagement and what to test — never overselling a pattern the data cannot support.

## Algorithm
1. Read "X Post Log" rows for the review window (default last 7 days) and the prior 4 weeks for comparison. Note the count; if fewer than 5 posts total, say so and keep the brief to observations only.
2. Group by hook_type, format, and topic. For each group compute the median engagement_rate using only verified rows; flag any group with fewer than 5 posts as insufficient data and do not rank it.
3. Find the top 3 patterns: the groups with the highest median engagement_rate that clear the 5-post bar. Find 1–2 weak patterns dragging the average down.
4. For each pattern, write one plain sentence and tag it [fact] if it rests on verified numbers over enough posts, or [hypothesis] if the sample is thin or the numbers are unverified. Where you connect a pattern to a result, add "correlation is not causation".
5. Propose exactly 3 things to test next week, each tied to a pattern (e.g., "post 2 more how-to threads on the growth pillar"). Keep them concrete and small.
6. Deliver max 15 lines to the user's channel. Do not change any posts or post anything; this is advice only.

## Output
```
Weekly review — @yourname (18 posts logged, verified)
Top patterns:
1. [fact] how-to threads: median 5.9% vs account median 3.2% — your strongest format.
2. [fact] "question" hooks beat "bold-claim" hooks (4.1% vs 2.4%); correlation is not causation.
3. [hypothesis] posts on the "build-in-public" pillar trend up, but only 4 posts — insufficient data, watch it.
Warnings:
- [fact] image-only posts underperform text (1.8%); 6 posts this week were image-only.
- [hypothesis] Tue/Thu posts look stronger, but timing sample is thin.
Test next week:
- 2 more how-to threads on the growth pillar.
- Rewrite 1 bold-claim opener as a question.
- Cut image-only posts to 1 and compare.
```

## Edge cases
- Fewer than 5 posts in the window → deliver observations only, label "insufficient data — no ranked verdict yet", suggest logging more posts.
- All rows unverified (public data only) → run the review but stamp it "unverified — connect your analytics export for reliable rates".
- A pattern looks huge but rests on 1–2 posts → mention it as a hypothesis, never as a top pattern.
- No new posts since last review → say so plainly and reuse the standing recommendations rather than inventing change.
