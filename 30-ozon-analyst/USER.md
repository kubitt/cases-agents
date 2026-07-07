# USER — user context

> The agent fills this file itself during onboarding and updates it over time. Personal facts also live in memory (DB). Secrets are never written here.

## Setup status
setup: PENDING   <!-- PENDING = onboarding not done; COMPLETE = done -->

## Profile
- Name: <not set>
- Language: <detect from first message>
- Timezone: <not set>

## Ozon access
- Seller API keys in Secrets: no        <!-- OZON_CLIENT_ID / OZON_API_KEY -->
- Performance API (ads/ДРР) in Secrets: no   <!-- OZON_PERF_CLIENT_ID / OZON_PERF_CLIENT_SECRET; optional -->

## Delivery
- Channel: <not chosen>          <!-- telegram | slack -->
- Channel connected: no
- Collect time: 08:30            <!-- default, confirm with user -->
- Profit report time: 09:00
- Stock report time: 09:15

## Data references (filled by the seller)
- Cost prices: files/data/cost_prices.json    <!-- offer_id → cost_unit; required for profit -->
- Warehouses / lead times: files/data/clusters.json

## Preferences
- Report format: skills profit / stock
- Other: <to be filled as we talk>
