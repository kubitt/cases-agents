---
name: intake-poll
description: Check inbound channels for new requests and hand the new ones on. Use on the recurring run or on "check for new requests now".
---

# Intake poll

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: collect every genuinely new inbound request across channels, exactly once, and pass them to request-classify — no misses, no duplicates.

## Algorithm
1. Read the last-processed markers from memory (one per channel: last_email_id, last_tg_update, last_sheet_row).
2. Gather new items since each marker:
   - Gmail: messages newer than last_email_id in the watched label/inbox (site forms often arrive here).
   - Telegram: messages to the bot/group newer than last_tg_update.
   - Site form sheet (optional): rows in "Form Intake" added after last_sheet_row.
3. Normalize each into a common record: source, received_at, from (name/handle/email), raw_text.
4. Dedupe: skip anything already in "Inbound Requests" (match on source + sender + a hash of the text) so a resend isn't logged twice.
5. If nothing new, finish silently and leave markers unchanged.
6. Hand the new records to request-classify, then advance each marker only after the item is successfully logged by request-route.

## Output (new records handed to request-classify)
```
New inbound (2):
1. source=email | from="maria@shop.ru" | 2026-07-13 09:12 | "Hi, do you deliver to Kazan and what's the price for 50 units?"
2. source=telegram | from="@pavel" | 2026-07-13 09:20 | "your service is down again, third time this week!!"
```

## Edge cases
- First run (no markers) → set markers to "now", process only items going forward (don't back-import the whole inbox unless the user asks).
- Same person sends two messages → treat as two records but link them in notes if within a short window; don't merge silently.
- Auto-reply / out-of-office / newsletter → tag as non-request; request-classify will mark spam/ignore, marker still advances.
- Channel temporarily unreachable → skip that channel this run, keep its marker, retry next run; never advance a marker past unread items.
- Attachment-only or empty message → log with raw_text="(no text)", route as a question for a human to open.
