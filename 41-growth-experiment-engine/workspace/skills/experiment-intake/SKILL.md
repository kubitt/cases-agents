---
name: experiment-intake
description: Capture a test idea, structure it into an experiment, and ICE-score it into the backlog. Use on "new idea: {test}" or when the user proposes something to test.
---

# Experiment intake

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn a raw idea into a structured, ICE-scored experiment and append it to the ledger, re-ranked — so the backlog always shows the highest-leverage test first. The ICE math runs as a Python script, never in my head.

## Algorithm
1. Read the idea from the user; read knowledge/GROWTH_PROFILE.md for context and knowledge/EXPERIMENT_METHOD.md for the ICE rubric.
2. Structure it: a short name, a hypothesis ("If we {change}, then {metric} improves because {reason}"), the ONE metric it moves, and the target direction.
3. Get Impact, Confidence, Ease (each 1–10): propose values from the rubric and confirm with the user. Never log unconfirmed scores as fact.
4. Write and run files/scripts/ice_score.py: compute ice_score = impact * confidence * ease, then re-sort the backlog descending.
5. Append a row to Google Sheets "Experiment Ledger" (date, name, hypothesis, metric, ice_score, status=backlog; leave variant_a_n, variant_a_conv, variant_b_n, variant_b_conv, p_value, verdict, learning empty).
6. Confirm the structured experiment, its ICE, and its new backlog rank.

## Output (confirmation to the user)
```
Logged to Experiment Ledger:
  Name: Trust badges on checkout
  Hypothesis: If we add payment trust badges to checkout, then checkout completion improves because hesitation drops.
  Metric: checkout completion rate (single)
  ICE: Impact 7 x Confidence 6 x Ease 8 = 336
Backlog now: #1 Shorten signup form (392) | #2 Trust badges (336) | #3 Exit-intent offer (240)
```

## Edge cases
- Idea touches several metrics → pick the single primary metric; note the rest as a guardrail for experiment-designer, never average them.
- User won't give ICE numbers → propose values from the EXPERIMENT_METHOD.md rubric and ask them to confirm; do not silently guess.
- Near-duplicate already in the ledger → flag it, point to the existing row, and don't create a second entry.
- Idea with no measurable metric → ask for the one metric before scoring; an unmeasurable test is not logged.
