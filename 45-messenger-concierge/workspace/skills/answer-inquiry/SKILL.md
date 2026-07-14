---
name: answer-inquiry
description: Answer a customer's question from the business facts. Use when a customer asks about services, prices, hours, location, promotions, or any policy.
---

# Answer inquiry

> A skill = one repeatable job, written as a recipe. You can edit how answers are sourced and phrased in plain words.

Goal: give the customer a fast, correct answer in the owner's voice — grounded entirely in the business facts, with an honest "let me check" when the answer isn't there.

## Algorithm
1. Read the customer's message and identify what they're asking: service details, price, hours, location, availability, promo, or policy (delivery, cancellation, payment).
2. Look up the answer in knowledge/BUSINESS_PROFILE.md. Use only what's written there.
3. If the answer is present: reply in the owner's tone (knowledge/CONVERSATION_VOICE.md), 1-3 short sentences, and offer the natural next step ("want me to book that?").
4. If the answer is NOT present or is ambiguous: tell the customer you'll confirm with the team, and notify the owner with the exact question. Do not guess.
5. If the message is actually an order or booking intent, hand off to skill take-order-booking.
6. Keep a light touch: answer first, sell second. Mention a promo only if it's relevant to what they asked.

## Output
```
Customer: "Do you do gel manicure and how much?"
Reply: "Yes — gel manicure is $35 and takes about 45 min. Want me to find you a slot this week?"
[If unknown]: "Great question — let me check with the team and get right back to you." -> owner notified: "Customer asked about X; not in profile."
```

## Edge cases
- Question not covered in BUSINESS_PROFILE → "let me check", notify the owner, never improvise a price or policy.
- Customer asks for a discount → only offer what's written as an active promo; otherwise say you'll ask the owner. Never invent a discount.
- Complaint or angry tone → don't debate; apologize briefly and escalate to the owner immediately.
- Multiple questions in one message → answer each briefly in order; if one is unknown, answer the rest and flag the gap.
- Off-topic or spam → reply politely once or ignore; don't engage; never share other customers' info.
