---
name: opportunity-brief
description: Turn a chosen opportunity into a build-ready MVP brief. Use on "brief opportunity #{n}", "spec {opportunity}", or when the user picks a ranked opportunity to pursue.
---

# Opportunity brief

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: produce a brief a developer or build agent could start from tomorrow — grounded entirely in the logged evidence, with a scope small enough to ship.

## Algorithm
1. Read the chosen row in Google Sheets "Opportunity Ledger" (opportunity, pain_cluster, mentions, example_quote, source_urls, existing_solutions, opportunity_score) and knowledge/RESEARCH_PROFILE.md for the user's build fit.
2. Draft the brief with these parts: Problem (the pain in one paragraph), Target user, Evidence (2–4 real quotes with source URLs and the mention count), MVP scope (3–5 must-have features only — cut everything else to "later"), Existing solutions and the gap, Risks and unknowns, First validation step (the cheapest test before building).
3. Keep scope honest: if the evidence is thin (mentions below the rubric bar), say so at the top and frame the brief as "worth validating", not "worth building".
4. Ask the user to approve before creating anything external. On approval, create a Google Doc "Opportunity Brief — {opportunity}", paste the brief, and save its link to brief_link with status=brief_ready. If Google Docs is not connected, deliver the brief as chat text.

## Output (Google Doc, summarized in chat)
```
Opportunity Brief — Auto-chase late payments (score 60, 4 mentions)
Problem: freelancers lose hours each week manually chasing overdue invoices.
Target user: solo freelancers and small studios billing 5–30 clients/mo.
Evidence: "chasing invoices eats my whole Friday" [reddit...]; "clients ghost until the 3rd email" [reddit...]
MVP scope: 1) import invoices 2) auto-reminder schedule 3) tone presets 4) paid/unpaid dashboard
Existing solutions + gap: big tools bundle this but are heavy/pricey for solos.
Risks: payment-data trust; deliverability. First validation: a landing page + 20 freelancer interviews.
Doc: [link] — status set to brief_ready.
```

## Edge cases
- Evidence below the minimum-mentions bar → mark the brief "validate first — insufficient signal" and lead with the cheapest validation test, not a build plan.
- User asks to build or ship it → clarify that I write the brief; building is a separate step (a developer or a build agent), and hand over the Doc.
- No clear differentiation from existing solutions → say so plainly in the gap section rather than inventing an edge; a crowded market is a real finding.
- Requested brief for an unlogged idea → run pain-signal-mining and opportunity-ranking first so the brief rests on evidence, not a hunch.
