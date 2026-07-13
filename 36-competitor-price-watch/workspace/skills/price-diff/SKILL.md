---
name: price-diff
description: Compare today's scanned prices to the stored history and compute the change. Use right after price-scan on the daily run or an on-demand check.
---

# Price diff

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn today's records plus yesterday's stored values into a clean list of real changes with the delta in %, comparing like-for-like.

## Algorithm
1. Load yesterday's values from Google Sheets "Competitor Prices" history (last stored row per competitor/item).
2. For each tracked item, match today vs yesterday by competitor + plan/product name.
3. Compare like-for-like: same currency and billing period. If the period changed (monthly → annual), report it as a structural change, not a % delta.
4. Compute delta: `((now - was) / was) * 100`, rounded to one decimal. Positive = increase, negative = cut.
5. Classify each item: unchanged / increased / decreased / new plan / removed plan / promo added or ended / unreadable / unavailable.
6. Ignore sub-threshold noise: changes under the config threshold in knowledge/WATCH_CONFIG.md (default 0.5%) are treated as unchanged unless the raw string clearly differs.
7. Hand the change list to price-report.

## Output (change list handed to price-report)
```
Changes since 2026-07-12:
- Acme / Pro: 49 → 59 USD/mo (+20.4%) [increase]
- Acme / promo: "20% off annual" [promo added]
- Globex: unavailable (timeout) [flag]
- Initech / Starter: 15 → 15 USD/mo [unchanged]
Summary: 2 changes, 1 flag, across 4 competitors.
```

## Edge cases
- No yesterday value for an item (first run or new plan) → mark `new` / `baseline`, store it, don't compute a delta.
- Currency switched (USD → EUR display) → report as "currency changed", don't fabricate an FX-adjusted delta.
- Item present yesterday, missing today → `removed plan?` only if the page read successfully; if page was unavailable, keep yesterday's value and flag, don't report a removal.
- Suspiciously large delta (>90%) → keep it but tag "verify" — often a parsing error, not a real move.
