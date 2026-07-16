---
name: subreddit-digest
description: Build the daily ranked digest of top posts from the target subreddits, or search posts by topic. Use during the nightly collection run, on "digest now", and on "find posts about X".
---

# Subreddit digest

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: produce one clean, de-duplicated digest of the best recent posts from the user's subreddits, ranked by real public signals and filtered to their taste.

## Algorithm
1. Read knowledge/SUBREDDIT_LIST.md (which subreddits, focus, posts-per-sub, window) and knowledge/DIGEST_PREFERENCES.md (include/exclude rules, categories, length).
2. For each subreddit, read its public "top this day" or "hot" page with built-in web reading. For a topic request, use built-in web search scoped to the subreddits instead.
3. For each candidate record: post_title, post_url, upvotes, num_comments, posted_ago, subreddit, and a category (how-to / discussion / news / question / show-off / meme).
4. Score with a visible formula: upvotes + (num_comments x 2), lightly favoring posts under 24h; rank descending into digest_rank.
5. Drop posts whose post_url is in "Reddit Digest Log" within the last 7 days (dedup) and anything the preference rules exclude.
6. Keep the top N (default 10), append each to "Reddit Digest Log" (date, subreddit, post_title, post_url, upvotes, num_comments, posted_ago, category, digest_rank, shortlisted=no, feedback empty, notes), and format the digest.

## Output (the delivered digest)
```
Reddit digest — 2026-07-16 (9 posts, 3 subreddits)
1. r/SaaS — "How we cut churn 40% with a 2-line onboarding change" — 1,240 up / 310 comments / 6h — how-to
   https://reddit.com/r/SaaS/...
2. r/startups — "What pricing page actually converted for you?" — 890 up / 540 comments / 11h — discussion
   https://reddit.com/r/startups/...
3. r/Entrepreneur — "Lost my biggest client — here's the post-mortem" — 760 up / 190 comments / 4h — discussion
   https://reddit.com/r/Entrepreneur/...
Skipped 4 memes and 2 already-sent posts per your rules. Reply "liked it" or "drop topics like X" to tune.
```

## Edge cases
- A subreddit is unreachable or private → note "could not read r/X today" in the digest and continue with the rest; never invent posts to fill the gap.
- Public counts look cached or stale → mark them "approx" rather than presenting stale upvotes and comments as live.
- Quiet day, nothing clears the bar → send a short "slow day, N minor posts" note instead of padding with low-value links.
- Near-duplicate of a recent post (same story, different thread) → keep the stronger one and note duplicate_check in notes.
