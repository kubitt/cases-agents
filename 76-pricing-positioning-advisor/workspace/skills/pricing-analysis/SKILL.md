---
name: pricing-analysis
description: Recommend a price and good-better-best tiers using pricing frameworks, the user's costs and segment, and researched competitor prices. Use on "recommend a price", "should I raise prices", "design my tiers", and inside the quarterly repricing review.
---

# Pricing analysis

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

## Goal
Recommend a defensible price and a good-better-best tier structure, with explicit rationale, grounded in the user's real costs and segment and in researched competitor prices — never a number pulled from thin air.

## Algorithm
1. Read knowledge/PRODUCT_PROFILE.md (product, unit cost, target margin, floor price, segment, value delivered) and knowledge/PRICING_FRAMEWORKS.md (which framework fits).
2. Read Google Sheets "Competitor Pricing" for the current market range; if it is empty or stale, run skill competitor-pricing-research first.
3. Cost-plus floor (sanity check): with a short Python script compute floor = unit_cost / (1 - target_margin), so a 60% target on a $10 cost floors at $25. Never recommend below the user's stated floor price.
4. Value and willingness-to-pay: anchor the ceiling to the outcome value and to where competitors cluster; place tiers with good-better-best, making the middle tier the intended default (anchoring: the top tier makes the middle look reasonable).
5. Build 3 tiers; for each set price, billing, features_included, target_segment, and a one-line rationale. Compute margin per tier with the same Python script.
6. Write the recommendation to Google Sheets "Pricing Model" (columns: tier, price, billing, features_included, target_segment, rationale, margin, notes). Present it in chat, facts vs judgment labeled, ending "This is advice — your call to implement."

## Output
Written to "Pricing Model" and summarized in chat:
```
Recommended model (facts: competitors cluster $29–$59/mo, source: Competitor Pricing sheet | judgment: value-based, middle tier as default)
- Starter: $29/mo — solo users — core features — margin 68% — entry anchor
- Growth: $59/mo — teams of 5–20 (your segment) — + collaboration, integrations — margin 79% — intended default
- Scale: $129/mo — larger teams — + SSO, priority support — margin 84% — top anchor that frames Growth
Floor check: unit cost $9 at 70% target → floor $30; Starter at $29 flagged as thin-margin.
This is advice — your call to implement.
```

## Edge cases
- No costs provided → recommend only a competitor-relative range, mark it "provisional — needs your costs", never a firm number.
- A recommendation would fall below the stated floor price → hold at the floor, explain the squeeze, suggest cutting cost or repackaging instead.
- Competitor data missing or stale → run competitor-pricing-research first; if still unavailable, label the market range "unknown" and proceed on value and costs only.
- Thin sample (fewer than 3 comparable competitors) → flag "insufficient market data" and lean on value-based reasoning.
