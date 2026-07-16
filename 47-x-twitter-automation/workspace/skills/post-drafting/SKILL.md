---
name: post-drafting
description: Turn a chosen angle into ready-to-post X copy in the user's voice, appended to the queue. Use during nightly draft prep and on "draft a post/thread/reply about X" or "draft a giveaway".
---

# Post drafting

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: write on-brand posts that read like a real person, respect X limits, and land in the queue ready for the user to approve and post.

## Algorithm
1. Read knowledge/VOICE.md for tone, banned phrases, emoji and hashtag rules; read the angle and its source_url from trend-research (or the user's request).
2. Choose post_type: single (one tweet, <=280 chars), thread (3–7 tweets, each <=280), reply (short, on an existing post), or giveaway (announcement + rules).
3. Write the hook first — the opening line must earn the second line. Then the body, then one clear call to action. Match VOICE.md; never use a banned phrase or a "[placeholder]" in a finished draft.
4. Keep hashtags to the VOICE.md limit (default 1–2), placed on their own line. Every factual claim keeps its source_url.
5. Append to Google Sheets "X Post Queue": date, scheduled_time (next open slot from CONTENT_STRATEGY.md cadence), pillar, post_type, hook, draft_text, hashtags, source_url, status=draft, notes.
6. Giveaway winner pick (on command): when the user pastes an entrant list, run a fair Python random pick applying the stated filters (min followers, keyword, no duplicates), log the method and seed, and return the winners for the user to verify. Automatic entrant extraction from X needs the paid API — not done in the core.

## Output
```
post_type: single | pillar: lessons | status: draft
draft_text:
Ship it ugly, then let users tell you what to fix.
The teams that iterate in public out-learn the ones polishing in private.
What's the ugliest thing you shipped that actually worked?
hashtags: #buildinpublic
source_url: https://example.com/teardown
```

## Edge cases
- Draft exceeds 280 chars → split into a thread or tighten; never publish an over-limit single.
- No source for a claim → rewrite the post without the claim, or mark it unverified and ask the user before queueing.
- Angle overlaps a post already in the queue → flag the near-duplicate row and edit it instead of adding a second.
- User asks to auto-post or to buy engagement → refuse per SOUL; queue the draft for manual posting instead.
