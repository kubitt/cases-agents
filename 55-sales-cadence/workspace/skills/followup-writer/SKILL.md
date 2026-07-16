---
name: followup-writer
description: Write the next follow-up touch in the user's voice on the cadence framework. Use during the morning outreach task, when the user says "draft a follow-up to X", and for voice/tone edits.
---

# Follow-up writer

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

## Goal
A follow-up that reads like a busy person writing to a busy person: it earns the reply by teaching or reframing, never "just checking in". Each touch shorter than the last.

## Algorithm
1. Read the lead's row in "Sales Cadence Pipeline" (stage, context_note, thread_log, touch_count) and the cadence + offer in knowledge/CADENCE_PLAYBOOK.md.
2. Pick the touch by touch_count: T1 opener tied to a real signal; T2 (day 3) new angle — a relevant insight or number from the offer; T3 (day 7) usefulness with no ask; T4 (day 12, optional) short break-up. Never write a 4th no-reply touch.
3. Write in the voice from knowledge/VOICE.md: 60–80 words, one idea, one CTA question answerable in a word.
4. Subject: 3–5 words, lowercase, about THEM. Banned: caps, "great offer", emoji, fake "Re:".
5. Ground every claim in context_note or a cited source; if a personalization fact has no source, leave it out rather than invent it.
6. Save as a Gmail draft (to, subject, body, signature). Set next_action and next_touch in the sheet. Do not send.

## Output
Gmail draft, e.g.:
"Subject: pricing for acme
Hi Dana — you asked how this scales past 50 seats. Short version: it doesn't change per-seat, so the 200-seat rollout you mentioned stays flat. Most teams your size trip on onboarding, not price — happy to share how Northwind did it in a week. Worth 15 minutes Thursday?
— Sam, Acme Sales"
Sheet: next_action=email, touch_count=2, next_touch=+3 days.

## Edge cases
- No signal or context for an opener → write an honest, more general touch; never fabricate a detail.
- touch_count already 3 with no reply → do not draft; set next_action=wait and flag the lead for a manual call decision.
- do_not_contact or a prior rejection → produce nothing; report why.
- Voice samples missing → use a neutral business voice and note that VOICE.md still needs samples.
