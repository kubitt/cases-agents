# Pinterest Traffic Agent

Studies your niche, designs premium pins (AI image + caption + SEO copy), and publishes them to Pinterest to drive clicks to your link — in any niche, any language.

## Value & ROI
A freelance Pinterest manager costs $300–800/mo; a designer or VA charges $5–25 per custom pin. Doing it yourself is 15–25 minutes per pin — keyword research, copy, image, publishing. The agent does the whole pin in about a minute of work plus your one-tap approval. Total cost: $29/mo (ASCN Start) + ~$1.5–3/mo for images (OpenRouter, ~$0.05 each at 1 pin/day); Pinterest and Telegram are free. Payback vs $29 + ~$3 images: 5–20x — at 30 pins/month you save 8–12 hours or $150–600 versus outsourcing, and Pinterest keeps sending traffic to old pins for months.

## What it does
1. Analyzes your niche (own knowledge + web search): audience, pains, working pin formats, 3–5 title formulas, visual style, Pinterest SEO keywords → saved to a strategy file.
2. Writes each pin as four fields: heading (caption), SEO title, description with a call to click, and an English image prompt.
3. Generates a premium image via OpenRouter (Gemini 2.5 Flash Image), then overlays a caption plaque (works with Cyrillic and Latin out of the box).
4. Sends the finished pin to Telegram for your approval before anything goes live.
5. On approval, publishes to Pinterest (API v5) with your target link, and reports the live pin.
6. Optional autoposting: generate + publish one pin on a schedule automatically (your standing approval), with a report each time.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, 3 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md`, `AUTOMATIONS.md` note — which integrations are needed, their costs, and the optional autoposting cron.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~10 min: niche + link, three API keys, style check, a real test pin you approve).

## Required integrations
External: OpenRouter API (images, ~$1.5–3/mo) and Pinterest API v5 (publishing, free) — both required. Recommended: Telegram (previews + reports, free). Optional native: Google Sheets (pin log). Secrets: `OPENROUTER_API_KEY`, `PINTEREST_ACCESS_TOKEN`, `PINTBOT`, `TELEGRAM_CHAT_ID`.

## Deliberate limitations
- **Images cost money.** Each pin spends ~$0.03–0.10 on OpenRouter. Frequent autoposting adds up — the agent always shows the per-image cost and you set the frequency.
- **Publishing needs a token with `pins:write`.** Pinterest access tokens expire; when one does, the agent keeps the finished image and asks you to reissue it — it never silently fails.
- **No performance analytics by default.** The agent confirms a pin is live but does not track impressions/clicks unless you later connect the Pinterest Analytics scope.
- **No text baked into images, no real people, no logos.** Visuals are a single premium AI scene; the only text is the caption plaque. This keeps pins clean and copyright-safe — but it isn't a graphic-design tool for complex infographics.
- **One board per setup.** Pins publish to the board configured in settings; ask the agent to switch boards or run multiple setups for multiple boards.
