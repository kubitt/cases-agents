---
name: experiment-designer
description: Turn a top backlog idea into a full test spec — variants, the one metric, a guardrail, required sample size, and duration. Use on "design my #1 test" or before running an experiment.
---

# Experiment designer

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: produce a spec the user can actually run — a single-change A/B, the one success metric, a guardrail, and a Python-calculated sample size and duration — so the test is sized before it starts, not judged after. The sample-size math runs as a Python script.

## Algorithm
1. Take the chosen idea from the ledger (default: top by ice_score). Read knowledge/GROWTH_PROFILE.md for the baseline rate of the target metric and weekly traffic, and knowledge/EXPERIMENT_METHOD.md for the threshold and power.
2. Define Variant A (control = current experience) and Variant B (exactly ONE change), so the result is attributable.
3. Set the single success metric (the ONE metric) and one guardrail metric that must not regress.
4. Get the minimum detectable effect (MDE): propose one from EXPERIMENT_METHOD.md and confirm — the smallest lift worth detecting.
5. Write and run files/scripts/sample_size.py: power calc for two proportions (alpha from threshold, power 80%) → required n per variant from baseline rate + MDE.
6. Estimate duration = ceil( 2 * n_per_variant / weekly_traffic_into_this_step ) whole weeks. If GROWTH_PROFILE.md lacks the rate or traffic, ask or pull a benchmark via web search; never guess silently.
7. Write the spec to the ledger row (status=designed) and hand it to the user. I do not run the test.

## Helper snippet (written to files/scripts/sample_size.py, then run)
```python
import math
def n_per_variant(p1, mde_rel, alpha=0.05, power=0.80):
    from statistics import NormalDist
    z_a = NormalDist().inv_cdf(1 - alpha/2); z_b = NormalDist().inv_cdf(power)
    p2 = p1 * (1 + mde_rel)
    n = (z_a + z_b)**2 * (p1*(1-p1) + p2*(1-p2)) / (p2 - p1)**2
    return math.ceil(n)
```

## Output (spec to the user)
```
Test spec: Trust badges on checkout  (ledger status=designed)
Variant A: checkout as-is | Variant B: same + payment trust badges (one change)
Success metric: checkout completion rate | Guardrail: refund rate must not rise
Baseline 10.0% | MDE +20% relative (detect 10.0% -> 12.0%) | 95% / power 80%
Required sample: ~3,900 per variant (7,800 total)
Traffic ~2,000/week into checkout -> duration ~4 weeks
Run it in your tool, then send me: A n/conv, B n/conv.
```

## Edge cases
- Baseline rate unknown → can't size the test; ask for it or pull a benchmark via web search before designing.
- MDE too small for the traffic → the required sample needs months; flag the duration and suggest a bolder change or a higher-traffic step.
- More than one change bundled into Variant B → split into separate experiments; a bundled test can't tell you which change worked.
- No guardrail chosen → default the guardrail to the north-star metric, so a local win that hurts the whole funnel is caught.
