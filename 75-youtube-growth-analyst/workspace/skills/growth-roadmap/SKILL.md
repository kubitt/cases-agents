---
name: growth-roadmap
description: Turn the audit and competitor benchmark into a prioritized "Growth Roadmap" Google Doc across retention, SEO/discovery, and monetization. Use on "build my roadmap" and after a channel-audit.
---

# Growth roadmap

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

## Goal
Produce a short, prioritized plan the user can act on this month, across three levers — retention, SEO/discovery, and monetization — with each recommendation tagged [fact] (grounded in the data) or [hypothesis] (reasoning to test).

## Algorithm
1. Read the latest rows in Google Sheets "Channel Audit Log" and "Competitor Benchmark", plus knowledge/CHANNEL_PROFILE.md (goal, channel type) and knowledge/BENCHMARK_LIBRARY.md (benchmarks, the three discovery systems, YouTube Partner Program thresholds, retention frameworks).
2. Retention lever: use pasted retention curves or transcripts when the user has provided them; otherwise reason from average-view-duration vs the niche target. Recommend hook, pacing, and structure changes. Anything without a curve or transcript behind it is a [hypothesis].
3. SEO/discovery lever: check titles, descriptions, tags, and topic selection against search demand. Without the optional DataForSEO upgrade, judge demand qualitatively from web search and competitor titles and label it [hypothesis]; never state a search volume you do not have.
4. Monetization lever: give RPM/CPM context for the niche from BENCHMARK_LIBRARY.md, assess YouTube Partner Program tier readiness against the thresholds there, and note sponsorship readiness. Frame money numbers as ranges, not promises.
5. Prioritize: pick the 3–6 moves with the highest expected impact for the user's stated goal, ordered biggest lever first. Each move gets: what to do, why (with the metric it rests on), and the [fact]/[hypothesis] tag.
6. Write the plan to a Google Doc named "Growth Roadmap" (create it or update the existing one). Say "correlation is not causation" wherever a move is tied to an expected result, and remind the user that benchmarks are reference ranges, not guarantees.

## Output
```
Growth Roadmap — @maker (goal: more subscribers) — updated 2026-07-17
Priority 1 — Retention (biggest lever)
- [fact] average-view-duration 38% vs target 45–55% (studio-paste). Do: rewrite the first 15s to state the payoff up front; cut the intro to <5s. Test on the next 3 videos.
Priority 2 — SEO/discovery
- [hypothesis] titles lead with topic, not outcome; leaders use number-led how-to. Do: A/B two outcome-led titles. (Live search volume needs the DataForSEO upgrade.)
Priority 3 — Monetization
- [fact] 40k subs, ~3.9k watch-hours/yr — YouTube Partner Program threshold is 1,000 subs + 4,000 public watch-hours; you're at the line on hours (BENCHMARK_LIBRARY.md). Do: confirm in Studio, then apply.
Note: correlation is not causation; benchmarks are reference ranges. Saved to "Growth Roadmap".
```

## Edge cases
- No retention curve or transcript provided → give retention advice as [hypothesis] from average-view-duration, and ask the user to paste a retention curve or transcript for a grounded read.
- Audit or benchmark rows are missing/stale → run channel-audit (and competitor-benchmark) first, or say the roadmap is based on older data and date it.
- User asks for guaranteed numbers ("how many subs will this get me") → refuse to promise; give a range with the assumption and mark it a hypothesis.
- Monetization question but user is not in the YouTube Partner Program → focus on the readiness thresholds and the fastest path to them, not RPM speculation.
