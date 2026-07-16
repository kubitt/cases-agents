---
name: sentiment-scoring
description: Score the sentiment of one brand mention. Use for every mention during a scan, when re-checking a flagged item, and whenever the user asks "how negative is this?".
---

# Sentiment scoring

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn a mention's snippet into a consistent, defensible sentiment label — negative, neutral, or positive — with a numeric score and an honest confidence.

## Algorithm
1. Read the snippet in full context. If a star rating or explicit score is present on the page, note it — it usually outranks the text.
2. Apply the lexicon in knowledge/BRAND_PROFILE.md (positive words, negative words, deal-breaker phrases) with a short Python helper in files/scripts/ that counts hits and normalizes to a score from -1.0 (very negative) to +1.0 (very positive). 0 is neutral.
3. Add human judgment for what a word list misses: sarcasm, mixed reviews (praise plus a complaint), questions, and comparisons to competitors. Adjust the score if the plain reading disagrees with the lexicon.
4. Set the label from the score: below -0.2 = negative, -0.2 to +0.2 = neutral, above +0.2 = positive.
5. Set confidence: high (clear tone or a matching star rating), medium (mixed or short text), low (sarcasm, ambiguity, or an unverified author).
6. Match the mention to one Topics entry from BRAND_PROFILE.md (e.g. support, pricing, product), else "general".
7. A high-confidence negative is a flag: the scan task will alert the user with the link and a draft reply to post themselves.

## Output
Returned to the scan for one row of "Mention Log":
```
sentiment: negative | score: -0.7 | confidence: high | topic: support
reason: "took 5 days" + "never fixed" = deal-breaker phrases; no offsetting praise
```

## Edge cases
- Sarcasm or irony ("great job losing my order, again") → trust the meaning over the words; label negative, confidence low, note "sarcasm".
- Mixed review (praises product, hates price) → score the overall balance, set topic to the stronger theme, note both in notes; confidence medium at most.
- Non-English or too short to judge → score what is clear, mark confidence low; never force a label onto a two-word fragment.
- Star rating contradicts the text (5 stars, angry words) → follow the text, confidence low, note the mismatch.
