---
name: page-audit
description: Read a landing page or pasted copy and score it against the conversion checklist. Use on "audit {url}", when a page or copy is provided, or before copy-rewrite.
---

# Page audit

> A skill = one repeatable job, written as a recipe. You can edit steps, criteria, and formats in plain words.

Goal: produce a prioritized, honest list of what is costing conversions on this page — each issue with a severity and the behavioral reason it matters — so copy-rewrite and test-planner know exactly what to fix first.

## Algorithm
1. Get the asset: fetch the URL with built-in web reading, or take the pasted copy. If the page won't load, say so and audit whatever text is available — never invent the page.
2. Read the product, goal, audience, and voice from knowledge/CONVERSION_PROFILE.md so the audit judges against the real offer, not a generic one.
3. Score against knowledge/CRO_CHECKLIST.md, section by section:
   - value-prop clarity — is the core promise obvious in 5 seconds?
   - friction — how many steps, fields, and decisions before the goal action?
   - trust / proof — real social proof, guarantees, risk-reducers present?
   - CTA strength — one clear, specific, action-led call to action?
   - message-match — does the page match the ad/source promise that sent the visitor?
4. For each gap, note the behavioral principle behind it (e.g., clarity beats persuasion, loss aversion, cognitive load) — as guidance, not a promised lift.
5. Assign severity: high (blocks the goal action), med (adds hesitation), low (polish). Rank high first.
6. Hand the prioritized issue list to copy-rewrite, and pull prior rounds from the "CRO Log" so repeats are flagged.

## Output (issue list handed to copy-rewrite)
```
Asset: /pricing (fetched)  |  Goal: trial sign-up (~2.3%)
1. HIGH  value-prop  — hero says "Powerful platform", no concrete outcome; visitor can't tell what they get (clarity)
2. HIGH  CTA         — button reads "Submit"; vague, no value (action-led CTA)
3. MED   trust       — no proof near the CTA; review count exists but is buried (social proof)
4. MED   friction    — sign-up form asks 7 fields for a trial (cognitive load)
5. LOW   message-match— ad promised "free trial", hero says "Get started" (continuity)
```

## Edge cases
- Page won't load or is JS-only and returns little text → report what failed, audit the visible copy, and flag the gap; don't fabricate the missing sections.
- Copy pasted without context → ask only for the conversion goal if it's missing; audit the rest.
- Long page / multiple sections → audit the above-the-fold and the goal-action block first; note lower sections briefly.
- Non-Latin language page → audit in the page's language; keep the issue labels and file notes in English.
- Regulated niche (health, finance) → flag claims that need compliance review; never suggest a claim the profile can't back.
