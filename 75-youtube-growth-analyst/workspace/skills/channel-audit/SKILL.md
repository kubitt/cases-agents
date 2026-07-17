---
name: channel-audit
description: Audit the user's YouTube channel — pull public stats or use pasted YouTube Studio numbers, compute the key ratios, compare to niche benchmarks, and log findings. Use in the first-session test run, on "audit my channel", and inside the monthly re-audit task.
---

# Channel audit

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

## Goal
Show the user, in plain words, why the channel is or isn't growing: the strengths, the weak spots, and the biggest levers — every number labeled verified (api / studio-paste) or estimated, honest depth over flattering charts.

## Algorithm
1. Read knowledge/CHANNEL_PROFILE.md for handle, niche, channel type, goal, and whether YOUTUBE_API_KEY is set. Read knowledge/BENCHMARK_LIBRARY.md for this niche's ranges.
2. Get the base public stats. If the key is set, call the YouTube Data API v3 from a Python helper: channels.list (part=snippet,statistics,contentDetails) for subscribers, total views, video count, and the uploads playlist id. Then walk recent uploads with playlistItems.list (part=snippet,contentDetails, 1 unit per call) — never the 100-unit search.list call — and videos.list for per-video statistics. Set source=api. If the key is not set, ask the user to paste these public numbers plus any YouTube Studio figures (watch-time, average-view-duration, impressions click-through rate, traffic sources); set source=studio-paste. Never fabricate — if a number is missing, say "I need this number".
3. Classify the channel type against the templates in knowledge/BENCHMARK_LIBRARY.md.
4. Compute the key ratios in Python: views-per-subscriber = total views / subscribers; recent-vs-baseline view velocity = median views of the last ~10 uploads / median views of the channel's baseline. Only compute a ratio from numbers of the same source; if a piece is missing, mark it estimate and say what it rests on.
5. Compare each metric to the niche benchmark and set verdict = above / at / below. Note "CTR (click-through rate) = clicks divided by impressions" whenever CTR appears.
6. Append one row per metric to Google Sheets "Channel Audit Log" (columns date, metric, value, benchmark, verdict, source, notes). Then summarize strengths, weaknesses, and the 2–3 biggest levers; tag each line [fact] or [hypothesis] and say "correlation is not causation" where a pattern is tied to a result.

## Output
```
Channel audit — @maker (source: api; retention numbers studio-paste)
Strengths:
- [fact] views-per-subscriber 42 vs niche benchmark ~15–25 (verdict: above) — discovery is working.
- [fact] recent-vs-baseline view velocity 1.8x (last 10 uploads beat the baseline) (verdict: above).
Weak spots:
- [fact] average-view-duration 38% vs niche target 45–55% (verdict: below, studio-paste) — retention is the ceiling.
- [hypothesis] CTR 3.1% looks low (CTR = clicks divided by impressions); only 6 videos with data — insufficient sample.
Biggest levers: 1) retention/hooks, 2) title+thumbnail CTR. Correlation is not causation — track after changes.
Logged 7 rows to "Channel Audit Log". Say "build my roadmap" for the plan.
```

## Edge cases
- No API key and the user has not pasted numbers → stay in manual-paste mode, ask for the specific public numbers, and do not estimate; audit only what is provided.
- Very new or tiny channel (few uploads) → run the audit but headline it "early read, small sample" and give directional notes, not verdicts.
- One viral video skews the averages → report the median (not the mean) and name the outlier separately so it does not masquerade as a pattern.
- A benchmark for the niche is missing from BENCHMARK_LIBRARY.md → say so, use the nearest comparable niche, and mark the verdict a hypothesis.
