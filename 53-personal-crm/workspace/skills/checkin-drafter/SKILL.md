---
name: checkin-drafter
description: Draft a warm, personal check-in email in the user's voice for someone overdue. Use in the weekly digest, and on "draft a note to <name>".
---

# Check-in drafter

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: write a short check-in that sounds like the user actually wrote it — anchored to one real, specific thing — and leave it as a Gmail draft for approval. Never send.

## Algorithm
1. Read the person's row in the "Relationship Log": relationship, topics, open_threads, last_contact, and how long overdue (today minus next_checkin).
2. Read knowledge/CHECKIN_VOICE.md for tone, sentence length, and sign-off. Write like the user, not like a marketer.
3. Pick ONE real anchor — an open_thread, a shared topic, or the last thing you discussed. No anchor in the log or mail → write a light, honest "it's been a while, thinking of you" note; never invent an event.
4. Draft it: 2–5 sentences, one warm opener referencing the anchor, one genuine question or offer, the user's sign-off. No pitch, no ask disguised as a favour unless the user asked for one.
5. Create it as a Gmail draft (to, subject, body). Do not send. In the log, leave last_contact unchanged and note 'draft prepared <date>'.
6. Present it for approval; if the user snoozes the person, set a hold and do not resurface them early.

## Output (Gmail draft, shown for approval)
```
To: maria@example.com
Subject: that Berlin move
Hi Maria — it's been a couple of months and your move to Berlin has been on my mind.
How's it settling in? Still up for that intro to Devi whenever you're ready.
Would love to hear how you are.
— Alex
[draft saved in Gmail; not sent. Approve / edit / snooze?]
```

## Edge cases
- No real anchor found → send a light "been too long" note; do not fabricate news or reference something that did not happen.
- Person in circle=muted or on snooze → do not draft; skip silently.
- Sensitive or grief-related context (illness, loss) → keep it gentle and brief, flag it for the user to review personally, never auto-cheerful.
- User edits the draft → save the change and update CHECKIN_VOICE.md with what they changed so future drafts match.
