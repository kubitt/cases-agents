---
name: ads-math
description: PPC financial calculator. Use when the user says "calculate", "CPA", "ROAS", "break-even", "LTV", "CAC", "what budget do I need", "how much will it cost", or any ad-related math question.
---

# PPC Math Calculator

Goal: answer any PPC financial question with clear inputs, formula, result, and a one-line interpretation — fast utility, no fluff.

## Algorithm

1. Identify the calculation type from the user's question:
   - **CPA (Cost Per Acquisition):** spend / conversions
   - **ROAS (Return on Ad Spend):** revenue / spend. Express as Nx multiplier.
   - **Break-even ROAS:** 1 / profit margin. Example: 40% margin → break-even ROAS = 2.5x.
   - **Break-even CPA:** average order value × profit margin. Example: AOV $100, margin 40% → max CPA $40.
   - **LTV:CAC ratio:** customer lifetime value / customer acquisition cost. Healthy ≥3:1.
   - **Budget forecast:** target conversions × target CPA. Or: target revenue / target ROAS.
   - **A/B test sample size:** (Z_alpha + Z_beta)^2 × 2 × p(1-p) / MDE^2. At 95% confidence, 80% power: ~3,850 per variant for 5% baseline, 20% relative MDE.
   - **A/B test duration:** (sample size per variant × 2) / daily traffic to the test.
   - **MER (Marketing Efficiency Ratio):** total revenue / total marketing spend (all channels).
   - **Impression share opportunity:** (impressions / eligible impressions) — estimate lost revenue from lost impression share.

2. Extract inputs from the user's message. If a required input is missing — ask for it specifically. Use industry benchmarks from knowledge/ADS_BENCHMARKS.md as defaults only if the user says "use defaults" or "I don't know."

3. Show the calculation: inputs → formula → result → interpretation.

4. Add context when relevant: "Your CPA of $65 is 30% above the SaaS industry benchmark of $50. See the audit for specific improvement areas."

## Output

```
## Break-even ROAS
Inputs: profit margin = 35%
Formula: 1 / 0.35 = 2.86x
Result: you need ROAS ≥ 2.86x to break even on ad spend.
Context: your current ROAS is 3.4x (from last audit) — you're profitable but with only 19% headroom. A CPA increase of >19% would push you below break-even.
```

## Edge cases
- Multiple products with different margins → ask for a weighted average or calculate per-product and show a range.
- User conflates revenue and profit → clarify: "Is $100 the revenue (price) or the profit (after COGS)? This changes the break-even significantly."
- Nonsensical inputs (negative margin, ROAS below 0) → flag as impossible, ask to double-check.
- Very small numbers (1-2 conversions) → calculate but caveat: "With only [N] conversions, this CPA is not statistically reliable. Wait for 30+ conversions for a stable number."
