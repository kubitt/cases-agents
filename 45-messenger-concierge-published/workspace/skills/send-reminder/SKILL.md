---
name: send-reminder
description: Send reminders for upcoming bookings and pending orders. Use when the reminder cron runs, or the owner asks to remind a customer.
---

# Send reminder

> A skill = one repeatable job. Edit the timing and wording of reminders in plain words.

Goal: reduce no-shows and stalled orders by sending a timely, friendly reminder to the customer — only when the owner has enabled reminders, and only at sensible hours.

## Algorithm
1. Check the owner's setting `auto_reminders` (from onboarding). If off, do nothing and finish.
2. Read the "Orders and Bookings" table for rows needing a reminder:
   - Bookings with datetime within the reminder window (default: ~24 hours ahead) and status not "cancelled" or "reminded".
   - Orders sitting in status "new" past the owner's follow-up window (e.g., a pickup not collected).
3. For each, compose a short, warm reminder in the owner's tone: what, when, and any prep or arrival note from BUSINESS_PROFILE.
4. Send it in the customer's Telegram chat. Update the row's status to "reminded".
5. Only send during sensible daytime hours in the business timezone — never at night. If the window has passed, hold until the next morning.
6. Summarize to the owner: how many reminders went out, and for which bookings.

## Output
```
To customer: "Hi Anna! Reminder: your haircut is tomorrow at 16:30. See you then — reply here if you need to reschedule."
To owner (digest): "Sent 4 booking reminders for tomorrow. 1 customer asked to reschedule — flagged for you."
```

## Edge cases
- auto_reminders is off → skip entirely; reminders are opt-in.
- Booking already marked "reminded" → don't send again; avoid double-pinging.
- Reminder window falls at night → queue for the next daytime send, never message after hours.
- Customer replies to a reminder (reschedule/cancel) → hand to skill answer-inquiry or take-order-booking; update the row; notify the owner.
- No contact channel for a row → skip it and flag to the owner rather than failing.
