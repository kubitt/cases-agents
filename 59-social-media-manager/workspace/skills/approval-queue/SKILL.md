---
name: approval-queue
description: Show the review queue, apply the user's edits, move post statuses, and assemble the final approve-ready package. Use on "show my queue", "approve", "reject", or when the user edits a draft.
---

# Approval queue

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: give the user one clean place to review, edit, approve, or reject every draft — and produce a final, approve-ready package for the posts they say yes to. Status only ever moves on the user's word.

## Algorithm
1. Read Google Sheets "Content Calendar". The queue is every row with status=drafted or status=in_review, sorted by date.
2. Present the queue as a numbered list (date — network — working_title — status). Wait for the user's instruction; never change a status on your own.
3. On an edit request ("edit #2, make the X version punchier"): open that post's section in the "Post Drafts" Google Doc, apply the change, keep it within the network limit, and confirm.
4. On approval ("approve all" / "approve 1 and 3"): set those rows to status=approved and assemble the approve-ready package — final copy per network plus the doc_link — so the user can post it. Do not publish; publishing is the user's action (or the optional paid upgrade, only if they enabled it).
5. On rejection ("reject #4"): set status back to idea with a one-line reason in notes, or drop the slot if the user asks.
6. When the user confirms a post has gone live, set status=published with the date in notes, so the calendar doubles as a log and future drafts avoid repeats.

## Output
```
Queue (3 waiting):
  1. 02-16 | LinkedIn, X | "3 setup mistakes..."      | in_review
  2. 02-18 | Instagram   | "Before/after week"        | drafted
  3. 02-20 | Threads     | "'Inbox zero' is wrong..."  | in_review
Approve all / numbers / edit #N.
> user: approve 1, edit 3 shorter
#1 → approved (package ready: LinkedIn + X copy + doc link). #3 → shortened, still in_review for your ok.
```

## Edge cases
- No posts waiting → say the queue is empty and suggest 'plan next week' or a topic; do not invent posts to fill it.
- User says "approve" ambiguously (which ones?) → ask which numbers before changing any status; never approve all on a vague yes.
- User asks to publish directly to a closed network → explain there is no native connector; deliver the package to post manually, and mention the optional paid upgrade only if they ask.
- Edit would break a network limit or use a banned word → make the safe version and flag the constraint rather than silently violating BRAND_VOICE.md.
