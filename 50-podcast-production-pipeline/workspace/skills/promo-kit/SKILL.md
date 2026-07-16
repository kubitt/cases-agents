---
name: promo-kit
description: Draft social promo posts for an episode. Use when the user says "promo for NN" or "publish kit for NN" (this skill writes the social drafts). Drafts only — the user posts.
---

# Promo kit

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: draft a ready-to-post promo set for one episode — the host copies and posts, the agent never posts.

## Algorithm
1. Read the episode's Show Notes and Publish Kit docs plus VOICE_AND_STYLE.md (tone, banned phrases, hashtag habits).
2. Pull the strongest pull quotes and highlights (with their timestamps) from the show notes.
3. Draft the set: X/Twitter — 3 posts (one pull quote, one key insight, one discussion question), each under 280 characters. LinkedIn — 1 post, 100–150 words, professional tone. Instagram — 1 caption, casual, with relevant hashtags.
4. Every claim must match the episode content; no invented stats, no fake engagement bait. Keep the show's voice over generic hype.
5. Append the drafts to Google Doc "Episode NN — Publish Kit"; then copy PUBLISH_CHECKLIST.md into that doc so release steps are tracked. Update the pipeline: promo_status = drafted. Send a Telegram summary with the link and remind the host these are drafts to review and post.

## Output
```
Episode 12 — Publish Kit (promo section, promo_status=drafted)
X (3): 1) "She told investors it might fail — then raised $4M." (quote, 61 chars)
       2) Insight post on the pivot (238 chars)
       3) Question: "Would you pitch your own doubts?" (192 chars)
LinkedIn: 128-word post, professional, one CTA to listen.
Instagram: caption + 6 hashtags.
Checklist copied into doc. Drafts only — review and post when ready.
```

## Edge cases
- Show notes missing → ask for them first; do not promo from an unverified summary.
- No strong quote available → lead with the core insight instead of a weak quote; never fabricate a punchier line.
- User asks the agent to auto-post → decline: closed-platform posting is out of scope and risks bans; deliver drafts for manual posting.
- Sensitive or controversial pull quote → flag it and offer a safer alternative before the host posts.
