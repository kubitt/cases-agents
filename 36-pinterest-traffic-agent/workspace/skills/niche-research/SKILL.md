---
name: niche-research
description: Research a niche and build the pin strategy. Use during onboarding, on "set me up", "analyze my niche", or "refresh the strategy". Runs before any pins are written.
---

# Niche research

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn a raw niche into a concrete pin strategy that pin-writer can use — audience, hooks, visual style, and Pinterest SEO keywords — saved to knowledge/NICHE_STRATEGY.md.

## Algorithm
1. Read the niche, target link, language, and tone from the user (onboarding) or from NICHE_STRATEGY.md if refreshing.
2. Use your own knowledge plus web search ("<niche> Pinterest ideas", "<niche> best pins", "<niche> keywords") to gather what actually works. Read 3–5 real sources; do not invent trends.
3. Define the audience in one or two lines: who they are, their main pains, and what they want (the promise behind the click).
4. List 3–5 pin formats that perform in this niche (e.g., listicle, how-to, before/after, checklist, inspiration board).
5. Write 3–5 title/hook formulas as fill-in patterns, e.g. "[Number] ways to [verb] [topic]", "How to [goal] without [pain]".
6. Describe the visual style in plain words + English keywords for imagePrompt (lighting, palette, mood, composition).
7. Collect 8–15 Pinterest SEO keywords/phrases the audience searches.
8. Save everything to knowledge/NICHE_STRATEGY.md. Show the user a short summary and ask for corrections.

## Output (summary shown to the user; full version in NICHE_STRATEGY.md)
```
Niche: earning from photography (link: example.com/photo, language: en, tone: inspiring)
Audience: beginner photographers 25–40 who want to monetize a hobby
Top formats: numbered lists, how-to guides, income breakdowns
Title formulas: "[N] ways to earn from [topic]", "How to [goal] without [pain]"
Visual style: warm natural light, premium minimalist, shallow depth of field, no text/people
Keywords: photography income, microstock, sell prints, photography for beginners (+8 more)
Saved to NICHE_STRATEGY.md. Anything to adjust?
```

## Edge cases
- Vague niche ("business", "lifestyle") → ask one narrowing question; suggest 2–3 concrete sub-niches to pick from before researching.
- Web search returns thin results → rely on your own knowledge, label the strategy "starter — refine after first pins react", and note it in NICHE_STRATEGY.md.
- Grey-hat or banned niche (adult, false health/income claims) → refuse per SOUL and explain; offer a compliant adjacent angle.
- Non-English niche → research in the user's language, but keep the visual-style keywords in English (imagePrompt is English-only).
