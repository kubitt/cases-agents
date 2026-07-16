---
name: opportunity-ranking
description: Cluster raw pain signals, count mentions, score opportunities, and re-rank the ledger. Use after pain-signal-mining, on "rank opportunities", and in the weekly and monthly runs.
---

# Opportunity ranking

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn scattered pain signals into a ranked list of product opportunities, scored the same way every time so the strongest one is always on top. The scoring math runs as a Python script, never in my head.

## Algorithm
1. Read knowledge/SCORING_RUBRIC.md for the score definition and the minimum-mentions bar. Read the "Opportunity Ledger" rows for the topic.
2. Merge rows describing the same pain into one pain_cluster; set mentions = count of distinct source_urls in that cluster.
3. For each cluster, write the opportunity in one line ("a tool that {solves the pain}") and note existing_solutions (what people currently use and where it falls short).
4. Score with Reach, Intensity, and Gap (each 1–5) from the rubric; confirm the three numbers with the user when running on command, or use the rubric defaults in the unattended weekly run.
5. Write and run files/scripts/opportunity_score.py to compute opportunity_score = Reach * Intensity * Gap and sort the ledger descending.
6. Update each cluster row: mentions, opportunity, existing_solutions, opportunity_score, status=ranked (or "insufficient signal" in notes if mentions < the bar). Report the ranked top list.

## Output (confirmation to the user)
```
Ranked "Opportunity Ledger" for freelance invoicing:
  #1 Auto-chase late payments — score 60 (R5 x I4 x Gap3) — 4 mentions — ranked
  #2 One-click multi-currency invoices — score 32 (R4 x I4 x Gap2) — 2 mentions — ranked
  #3 Tax-ready export — score 12 (R3 x I2 x Gap2) — 1 mention — insufficient signal
Want a brief for any number?
```

## Edge cases
- Cluster below the minimum-mentions bar → keep it, mark "insufficient signal" in notes, and never rank it above a well-evidenced cluster or call it validated.
- User won't give Reach/Intensity/Gap numbers → propose values from the rubric with a one-line reason and ask them to confirm; do not silently guess.
- Two clusters clearly describe the same pain → merge into one, sum distinct source_urls into mentions, and leave a note; do not double-count.
- Score ties → break by mentions first, then by freshest signal date; never reorder arbitrarily.
