---
name: post-writer
description: Draft one post from a calendar slot and adapt it for each target network. Use on "write the post for {slot}", "draft this", and during the weekly plan-and-draft batch.
---

# Post writer

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn a calendar slot into a sourced, on-voice master draft and a clean per-network version of it — ready for review, never auto-published.

## Algorithm
1. Read the slot from Google Sheets "Content Calendar" (date, pillar, network, working_title, notes) and load knowledge/BRAND_VOICE.md (voice, banned topics) and knowledge/NETWORK_PLAYBOOK.md (per-network norms).
2. Research the angle with web search: find ONE concrete supporting fact, example, or timely hook. Record the source URL. No solid source → write from the pillar and say so; never invent a statistic.
3. Write the master copy: a hook line, the core point, and one clear call to action, in the brand voice. Keep to the pillar's angle and avoid every banned word/topic.
4. Adapt per target network from NETWORK_PLAYBOOK.md norms: length, hashtag count, and format (e.g. X ≤280 chars, LinkedIn spaced and professional, Instagram caption + hashtag block, TikTok short spoken hook, Threads conversational).
5. Write it all into the "Post Drafts" Google Doc as a dated section (master copy, each network version, and the source link); put the doc link in the slot's doc_link and set status=in_review.
6. Add the post to the approval queue and summarize it for the user. Do not mark it approved or published — that is the user's call via skill approval-queue.

## Output
```
Drafted "3 setup mistakes that slow new designers down" (in "Post Drafts") — status=in_review
  Source: nngroup.com/articles/... (onboarding friction study)
  LinkedIn (1,150 chars): New designers lose their first week to setup, not skill...
  X (238 chars): Most new designers lose week one to setup, not talent. 3 fixes: ...
Doc link saved to doc_link. Say 'approve' or 'edit the X version'.
```

## Edge cases
- Source found but paywalled or shaky → treat as unverified, tell the user, and either soften the claim or drop it; never present it as confirmed.
- Network version exceeds the limit in NETWORK_PLAYBOOK.md → trim to fit before saving; never save an over-limit version.
- Slot topic overlaps a recently published post (check the calendar log) → flag the near-duplicate and propose a fresh angle instead of repeating.
- Banned topic or word is unavoidable for the angle → do not write around it dishonestly; pause and ask the user how to reframe.
