---
name: request-classify
description: Classify each new request by type and urgency and extract its key fields. Use right after intake-poll, or on "classify this request".
---

# Request classify

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn a raw inbound message into a clean, structured record — type, urgency, and the fields the CRM needs — using only what's in the message.

## Algorithm
1. For each record from intake-poll, read the rules in knowledge/CLASSIFICATION_RULES.md.
2. Classify type: purchase / question / complaint / partnership / spam. If ambiguous, pick the closest and add a "review" note — don't force a wrong bucket.
3. Classify urgency using signals:
   - high: angry/complaint about an outage or failure, a deadline mentioned, a large/enterprise deal, a threat to churn
   - medium: a clear buying question or a normal complaint
   - low: general question, info request, vague interest
4. Extract fields (only what's present): name, contact (email/phone/handle), essence (1–2 sentences in your words, faithful to the message), product/topic, source, received_at. Missing → "unknown".
5. Detect language of the request and note it (helps whoever replies).
6. Hand the classified records to request-route.

## Output (classified record handed to request-route)
```
- source: email | from: maria@shop.ru | name: Maria (unknown last)
  type: purchase | urgency: medium | lang: ru
  essence: "Asks about delivery to Kazan and price for 50 units."
  product: bulk order | contact: maria@shop.ru

- source: telegram | from: @pavel | name: unknown
  type: complaint | urgency: high (outage + repeat)
  essence: "Reports the service is down for the third time this week."
  product: service uptime | contact: @pavel
```

## Edge cases
- Mixed intent (question + complaint) → pick the dominant type, note the secondary in essence.
- Spam / newsletter / bot → type=spam, urgency=low, do not route to a person; log for the record.
- Non-Latin or foreign language → classify normally, note the language; keep field labels in English.
- Vague one-liner ("info?") → type=question, urgency=low, essence quotes the message; don't invent what they want.
- Potential fraud/scam signals → flag "verify" in notes, route as question, never auto-act on payment/refund claims.
