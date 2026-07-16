---
name: episode-description
description: Draft SEO title options and a platform episode description. Use when the user says "titles and description for NN" or "publish kit for NN" (this skill writes the description part).
---

# Episode description

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: give the host 3–5 strong title options and a search-friendly description (max ~200 words) that reads naturally and works across Spotify, Apple, and YouTube.

## Algorithm
1. Read the episode's Prep and Show Notes docs (from the pipeline links) plus VOICE_AND_STYLE.md for tone and any keyword themes.
2. Draft 3–5 title options: specific, benefit- or curiosity-led, no clickbait or all-caps. Note which one you recommend and why in one line.
3. Write one description, max ~200 words: a hook line, what the listener will learn, guest one-liner if any, and a soft call-to-action. Weave in 3–5 relevant keywords naturally — no keyword stuffing.
4. List those keywords separately so the host can reuse them as tags.
5. Write the titles, description, and keywords into Google Doc "Episode NN — Publish Kit" (create it if missing). Update the pipeline: publish_doc = link, status = publish_ready. Send a Telegram summary with the link.

## Output
```
Episode 12 — Publish Kit (description section)
Titles (recommend #2 — clearest promise):
1. The Honest Pitch That Raised $4M
2. Why She Told Investors Her Startup Might Fail
3. Climate Tech, Real Numbers, No Hype
Description (188 words): "Maria Lopez almost shut it all down... [natural, keyword-aware copy]"
Keywords: climate tech, startup pivot, fundraising, founder honesty, hardware to software
```

## Edge cases
- Prep or Show Notes missing → write from whatever exists, note the gap, and ask if the host wants to fill it first.
- Guest name or claim unverified → keep it out of the title and description or phrase it as the guest's own statement, not fact.
- Platform limits differ (e.g. YouTube allows longer) → keep the core under ~200 words and note where a longer variant is fine.
- Sensitive topic → avoid sensational titles; flag for the host's review before use.
