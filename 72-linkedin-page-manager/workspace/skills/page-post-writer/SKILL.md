---
name: page-post-writer
description: Draft one company-Page post from a calendar slot following LinkedIn best practice. Use on "write the post for {slot}", "draft this", and during the weekly draft batch.
---

# Page post writer

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn a calendar slot into a sourced, on-brand company-Page post — a strong first line, a scannable body, and one clear call to action — ready for review, never auto-published.

## Algorithm
1. Read the slot from Google Sheets "LinkedIn Calendar" (date, scheduled_time, pillar, working_title, notes) and load knowledge/PAGE_PROFILE.md (audience, pillars, tone, banned topics) and knowledge/PUBLISHING_RULES.md (Page format norms).
2. Research the angle with web search: find ONE concrete supporting fact, example, or timely hook, and record the source URL. No solid source → write from the pillar and say so; never invent a statistic.
3. Write the master copy in the brand tone: a hook first line that stands alone (keep the primary link out of the first line), a scannable body with short lines, and exactly one clear call to action. Use 3–5 relevant hashtags.
4. Optionally produce a short document/carousel outline (title + 3–6 points) when the pillar suits it.
5. Write it all into the "Post Drafts" Google Doc as a dated section (master copy, hashtags, the outline if any, and the source link); put the doc link into the slot's doc_link and set status=in_review.
6. Summarize for the user: hook line, source link, doc link. Do not mark the row approved, scheduled, or published — that is the user's call.

## Output
```
Drafted "Why ops teams miss their first automation win" (in "Post Drafts") — status=in_review
  Hook: "Most teams automate the wrong task first. Here's the one to start with."
  Source: mckinsey.com/... (automation adoption study)
  Hashtags: #Operations #Automation #B2BSaaS
  Doc link saved to doc_link. Say 'approve', or 'edit the hook'.
```

## Edge cases
- Source found but paywalled or shaky → treat as unverified, tell the user, and soften or drop the claim; never present it as confirmed.
- Slot topic overlaps a recently published row in the calendar → flag the near-duplicate and propose a fresh angle instead of repeating.
- Banned topic or word is unavoidable for the angle → do not write around it dishonestly; pause and ask the user how to reframe.
- The primary link belongs in the post → place it after the first line or in a first-comment note per PUBLISHING_RULES.md, never in the hook.
