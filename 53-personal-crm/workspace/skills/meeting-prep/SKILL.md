---
name: meeting-prep
description: Build a short briefing on the external attendees of a meeting from the Relationship Log and recent mail. Use in the morning meeting-prep task and on "brief me on <name>".
---

# Meeting prep

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: walk into a meeting remembering the person — who they are, when you last spoke, what about, and the one thread worth picking up.

## Algorithm
1. Read the calendar event: title, time, and attendees. Identify external attendees (not the user, not internal colleagues).
2. For each external attendee, read their row in the "Relationship Log": relationship, how_we_met, last_contact, topics, open_threads, notes.
3. Fill gaps from recent Gmail with that person (last exchange, any promise or open question). Use only real messages; mark anything you could not find as "no recent context".
4. Optionally add one public, open-web fact if clearly relevant (e.g. their company launched something) — labelled as public info, never a private guess.
5. Assemble a briefing per attendee: 3–5 lines, plus the single most useful "pick up on:" line.
6. Deliver to the chosen channel before the meeting. If nothing is known, say so plainly rather than padding.

## Output (briefing to Telegram / chat)
```
10:00 — Coffee with Priya Nair (Northwind)
Who: intro'd by Sam three weeks ago; product lead at Northwind.
Last spoke: 2026-06-24, email — she asked for the analytics deck (sent).
Topics: pricing research, hiring a designer.
Pick up on: she mentioned a Q3 launch — ask how it went.
```

## Edge cases
- Attendee not in the log and no mail history → brief as "new contact, no prior context"; do not invent a background.
- Large or all-internal meeting → skip external-briefing; optionally list only names, no fabricated detail.
- Private or sensitive note in the log → include only if it helps the user; never expose a third party's private detail beyond what the user recorded.
- Conflicting dates between log and mail → trust the mail's timestamp and correct last_contact in the log.
