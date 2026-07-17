# Social Intel Radar

Tells you what is actually working in your niche — competitor top posts, rising formats, hashtags, and sounds — without the hours of scrolling.

## Value & ROI
Replaces a social-listening analyst and a trend dashboard. Doing this by hand is ~4-6 hrs/week (~$300-1500/mo of a marketer's time), and a listening tool (Social Blade tier, trend dashboards) runs $79-249/mo. This agent scans every night, logs every competitor post and rising trend with a source link, and hands you a weekly what's-working brief. The core is fully native: $0 beyond $29/mo ASCN Start (10,000 credits) — no paid API required. Payback vs $29: roughly 10-40x once you drop the listening subscription and the manual monitoring.

## What it does
1. Keeps every competitor post in Google Sheets "Social Intel Log" (columns: date, platform, source_handle, post_url, format, hook_type, topic, likes, comments, shares, views, engagement_rate, verified, notes) — one row per post, deduped by post_url.
2. Keeps every rising trend in Google Sheets "Trend Radar" (columns: date, platform, trend, type, momentum, example_url, notes) — type is hashtag, sound, format, or topic; every row has a source link.
3. Scans your tracked handles and your niche nightly using built-in web search and page reading — public pages only.
4. Marks each engagement number verified (a public figure on the page) or estimated, so you always know what is solid.
5. Sends a weekly brief (Monday 08:00): top 3 repeatable patterns, 2 formats worth testing, and 1-2 content-gap opportunities, each line tagged [fact] or [estimate].

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (niche, handles, sheets, then a live test scan on your real accounts).

## Required integrations
Native: Google Sheets (required, the two research logs). Built-in: web search and page reading (zero setup). External: none for the core. Channel: Telegram recommended for the weekly brief.

## Deliberate limitations
- Public web only — no login-gated, private, or paywalled content, and no browser automation to click through sites (platform limit; respects each source's terms of service).
- Engagement figures are often estimated because platforms hide exact numbers; each is marked verified or estimated so nothing is oversold.
- Exact structured metrics, historical data, video transcripts, and ad-library data are out of reach in native mode — they need a paid data API (see Optional upgrades in INTEGRATIONS.md: CreatorCrawl ~$29-49/mo for Western platforms, or TikHub for Chinese platforms). Not wired into this build.
- Read-only research: the agent never posts, never DMs, never follows, and never scrapes behind logins or bypasses platform limits.
