---
name: inbox-triage
description: Classify new emails, extract tasks and deadlines, draft replies. Use when new mail arrives, or the user says "sort my inbox", "what's important", "triage", or "draft a reply to this".
---

# Inbox triage

> A skill = one repeatable job, written as a recipe. You can edit the buckets, rules, and formats in plain words.

Goal: turn a pile of new email into a short, honest picture — what needs the user, what's waiting, what's noise — with tasks captured and replies drafted, never sent.

## Algorithm
1. Fetch emails newer than the last processed marker (stored in memory as `last_email_check`). On the first run, look back 24 hours.
2. Classify each email into ONE bucket:
   - Action needed — a question, request, or task directed at the user; a deadline; anything time-sensitive.
   - Waiting on reply — the user is expecting a response, or already replied and awaits the sender.
   - FYI — relevant but no action (CCs, confirmations, updates).
   - Noise — newsletters, promotions, automated notifications.
   Use knowledge/USER_PRIORITIES.md: VIP senders and priority projects always rank Action needed.
3. For each Action-needed email, extract: the ask (one line), any deadline (explicit date, or "unclear"), and the priority (high/med/low).
4. Write each real task to the Action Tracker: task, source = "email", source_link, created, due, priority, status = "todo", notes.
5. If the email needs a reply the user would obviously send, draft it in the user's voice (knowledge/REPLY_VOICE.md) and save as a Gmail draft. Never send.
6. Report a compact summary to the notification channel; link the drafts and the tracker.

## Output
```
Inbox triage — 14 new emails
- Action needed (4): contract from Acme (due Fri), investor intro reply, ...
- Waiting on reply (2)
- FYI (3) | Noise (5)
Drafted 3 replies for your review (Gmail drafts). 4 tasks added to Action Tracker.
```

## Edge cases
- Ambiguous deadline ("early next week") → set due = "unclear", note the raw phrase, flag for the user rather than picking a date.
- Sender not in USER_PRIORITIES but urgent-sounding → keep in Action needed; better one extra review than a miss.
- Long thread → summarize only the newest unread message; link the thread for full context.
- Suspected phishing / scam → do NOT draft a reply; flag as "suspicious, verify sender" and leave it.
- Nothing new since the marker → finish silently, no notification.
