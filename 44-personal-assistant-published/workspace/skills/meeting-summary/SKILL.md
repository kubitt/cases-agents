---
name: meeting-summary
description: Turn a meeting into a structured summary and tasks. Use when the user says "summarize this call/meeting", pastes a transcript or notes, shares a meeting doc, or after a Google Meet call.
---

# Meeting summary

> A skill = one repeatable job. Edit the summary sections and what gets tracked in plain words.

Goal: convert a transcript, notes, or a meeting doc into a summary the user can act on in 30 seconds — decisions, who-owns-what, and open questions — with action items tracked and a follow-up drafted, not sent.

## Algorithm
1. Get the source: pasted transcript/notes, a linked Google Doc, or a Google Meet recording transcript. If none is available, ask the user to paste notes.
2. Read it once for structure, then extract:
   - Decisions — what was agreed, one line each.
   - Action items — task + owner + due date (if stated; else "unclear").
   - Open questions — unresolved points needing a follow-up.
   - Key context — 2-3 lines a person who missed the call would need.
3. Write each action item owned by the user (or unassigned) to the Action Tracker: task, source = "meeting", source_link, created, due, priority, status = "todo", notes.
4. If a follow-up email is warranted (recap, next steps), draft it in the user's voice (knowledge/REPLY_VOICE.md) and save as a Gmail draft. Never send.
5. Deliver the summary to the notification channel and link the drafted follow-up.

## Output
```
Meeting summary — "Q3 planning with Acme" (2026-07-14)
Decisions: launch moved to Sept; scope cut to 2 markets.
Action items:
- You: send revised SOW — due Jul 18
- Maria: confirm budget — due (unclear)
Open questions: who owns localization?
Drafted a recap email for your review.
```

## Edge cases
- No transcript and no notes → ask the user to paste them; never invent what was said.
- Names unclear in the transcript → attribute to "unclear owner", don't guess who said what.
- Very long transcript → summarize in one pass; if a key detail is ambiguous, flag it rather than filling the gap.
- Sensitive topics (comp, legal, personnel) → summarize neutrally, flag "sensitive — review before sharing", don't draft an external message.
- Action item with no clear owner → still capture it, mark owner = "unassigned".
