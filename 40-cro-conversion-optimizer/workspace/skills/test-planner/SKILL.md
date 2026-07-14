---
name: test-planner
description: Turn the top issues into ranked A/B hypotheses with a script-computed ICE score. Use after copy-rewrite, or on "plan tests".
---

# Test planner

> A skill = one repeatable job, written as a recipe. You can edit steps, the rubric, and formats in plain words.

Goal: convert the top issues and rewrites into a ranked list of A/B test hypotheses — each with the single metric to move and an ICE score computed by a script (never eyeballed) — so the user knows what to test first and why.

## Algorithm
1. Take the prioritized issues from page-audit and the rewritten variants from copy-rewrite.
2. For each candidate test, write a hypothesis in "If we {change}, then {metric} improves because {reason}" form, and name the ONE metric it should move (e.g., sign-up rate, CTA click rate).
3. Score Impact, Confidence, and Ease each 1–10 using the rubric in knowledge/CRO_CHECKLIST.md. Do NOT compute in your head.
4. Write the scores to files/scripts/ice_score.py and RUN it; use the numbers it returns. The ICE score is Impact × Confidence × Ease (max 1000).
5. Rank hypotheses by the script's ICE score, highest first. Add a plain note that each result needs enough sample to trust before it's called a winner.
6. Log each hypothesis to the "CRO Log" (date, asset, issue, severity, hypothesis, ice_score, variant, status=planned, result=blank) and hand the ranked list to delivery.

## Helper snippet (the agent writes this to files/scripts/ice_score.py, then runs it)
```python
import json, sys
# rows: [{"hypothesis": str, "impact": int, "confidence": int, "ease": int}, ...]
rows = json.load(sys.stdin)
for r in rows:
    r["ice"] = r["impact"] * r["confidence"] * r["ease"]   # each 1-10, max 1000
for r in sorted(rows, key=lambda x: x["ice"], reverse=True):
    print(f'{r["ice"]:4d} ({r["impact"]}/{r["confidence"]}/{r["ease"]}) {r["hypothesis"]}')
```

## Output (ranked tests, delivered and logged)
```
Ranked A/B tests — /pricing (goal: trial sign-up)
1. ICE 512 (8/8/8)  Rewrite hero to outcome-led → sign-up rate. Variant A vs. current.
2. ICE 405 (9/5/9)  Change CTA "Submit" → "Start my free trial" → CTA click rate.
3. ICE 240 (6/5/8)  Add review count near CTA → sign-up rate. Needs real number.
Note: run one test at a time; each needs enough conversions per arm to trust — small samples are not a winner.
```

## Edge cases
- Traffic too low to test all → rank anyway, and flag which tests would take too long to reach a trustworthy sample.
- Two hypotheses tie on ICE → break the tie by ease (ship the cheaper one first) and say so.
- User asks for the "winner" of a live test → only call it if the sample is adequate; otherwise report it as inconclusive, not a win.
- Issue has no honest variant (no proof) → drop it from the test plan rather than inventing a claim to test.
- Script fails to run → report the error and do not report guessed ICE numbers.
