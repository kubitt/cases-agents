---
name: pin-writer
description: Write one pin's content — heading, title, description, and English imagePrompt. Use on "write a pin" / "generate a pin" (content step), before every publish, and for batch drafting.
---

# Pin writer

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: produce four ready fields for a single pin — following the niche strategy — so pin-publisher can turn them into a live pin. This step is pure writing; no images or API calls here.

## Algorithm
1. Read knowledge/NICHE_STRATEGY.md (audience, formulas, visual style, keywords) and knowledge/PIN_SETTINGS.md (language, target link, image rules).
2. Pick a fresh angle not used recently (check recent headings in memory/log). Choose one title formula from the strategy.
3. Write the four fields:
   - heading — 5–15 words, the caption for the plaque on the image. A short viral hook in the niche language. No ALL-CAPS.
   - title — up to 100 characters, Pinterest title with a main keyword for SEO, in the niche language.
   - description — 100–300 characters, natural text with 1–2 keywords and a clear call to click the link, in the niche language.
   - imagePrompt — 50–200 characters, ENGLISH ONLY. One premium realistic scene, cinematic light. Always end with: "one scene, no text or letters, no people, no logos".
4. Sanity-check against SOUL: any number/claim must be real; heading must match what the linked page delivers.
5. Save the four fields (to memory or a temp note) and hand off to pin-publisher, or show them if the user only asked to write.

## Output
```json
{
  "heading": "10 ways to earn from your photos",
  "title": "How to earn from photography: 10 real ways for beginners",
  "description": "Want to monetize your hobby? 10 proven ways to earn from photography — from microstock to selling prints. Tap to read the full guide.",
  "imagePrompt": "Ultra realistic photo, 8K, premium, cinematic light, a camera on a wooden table with coffee and a notebook, soft window light, warm tones, one scene, no text or letters, no people, no logos"
}
```

## Edge cases
- No NICHE_STRATEGY.md yet → stop and run niche-research first; don't guess the strategy.
- User gives a specific topic/keyword → use it as the angle, still follow the formulas and field limits.
- Non-Latin language (e.g., Russian, Arabic) → heading/title/description in that language; imagePrompt stays English.
- Sensitive claim requested (income guarantee, medical result) → soften to an honest version or refuse per SOUL; never promise outcomes.
