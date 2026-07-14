---
name: significance-analyzer
description: Given variant results (visitors + conversions per variant), run a Python two-proportion z-test and give an honest verdict with the p-value. Use on "results for {test}: ...".
---

# Significance analyzer

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: judge an A/B result honestly. Compute the p-value and relative uplift with a Python script, then return one verdict: winner (95%+), no significant difference, or insufficient data. I never call a winner without the script's number. This step writes and runs a small Python helper in files/scripts/.

## Algorithm
1. Take variant_a (n + conversions) and variant_b (n + conversions) from the user or the ledger row.
2. Read the significance threshold (default 95% → alpha 0.05) and the minimum sample rule from knowledge/EXPERIMENT_METHOD.md.
3. If either variant is below the minimum sample → stop: verdict "insufficient data — need more sample". Do NOT compute a winner.
4. Write and run files/scripts/ztest.py: a two-sided two-proportion z-test → p-value; relative uplift = (rate_b - rate_a) / rate_a.
5. Verdict from the script's p-value: p < 0.05 and B > A → "winner (95%+): Variant B"; p < 0.05 and A > B → "winner (95%+): Variant A"; p >= 0.05 → "no significant difference"; below minimum → "insufficient data".
6. Write p_value, verdict, and a one-line learning back to the ledger row (status=done). Show the p-value every time.

## Helper snippet (written to files/scripts/ztest.py, then run)
```python
import math
def ztest(na, ca, nb, cb):
    pa, pb = ca/na, cb/nb
    p = (ca+cb)/(na+nb)
    se = math.sqrt(p*(1-p)*(1/na + 1/nb))
    z = (pb-pa)/se
    pval = math.erfc(abs(z)/math.sqrt(2))   # two-sided
    return round(pa*100,2), round(pb*100,2), round((pb-pa)/pa*100,1), round(pval,4)
```

## Output (verdict to the user)
```
Test: Trust badges on checkout | metric: checkout completion
Variant A (control): 2,900 visitors / 290 conv = 10.0%
Variant B (badges):  2,900 visitors / 342 conv = 11.8%
Relative uplift: +18%  |  p = 0.03  ->  winner (95%+): Variant B
Logged to Experiment Ledger (status=done). Ship B; correlation is not proof — watch the guardrail after rollout.
```

## Edge cases
- Either variant below the minimum sample → verdict "insufficient data — need more sample"; never declare a winner on thin data.
- Massive apparent uplift on a tiny sample → show the uplift but keep the verdict "insufficient data"; big lifts on 30 visitors are noise.
- p between 0.05 and 0.10 → report "no significant difference (p=0.08)"; suggest extending the run, do not call it a win.
- Zero conversions in a variant, or conversions greater than visitors → reject the input, ask the user to recheck; don't run a nonsense test.
