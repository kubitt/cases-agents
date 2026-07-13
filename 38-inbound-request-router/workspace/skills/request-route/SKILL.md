---
name: request-route
description: Record each classified request in the CRM, assign an owner, notify them, and escalate urgent ones. Use right after request-classify.
---

# Request route

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: get every request into the CRM and in front of the right person — with urgent ones escalated — and never notify about something that wasn't saved.

## Algorithm
1. For each classified record, assign an owner using the matrix in knowledge/ROUTING_MATRIX.md (type → owner; a fallback owner for anything unmatched).
2. Write the row to Google Sheets "Inbound Requests" first: received_at, source, name, contact, type, urgency, essence, product, owner, status=New, notes. Confirm the write succeeded.
3. Only after a successful write, notify the assigned owner in Telegram with the essence, type, urgency, and a link to the row.
4. Escalate: if urgency=high, also notify the manager (from the matrix). If a high-urgency request is unacknowledged after the SLA in ROUTING_MATRIX.md (default 30 min), send a reminder.
5. Spam: log with status=Spam, don't notify anyone.
6. Advance the intake marker for that item (so intake-poll won't reprocess it) and log a one-line run summary: N logged, by type, escalations sent.

## Output (owner notification + run summary)
```
Notified @sales_manager:
🟡 New request [Medium] · Purchase · Maria (maria@shop.ru)
"Delivery to Kazan + price for 50 units." · CRM row: [link]

Escalated to @founder:
🔴 URGENT · Complaint · @pavel — "service down, 3rd time this week" · owner @support_lead

Run: 2 logged (1 purchase, 1 complaint), 1 escalation. Marker updated.
```

## Edge cases
- No matching owner in the matrix → assign the fallback owner, flag "routing rule needed" for the user.
- CRM write fails → do NOT notify; keep the item unmarked and retry next run; alert the user if it fails twice.
- Owner has no Telegram set → fall back to ASCN chat / email notification, note the gap for the user to fix.
- Duplicate slipped through (same request re-sent) → update the existing row's notes instead of a new row; don't double-notify.
- Burst of many requests at once → batch the owner notifications into a short digest per owner rather than one ping each, but escalate high-urgency ones individually.
