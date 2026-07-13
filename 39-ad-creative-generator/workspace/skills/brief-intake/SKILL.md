---
name: brief-intake
description: Collect the campaign brief and optionally analyze competitor ads. Use on "make creatives for {campaign}", or before ad-copywriter when the brief is incomplete.
---

# Brief intake

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: assemble a complete, honest brief — offer, audience, constraints, prior tests — so ad-copywriter has everything it needs and never guesses the product.

## Algorithm
1. Read what the user gave and fill gaps from knowledge/BRIEF_TEMPLATE.md and memory. Required fields: offer/product, main benefit, target audience, target platform (Meta / Google / TikTok / VK), and any real proof points.
2. Ask only for missing essentials, one question at a time. Do not invent an offer or audience.
3. Pull prior tests from Google Sheets "Ad Tests" for this campaign: which hooks/headlines ran, what won, what flopped — so this round avoids repeats and builds on winners.
4. If the user shared competitor ad links, analyze them: read the pages (built-in web reading; Firecrawl for JS-heavy pages), note their angle, promise, and what they omit — as inspiration, never to copy.
5. Confirm the brief back in 4–5 lines and note the target platform's format limits for ad-copywriter.
6. Hand the brief + platform limits + prior-test summary to ad-copywriter.

## Output (brief handed to ad-copywriter)
```
Campaign: Spring launch — Pro plan
Offer: project management SaaS, Pro plan | Benefit: cut status-meeting time ~30%
Audience: ops leads at 10–50-person teams | Platform: Meta (feed)
Proof: "5-person studio saved 4 h/week" (real, user-provided)
Constraints: no discounts this quarter | Banned: best, guaranteed
Prior tests: 'benefit' hook won last round; 'curiosity' flopped — vary it
Competitor note: rival leads on price; gap = time-saved angle
```

## Edge cases
- No proof points → skip social-proof-heavy hooks or keep them general; never invent a statistic.
- No competitor links → skip competitor analysis, proceed with the brief.
- Regulated niche (health, finance, crypto) → flag platform ad-policy limits, avoid prohibited claims, suggest compliant angles.
- Brief too thin to write good ads → ask the 1–2 questions that matter most, don't pad with assumptions.
- Competitor page unreadable → note it, rely on the brief; don't fabricate what the competitor says.
