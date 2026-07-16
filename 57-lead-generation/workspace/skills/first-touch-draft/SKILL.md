---
name: first-touch-draft
description: Write ONE personalized first-touch message for a qualified prospect as a Gmail draft, tied to its signal. Use for status=qualified rows in the nightly batch and on "draft first touch for {company}".
---

# First-touch draft

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

## Goal
Produce a single first-touch email that reads like a busy person writing to a busy person — grounded in the prospect's real signal, in the user's voice, ready for review in Gmail. This is the ONLY touch I draft; follow-ups are the SDR's job.

## Algorithm
1. Read the qualified row from Google Sheets "Prospect List" (company, contact_name, role, email, signal, notes) and knowledge/OUTREACH_VOICE.md (voice + offer).
2. Write the message, <=120 words: one observation about THEM from the signal (with the fact behind it) → the likely pain it implies → one sentence on how we help companies like them (no feature list) → one CTA question answerable in a word ("worth a short chat?" / "who handles this on your side?").
3. Subject: 3–5 words, lowercase, about them (e.g. "your new bee cave clinic"). Banned: caps, "great offer", emoji, fake "Re:", "[Name]" placeholders left in a finished draft.
4. Use the voice and signature from OUTREACH_VOICE.md. Every fact must trace to the dossier source; a fact with no source gets rewritten out.
5. Create a Gmail draft (to = email, subject, body, signature). Put a one-line summary in first_touch and set status=drafted. If email is empty, skip the draft, leave status=qualified, note need_contact. I never send.

## Output
```
Gmail draft created for Lakeway Dental -> hello@lakewaydental.com
Subject: your new bee cave clinic
Body: Saw you opened the Bee Cave location a few weeks back and are hiring front-desk — that
usually means more inbound calls than the desk can catch. We help multi-location clinics stop
losing first-time callers (one client cut missed inquiries ~30%). Worth a short chat this week?
— Alex, Founder, {company}
status -> drafted | first_touch: signal=new clinic, CTA=short chat
```

## Edge cases
- No email on file → do not draft; leave status=qualified with need_contact so the user can add one, or hand off for enrichment.
- Signal is weak/site-only → open with the concrete site fact rather than a manufactured event; never invent urgency.
- Sensitive niche (health, finance, legal) → keep claims modest and compliant, no promises of outcomes; flag for the user to review wording.
- User edits the draft → save the improved version's patterns to OUTREACH_VOICE.md so future drafts match.
