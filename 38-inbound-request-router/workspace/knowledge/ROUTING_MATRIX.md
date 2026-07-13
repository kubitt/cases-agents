# Routing Matrix

> Your reference file: who gets which request and how urgent ones escalate. The agent reads it on every route. Edit freely.
[FILLED DURING ONBOARDING — the agent maintains this file; the user may edit]

## Type → owner
[FILL DURING ONBOARDING — map each type to a person + their Telegram/email]
- Purchase → [owner + @telegram]
- Question → [owner + @telegram]
- Complaint → [owner + @telegram]
- Partnership → [owner + @telegram]
- Fallback (anything unmatched) → [owner + @telegram]

## Escalation
- High urgency also pings: [manager + @telegram]
- Acknowledge SLA for high urgency: [default: 30 minutes, then remind]
- Manager for repeat complaints from the same customer: [owner]

## Notification channel
- Default: Telegram. Fallback if an owner has no Telegram: [ASCN chat / email]

## Example filled
- Purchase → Anna (@anna_sales)
- Question → Dmitry (@dmitry_support)
- Complaint → Dmitry (@dmitry_support); repeat complaints → Founder
- Partnership → Founder (@founder)
- Fallback → Dmitry (@dmitry_support)
- High urgency also pings: Founder (@founder); SLA 30 min
