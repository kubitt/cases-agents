# Ad Creative Generator

From your brief, produces a batch of ready ad variants — five texts on different hooks, each with its own AI image — and tracks what you test so every round improves. You upload the winners to your ad manager.

## Value & ROI
A performance copywriter charges $50–150 per ad set; a designer adds $20–50 per creative; agencies bill $500–2,000 for a campaign's creatives. And most of the cost is iterating — new hooks, new images, over and over. The agent produces five hook-varied variants with images in minutes, and remembers what won. Total cost: $29/mo (ASCN Start) + ~$1–3/mo for images (OpenRouter, ~$0.25 per batch of 5). Payback vs $29 + ~$3: 10–40x — one campaign's worth of creatives replaces hundreds of dollars of copy-and-design work.

## What it does
1. Takes your brief (from chat or a saved template): offer, audience, platform, real proof, constraints.
2. Optionally analyzes competitor ads you link — their angle and gaps — for inspiration, never copying.
3. Writes 5 ad variants, one per hook: pain, benefit, social proof, urgency, curiosity — within the platform's character limits.
4. Generates one AI image per variant via OpenRouter, in the platform's aspect ratio.
5. Delivers the package to Telegram and archives it in Google Drive.
6. Logs every batch to Google Sheets "Ad Tests" and, when you send CTR results, doubles down on the winning hooks next round.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, 3 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — integrations, costs, and the optional weekly batch cron.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~9 min: product + audience, platform, image key, delivery, a real test batch).

## Required integrations
External: OpenRouter API (images, ~$1–3/mo) — required. Recommended: Google Sheets (test history) and Telegram (delivery) — native, free. Optional: Google Drive (archiving), Firecrawl API (competitor analysis). Secrets: `OPENROUTER_API_KEY` (required), `FIRECRAWL_API_KEY` (optional).

## Deliberate limitations
- **It produces creatives, it doesn't publish ads.** You review and upload the winners to your ad manager; direct posting to Meta/Google/TikTok needs heavy OAuth approval and is out of scope.
- **Images cost money.** ~$0.05 per image, ~$0.25 per batch of 5; frequent weekly batches add up — the agent shows the cost and you set the cadence.
- **Text lives in ad fields, not baked into images.** Image models render text unreliably, so the visual is clean and the copy is separate — as ad managers expect.
- **Competitor analysis is inspiration only.** The agent studies angles and gaps; it never reproduces a competitor's copy or creative.
- **Ad-policy compliance is yours to confirm.** The agent avoids obvious prohibited claims, but regulated niches (health, finance, crypto) must be checked against each platform's rules before running.
