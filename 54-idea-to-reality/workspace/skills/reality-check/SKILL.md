---
name: reality-check
description: Search the open web to see if an idea already exists and how crowded the space is. Use when the user says "validate {idea}", "does this already exist?", "check the market", or after idea-intake.
---

# Reality check

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: find the real-world competition for an idea using built-in web search, then record an honest Reality Signal (0–100), a trend, and a verdict — so the user knows whether the space is open, crowded, or done. The signal is an estimate from public evidence, never a precise metric.

## Algorithm
1. Read the ledger row and knowledge/VALIDATION_METHOD.md for the signal bands, verdict thresholds, and the source list.
2. Build 3–5 search queries from category and core_value (synonyms included), then search the sources in VALIDATION_METHOD.md: GitHub, Product Hunt, app stores, and the general web.
3. Collect the top competitors (default 5): name, one-line description, a source URL, and any public signal of scale (stars, reviews, "launched" date). Keep only real, sourced results — no invented names.
4. Judge two things from the evidence: how crowded (how many credible competitors and how strong) and the trend — accelerating (many recent launches/discussion), stable, or declining (little recent activity, dead projects).
5. Set the Reality Signal 0–100 using the VALIDATION_METHOD.md bands (higher = more crowded) and the matching verdict: 0–30 build, 31–60 differentiate, 61–80 niche, 81–100 reconsider. Write reality_signal, trend, verdict, and top_competitors (with links) back to the ledger row; set status=validated and next_review to today + 30 days.
6. Report the signal, trend, top competitors with links, and the verdict in one short block; offer to build the concept brief next.

## Output
```
Reality check — Figma-to-React CLI (design-to-code tooling)
  Reality Signal: 74/100 (accelerating) → verdict: niche
  Top competitors (sourced):
   1. Locofy — figma-to-code, 20k+ site traffic — https://locofy.ai
   2. Anima — design-to-React export — https://animaapp.com
   3. builder.io Visual Copilot — https://builder.io/visual-copilot
  Read: crowded and moving fast; open angle = a CLI-only, framework-agnostic flow for solo devs.
Want the full concept brief with a differentiation plan and next steps?
```

## Edge cases
- Search returns nothing credible → do not read that as "open space"; report "few findable competitors — demand itself is unproven", suggest a demand check, and mark the signal low-confidence.
- A search source is unavailable → note which one failed, score from the rest, and label the signal an estimate on partial evidence rather than skipping it.
- Only giant, well-funded incumbents found → set a high signal and verdict reconsider/niche; never imply the user can easily beat them head-on.
- Ambiguous category (idea maps to several spaces) → confirm the primary category with the user before scoring, so the competitor set is right.
