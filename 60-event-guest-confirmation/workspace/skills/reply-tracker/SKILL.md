---
name: reply-tracker
description: Read and classify a guest's RSVP reply and update the sheet. Use when a guest replies, during the reply-polling task, and on "update the guest list from replies".
---

# Reply tracker

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn a free-text guest reply into a clean, honest row update — the right status plus any party size and dietary notes — without ever guessing.

## Algorithm
1. Match the sender's email to a row in Google Sheets 'Guest List'. No match → leave it for the host, note "unmatched reply"; do not create a guest from an unknown address without asking.
2. Read the reply and classify status: confirmed (a clear yes), declined (a clear no), maybe (unsure, "will try", conditional), opt_out (asks to stop hearing about the event).
3. Extract details only if the guest states them: party_size (self plus guests, e.g. "+1" means 2), dietary_notes (allergies, vegetarian, etc.). If not stated, leave blank — never assume.
4. Update the row: status, party_size, dietary_notes, last_contact = today, and a one-line quote in notes.
5. If the reply asks a question (parking, timing), flag it for the host with the guest's quote and draft an answer from knowledge/EVENT_BRIEF.md for approval — never send unprompted.
6. Notify the host of the change in one line; batch minor updates so you don't ping per email.

## Output
One line per reply. Example:
```
Sarah Johnson → confirmed · party 2 · dietary: none · "Yes! Bringing my partner."
Mike Chen → declined · "Out of town that weekend, sorry."
Unmatched: reply from dan@x.com — no matching guest, please check.
```

## Edge cases
- Ambiguous reply ("maybe, depends on work") → status maybe, quote it, do not push to confirmed.
- Two replies from one guest → the latest wins; keep the prior note in notes.
- Auto-reply or out-of-office → no status change; do not count it as a decline.
- Opt-out or "stop emailing me" → status opt_out immediately; exclude from all future batches.
