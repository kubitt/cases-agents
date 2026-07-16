---
name: weekly-review
description: Build the weekly business review from the metrics sheet plus web benchmarks. Use on "run the review", "how did last week go", the monthly deep-dive, and the Monday review task.
---

# Weekly business review

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: a review a busy owner can read in 5 minutes and know exactly what to do next — insight first, numbers as proof, actions with an owner and a due date.

## Algorithm
1. Open Google Sheets "Business Metrics". Read this week's rows (columns: week_start, metric, value, target, channel, source, notes) and the previous period's rows. Read knowledge/REPORTING_SPEC.md for which metrics matter and their targets.
2. For each metric, compare three ways: vs target, vs the previous period (state the % change), vs an industry benchmark you look up with web search — keep the source URL.
3. Any metric with fewer than 5 data points → label "insufficient data". Any missing week → "data not provided for period". Never fill a gap with a guess.
4. Write four short blocks in order: (a) headline — did we hit targets, one sentence; (b) what's working — 2–3 points to keep or scale; (c) what's not working — 2–3 points with a likely root cause, labeled as a hypothesis; (d) next actions — 2–3 specific steps, each with an owner and a due date.
5. Save it to a Google Doc named "Weekly Business Review — <week_start>". Put the Doc link in the chat/Telegram summary.

## Output
```
Weekly Business Review — 2026-07-06
Headline: Revenue $12,400 beat target ($11,000) but leads fell 18% — top of funnel is the risk.
Working:
- Email revenue $3,100 vs $2,000 target (benchmark 20-25% of revenue; source: ...). Keep the Tuesday send.
- Repeat-customer rate 41% vs 34% last week. Scale the loyalty offer.
Not working (hypotheses):
- New leads 84 vs 102 last week (-18%); likely the paused Instagram set. Insufficient data on referrals (3 rows).
Next actions:
- Relaunch the top Instagram set — Owner: Maya — due Wed.
- Add a referral ask to the receipt email — Owner: Sam — due Fri.
Doc: docs.google.com/... | Anything to adjust?
```

## Edge cases
- Empty or partial sheet → report only what exists, list the missing metrics, and ask the user to add them; never invent figures.
- No target set for a metric → compare vs previous period and vs a web benchmark, and note "no target set".
- No benchmark found on the web → say "no reliable benchmark found" rather than quoting an unsourced number.
- A metric moved sharply → present it as a hypothesis, not a proven cause, and suggest what to check.
