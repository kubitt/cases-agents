# Classification Rules

> Your reference file: how the agent decides type and urgency. The agent reads it before classifying. Edit freely.
[FILLED DURING ONBOARDING — the agent maintains this file; the user may edit]

## Types
- Purchase — wants to buy, asks price/availability/quote, order intent
- Question — info, how-to, pre-sale or general query
- Complaint — something is wrong: broken, late, unhappy
- Partnership — collaboration, reseller, integration, PR/press
- Spam — bots, newsletters, irrelevant mass mail (not routed)

## Urgency signals
- High: outage/failure, angry tone, deadline stated, large/enterprise deal, threat to cancel, repeat complaint
- Medium: clear buying question, normal complaint, time-sensitive but not critical
- Low: general question, vague interest, info request

## Fields to extract (only what's present)
- name, contact (email/phone/@handle), essence (1–2 sentences, faithful), product/topic, source, received_at, language

## Custom keywords (help the agent classify your niche)
[FILL DURING ONBOARDING — words that signal each type/urgency in your business]
- High-urgency words: [e.g., "down", "urgent", "refund", "deadline", "cancel"]
- Purchase words: [e.g., "price", "quote", "buy", "order", "how much"]

## Example filled
- High-urgency words: down, not working, urgent, refund, chargeback, deadline, cancel, lawyer
- Purchase words: price, quote, buy, order, invoice, how much, bulk, wholesale
- Partnership words: partner, reseller, collaboration, integrate, press, media
