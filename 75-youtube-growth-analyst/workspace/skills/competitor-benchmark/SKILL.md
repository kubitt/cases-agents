---
name: competitor-benchmark
description: Benchmark the 3–5 competitor channels from CHANNEL_PROFILE.md — pull public stats and top videos, compare cadence, views, and patterns, and position the user against the set. Use on "check my competitors", inside the audit, and in the weekly competitor pulse.
---

# Competitor benchmark

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

## Goal
Position the user's channel against the 3–5 competitors they named: how their cadence, average views, and view-to-subscriber ratio compare, and which recurring title, thumbnail, and format patterns the strong performers share — public data only.

## Algorithm
1. Read the competitor list, niche, and channel type from knowledge/CHANNEL_PROFILE.md.
2. For each competitor, get public stats. If YOUTUBE_API_KEY is set, use a Python helper: channels.list for subscribers and total views and the uploads playlist id, then playlistItems.list (1 unit per call, not search.list) to walk recent uploads, and videos.list for per-video views. Set source=api. If no key, read each competitor's public channel and videos pages and record what is visible; set source=estimate and say the numbers are approximate.
3. Compute per competitor: upload_cadence (uploads per week over the recent window), avg_views (median views of recent uploads), view_sub_ratio (total views / subscribers), and top_format (the format of their best recent videos: long-form / short / live / other).
4. Note recurring patterns among the strongest performers: title shapes (question, number, how-to), thumbnail style, and video format. Keep this descriptive — it is inspiration and analysis, never copying.
5. Append one row per competitor to Google Sheets "Competitor Benchmark" (columns date, competitor, subscribers, avg_views, upload_cadence, view_sub_ratio, top_format, notes).
6. Write a short positioning read: where the user leads, where they trail, and the 1–2 patterns worth testing. Tag each line [fact] or [hypothesis].

## Output
```
Competitor benchmark — niche: no-code tutorials (source: api)
- CompA: 210k subs | avg_views 34k | cadence 2/wk | view_sub_ratio 61 | top_format long-form how-to
- CompB: 88k subs | avg_views 41k | cadence 1/wk | view_sub_ratio 96 | top_format long-form how-to
- You: 40k subs | avg_views 12k | cadence 3/wk | view_sub_ratio 42
Read:
- [fact] your cadence is highest but avg_views is lowest — you may be trading depth for volume.
- [hypothesis] both leaders favor number-led how-to titles + face-in-thumbnail; worth a controlled test.
Logged 3 rows to "Competitor Benchmark".
```

## Edge cases
- A competitor channel is private, deleted, or unreadable → skip it, note "not accessible" in notes, and do not estimate its numbers.
- No API key → work from public pages, set source=estimate, and tell the user the comparison is approximate until the free key is added.
- A competitor is far larger or in a different niche → benchmark ratios (view_sub_ratio, cadence), not raw subscriber counts, and flag the mismatch.
- Only 1–2 competitors provided → run it, but say the set is small and the patterns are directional, not conclusive.
