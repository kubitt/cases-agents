---
name: inbox-triage
description: Read a new inbound message, comment, or logged review, classify it, and draft a reply. Use during the inbox and review poll, when the user says "triage now" or forwards a message, and in the onboarding test run.
---

# Inbox triage

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn each new inbound item into one clean queue row with an intent, a priority, a sentiment, and a ready-to-send draft in the brand voice — never a sent message.

## Algorithm
1. Read knowledge/BRAND_REPLY_VOICE.md (tone, do/don't phrases, FAQ answers, escalation rules, refund and complaint lines) and knowledge/CHANNEL_SOURCES.md (connected channels, response-time SLA per priority, banned responses).
2. Collect new items from the connected sources: Telegram, Slack, and Gmail messages newer than the saved poll marker, plus any review rows already logged as channel=review by skill review-watch. Skip anything already in "Inbox Queue".
3. Classify each item by intent: question, complaint, lead, spam, or praise. Spam is logged with status=ignored and no draft.
4. Set priority: high (complaint, an unhappy or low-rated review, a hot lead, anything past its SLA), medium (a normal question or lead), low (praise, small talk). Set sentiment: negative, neutral, or positive.
5. Escalation check: if the item matches an escalation rule, set status=escalated, leave reply_draft empty, and note the reason — do not write a confident answer.
6. For everything else, draft one reply in the brand voice: answer the question or acknowledge the complaint calmly using the FAQ and refund/complaint lines; keep it short; never use a banned response. Write it to reply_draft and set status=drafted.
7. Append one row per item to Google Sheets "Inbox Queue": date, channel, author, message, intent, priority, sentiment, reply_draft, status, notes. Update the poll marker.

## Output
One appended row per item, e.g.:
```
2026-07-15 | telegram | @maria_k | "Do you ship to Portugal? Site only shows Spain." | question | medium | neutral | "Hi Maria — yes, we ship to Portugal; delivery is 3–5 days and shown at checkout. Want the link?" | drafted |
2026-07-15 | gmail | tom@acme.io | "Third email about a refund and still nothing. Done with you." | complaint | high | negative | "" | escalated | refund above auto-limit, human decision
```
Then a one-line summary: "Triage done: 6 new items (2 high, 3 medium, 1 spam). 1 escalated to you, 4 drafts ready in Inbox Queue."

## Edge cases
- Source unreachable or not connected → skip it, note "channel unavailable" in the summary, do not invent messages; native mode never reaches Instagram / Facebook / X.
- Duplicate (same message already a row, or the same person messaging twice) → do not add a second row for the same item; update the existing row and note "repeat contact" in notes.
- Ambiguous intent or a language you are unsure of → mark confidence low in notes, pick the safer (higher) priority, and draft cautiously rather than guessing a policy.
- Item matches an escalation rule → status=escalated, empty reply_draft, reason in notes; never a confident auto-answer.
