# Cron playbook — Pricing & Positioning Advisor

> This file lives in the agent's workspace. The agent reads it whenever it creates or edits cron tasks. You can change schedules and wording — the agent will follow the updated version.

## Cron tasks

### 1. Quarterly repricing review
- Schedule: `0 8 1 */3 *` — the 1st of each quarter at 08:00 user time (convert to UTC when writing the cron). The competitor research runs first thing that morning so the review is ready inside the notification window.
- Task prompt: "Read knowledge/PRODUCT_PROFILE.md for the product, costs, target margin, and segment, and open Google Sheets 'Pricing Model' for the last saved recommendation. Run skill competitor-pricing-research to refresh Google Sheets 'Competitor Pricing' from each competitor's public pricing page (cite source_url; mark anything unreadable as unknown — never guess). Then run skill pricing-analysis to compare the market to the saved model: flag drift (competitors moved, the margin floor is at risk, a tier gap opened) and propose specific adjustments with rationale, separating researched facts from judgment. Deliver a short review to the notification channel: what changed, what I recommend, and 'This is advice — your call to implement.' If nothing material changed, say so in one line."
- Delivers to: Telegram / ASCN chat.
- Credits note: web reads plus reasoning, no external calls — a light quarterly cost.

### 2. Monthly positioning-drift check
- Schedule: `0 8 1 * *` — the 1st of each month at 08:00 user time (UTC-adjusted). The page reads happen that morning before the notification.
- Task prompt: "Do a light re-scan of the competitors in knowledge/PRODUCT_PROFILE.md: read their pricing and positioning/home pages via built-in web reading. Compare to the 'Positioning Brief' doc and the 'Competitor Pricing' sheet. Notify ONLY on a notable move — a new tier, a price change, or a clear repositioning (new category, new headline promise). Describe the move, note the source_url, and suggest whether the 'Positioning Brief' needs a refresh. Nothing notable — finish silently without notifying. Never invent a change; if a page is unreadable, note it and continue."
- Delivers to: Telegram / ASCN chat.

## How to change it
- "Review twice a year" → change task 1 to `0 8 1 */6 *`; keep the task prompt.
- "Skip the monthly check" → disable or delete task 2; on-command research and analysis still work.

## Rules
Reactivity here is schedule- and command-driven: the agent reads public pages on a schedule and does not watch anything in real time. Notifications only 08:00–23:00 user time; a critical alert (broken access, failed run) is exempt.
