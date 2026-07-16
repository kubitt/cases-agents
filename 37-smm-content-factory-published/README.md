# SMM Content Factory

Researches trends, writes a weekly batch of posts adapted per social network, generates an image for each, and publishes after your approval — for one brand or many (agency mode).

## Value & ROI
A freelance SMM manager costs $600–1,500/mo; an agency retainer runs higher, and doing it yourself eats 6–10 hours a week on research, copy, and design. The agent prepares a full weekly package in minutes of work plus your approval tap. Total cost: $29/mo (ASCN Start) + ~$1/mo for images (OpenRouter, ~$0.05 each at 5 posts/week); Telegram, Sheets, and web-search trends are free. Payback vs $29 + ~$1: 15–50x — one weekly package replaces hours of a manager's time, and agencies run 25 client profiles from one agent.

## What it does
1. Keeps brand profiles and a content log in Google Sheets (niche, audience, tone, banned topics, networks, links).
2. Researches real weekly trends for the niche via web search (Firecrawl optional) — no invented trends.
3. Writes a batch of posts adapted per network: Telegram (no hashtags), VK (≤3), Instagram (≤10), X (≤280 chars), LinkedIn (professional).
4. Generates one AI image per post via OpenRouter (Gemini 2.5 Flash Image).
5. Sends the whole package to Telegram for approval ("approve all / edit #N").
6. Publishes on approval: Telegram directly, VK and Instagram/X/LinkedIn via Blotato — or hands you a ready-to-post package. Logs everything to avoid repeats.
7. Optional weekly automation: prepares the package every Monday, and (if enabled) autopublishes on schedule.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, 3 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — integrations, costs, and the optional autoposting cron.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~10 min: brand + networks, Sheets, Telegram, image key, a real test package you approve).

## Required integrations
External: OpenRouter API (images, ~$1/mo) — required. Recommended: Telegram (approval + publishing) and Google Sheets (profiles + log) — both native, free. Optional: Blotato API (Instagram/X/LinkedIn autopublish), VK token (VK wall). Secrets: `OPENROUTER_API_KEY` (required), `BLOTATO_API_KEY`, `VK_TOKEN` (optional).

## Deliberate limitations
- **Instagram, X, and LinkedIn have no open publishing API on ASCN.** Auto-posting there routes through Blotato (a paid multi-social API); without it, the agent delivers a ready-to-post package (text + image) for those networks. Telegram and VK publish directly.
- **Images cost money.** ~$0.03–0.10 per post on OpenRouter; frequent autoposting adds up — the agent shows the cost and you set the cadence.
- **No paid ads, no DMs, no comment automation.** Organic posts only.
- **No performance analytics by default.** The agent confirms posts are live; reach/engagement tracking needs each network's analytics API and can be added later.
- **Trends are only as fresh as public sources.** In fast-moving niches the agent labels item dates and prefers recent sources, but it reports what it can verify — it never invents a trend.
