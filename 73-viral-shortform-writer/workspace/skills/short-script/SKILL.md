---
name: short-script
description: Build a 15–60 second script (hook -> build -> payoff -> CTA) with on-screen text and shot notes, then offer a carousel or text-thread repurpose. Use when the user says "write a script", "make a Reel/Short/TikTok", or approves a hook.
---

# Short script

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: a tight 15–60s script the user can film today — hook -> build -> payoff -> CTA — with on-screen-text lines and brief shot notes, logged to the "Idea Bank".

## Algorithm
1. Read knowledge/CREATOR_VOICE.md and knowledge/PLATFORM_SIGNALS.md. Confirm the topic and platform; if none given, use the primary platform from knowledge/CREATOR_VOICE.md.
2. If a hook is already chosen (from hook-forge) use it; otherwise write one. Confirm any claim or number with web search and keep the source_url — never invent.
3. Write the script in four labelled beats: Hook (first 1–2 seconds), Build (the setup or steps), Payoff (the value or turn), CTA (one action tuned to the platform signal). Keep total spoken length to 15–60s (roughly 40–150 words).
4. For each beat add: the spoken line, an on-screen-text line (short, punchy, readable at a glance), and a brief shot note (what's on camera).
5. Log the finished idea to Google Sheets "Idea Bank": date, platform, topic, hook, angle, status=scripted, performance_notes (blank until the user posts).
6. Offer a repurpose of the same idea: a carousel (slide by slide) or a text thread (for Threads). Build it on request.

## Output
(worked example — topic "why your Reels flop", platform Reels, ~30s)
```
Platform: Reels | Length: ~30s | status=scripted (logged to Idea Bank)
HOOK (0–2s)
  Say: "Your Reels aren't flopping because of the algorithm."
  On-screen: YOUR REELS AREN'T FLOPPING BECAUSE OF THE ALGORITHM
  Shot: talking head, hard cut, no intro
BUILD (2–18s)
  Say: "They flop because the first line lets people scroll. Watch time is everything."
  On-screen: FIRST LINE = EVERYTHING
  Shot: b-roll of a scrolling phone
PAYOFF (18–26s)
  Say: "Open with the result, not the setup. Show the win in second one."
  On-screen: LEAD WITH THE WIN
  Shot: side-by-side bad vs good open
CTA (26–30s)
  Say: "Save this before your next post."
  On-screen: SAVE THIS 👇
  Shot: talking head
Repurpose available: 5-slide carousel or a 4-post Threads thread — want one?
```

## Edge cases
- Script runs past 60s → cut the Build to one point, keep a single payoff; long ideas become a carousel or a series, not one long clip.
- Claim without a source → rewrite the beat without it, or ask before including.
- Idea duplicates a row already in "Idea Bank" → update that row instead of adding a new one, and note it in performance_notes.
- User wants me to film or edit the video → I can't; I hand over the script, on-screen text, and shot notes for the user to shoot.
