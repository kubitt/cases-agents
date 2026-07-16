---
name: account-audit
description: One full deep dive over everything logged so far. Use in the first-session test run and when the user says "audit my account" or "give me the full picture".
---

# Account audit

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: a first-session (or on-demand) deep review that shows the user, in plain words, what their whole account is doing well and badly — the "aha" that a $10–50/mo analytics tool sells. Honest depth over flattering charts.

## Algorithm
1. Make sure posts are logged: if "X Post Log" is thin, first run skill post-analyzer over the user's CSV export or the public posts they shared (aim for 20+ posts for a meaningful audit; fewer is fine but say the sample is small).
2. Read every logged row. Split verified rows from unverified rows and analyze them separately — never blend them into one number.
3. Format analysis: median engagement_rate per format; name the best and worst, each with its post count. Skip any format under 5 posts as insufficient data.
4. Hook and topic analysis: same median-per-group method for hook_type and topic (content pillars from knowledge/ACCOUNT_PROFILE.md); call out the pillar that earns the most and the least engagement.
5. Timing note: if post_date has enough spread, note any day/time pattern strictly as a hypothesis; timing samples are usually thin.
6. Write the audit: strengths, weak spots, and 3–5 concrete moves tied to the goal in ACCOUNT_PROFILE.md. Tag every claim [fact] or [hypothesis], mark unverified sections, and add "correlation is not causation" wherever a pattern is linked to a result. Offer to save a longer version to a Google Doc.

## Output
```
Account audit — @yourname (46 posts logged: 38 verified, 8 unverified)
Strengths:
- [fact] threads carry the account: median 5.6% across 14 threads vs 2.9% for singles.
- [fact] the "growth" pillar outperforms "mindset" (4.8% vs 2.3%, 20 vs 12 posts).
Weak spots:
- [fact] image-only posts underperform (1.7%, 9 posts) — likely diluting your feed.
- [hypothesis] link posts look weaker, but only 3 — insufficient data.
Moves (tied to goal = grow followers):
1. Shift toward how-to threads on the growth pillar; correlation is not causation, so track it.
2. Retire image-only posts for 3 weeks and compare.
3. Turn your 3 best threads into follow-up threads.
Note: 8 unverified posts excluded from the rates above; connect your analytics export to fold them in.
```

## Edge cases
- Very small sample (under ~10 posts) → run the audit but headline it "early read, small sample"; give directional notes, not verdicts.
- No verified data at all → audit the public data, stamp the whole report "unverified", and recommend the analytics export.
- One viral outlier skews a group → report the median (not the mean) and name the outlier separately so it doesn't masquerade as a pattern.
- Conflicting signals (a format wins on engagement_rate but loses on reach) → present both, do not force a single winner.
