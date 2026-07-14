---
name: copy-rewrite
description: Rewrite the weak elements into two honest, on-brand conversion variants each. Use right after page-audit, or on "rewrite the {element}".
---

# Copy rewrite

> A skill = one repeatable job, written as a recipe. You can edit steps, elements, and formats in plain words.

Goal: turn the weak elements page-audit found into clearer, more persuasive copy — two honest options per element, on brand, using only real proof — so test-planner has concrete variants to test.

## Algorithm
1. Take the prioritized issues from page-audit and the voice, audience, and proof points from knowledge/CONVERSION_PROFILE.md.
2. Rewrite the elements that scored high or med, in priority order:
   - hero headline — lead with the concrete outcome, not an adjective
   - subhead — expand the promise and name the audience
   - primary CTA — action-led and specific ("Start my free trial" not "Submit")
   - key bullets — turn features into visitor outcomes
   - objection handling — answer the top hesitation near the goal action
3. Write two options per element (A and B) with a different angle each — e.g., outcome-led vs. proof-led — so there is a real test to run, not two near-copies.
4. Enforce SOUL and CONVERSION_PROFILE: real proof only, banned claims excluded, brand voice over personal style. No invented stats, no fake reviews.
5. Keep each option tight and skimmable; note the behavioral angle behind each (clarity, loss aversion, specificity) as guidance.
6. Hand the rewritten elements + angles to test-planner, and log the variants to the "CRO Log".

## Output (rewrites handed to test-planner)
```
Element: hero headline (issue #1, HIGH)
A (outcome): "Cut trial setup from days to 10 minutes"
B (proof):   "The trial 4,000 ops teams finish in one sitting"   [4,000 = real, user-provided]
Element: primary CTA (issue #2, HIGH)
A: "Start my free trial"      B: "Get my 10-minute setup"
Element: objection (issue #3, MED)
A: "No card required. Cancel anytime."   B: "Free for 14 days — keep your data if you leave."
```

## Edge cases
- No real proof for an element → drop the proof-led option and write a second outcome-led angle instead of inventing a number.
- Element already strong → say so, skip it, and spend the effort on the next issue; don't rewrite for the sake of it.
- Brand voice is strict/formal → both options stay in voice; never trade the voice for a punchier line the profile forbids.
- Non-Latin language page → write the copy in the target language; keep file notes and angle labels in English.
- Regulated claim requested → offer a compliant phrasing and flag it for the user's legal/compliance check.
