---
name: trend-research
description: Find fresh, on-niche angles worth posting about, with a source for each. Use during the nightly draft prep task and when the user says "what's trending" or "find me angles".
---

# Trend research

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: in 5–10 minutes, produce 2–4 ranked posting angles for the user's niche, each tied to a real, recent source — so drafting starts from a real reason to post, not a blank page.

## Algorithm
1. Read knowledge/CONTENT_STRATEGY.md for the niche, pillars, audience, and the public watch accounts.
2. Web search the niche for the last 7 days: "<niche> news", "<niche> launch", "<topic> discussion". Read the top public pages; note the event, the date, and the URL.
3. Read the public pages of the watch accounts if reachable; capture themes they are posting about. If a page is blocked or unreachable, skip it and mark it unverified — never guess its contents.
4. For each candidate angle write: the hook idea, which pillar it fits, why it matters to the audience now, and the source URL.
5. Rank angles by freshness and fit to the audience's goal (CONTENT_STRATEGY.md). Keep the top 2–4; drop anything with no source.
6. Hand the ranked angles to post-drafting (or list them if the user asked to review first).

## Output
```
Angles for today (niche: indie SaaS):
1. [hot take] "Ship ugly, then iterate" — new Stripe teardown shows fast-shippers win. Pillar: lessons. Source: https://example.com/teardown (2 days ago)
2. [news] X rolled out longer posts to all — thread on how to use them. Pillar: how-to. Source: https://example.com/x-update (yesterday)
3. [story] A founder's churn-fix that added 12% MRR. Pillar: behind-the-scenes. Source: https://example.com/case (4 days ago)
```

## Edge cases
- No fresh news in the niche → fall back to an evergreen angle from a content pillar and label it "evergreen", not "trending".
- A source is paywalled or unreachable → do not summarize what you cannot read; mark the angle unverified or drop it.
- Watch account page blocked by X → skip it silently, note "account unreadable via web" once; do not scrape or use cookies.
- Two angles are near-duplicates → keep the one with the stronger, fresher source and merge the notes.
