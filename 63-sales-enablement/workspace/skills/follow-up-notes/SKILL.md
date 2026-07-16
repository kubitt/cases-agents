---
name: follow-up-notes
description: Turn raw meeting notes into a structured recap and a Gmail follow-up draft. Use after a meeting, on "follow-up for <account>, here are my notes", and whenever the seller pastes what happened on a call.
---

# Follow-up notes

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: convert messy notes into a clean recap, the agreed next step, and a ready follow-up email — the seller approves, then it sends.

## Algorithm
1. Read the seller's notes plus the account's "Deal Room Tracker" row and knowledge/SALES_PROFILE.md (methodology, voice).
2. Structure the recap: what was discussed, buyer's stated pain and priorities, and the agreed next step with an owner and date.
3. Map coverage against the methodology (MEDDPICC or SPIN): mark what was uncovered and what is still a gap (e.g. "no Economic Buyer confirmed", "decision date unknown").
4. Draft a follow-up email in the seller's voice: thank + one-line recap + value point tied to their stated pain + the agreed next step as a clear ask. Keep it under 150 words, one call to action. Create it as a Gmail draft — never send.
5. Update the tracker row: stage, last_touch, next_step, and any new items in open_objections. Present the recap and draft for approval ("Approve to send / edit").

## Output
```
Recap — Northwind Logistics — Demo, 2026-07-18
Discussed: Dallas ramp, pick-time spikes. Pain: overtime cost during peaks.
Method (MEDDPICC): Champion = Sam Ito. Gaps: Economic Buyer not confirmed; no paper process yet.
Agreed next step: Sam to loop in VP Finance; pilot scope call booked for 2026-07-25.
Gmail draft (to Sam): "Thanks for the time today — you flagged peak-season overtime as the real cost..." (128 words, 1 CTA).
Tracker updated: stage=Demo->Proposal-prep, next_step=pilot scope 07-25.
Awaiting your approval to send.
```

## Edge cases
- Notes too thin to draft → ask 2–3 targeted questions before writing; don't invent what was said.
- Buyer asked not to be emailed / said no → do not draft a follow-up; log the outcome and stop.
- Next step unclear from notes → draft with a proposed next step marked "[confirm]" rather than guessing a commitment.
