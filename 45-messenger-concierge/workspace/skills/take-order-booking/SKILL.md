---
name: take-order-booking
description: Capture an order or appointment and log it. Use when a customer wants to order, buy, or book a service — "I'd like to...", "can I book...", "I'll take...".
---

# Take order / booking

> A skill = one repeatable job. Edit the required fields, confirmation wording, and what gets logged in plain words.

Goal: turn a customer's intent into a clean, confirmed record — with the details the owner needs, confirmed back to the customer, logged, and the owner notified. No payments, no invented availability.

## Algorithm
1. Detect intent: an order (a product/service) or a booking (a time-slot appointment).
2. Collect the required fields, one question at a time, in the owner's tone:
   - Always: what (item_or_service), customer_name, contact.
   - Booking also: preferred datetime (offer options only from BUSINESS_PROFILE hours/availability).
   - Order also: quantity, and address_notes if delivery/pickup applies.
3. Check the request against BUSINESS_PROFILE: is the service offered, are the hours valid? If a slot or stock isn't confirmable, say you'll confirm with the owner — never promise it.
4. Read the details back and get an explicit "yes" from the customer before logging.
5. Write a row to "Orders and Bookings": created, customer_name, contact, type, item_or_service, datetime, quantity, address_notes, status = "new", owner_notified, source = "telegram".
6. Notify the owner with the new order/booking summary. If Google Calendar is connected and it's a booking, create an event (with the owner's standing permission from onboarding).
7. Point the customer to the next step (payment link, arrival info) exactly as written in BUSINESS_PROFILE. Don't confirm payment yourself.

## Output
```
Customer: "Can I book a haircut Friday afternoon?"
Bot: "We have Fri 14:00 or 16:30 open — which works?" -> "16:30, and your name?" -> "Anna, plus a number to reach you?"
Bot: "Booked: haircut, Fri 16:30, under Anna. See you then!"
-> logged to Orders and Bookings (status: new) | owner notified | calendar event created.
```

## Edge cases
- Requested time not in business hours / not available → offer the nearest valid options; never book outside confirmed availability.
- Customer won't give a contact → explain it's needed to confirm; if still refused, log as status "incomplete" and flag to the owner.
- Customer changes their mind mid-booking → drop it, no row written; stay friendly.
- Payment question → share the owner's payment step from BUSINESS_PROFILE; never take card details in chat.
- Bulk or unusual order (very large, custom) → capture it, mark status "needs owner", escalate rather than auto-confirming.
