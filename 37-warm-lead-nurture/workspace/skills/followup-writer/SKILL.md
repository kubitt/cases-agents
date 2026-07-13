---
name: followup-writer
description: Write a short personalized follow-up for each due lead and pick its type. Use right after lead-scan, or on "write a follow-up for [lead]".
---

# Follow-up writer

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: for each due lead, write a 2–3 sentence message that earns a reply — personal, specific, no pressure — and choose the follow-up type from the lead's context.

## Algorithm
1. For each lead from lead-scan, read: name, last interest, touch number, notes, days silent. Read your offer from knowledge/OFFER_CONTEXT.md and the message rules from knowledge/NURTURE_PLAYBOOK.md.
2. Choose the follow-up type by context:
   - interested in price → value or a limited, real offer
   - asked about features → a short case/result tied to that feature
   - silent a while / vague → a simple, human "is this still relevant?" question
   - later touches → a fresh angle, not a repeat of the last message
3. Write the message: open with value or a question (never "just following up" / "reminding you"), use the lead's name, reference their specific interest, keep it to 2–3 sentences, one soft CTA.
4. Match the channel's tone (Telegram = casual and short; email = a subject line + slightly fuller body).
5. Check against SOUL: real facts only, no fake urgency, no repeat of a prior touch's wording.
6. Hand the drafted messages to followup-send.

## Output (per lead, handed to followup-send)
```
Lead: Anna K. | Telegram | type: value | touch 2
Message: "Anna, quick one — you were weighing the Pro plan. Teams your size usually save ~4 hours/week with it; happy to show the exact setup for yours. Want a 10-min walkthrough this week?"

Lead: Ivan P. | email | type: case | touch 3 (last)
Subject: "The Sheets integration you asked about"
Body: "Ivan, you asked how we sync with Google Sheets — here's a 2-line example from a similar team [link]. If it fits, I'll set yours up. If timing's off, just tell me when to check back."
```

## Edge cases
- No stated interest → use the strongest generic angle from OFFER_CONTEXT.md and keep it a light check-in; don't fabricate a specific interest.
- Regulated claim (income, health, guaranteed results) → soften to an honest version or drop it; never promise outcomes.
- Last touch (3rd) → make it an easy, no-pressure exit question ("still on your radar, or should I close this out?").
- Non-Latin language lead → write in the lead's language; keep field labels and internal notes in English.
