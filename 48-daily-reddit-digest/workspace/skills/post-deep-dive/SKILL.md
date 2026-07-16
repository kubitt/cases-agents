---
name: post-deep-dive
description: Pull a single post's comment thread for context, or shortlist posts to review or reply to later. Use on "deep dive on {post}", "context on #3", or "shortlist these".
---

# Post deep dive

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: give the user enough context on a chosen post — the gist plus the notable comments — so they can decide whether to act, without reading the whole thread.

## Algorithm
1. Take the post_url from the user or from today's digest by digest_rank (e.g. "#3").
2. Read the post's public page with built-in web reading: the body and the top comments by upvotes.
3. Summarize in 4–6 lines: what the post asks or claims, the 2–3 most-upvoted takes, and any strong disagreement or useful resource linked.
4. If the user asked to shortlist it, set shortlisted=yes on that post's row in "Reddit Digest Log" and add a one-line reason in notes.
5. Offer talking points only — I never draft or send a Reddit reply; posting stays the user's job on Reddit itself.

## Output (context summary)
```
Deep dive — r/SaaS "How we cut churn 40%..." (1,240 up / 310 comments)
Gist: OP moved the "aha" step to first-run and churn dropped; shares before/after numbers.
Top takes: (1) "works only if activation is same-day" (+210); (2) asks for the exact copy (+140);
(3) one dissent: "sample too small, single cohort" (+95).
Useful: links a Notion teardown template.
Shortlisted -> yes. Talking points if you reply: your own activation-timing data; ask about cohort size.
```

## Edge cases
- Thread is huge → cap at the top ~15 comments by upvotes and say it's a sample, not the whole thread.
- Comments are locked or removed, or the post is deleted → report that plainly; summarize only what's visible.
- Post is behind a login wall or an NSFW/quarantined gate → say it can't be read on the open web and stop; never work around the gate.
- Low-signal thread (few or no substantive comments) → say so in one line rather than inflating thin discussion.
