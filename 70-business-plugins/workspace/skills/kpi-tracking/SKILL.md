---
name: kpi-tracking
description: Log new numbers into the KPI Dashboard and compute each metric's status and trend. Use when the user sends fresh figures, says "update the KPIs", "what's our status", or during the weekly brief and monthly review.
---

# KPI tracking

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: keep one honest KPI Dashboard — current vs target, a clear red/amber/green status and an up/flat/down trend for each metric — with every number traceable to a source and nothing invented.

## Algorithm
1. Open Google Sheets "KPI Dashboard" (columns: metric, owner, target, current, prior, unit, status, trend, period, source, note). Read knowledge/REPORTING_STYLE.md for the RAG thresholds and each metric's direction (higher-is-better or lower-is-better).
2. For each number the user gives: move the old `current` into `prior`, write the new `current` and its `period`, and record where it came from in `source`. A figure you were not given → write "data not provided for this period" in `note`; never guess a value.
3. Compute `status`: green when the metric meets or beats target; amber when it is within the threshold band (default 10%); red beyond that. For lower-is-better metrics (churn, CAC) mirror the logic. Compute `trend` from prior→current: up, flat, or down.
4. Flag every red metric with its exact source row so the user can check it. If a metric's sample is too small to read, mark it "insufficient data" rather than assigning a status.
5. Reply with one line per metric plus the red list. Do not restate the whole sheet if only a few changed.

## Output
```
KPI Dashboard updated (period 2026-W28):
  MRR: target $50,000 | current $46,200 (prior $44,800) → amber (up; 7.6% below target)
  New signups: target 400 | current 512 (prior 470) → green (up)
  Monthly churn: target <=3.0% | current 3.9% (prior 3.5%) → red (rising; worse than target)
Red list: Monthly churn 3.9% vs <=3.0% target — source: "Billing export" tab, row 14.
```

## Edge cases
- Number with no source given → log it but mark `note` "source unconfirmed"; ask the user for the source.
- Metric not yet in the dashboard → add a row only after confirming its target and direction; don't score an unconfigured metric.
- Restated / corrected past number → overwrite in place, add a `note` "corrected {date}"; never silently drop the old value without saying so.
- Target missing for a metric → leave `status` blank and ask for the target; a status without a target is meaningless.
