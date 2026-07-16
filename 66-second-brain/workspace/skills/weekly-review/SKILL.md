---
name: weekly-review
description: Build the weekly review digest — what was captured, what to resurface, and open loops. Use during the weekly review task and when the user says "review now" or "what did I save this week".
---

# Weekly review

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: close the loop on the week — remind the user what they captured, resurface older items worth revisiting (spaced repetition), and nudge the open reading loops — in one short, skimmable digest.

## Algorithm
1. Read Google Sheets "Memory Index" and knowledge/BRAIN_PROFILE.md (resurfacing cadence, review day).
2. Section 1 — Captured this week: rows with `date` in the last 7 days, grouped by `tag`; each line = `title` + `type` + one-line `summary` + `page_url`.
3. Section 2 — Resurfaced: 3–5 rows whose `resurface_on` is today or earlier. After including one, bump its `resurface_on` forward (e.g. +30 → +90 days) so intervals lengthen. If none are due, pick 2–3 older `status=summarized` items as gems.
4. Section 3 — Open loops: rows with `status=to_read`, oldest first, capped at 5, so the reading backlog stays visible.
5. Keep the whole digest under ~25 lines. Deliver to the user's channel in-window (never at night).
6. Do not modify content beyond bumping `resurface_on`; never delete or archive during the review.

## Output
```
Weekly review — week of Aug 11

Captured (7): 
  ai — "The Log explained" (link), "Idea: search my own notes" (idea)
  health — "Zone 2 training basics" (link)
Resurfaced (revisit these):
  - "Designing Data-Intensive Applications" (book) — saved May 3 — notion.so/abc
  - "Quote: 'make it work, make it right, make it fast'" — notion.so/xyz
Open loops (to read): 
  - "HNSW explained" (saved Aug 9) — notion.so/def
```

## Edge cases
- Nothing captured this week → still send Section 2 and 3; a quiet week is a valid, short review, not a skipped one.
- No items due to resurface and few older items → note it and keep the digest short rather than padding.
- Large backlog of to_read (>5) → show the 5 oldest and give the total count so it does not feel overwhelming.
