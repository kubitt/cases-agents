---
name: objection-response
description: Give framework-based responses to a specific sales objection. Use on "how do I answer <objection>", when the seller reports a new pushback, and when preparing the objections section of a call brief.
---

# Objection response

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: hand the seller 2–3 honest, ready-to-say responses to an objection — grounded in their positioning, never hype or false claims.

## Algorithm
1. Classify the objection: price, timing, authority, need, trust, or competitor. This shapes the response angle.
2. Check the "Objection Playbook" Doc and knowledge/COMPETITOR_BATTLECARDS.md for an existing answer; reuse and adapt it before writing new.
3. Apply the acknowledge → clarify → reframe pattern: acknowledge the concern, suggest one clarifying question to ask the buyer, then reframe using a differentiator or a value point from knowledge/SALES_PROFILE.md.
4. Write 2–3 response options, each ≤3 sentences, in plain spoken language the seller can say out loud. Any claim about results or competitors must trace to a source; if none, say "position it as your experience, not a stat".
5. If this objection is new, append it with the chosen response to the "Objection Playbook" and log it in the tracker column open_objections for the account.

## Output
```
Objection: "You're more expensive than RackBot." (type: price / competitor)
Clarify first: "Expensive versus the sticker, or versus what a slow rollout costs you?"
Option A: Acknowledge the gap, then reframe to cost-per-pick — cite the customer case in SALES_PROFILE.md (source: case link).
Option B: Trade scope — offer a smaller pilot so ROI is proven before full spend.
Option C (trust): Offer two reference calls with similar 3PLs. No hard ROI stat available → frame as their experience.
Logged to Objection Playbook + tracker open_objections for Northwind Logistics.
```

## Edge cases
- Objection is really a brush-off ("send me info") → treat as low intent; suggest a qualifying question, don't over-invest.
- Objection needs a claim you cannot source → give the response but tell the seller to frame it as opinion, not fact.
- Same objection recurs across accounts → flag it for the weekly refresh so the Playbook answer becomes the default.
