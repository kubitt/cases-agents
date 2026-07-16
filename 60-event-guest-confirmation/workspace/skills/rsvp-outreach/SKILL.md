---
name: rsvp-outreach
description: Draft confirmation and reminder emails for guests. Use when preparing a confirmation batch, when the daily reminder batch runs, and on "email the guests" or voice/tone edits.
---

# RSVP outreach

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: write warm, personal RSVP emails that make replying easy — one clear ask, the right event facts, the host's voice — ready for the host to approve.

## Algorithm
1. Read the event facts from knowledge/EVENT_BRIEF.md (title, date, time, location, RSVP deadline, plus-one rule, dress code). Never state a fact that isn't in the brief.
2. Read the host's tone and sign-off from knowledge/MESSAGE_VOICE.md.
3. Confirmation email: greet by first name, give the event in one tidy line (what / when / where), ask the one question "Can you make it?", and invite dietary needs and plus-ones if allowed. Keep it under 120 words.
4. Reminder email (status invited or no_response): a friendly nudge, restate the date and the RSVP deadline, under 60 words, no guilt-trips. Only if reminder_count is under 2 and the deadline has not passed.
5. Build the emails as Gmail drafts, one per guest. Put the subject and the guest name into the batch summary for approval. Never send from this skill.
6. After the host approves and the send happens: set status per email type, last_contact = today; for reminders raise reminder_count by 1 in 'Guest List'.

## Output
Batch summary for approval, then the draft body. Example:
```
Drafts ready (3) — approve all / numbers:
1. Sarah Johnson — invited — "Can you make the Summer BBQ, Jun 14?"
2. Mike Chen — invited — "Summer BBQ on Jun 14 — you in?"
3. Rachel Torres — reminder — "Quick nudge: RSVP by Jun 7?"

Draft 1 body:
Hi Sarah, we're having our Summer BBQ on Sat Jun 14, 4 PM, 23 Oak Street.
Can you make it? If so, any dietary needs or a plus-one to note? — Jamie
```

## Edge cases
- No email address for a guest → leave status invited, add "needs email" in notes, tell the host; never invent an address.
- A missing event fact (e.g. no location yet) → write around it or ask the host; never guess a detail.
- Guest already confirmed or declined → no reminder; skip and note the skip reason in notes.
- Guest status opt_out → never draft anything for them.
