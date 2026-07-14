# Integrations: Competitor Price Watch

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | Competitor list + daily price history "Competitor Prices" | Native OAuth, 1 click |
| Telegram | Recommended | The morning price-change summary | Native OAuth channel, 2-min setup |
| Web reading (built-in) | Required | Reading competitor pricing pages | Built-in, zero setup |
| Firecrawl API | Optional | Reliable parsing of JS-heavy pricing pages | REST + key in Secrets as `FIRECRAWL_API_KEY`; free tier, then usage-based (see firecrawl.dev) |

Secrets to create before first run (Settings → Secrets): none required. Optional: `FIRECRAWL_API_KEY` (only if some pricing pages are JS-heavy and don't render prices with built-in reading).

Onboarding connection order: competitor list → Google Sheets → parsing check → (optional Firecrawl) → Telegram → daily time.

Degradation: without Telegram — the summary arrives in ASCN chat. Without Firecrawl — built-in web reading handles static pricing pages; JS-heavy pages that hide prices are flagged as unreadable rather than guessed. Without Google Sheets — history can't persist and day-over-day diffs won't work, so Sheets is required.

Deliberately absent / notes:
- **No behind-login or paywalled prices.** Public pricing pages only — the agent respects site protections and never bypasses them.
- **No strategy advice.** The agent reports what changed; pricing decisions are yours (a separate analysis is a different job).
- **Not a full market-intelligence radar.** This agent is focused on competitor prices; broad news/mention monitoring is a different agent.
