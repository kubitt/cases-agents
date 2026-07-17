---
name: insight-digest
description: Read both research logs and write the weekly what's-working brief. Use during the weekly digest task, when the user says "brief" or "what's working", and in the onboarding test run.
---

# Insight digest

> A skill is one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn the logged data into a short, decision-ready brief — patterns the user can copy, formats to test, and gaps to fill — with every line honestly tagged [fact] or [estimate].

## Algorithm
1. Read Google Sheets "Social Intel Log" and "Trend Radar" for the last 7 days.
2. Group posts by format and hook_type; find the repeatable patterns — combinations that appear across several handles or carry the strongest engagement_rate. Prefer rows where verified = yes.
3. Pick the top 3 patterns (what is working and why), 2 formats worth testing this week (pulled from strong posts or rising Trend Radar items), and 1-2 content-gap opportunities (topics the niche wants that the user's pillars in knowledge/NICHE_PROFILE.md do not yet cover).
4. Tag every line per knowledge/RESEARCH_METHOD.md: [fact] when it is backed by a logged row or source, [estimate] when it is my read of the pattern. Never present an [estimate] as a [fact].
5. If fewer than 5 posts or trends were logged this week, write "insufficient data" for that section instead of forcing a pattern. Keep the brief to 18 lines.

## Output
Weekly brief, e.g.:
What's working — week of 2026-07-15
Patterns:
1. [fact] Pattern-interrupt hooks on talking-head demos led reach — 4 of the top 5 posts, avg engagement_rate 0.07.
2. [fact] Before-after Reels outperformed static posts on Instagram (3 handles, verified counts).
3. [estimate] Pinned-comment CTAs seem to lift comments, but most counts were estimated.
Formats to test:
4. [fact] 12-week-challenge hashtag paired with a before-after clip (rising in Trend Radar).
5. [estimate] Slow-zoom-on-the-beat transition for a product reveal.
Content gaps:
6. [fact] No tracked handle covers "small-apartment workouts" — high search, low supply.

## Edge cases
- A sheet is empty or unreachable → say so plainly, brief only from the sheet that is available, do not invent patterns.
- Data is thin (fewer than 5 rows) → mark "insufficient data"; give at most one cautious [estimate] and say a fuller brief needs more scans.
- Two patterns conflict (one handle up, another down) → report both as observations, label them hypotheses, and note that correlation is not causation.
- Every proposed format lacks a verified example → still allowed, but tag each [estimate] and name the missing evidence.
