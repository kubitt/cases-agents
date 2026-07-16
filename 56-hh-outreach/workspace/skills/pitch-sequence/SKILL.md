---
name: pitch-sequence
description: Build the outreach sequence and write the emails. Use after signal research, when drafting touches in the morning batch, and for voice or tone edits.
---

# Pitch sequence

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: 2-3 honest emails that read like a busy person writing to a busy person, openly from a service provider about the company's open role. Each next touch is shorter.

## Algorithm (default sequence)
- T1 (day 0): signal-based opener, 120 words or fewer. Formula: name the posted role and why you noticed it (1-2 sentences from the dossier, with the fact traceable to source_url) -> the likely pain that role signals -> how your service covers it faster or cheaper than a hire (1 sentence, no feature list) -> one CTA: your booking link and a one-word question ("worth a quick call?"). Set opener_type = signal_role, signal_salary, or signal_multi_hire.
- T2 (day 3): new angle - a relevant case or number from knowledge/OFFER_ICP.md, 80 words or fewer. Never "just following up". opener_type = case_number.
- T3 (day 7, optional): break-up, 40 words or fewer: "Closing the loop - if the <posted_role> gap is still open, my link is above. Good luck either way." opener_type = breakup.
- Subject: 3-5 words, lowercase, about their role ("your support lead opening"). Banned: caps, "great offer", emoji, fake "Re:".

## Text rules
- Voice, signature, and booking link come from knowledge/VOICE.md — write like the user talks, not like a marketer.
- Identity is honest: you are a service provider reaching out about their open role, never a job applicant. Banned phrases: "applying for", "my application", "hope you're doing well", "unique solution", "mutually beneficial cooperation", any "[Name]" placeholder left in a finished draft.
- One CTA per email, answerable in one word or one click. No mocking or condescension about their hiring.
- Every fact traces to source_url. No source, no fact — rewrite without it.

## Output
Gmail draft (to, subject, body, signature with booking link). In "Outreach Pipeline": status=in_sequence, next_touch date, opener_type — the Friday analytics runs on it.

## Edge cases
- Reply at any point -> the sequence stops; switch to manual mode with reply drafts.
- Auto-reply "away until N" -> next_touch = N+1, the touch counter unchanged.
- Rejection or opt-out -> do_not_contact; a polite final reply only if the user asks.
- No booking link on file -> fall back to a plain-text CTA question and flag it for the user to add in knowledge/VOICE.md.
