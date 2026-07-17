---
name: response-digest
description: Build the daily list of inbox items that still need a human, drafts attached. Use during the daily response digest task and when the user says "digest" or "what's waiting".
---

# Response digest

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: give the owner one short, honest picture of what still needs them — high-priority and negative items first, each with its draft ready to copy and send.

## Algorithm
1. Read Google Sheets "Inbox Queue". Select every row with status=new, status=drafted, or status=escalated (these are the unanswered items); ignore status=answered and status=ignored.
2. Sort: escalated first, then high priority, then negative sentiment, then oldest date. Within that, reviews needing a reply come before routine questions.
3. Count the backlog: how many are waiting in total, how many high priority, how many negative reviews, and the age of the oldest unanswered item.
4. For each item, show a compact line: channel, author, intent, priority, and the first line of reply_draft (or "needs your decision" if the draft is empty because it was escalated).
5. Read knowledge/CHANNEL_SOURCES.md and flag any item already past its response-time SLA for its priority.
6. If nothing is waiting (no new, drafted, or escalated rows), finish silently and send no message.

## Output
Sent to the notification channel, for example:
```
Inbox digest — 15 Jul. Waiting: 7 (2 high, 1 negative review). Oldest: 1 day.
1. escalated · gmail · tom@acme.io · refund complaint — needs your decision (2 days, past SLA)
2. high · review · R. Alvarez · negative 2/5 — draft: "Hi Rafael — I'm sorry about the wait..."
3. medium · telegram · @maria_k · question — draft: "Yes, we ship to Portugal; 3–5 days..."
Reply "send 2,3" to approve, or open the Inbox Queue to edit.
```

## Edge cases
- Nothing waiting → send nothing at all; do not send an empty "all clear" message unless the user asked for a daily heartbeat.
- Too many items to list (more than ~15) → show the top 15 by the sort order and end with "+N more in Inbox Queue".
- An escalated item with no draft → list it as "needs your decision"; never fill in a confident answer just to pad the digest.
- The queue is unreachable → say the sheet could not be read and what to check, rather than reporting an empty backlog.
