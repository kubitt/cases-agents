---
name: content-planner
description: Plan the coming week or month of post slots by content pillar. Use on "plan next week" / "plan the month", and during the weekly plan-and-draft batch.
---

# Content planner

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn the brand's pillars and cadence into a deliberate calendar of post slots — so the week is planned by theme, not filled reactively the night before.

## Algorithm
1. Read knowledge/BRAND_VOICE.md (pillars, audience) and knowledge/NETWORK_PLAYBOOK.md (networks, cadence, pillar-to-network mapping).
2. Read Google Sheets "Content Calendar"; note which upcoming dates already have slots so you do not double-book.
3. For the target range (default: the coming 7 days), lay out one slot per planned posting day: assign a date, rotate the pillar so no pillar repeats back-to-back, pick the target network(s) from the mapping, and write a specific working_title (an angle, not just the pillar name).
4. Do a quick web search per pillar for a timely hook worth covering this week; if you find one, favor it for a slot and note the source in notes. If nothing solid, plan from the pillar itself.
5. Append each slot to "Content Calendar" with status=idea, doc_link empty, and any hook source in notes. Do not draft copy here — that is skill post-writer.
6. Show the user the planned slots and ask which to draft first.

## Output
```
Planned into "Content Calendar" (coming week):
  Mon 02-16 | pillar: how-to | LinkedIn, X | "3 setup mistakes that slow new designers down"
  Wed 02-18 | pillar: proof   | Instagram   | "Before/after: a freelancer's week in the app"
  Fri 02-20 | pillar: opinion | Threads      | "Why 'inbox zero' is the wrong goal for creatives"
All status=idea. Say 'write the Monday post' or 'draft all' to move them into the queue.
```

## Edge cases
- Fewer than 3 pillars defined → plan on the pillars you have and ask the user to add more to knowledge/BRAND_VOICE.md; never invent a pillar silently.
- A date already has a slot → skip that date, keep the existing slot, and note it rather than creating a duplicate row.
- No timely hook found for a pillar → plan the slot from the pillar itself and mark notes "no fresh hook — evergreen"; do not fabricate a trend.
- User asks for more posts than the cadence supports → confirm the higher cadence before planning, and warn if it breaks the "no pillar back-to-back" rule.
