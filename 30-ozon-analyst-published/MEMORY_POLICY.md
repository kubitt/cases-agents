# MEMORY POLICY

## core (stable across sessions)
- user.name, user.language, user.timezone
- ozon.client_id (Client-Id only; NEVER the Api-Key), ozon.perf_connected (yes | no)
- delivery.channel (telegram | slack), delivery.collect_time, delivery.profit_time, delivery.stock_time
- ozon.skus (known offer_ids), key user decisions ("don't touch SKU X")

## daily (short-lived)
- today's results, temporary notes and reminders

## conversation
- current-session context, cleared automatically

## Never store
- tokens, API keys, passwords, verification codes — only in the encrypted secret store / OAuth
- cost prices are config (files/data/cost_prices.json), not memory

## Rules
- When onboarding completes, persist the config both to core memory and to USER.md (`setup: COMPLETE`).
- Namespace keys: `user.*`, `ozon.*`, `delivery.*`.
- "forget …" → delete the matching entry; "remember …" → save to core.
