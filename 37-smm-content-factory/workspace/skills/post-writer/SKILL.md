---
name: post-writer
description: Write a batch of posts adapted per social network from the week's topics. Use on "write posts", "make a package", or to adapt one idea across networks.
---

# Post writer

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn the week's topics into ready post texts, one per chosen network, in the brand voice — so post-publisher only needs to add images and publish.

## Algorithm
1. Read knowledge/BRAND_PROFILE.md (voice, audience, networks, links) and the topics from trend-research.
2. For each topic, write a post for each network the brand uses. Structure every post: a first line that stops the scroll, one concrete fact or tip, a closing question or CTA.
3. Apply platform rules (hard limits):
   - Telegram: no hashtags, can be longer, 1 link ok.
   - VK: up to 3 hashtags.
   - Instagram: up to 10 hashtags, line breaks for readability.
   - X: 280 characters max, punchy.
   - LinkedIn: professional tone, a short insight or lesson.
4. Rotate formats across the batch: useful / engaging / selling / entertaining — don't ship five of the same.
5. Write a short English image brief for each post (for post-publisher): one clean scene matching the brand's visual style, "no text, no people, no logos" unless the brand asks otherwise.
6. Check SOUL: real facts only, brand banned topics excluded, banned words (unique, innovative, revolutionary) absent.

## Output (per post, handed to post-publisher)
```
Topic 1 — how-to (format: useful)
- Telegram: "Your pour-over tastes flat? It's almost always the ratio... [tip]. What ratio do you use?"
- X (<280): "Flat pour-over = wrong ratio. Try 1:16, grind medium-fine, pour in 3 stages. Fixes 90% of bad cups."
- Instagram: "...\n\n#coffee #pourover #homebarista"
image_brief (EN): "top-down pour-over coffee setup on light wood, steam, warm morning light, no text, no people"
```

## Edge cases
- No topics provided → run trend-research first; never invent trends to write about.
- Brand uses only some networks → write only those; don't produce posts for networks the brand skips.
- Sensitive/regulated claim (health, income, legal) → soften to an honest version or drop it; never promise outcomes.
- X limit exceeded → tighten wording until ≤280 chars; never ship an over-limit X post.
