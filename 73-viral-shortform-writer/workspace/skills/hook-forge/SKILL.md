---
name: hook-forge
description: Generate 10 platform-tuned opening hooks for a topic or a pasted reference, ranked by scroll-stop strength. Use when the user says "give me hooks", "hooks for X", or pastes a reference clip/script and wants opening lines.
---

# Hook forge

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: hand the user 10 first-two-seconds hooks for one topic, each aimed at a real platform ranking signal, ranked strongest-first — and never a hook the video can't pay off.

## Algorithm
1. Read knowledge/CREATOR_VOICE.md (voice, banned words/claims, language) and knowledge/PLATFORM_SIGNALS.md (per-platform ranking signal and norms). If the user pasted an image, screenshot, or rough script, read it for the real angle.
2. Confirm the topic/angle and the target platform(s). If a claim or number is involved, run built-in web search for real context and keep the source_url — never invent a statistic.
3. Write 10 distinct opening lines (the first line, roughly the first 1–2 seconds). Mix hook types: question, bold claim (only if true and sourced), contrast/tension, curiosity gap, relatable pain, result-first, and a "wrong way / right way" open.
4. For each hook, name the platform signal it targets in plain words (for example Reels = sends/saves, TikTok = watch-time + rewatches) so the user knows why it fits.
5. Rank 1–10 by scroll-stop strength (would a scrolling viewer stop?). Add a one-line why for each. Drop any hook the content can't honestly deliver on.
6. Offer to pass the top pick to short-script or caption-craft.

## Output
(worked example — topic "a 20-minute meal-prep routine", platform Reels)
```
Topic: 20-minute meal-prep routine | Platform: Reels (signal: sends + saves)
1. "You're meal-prepping wrong — and it's costing you 3 hours a week." — pain + concrete number — strong save/send bait because it promises a fix people forward.
2. "5 lunches. 20 minutes. One pan." — result-first, concrete numbers — instantly scannable, high saves.
3. "The meal-prep step everyone skips (and why your food gets soggy)." — curiosity gap tied to a real payoff.
4. "I stopped meal-prepping on Sundays. Here's what I do instead." — contrast/tension, personal.
   ... (through 10)
Top pick: #2 — clearest promise the video can keep. Want a script or a caption for it?
```

## Edge cases
- Claim or number with no source found → drop the number or mark it unverified and ask before using; never fabricate a statistic.
- Topic that only works as bait (the video can't deliver the promise) → say so, propose an honest angle instead.
- Reference pasted is someone else's clip → use it for structure/inspiration only, never copy their words; note the pattern in the "Swipe File" with its source_url if useful.
- No platform chosen → default to the primary platform in knowledge/CREATOR_VOICE.md and note the assumption.
