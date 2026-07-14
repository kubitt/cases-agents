# Integrations: Ad Creative Generator

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| OpenRouter API | Required | One AI image per ad variant (`google/gemini-2.5-flash-image`) | REST + key in Secrets as `OPENROUTER_API_KEY`; ~$0.03–0.10/image (~$0.25 per 5-variant batch) |
| Google Sheets | Recommended | "Ad Tests" history: hooks, headlines, CTR, winners | Native OAuth, 1 click |
| Telegram | Recommended | Delivering the creative package | Native OAuth channel, 2-min setup |
| Google Drive | Optional | Archiving each batch (images + copy) in folders | Native OAuth |
| Firecrawl API | Optional | Analyzing JS-heavy competitor ad/landing pages | REST + key in Secrets as `FIRECRAWL_API_KEY`; free tier, then usage-based |

Secrets to create before first run (Settings → Secrets): `OPENROUTER_API_KEY` (required). Optional: `FIRECRAWL_API_KEY` (competitor analysis on JS-heavy pages).

Onboarding connection order: product/audience → platform/proof → OpenRouter key → Sheets/Drive/Telegram → (optional Firecrawl) → test batch.

Degradation: without Google Drive — packages are delivered inline in Telegram, not archived. Without Google Sheets — the test history isn't tracked, so rounds don't compound (recommended). Without OpenRouter — the agent delivers ad copy only, no images; onboarding recommends adding the key.

Deliberately absent / notes:
- **It doesn't publish ads or spend budget.** The agent produces creatives; you review and upload them to Meta/Google/TikTok Ads Manager. Direct ad-platform posting needs heavy OAuth approval and is out of scope.
- **Competitor analysis is inspiration, not copying.** The agent studies angles and gaps; it never reproduces a competitor's copy or creative.
- **Image models render minimal text unreliably.** Ad text lives in the ad fields, not baked into the image; the image is the visual, the copy is separate.
- **Ad-policy compliance is yours to confirm.** The agent avoids obvious prohibited claims, but regulated niches must be checked against each platform's ad rules before running.
